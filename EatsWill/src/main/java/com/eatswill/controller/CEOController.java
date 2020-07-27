package com.eatswill.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.eatswill.dao.CeoDAO;
import com.eatswill.dto.CeoDTO;
import com.eatswill.dto.CeoInfo;
import com.eatswill.dto.OrderDTO;
import com.eatswill.dto.SalesDTO;
import com.eatswill.util.MyUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@SessionAttributes("CeoInfo")
@Controller("CEOController")
public class CEOController {

	@ModelAttribute("ceoInfo")
	public CeoInfo ceoInfo() {
		return new CeoInfo();
	}

	@Autowired
	@Qualifier("ceoDAO")
	CeoDAO dao;

	@Autowired
	MyUtil myUtil;

	// 메인페이지 & 로그인
	@RequestMapping(value = "/CEO.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceo(HttpServletRequest request, HttpSession session) {
		
		String ceoId = request.getParameter("ceoId");
		String ceoPw = request.getParameter("ceoPw");

		if (ceoId != null) {

			CeoDTO dto = dao.getReadData(ceoId);

			if (dto == null || !dto.getCeoPw().equals(ceoPw)) {

				System.out.println("아이디비번틀림");
				return "CEO/ceo";

			} else {

				CeoInfo info = new CeoInfo();
				info.setCeoId(dto.getCeoId());
				info.setCeoName(dto.getCeoName());
				session.setAttribute("ceoInfo", info);

			}

		}

		ceoId = "";
		ceoPw = "";
		
		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		if(info != null) {
			
			int storeCount = dao.getStoreCount(info.getCeoId());
			int orderChk = dao.ceoIdOrderStatus(info.getCeoId(), "100"); // 주문확인
			int orderReady = dao.ceoIdOrderStatus(info.getCeoId(), "200"); // 준비중
			
			System.out.println("주문확인 : " + orderChk);
			System.out.println("준비중 : " + orderReady);
			
			request.setAttribute("orderChk", orderChk);
			request.setAttribute("orderReady", orderReady);
			request.setAttribute("storeCount", storeCount);
			
		}

		return "CEO/ceo";

	}

	// 로그아웃
	@RequestMapping(value = "/logout_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/CEO.action";

	}

	// 회원가입 페이지
	@RequestMapping(value = "/ceoSignup.action")
	public String ceoSignup() {

		return "CEO/ceoSignup";

	}

	// 회원가입 완료
	@RequestMapping(value = "/ceoSignup_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceoSignup_ok(HttpServletRequest request, CeoDTO dto) {

		dao.insertData(dto);

		return "redirect:/CEO.action";

	}

	
	//매장추가 START=============================================================================================================================
	// 매장추가 페이지
	@RequestMapping(value = "/addStore.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String addStore(HttpServletRequest request, HttpSession session, CeoDTO dto) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		
		List<CeoDTO> lists = dao.getStoreList(ceoId);
		
		request.setAttribute("lists", lists);
		
		return "CEO/addStore";

	}

	//매장 리스트 ajax
	@RequestMapping(value = "/storeItem.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String storeItem(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		
		List<CeoDTO> lists = dao.getStoreList(ceoId);
		
		request.setAttribute("lists", lists);
		
		return "CEO/storeItem";
		
	}

	// 매장추가 ajax
	@RequestMapping(value = "/addStore_ok.action", method = {RequestMethod.POST, RequestMethod.GET})
	public String addStore_ok(HttpServletRequest request, HttpSession session, CeoDTO dto, MultipartRequest req) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		dto.setCeoId(ceoId);
		String shopName = request.getParameter("shopName");
		String shopTel = request.getParameter("shopTel");
		String shopAddr1 = request.getParameter("shopAddr1");
		String shopAddr2 = request.getParameter("shopAddr2");
		String category = request.getParameter("category");
		String franchise = request.getParameter("franchise");
		dto.setShopName(shopName);
		dto.setShopTel(shopTel);
		dto.setShopAddr1(shopAddr1);
		dto.setShopAddr2(shopAddr2);
		dto.setCategory(category);
		dto.setFranchise(franchise);
		dto.setShopAddr(shopAddr1.concat(shopAddr2));

		List<CeoDTO> lists = null;
		
		System.out.println(dto.getUploadfile());
		
		// 매장이미지사진파일 업로드
		MultipartFile uploadfile = req.getFile("uploadfile");
//		String path = request.getSession().getServletContext().getRealPath("resources/img/");
		String path = "D://shopimg/";
//		System.out.println(path);
		String newFileName = null;
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();
		if (uploadfile != null) {
			String shopImg = uploadfile.getOriginalFilename();

			// 파일 확장자
			String fileExt = shopImg.substring(shopImg.lastIndexOf("."));
			if (fileExt == null || fileExt.equals(""))
				return null;

			// 서버에 저장할 새로운 파일명을 만든다.
			newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			newFileName += System.nanoTime();
			newFileName += fileExt;

			dto.setShopImg(newFileName);
			
			try {
				File file = new File(path + newFileName);
				uploadfile.transferTo(file);
				dao.insertStore(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			lists = dao.getStoreList(ceoId);
			request.setAttribute("lists", lists);
			
			return "CEO/storeItem";
		}
		
		lists = dao.getStoreList(ceoId);
		request.setAttribute("lists", lists);
		
		return "CEO/storeItem";

	}
	
	//매장삭제 ajax
		@RequestMapping(value = "/deleteStore.action", method = { RequestMethod.POST, RequestMethod.GET })
		public String deleteStore(HttpServletRequest request, HttpSession session, CeoDTO dto) {
			
			CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
			String ceoId = info.getCeoId();
			String shopCode = request.getParameter("shopCode");
			System.out.println("매장코드 : " + shopCode + " 삭제");
			dao.deleteStore(shopCode);
			
			List<CeoDTO> lists = dao.getStoreList(ceoId);
			
			request.setAttribute("lists", lists);
			
			return "CEO/storeItem";
			
		}
	
	//매장추가 END=============================================================================================================================

	//매장리스트 mode (주문확인,메뉴관리,리뷰관리)
		@RequestMapping(value = "/ceoStoreList.action", method = { RequestMethod.POST, RequestMethod.GET })
		public String storeList(HttpServletRequest request, HttpSession session, CeoDTO dto) {
			
			String mode = request.getParameter("mode");
			System.out.println(mode);
			CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
			String ceoId = info.getCeoId();
			if(mode.equals("addMenu")) {
				
				List<CeoDTO> shopList = dao.getStoreList(ceoId);
				
				request.setAttribute("mode", mode);
				request.setAttribute("shopList", shopList);
				
				return "CEO/storeList";
				
			} else if(mode.equals("orderChk")) {
				
				List<CeoDTO> shopList = dao.getStoreList(ceoId);
				
				request.setAttribute("mode", mode);
				request.setAttribute("shopList", shopList);
				
				return "CEO/storeList";
				
			} else if(mode.equals("ceoReview")) {
				
				List<CeoDTO> shopList = dao.getStoreList(ceoId);

				int storeCount = dao.getStoreCount(ceoId);
				
				request.setAttribute("mode", mode);
				request.setAttribute("shopList", shopList);
				request.setAttribute("storeCount", storeCount);

				return "CEO/storeList";
				
			} else if(mode.equals("sales")) {
				
				List<CeoDTO> shopList = dao.getStoreList(ceoId);
				
				int storeCount = dao.getStoreCount(ceoId);
				
				request.setAttribute("mode", mode);
				request.setAttribute("shopList", shopList);
				request.setAttribute("storeCount", storeCount);
				
				return "CEO/storeList";
				
			}
			
			return "CEO/ceo";
			
		}
	
	//리뷰관리 START=============================================================================================================================
	//리뷰페이지 ajax
	@RequestMapping(value = "/ceoReviewArticle.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String ajaxStoreRiview(HttpServletRequest request, HttpSession session) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String shopCode = request.getParameter("shopCode");
		System.out.println("리뷰페이지 : " + shopCode);
		List<CeoDTO> reviewList = dao.getStoreReview(ceoId, shopCode);
		request.setAttribute("reviewList", reviewList);

		return "CEO/ceoReviewArticle";

	}

	//리뷰페이지 사장님 답글처리 ajax
	@RequestMapping(value = "/ajaxCeoReview.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String ajaxCeoReview(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String renum = request.getParameter("renum");
		String ceoContent = request.getParameter("ceoContent");
		System.out.println("답글처리renum :" + renum);
		System.out.println("답글처리ceoContent : " + ceoContent);
		
		dto.setRenum(renum);
		dto.setCeoContent(ceoContent);
		dao.ceoReviewAdd(dto);
		
		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String shopCode = request.getParameter("shopCode");
		System.out.println(shopCode);
		List<CeoDTO> reviewList = dao.getStoreReview(ceoId, shopCode);
		request.setAttribute("reviewList", reviewList);
		
		return "CEO/ceoReviewArticle";
		
	}
	
	//리뷰페이지 모달창띄우기
	@RequestMapping(value = "/reviewModal.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String reviewModal(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String renum = request.getParameter("renum");
		String shopCode = request.getParameter("shopCode");
		System.out.println("모달창renum :" + renum);
		System.out.println("모달창shopCode : " + shopCode);
		
		request.setAttribute("renum", renum);
		request.setAttribute("shopCode", shopCode);
		
		return "CEO/reviewModal";
	}
	
	//리뷰페이지 사장님 답글삭제 ajax
	@RequestMapping(value = "/ajaxCeoReviewDel.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String ajaxCeoReviewDel(HttpServletRequest request, HttpSession session) {
		
		System.out.println("ajax3");
		
		String renum = request.getParameter("renum");
		
		System.out.println("답글삭제renum : " + renum);
		
		dao.ceoReviewDel(renum);
		
		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String shopCode = request.getParameter("shopCode");
		System.out.println(shopCode);
		List<CeoDTO> reviewList = dao.getStoreReview(ceoId, shopCode);
		request.setAttribute("reviewList", reviewList);
		
		
		return "CEO/ceoReviewArticle";
		
	}
	

	//해당매장의 리뷰리스트 페이지
	@RequestMapping(value = "/storeReview.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeReiew(HttpServletRequest request, HttpSession session) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String shopCode = request.getParameter("shopCode");
		
		List<CeoDTO> reviewList = dao.getStoreReview(ceoId, shopCode);
		Iterator<CeoDTO> it = reviewList.iterator();
		while(it.hasNext()) {

			CeoDTO dto = it.next();
			String orderCode = dto.getOrderCode();
			List<OrderDTO> orderDetail = dao.getOrderDetail(orderCode);
			dto.setOrderDetail(orderDetail);
			
		}
		
		int reviewCount = dao.getReviewCount(shopCode);
		CeoDTO shopdto = dao.getStoreName(shopCode);
		
		if(reviewCount != 0) {
			double avgReScore = dao.getAvgReScore(shopCode); // 해당 매장 평균별점
			double avgReScore2 = Math.round(avgReScore); // 매장 평균 별점 반올림함
			request.setAttribute("avgReScore", avgReScore);
			request.setAttribute("avgReScore2", avgReScore2);
		}
		
		request.setAttribute("shopdto", shopdto);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("reviewCount", reviewCount);
		
		return "CEO/storeReview";
		
	}
	//리뷰관리 END=============================================================================================================================
	
	
	//주문확인 START=============================================================================================================================
	//한 매장 주문확인 페이지
	@RequestMapping(value = "/storeOrderChk.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeOderChk(HttpServletRequest request, HttpSession session) {
		
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		
		List<CeoDTO> orderList = dao.getOrderChk(shopCode);
		
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/storeOrderChk";
		
	}
	
	//한 매장 주문확인 페이지에서 로딩시 orderChkList 불러오는 ajax
	@RequestMapping(value = "/storeOrderChkPage.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeOderChkPage(HttpServletRequest request, HttpSession session) {
		
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		System.out.println(shopCode);
		System.out.println(shopName);
		
		List<CeoDTO> orderList = dao.getOrderChk(shopCode);
		Iterator<CeoDTO> it = orderList.iterator();
		while(it.hasNext()) {

			CeoDTO dto = it.next();
			String orderCode = dto.getOrderCode();
			List<OrderDTO> orderDetail = dao.getOrderDetail(orderCode);
			dto.setOrderDetail(orderDetail);
			
		}
		//orderStatus =  100 : 주문확인, 200: 준비중, 300: 주문완료
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}
	
	
	//주문상태(준비중,배달완료) 업데이트 ajax
	@RequestMapping(value = "/storeOrderChk_ok.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeOderChk_ok(HttpServletRequest request, HttpSession session) {
		
		String orderCode = request.getParameter("orderCode");
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		String orderStatus = request.getParameter("orderStatus");
		
		System.out.println("주문코드 : " + orderCode);
		System.out.println("주문상태코드 : " + orderStatus);
		
		dao.orderUpdate(orderCode, orderStatus); //주문상태 업데이트 자세한설명은 CeoDAO
		
		List<CeoDTO> orderList = dao.getOrderChk(shopCode);
		
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}

	//주문상태(주문취소) 업데이트 ajax
	@RequestMapping(value = "/storeOrderChk_cancel.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeOrderChk_cancel(HttpServletRequest request, HttpSession session) {
		
		String orderCode = request.getParameter("orderCode");
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		
		System.out.println("주문코드 : " + orderCode + " 주문취소");
		
		dao.orderCancel(orderCode);//배달상태 주문취소
		
		List<CeoDTO> orderList = dao.getOrderChk(shopCode);
		
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}
	//주문확인 END=============================================================================================================================
	
	
	//메뉴추가 START=============================================================================================================================
	// 메뉴추가 페이지
	@RequestMapping(value = "/addMenu.action", method = {RequestMethod.POST, RequestMethod.GET})
	public String addMenu(HttpServletRequest request) {

		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		
//		List<CeoDTO> menuSize = dao.getStoreMenu(shopCode);
		
//		request.setAttribute("menu", menu);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		
		System.out.println("shopCode : " + shopCode);
		System.out.println("shopCode : " + shopName);
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체데이터갯수
		int menuCount = dao.getMenuCount(shopCode);
		
		//전체페이지수
		int numPerPage = 4;
		int totalPage = myUtil.getPageCount(numPerPage, menuCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
		
		System.out.println("메뉴총개수 : " + menuCount);
		System.out.println("총페이지 : " + totalPage);
		
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("menu", menu);
		request.setAttribute("menuCount",menuCount);
		
		return "CEO/addMenu";

	}
	
	// 메뉴추가 페이지ajax (더보기 클릭시)
	@RequestMapping(value = "/menuItem.action", method = {RequestMethod.POST, RequestMethod.GET})
	public String menuItem(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		String pageNum = request.getParameter("pageNum");
		
//		List<CeoDTO> menuSize = dao.getStoreMenu(shopCode);
//		
//		int maxMenu = menuSize.size();
		
		System.out.println("메뉴추가페이지 shopCode : " + shopCode);
		
		System.out.println("pageNum : " + pageNum);
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체데이터갯수
		int menuCount = dao.getMenuCount(shopCode);
		
		//전체페이지수
		int numPerPage = 4;
		int totalPage = myUtil.getPageCount(numPerPage, menuCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1 ) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
		
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("menu", menu);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("menuCount",menuCount);
		
		return "CEO/menuItem";
		
	}
	

	// 메뉴추가ajax
	@RequestMapping(value = "/addMenu_ok.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String addMenu_ok(HttpServletRequest request, HttpSession session, CeoDTO dto, MultipartRequest req) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String menuName = request.getParameter("menuName");
		String menuPrice = request.getParameter("menuPrice");
		String part = request.getParameter("part");
		System.out.println("메뉴이름 : " + menuName);
		System.out.println("메뉴가격 : " + menuPrice);
		System.out.println("메뉴종류 : " + part);
		
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");

		dto.setCeoId(ceoId);
		dto.setShopCode(shopCode);
		dto.setPart(part);

		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		
		// 메뉴이미지사진파일 업로드
		MultipartFile uploadMenu = req.getFile("uploadMenu");
		System.out.println("업로드파일 : " + uploadMenu);
//		String path = request.getSession().getServletContext().getRealPath("resources/menuimg/");
		String path = "D://menuimg/"; //메뉴사진 업로드경로
//		System.out.println(path);
		String newFileName = null;
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();
		if (uploadMenu != null) {
			String menuImg = uploadMenu.getOriginalFilename();

			// 파일 확장자
			String fileExt = menuImg.substring(menuImg.lastIndexOf("."));
			if (fileExt == null || fileExt.equals(""))
				return null;

			// 서버에 저장할 새로운 파일명을 만든다.
			newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			newFileName += System.nanoTime();
			newFileName += fileExt;

			dto.setMenuImg(newFileName);
			System.out.println("newFileName : " + newFileName);
			try {
				File file2 = new File(path + newFileName);
				uploadMenu.transferTo(file2);
				dao.insertMenu(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//전체데이터갯수
			int menuCount = dao.getMenuCount(shopCode);
			
			//전체페이지수
			int numPerPage = 4;
			int totalPage = myUtil.getPageCount(numPerPage, menuCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
			
			System.out.println("메뉴총개수 : " + menuCount);
			System.out.println("총페이지 : " + totalPage);
			
			request.setAttribute("numPerPage", numPerPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("menu", menu);
			request.setAttribute("menuCount",menuCount);
			
			return "CEO/menuItem";
		}
		
		dao.insertMenu(dto);
		
		//전체데이터갯수
		int menuCount = dao.getMenuCount(shopCode);
		
		//전체페이지수
		int numPerPage = 4;
		int totalPage = myUtil.getPageCount(numPerPage, menuCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
		
		System.out.println("메뉴총개수 : " + menuCount);
		System.out.println("총페이지 : " + totalPage);
		
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("menu", menu);
		request.setAttribute("menuCount",menuCount);
		
		return "CEO/menuItem";

	}
	
	//메뉴삭제 ajax
	@RequestMapping(value = "/deleteMenu.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteMenu(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String menuCode = request.getParameter("menuCode");
		System.out.println("메뉴코드 : " + menuCode + " 삭제");
		dao.deleteMenu(menuCode);
		
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		
//		List<CeoDTO> menu = dao.getStoreMenu(shopCode);
		
//		request.setAttribute("menu", menu);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체데이터갯수
		int menuCount = dao.getMenuCount(shopCode);
		
		//전체페이지수
		int numPerPage = 4;
		int totalPage = myUtil.getPageCount(numPerPage, menuCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1 ) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
		
		request.setAttribute("menu", menu);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("menuCount",menuCount);
		
		return "CEO/menuItem";
		
	}

	//메뉴추가 END===============================================================================================================================
	
	//매출 페이지
	@RequestMapping(value = "/sales.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String sales(HttpServletRequest request, HttpSession session) {
		
		System.out.println("sales.action");
		String shopCode = request.getParameter("shopCode");
		System.out.println(shopCode);
		
		List<SalesDTO> dayLists = dao.getDaySales(shopCode); // 일별 매출
		List<SalesDTO> monthLists = dao.getMonthSales(shopCode); // 월별 매출
		int totSales = dao.getTotSales(shopCode); // 매장별 총매출
		int profit = (int) (totSales * 0.9); // 순이익
		int orderCount = dao.getOrderCount(shopCode); //매장별 주문횟수
		int heartCount = dao.getHeartCount(shopCode); //매장별 찜횟수
		
		ObjectMapper mapper = new ObjectMapper();

		String jsonDay = null;
		String jsonMonth = null;
		
		try {
			
			jsonDay = mapper.writeValueAsString(dayLists); // json 형식으로 파싱
			jsonMonth = mapper.writeValueAsString(monthLists);

		} catch (JsonProcessingException e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		System.out.println(jsonDay);
		System.out.println(jsonMonth);
		request.setAttribute("heartCount", heartCount);
		request.setAttribute("orderCount", orderCount);
		request.setAttribute("profit", profit);
		request.setAttribute("totSales", totSales);
		request.setAttribute("jsonDay", jsonDay);
		request.setAttribute("jsonMonth", jsonMonth);
		request.setAttribute("shopCode", shopCode);
		
		return "CEO/sales";
		
	}
	
}

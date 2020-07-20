package com.eatswill.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.eatswill.dao.CeoDAO;
import com.eatswill.dto.CeoDTO;
import com.eatswill.dto.CeoInfo;
import com.eatswill.dto.OrderDTO;

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "index";

	}

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
	@RequestMapping(value = "/addStore.action")
	public String addStore() {

		return "CEO/addStore";

	}

	// DB에 매장추가
	@RequestMapping(value = "/addStore_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String addStore_ok(HttpServletRequest request, HttpSession session, CeoDTO dto) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		dto.setCeoId(ceoId);
		dto.setShopAddr(dto.getShopAddr1().concat(dto.getShopAddr2()));

		System.out.println(dto.getUploadfile());
		
		// 매장이미지사진파일 업로드
		MultipartFile uploadfile = dto.getUploadfile();
//		String path = request.getSession().getServletContext().getRealPath("resources/img/");
		String path = "D://img/";
		System.out.println(path);
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
			return "redirect:/addStore.action";
		}

		return "redirect:/addStore.action";

	}
	//매장추가 END=============================================================================================================================

	
	//리뷰관리 START=============================================================================================================================
	// 리뷰관리 페이지
	@RequestMapping(value = "/ceoReview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceoReview(HttpServletRequest request, HttpSession session, CeoDTO dto) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();

		List<CeoDTO> shopList = dao.getStoreList(ceoId);

		int storeCount = dao.getStoreCount(ceoId);

		request.setAttribute("shopList", shopList);
		request.setAttribute("storeCount", storeCount);

		return "CEO/ceoReview";

	}

	//리뷰페이지 ajax
	@RequestMapping(value = "/ceoReviewArticle.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String ajaxStoreRiview(HttpServletRequest request, HttpSession session) {
		System.out.println("ajax");
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
		System.out.println("ajax2");
		
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
	public String storeReiew(HttpServletRequest request, HttpSession session, CeoDTO dto) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String shopCode = request.getParameter("shopCode");
		
		
		
		List<CeoDTO> reviewList = dao.getStoreReview(ceoId, shopCode);
		int reviewCount = dao.getReviewCount(shopCode);
		dto = dao.getStoreName(shopCode);
		
		if(reviewCount != 0) {
			double avgReScore = dao.getAvgReScore(shopCode); // 해당 매장 평균별점
			double avgReScore2 = Math.round(avgReScore); // 매장 평균 별점 반올림함
			request.setAttribute("avgReScore", avgReScore);
			request.setAttribute("avgReScore2", avgReScore2);
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("reviewCount", reviewCount);
		
		return "CEO/storeReview";
		
	}
	//리뷰관리 END=============================================================================================================================
	
	
	//주문확인 START=============================================================================================================================
	// 주문확인 페이지 매장리스트
	@RequestMapping(value = "/orderChk.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String orderChk(HttpServletRequest request, HttpSession session) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		
		List<CeoDTO> shopList = dao.getStoreList(ceoId);
		
		request.setAttribute("shopList", shopList);
		
		return "CEO/orderChk";

	}
	
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
		
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}
	
	
	//주문상태 업데이트 ajax
	@RequestMapping(value = "/storeOrderChk_ok.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeOderChk_ok(HttpServletRequest request, HttpSession session) {
		
		String orderCode = request.getParameter("orderCode");
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		
		System.out.println(orderCode);
		dao.orderUpdate(orderCode);
		
		List<CeoDTO> orderList = dao.getOrderChk(shopCode);
		
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}
	//주문확인 END=============================================================================================================================
	
	
	//메뉴추가 START=============================================================================================================================
	//매장리스트
	@RequestMapping(value = "/storeList.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeList(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		
		List<CeoDTO> shopList = dao.getStoreList(ceoId);
		
		request.setAttribute("shopList", shopList);
		
		return "CEO/storeList";
		
	}

	// 메뉴추가 페이지
	@RequestMapping(value = "/addMenu.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String addMenu(HttpServletRequest request) {

		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		
		List<CeoDTO> menu = dao.getStoreMenu(shopCode);
		
		request.setAttribute("menu", menu);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		
		return "CEO/addMenu";

	}
	
	// 메뉴추가 페이지ajax
		@RequestMapping(value = "/menuItem.action", method = { RequestMethod.POST, RequestMethod.GET })
		public String menuItem(HttpServletRequest request, HttpSession session, CeoDTO dto) {
			
			String shopCode = request.getParameter("shopCode");
			String shopName = request.getParameter("shopName");
			
			List<CeoDTO> menu = dao.getStoreMenu(shopCode);
			
			request.setAttribute("menu", menu);
			request.setAttribute("shopCode", shopCode);
			request.setAttribute("shopName", shopName);
			
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
		System.out.println(part);
		
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		

		dto.setCeoId(ceoId);
		dto.setShopCode(shopCode);
		dto.setPart(part);

		// 메뉴이미지사진파일 업로드
		MultipartFile uploadMenu = req.getFile("uploadMenu");
		System.out.println("업로드파일 : " + uploadMenu);
//		String path = request.getSession().getServletContext().getRealPath("resources/menuimg/");
		String path = "D://img/";
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
			request.setAttribute("shopCode", shopCode);
			request.setAttribute("shopName", shopName);
			return "CEO/menuItem";
		}
		
		dao.insertMenu(dto);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		return "CEO/menuItem";

	}

	//메뉴추가 END===============================================================================================================================
	
	
}

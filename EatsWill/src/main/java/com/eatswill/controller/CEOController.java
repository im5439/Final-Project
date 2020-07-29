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

	// ���������� & �α���
	@RequestMapping(value = "/CEO.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceo(HttpServletRequest request, HttpSession session) {
		
		String ceoId = request.getParameter("ceoId");
		String ceoPw = request.getParameter("ceoPw");

		if (ceoId != null) {

			CeoDTO dto = dao.getReadData(ceoId);

			if (dto == null || !dto.getCeoPw().equals(ceoPw)) {

				System.out.println("���̵���Ʋ��");
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
			int orderChk = dao.ceoIdOrderStatus(info.getCeoId(), "100"); // �ֹ�Ȯ��
			int orderReady = dao.ceoIdOrderStatus(info.getCeoId(), "200"); // �غ���
			
			System.out.println("�ֹ�Ȯ�� : " + orderChk);
			System.out.println("�غ��� : " + orderReady);
			
			request.setAttribute("orderChk", orderChk);
			request.setAttribute("orderReady", orderReady);
			request.setAttribute("storeCount", storeCount);
			
		}

		return "CEO/ceo";

	}

	// �α׾ƿ�
	@RequestMapping(value = "/logout_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/CEO.action";

	}

	// ȸ������ ������
	@RequestMapping(value = "/ceoSignup.action")
	public String ceoSignup() {

		return "CEO/ceoSignup";

	}

	// ȸ������ �Ϸ�
	@RequestMapping(value = "/ceoSignup_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceoSignup_ok(HttpServletRequest request, CeoDTO dto) {

		dao.insertData(dto);

		return "redirect:/CEO.action";

	}

	
	//�����߰� START=============================================================================================================================
	// �����߰� ������
	@RequestMapping(value = "/addStore.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String addStore(HttpServletRequest request, HttpSession session, CeoDTO dto) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		
		List<CeoDTO> lists = dao.getStoreList(ceoId);
		
		request.setAttribute("lists", lists);
		
		return "CEO/addStore";

	}

	//���� ����Ʈ ajax
	@RequestMapping(value = "/storeItem.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String storeItem(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		
		List<CeoDTO> lists = dao.getStoreList(ceoId);
		
		request.setAttribute("lists", lists);
		
		return "CEO/storeItem";
		
	}

	// �����߰� ajax
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
		
		// �����̹����������� ���ε�
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

			// ���� Ȯ����
			String fileExt = shopImg.substring(shopImg.lastIndexOf("."));
			if (fileExt == null || fileExt.equals(""))
				return null;

			// ������ ������ ���ο� ���ϸ��� �����.
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
	
	//������� ajax
		@RequestMapping(value = "/deleteStore.action", method = { RequestMethod.POST, RequestMethod.GET })
		public String deleteStore(HttpServletRequest request, HttpSession session, CeoDTO dto) {
			
			CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
			String ceoId = info.getCeoId();
			String shopCode = request.getParameter("shopCode");
			System.out.println("�����ڵ� : " + shopCode + " ����");
			dao.deleteStore(shopCode);
			
			List<CeoDTO> lists = dao.getStoreList(ceoId);
			
			request.setAttribute("lists", lists);
			
			return "CEO/storeItem";
			
		}
	
	//�����߰� END=============================================================================================================================

	//���帮��Ʈ mode (�ֹ�Ȯ��,�޴�����,�������)
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
	
	//������� START=============================================================================================================================
	//���������� ajax
	@RequestMapping(value = "/ceoReviewArticle.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String ajaxStoreRiview(HttpServletRequest request, HttpSession session) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String shopCode = request.getParameter("shopCode");
		System.out.println("���������� : " + shopCode);
		List<CeoDTO> reviewList = dao.getStoreReview(ceoId, shopCode);
		request.setAttribute("reviewList", reviewList);

		return "CEO/ceoReviewArticle";

	}

	//���������� ����� ���ó�� ajax
	@RequestMapping(value = "/ajaxCeoReview.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String ajaxCeoReview(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String renum = request.getParameter("renum");
		String ceoContent = request.getParameter("ceoContent");
		System.out.println("���ó��renum :" + renum);
		System.out.println("���ó��ceoContent : " + ceoContent);
		
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
	
	//���������� ���â����
	@RequestMapping(value = "/reviewModal.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String reviewModal(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String renum = request.getParameter("renum");
		String shopCode = request.getParameter("shopCode");
		System.out.println("���ârenum :" + renum);
		System.out.println("���âshopCode : " + shopCode);
		
		request.setAttribute("renum", renum);
		request.setAttribute("shopCode", shopCode);
		
		return "CEO/reviewModal";
	}
	
	//���������� ����� ��ۻ��� ajax
	@RequestMapping(value = "/ajaxCeoReviewDel.action", produces = "application/String;charset=utf8", method = RequestMethod.POST)
	public String ajaxCeoReviewDel(HttpServletRequest request, HttpSession session) {
		
		System.out.println("ajax3");
		
		String renum = request.getParameter("renum");
		
		System.out.println("��ۻ���renum : " + renum);
		
		dao.ceoReviewDel(renum);
		
		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String shopCode = request.getParameter("shopCode");
		System.out.println(shopCode);
		List<CeoDTO> reviewList = dao.getStoreReview(ceoId, shopCode);
		request.setAttribute("reviewList", reviewList);
		
		
		return "CEO/ceoReviewArticle";
		
	}
	

	//�ش������ ���丮��Ʈ ������
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
			double avgReScore = dao.getAvgReScore(shopCode); // �ش� ���� ��պ���
			double avgReScore2 = Math.round(avgReScore); // ���� ��� ���� �ݿø���
			request.setAttribute("avgReScore", avgReScore);
			request.setAttribute("avgReScore2", avgReScore2);
		}
		
		request.setAttribute("shopdto", shopdto);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("reviewCount", reviewCount);
		
		return "CEO/storeReview";
		
	}
	//������� END=============================================================================================================================
	
	
	//�ֹ�Ȯ�� START=============================================================================================================================
	//�� ���� �ֹ�Ȯ�� ������
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
	
	//�� ���� �ֹ�Ȯ�� ���������� �ε��� orderChkList �ҷ����� ajax
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
		//orderStatus =  100 : �ֹ�Ȯ��, 200: �غ���, 300: �ֹ��Ϸ�
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}
	
	
	//�ֹ�����(�غ���,��޿Ϸ�) ������Ʈ ajax
	@RequestMapping(value = "/storeOrderChk_ok.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeOderChk_ok(HttpServletRequest request, HttpSession session) {
		
		String orderCode = request.getParameter("orderCode");
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		String orderStatus = request.getParameter("orderStatus");
		
		System.out.println("�ֹ��ڵ� : " + orderCode);
		System.out.println("�ֹ������ڵ� : " + orderStatus);
		
		dao.orderUpdate(orderCode, orderStatus); //�ֹ����� ������Ʈ �ڼ��Ѽ����� CeoDAO
		
		List<CeoDTO> orderList = dao.getOrderChk(shopCode);
		
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}

	//�ֹ�����(�ֹ����) ������Ʈ ajax
	@RequestMapping(value = "/storeOrderChk_cancel.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String storeOrderChk_cancel(HttpServletRequest request, HttpSession session) {
		
		String orderCode = request.getParameter("orderCode");
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		
		System.out.println("�ֹ��ڵ� : " + orderCode + " �ֹ����");
		
		dao.orderCancel(orderCode);//��޻��� �ֹ����
		
		List<CeoDTO> orderList = dao.getOrderChk(shopCode);
		
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("shopName", shopName);
		request.setAttribute("orderList", orderList);
		
		return "CEO/orderChkList";
		
	}
	//�ֹ�Ȯ�� END=============================================================================================================================
	
	
	//�޴��߰� START=============================================================================================================================
	// �޴��߰� ������
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
		
		//��ü�����Ͱ���
		int menuCount = dao.getMenuCount(shopCode);
		
		//��ü��������
		int numPerPage = 4;
		int totalPage = myUtil.getPageCount(numPerPage, menuCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
		
		System.out.println("�޴��Ѱ��� : " + menuCount);
		System.out.println("�������� : " + totalPage);
		
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("menu", menu);
		request.setAttribute("menuCount",menuCount);
		
		return "CEO/addMenu";

	}
	
	// �޴��߰� ������ajax (������ Ŭ����)
	@RequestMapping(value = "/menuItem.action", method = {RequestMethod.POST, RequestMethod.GET})
	public String menuItem(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String shopCode = request.getParameter("shopCode");
		String shopName = request.getParameter("shopName");
		String pageNum = request.getParameter("pageNum");
		
//		List<CeoDTO> menuSize = dao.getStoreMenu(shopCode);
//		
//		int maxMenu = menuSize.size();
		
		System.out.println("�޴��߰������� shopCode : " + shopCode);
		
		System.out.println("pageNum : " + pageNum);
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//��ü�����Ͱ���
		int menuCount = dao.getMenuCount(shopCode);
		
		//��ü��������
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
	

	// �޴��߰�ajax
	@RequestMapping(value = "/addMenu_ok.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String addMenu_ok(HttpServletRequest request, HttpSession session, CeoDTO dto, MultipartRequest req) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		String menuName = request.getParameter("menuName");
		String menuPrice = request.getParameter("menuPrice");
		String part = request.getParameter("part");
		System.out.println("�޴��̸� : " + menuName);
		System.out.println("�޴����� : " + menuPrice);
		System.out.println("�޴����� : " + part);
		
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
		
		
		// �޴��̹����������� ���ε�
		MultipartFile uploadMenu = req.getFile("uploadMenu");
		System.out.println("���ε����� : " + uploadMenu);
//		String path = request.getSession().getServletContext().getRealPath("resources/menuimg/");
		String path = "D://menuimg/"; //�޴����� ���ε���
//		System.out.println(path);
		String newFileName = null;
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();
		if (uploadMenu != null) {
			String menuImg = uploadMenu.getOriginalFilename();

			// ���� Ȯ����
			String fileExt = menuImg.substring(menuImg.lastIndexOf("."));
			if (fileExt == null || fileExt.equals(""))
				return null;

			// ������ ������ ���ο� ���ϸ��� �����.
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
			
			//��ü�����Ͱ���
			int menuCount = dao.getMenuCount(shopCode);
			
			//��ü��������
			int numPerPage = 4;
			int totalPage = myUtil.getPageCount(numPerPage, menuCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
			
			System.out.println("�޴��Ѱ��� : " + menuCount);
			System.out.println("�������� : " + totalPage);
			
			request.setAttribute("numPerPage", numPerPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("menu", menu);
			request.setAttribute("menuCount",menuCount);
			
			return "CEO/menuItem";
		}
		
		dao.insertMenu(dto);
		
		//��ü�����Ͱ���
		int menuCount = dao.getMenuCount(shopCode);
		
		//��ü��������
		int numPerPage = 4;
		int totalPage = myUtil.getPageCount(numPerPage, menuCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CeoDTO> menu = dao.getMenuList(shopCode, start, end);
		
		System.out.println("�޴��Ѱ��� : " + menuCount);
		System.out.println("�������� : " + totalPage);
		
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("menu", menu);
		request.setAttribute("menuCount",menuCount);
		
		return "CEO/menuItem";

	}
	
	//�޴����� ajax
	@RequestMapping(value = "/deleteMenu.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteMenu(HttpServletRequest request, HttpSession session, CeoDTO dto) {
		
		String menuCode = request.getParameter("menuCode");
		System.out.println("�޴��ڵ� : " + menuCode + " ����");
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
		
		//��ü�����Ͱ���
		int menuCount = dao.getMenuCount(shopCode);
		
		//��ü��������
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

	//�޴��߰� END===============================================================================================================================
	
	//���� ������
	@RequestMapping(value = "/sales.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String sales(HttpServletRequest request, HttpSession session) {
		
		System.out.println("sales.action");
		String shopCode = request.getParameter("shopCode");
		System.out.println(shopCode);
		
		List<SalesDTO> dayLists = dao.getDaySales(shopCode); // �Ϻ� ����
		List<SalesDTO> monthLists = dao.getMonthSales(shopCode); // ���� ����
		int totSales = dao.getTotSales(shopCode); // ���庰 �Ѹ���
		int profit = (int) (totSales * 0.9); // ������
		int orderCount = dao.getOrderCount(shopCode); //���庰 �ֹ�Ƚ��
		int heartCount = dao.getHeartCount(shopCode); //���庰 ��Ƚ��
		
		ObjectMapper mapper = new ObjectMapper();

		String jsonDay = null;
		String jsonMonth = null;
		
		try {
			
			jsonDay = mapper.writeValueAsString(dayLists); // json �������� �Ľ�
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

package com.eatswill.controller;


import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatswill.dao.StoreDAO;
import com.eatswill.dto.StoreDTO;


@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;

	@RequestMapping(value = "/menu", method = {                 RequestMethod.GET,RequestMethod.POST})
	public String menu(HttpServletRequest request,String shopCode,String userId,String ceoId) throws Exception{

		List<StoreDTO> lists = dao.menuList(shopCode);
		
		System.out.println("menuList" + ceoId);

		request.setAttribute("lists", lists);
		request.setAttribute("userId", userId);
		request.setAttribute("ceoId", ceoId);

		return "store/menuList";

	}

	@RequestMapping(value = "/info", method = {RequestMethod.GET,RequestMethod.POST})
	public String shopInfo(HttpServletRequest request,String shopCode,String ceoId) throws Exception{


		//String shopCode = request.getParameter("shopCode");

		System.out.println("info shopCode=>" + shopCode);

		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("lists", lists);

		return "store/storeInfo";
	}

	@RequestMapping(value = "/page", method = {RequestMethod.GET,RequestMethod.POST})
	public String page(HttpServletRequest request,String shopCode,String ceoId) {
		
		String userId = "hye";
		String chk = null;


		System.out.println("info shopCode=>" + shopCode);

		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);

		if(!dao.heartSelect(userId, shopCode).isEmpty()) {
			chk = "in";

		}else {
			chk = "del";
		}
		
		List<StoreDTO> lists1 = dao.selectList(userId);

		request.setAttribute("lists1", lists1);

		request.setAttribute("chk", chk);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("userId", userId);
		return "store/storePage";
	}


	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request, String shopCode, StoreDTO dto,String userId) {

		//String savePath = "D:\\reImg";

		List<StoreDTO> lists = dao.reviewList(shopCode, dto.getCount()+1);
		System.out.println("review renum" + (dto.getCount()+1));
		System.out.println("userId=" + userId);
		
		//count
		request.setAttribute("lists", lists);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("userId", userId);
		
		dao.deleteReview();
		dao.deleteReport(); //�Ű�3���� renum�� �ڵ�����
		

		return "store/reviewList";
	}
	
	@RequestMapping(value = "/report", method = {RequestMethod.POST,RequestMethod.GET})
	public String report
	(HttpServletRequest request,String userId,String reNum,StoreDTO dto,String menuCode,String shopCode,String ceoId,String count) {
		
		System.out.println("report ����");
		System.out.println(userId);
		System.out.println(reNum);
		
		dto.setReNum(Integer.parseInt(reNum));
		dto.setUserId(userId);
		
		dao.insertReport(dto);
		
		request.setAttribute("dto", dto);
	
		
		return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;
	}
	
	

	@RequestMapping(value = "/menuArticle", method = {RequestMethod.POST,RequestMethod.GET})
	public String menuArticle(HttpServletRequest request,String menuCode,String userId,String ceoId) {

		StoreDTO dto = dao.menuListOne(menuCode);
		
		System.out.println("article" + ceoId);
	
		request.setAttribute("userId", userId);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("dto", dto);

		return "store/menuArticle";
	}


	@RequestMapping(value = "/cartInsert", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartInsert(HttpServletRequest request, StoreDTO dto,String userId,String ceoId) {

		System.out.println("cartInsert ����");

		//������ �ޱ�
		int cAmount = Integer.parseInt(request.getParameter("cAmount"));
		int cQty = Integer.parseInt(request.getParameter("cQty"));
		String menuCode = request.getParameter("menuCode");
		String shopCode = request.getParameter("shopCode");
		
		System.out.println("cart ceoId" + ceoId);
		System.out.println("cart userId" + userId);

		//shopCode Select
		if(dao.cartChkShop(userId, shopCode).isEmpty()) {

			//���� ������ ����Ʈ delete
			System.out.println("cartChk ����");
			dao.deleteCart(userId);
			System.out.println("cart ceoId" + ceoId);
			System.out.println("cart userId" + userId);

		}

		//update
		if(!dao.selectCart(userId,menuCode).isEmpty()) {

			System.out.println("updateCart ����");

			dto.setcQty(cQty);
			dto.setcAmount(cAmount);

			dao.updateCart(dto);
			
			System.out.println("cart ceoId" + ceoId);
			System.out.println("cart userId" + userId);

			request.setAttribute("dto", dto);
		

			return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;

		}

		//������ insert
		System.out.println("cart ceoId" + ceoId);
		System.out.println("cart userId" + userId);
		dto.setUserId(userId);
		dto.setMenuCode(menuCode);
		dto.setcQty(cQty);
		dto.setcAmount(cAmount);
		dto.setShopCode(shopCode);

		dao.insertCart(dto);

		request.setAttribute("dto", dto);
		
		return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;

	}

	//��
	@RequestMapping(value = "/heart", method = {RequestMethod.POST,RequestMethod.GET})
	public String heart(HttpServletRequest request, StoreDTO dto,String chk,String shopCode,String ceoId,String userId) {

		System.out.println("heart ����");

		System.out.println("chk�� " + chk);

		//shopCode Select
		if(chk=="in" || chk.equals("in")) {

			dao.heartDelete(userId, shopCode);

			return "redirect:/page.action?shopCode=" + shopCode + "&userId=" + userId +"&ceoId=" + ceoId;
		}

		dto.setShopCode(shopCode);
		dto.setUserId(userId);

		dao.heartInsert(dto);
		

		return "redirect:/page.action?shopCode=" + shopCode + "&userId=" + userId +"&ceoId=" + ceoId;
	}

	//������ ����Ʈ ���(�ÿ�)
	@RequestMapping(value="/storeList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request,StoreDTO dto) throws Exception{

		String cp = request.getContextPath();

		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");

		if(searchKey == null){

			searchKey = "shopName";
			searchValue = "";

		}else{

			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
				URLDecoder.decode(searchValue, "UTF-8");	
		}

		List<StoreDTO> lists = dao.shopList();

		//�˻� ó��
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/storelist.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}

		//�ۺ��� �ּ� ����
		String articleUrl = 
				cp + "/page.action" ;

		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl",articleUrl);


		return "store/storeList";

	}
	
	@RequestMapping(value="/orderByRe.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String orderByRe(HttpServletRequest request,StoreDTO dto) throws Exception{
		
		System.out.println("orderByRe ����");
		String cp = request.getContextPath();
		
		List<StoreDTO> lists = dao.orderByRe();
		
		String articleUrl = 
				cp + "/page.action" ;

		
		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl",articleUrl);
		
		return "store/storeList";
		
	}
	
	@RequestMapping(value="/orderByO.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String orderByO(HttpServletRequest request,StoreDTO dto) throws Exception{
		
		System.out.println("orderByO ����");
		String cp = request.getContextPath();
		
		List<StoreDTO> lists = dao.orderByO();
		
		String articleUrl = 
				cp + "/page.action" ;

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl",articleUrl);
		
		return "store/storeList";
		
	}
	
	@RequestMapping(value="/orderByRes.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String orderByRes(HttpServletRequest request,StoreDTO dto) throws Exception{
		
		System.out.println("orderByRes ����");
		String cp = request.getContextPath();
		
		List<StoreDTO> lists = dao.orderByRes();
		
		String articleUrl = 
				cp + "/page.action" ;

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl",articleUrl);
		
		return "store/storeList";
		
	}

}

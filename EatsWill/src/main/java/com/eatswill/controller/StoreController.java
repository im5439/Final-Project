package com.eatswill.controller;


import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eatswill.dao.StoreDAO;
import com.eatswill.dto.StoreDTO;


@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;

	@RequestMapping(value = "/menu", method = {RequestMethod.GET,RequestMethod.POST})
	public String menu(HttpServletRequest request,String shopCode,String userId) throws Exception{

		List<StoreDTO> lists = dao.menuList(shopCode);

		request.setAttribute("lists", lists);
		request.setAttribute("userId", userId);

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
		
		String userId = "james"; //세션으로 받기
		String chk = null; // 


		System.out.println("info shopCode=>" + shopCode);

		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);

		if(!dao.heartSelect(userId, shopCode).isEmpty()) {
			chk = "in";

		}else {
			chk = "del";
		}

		request.setAttribute("chk", chk);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("userId", userId);
		return "store/storePage";
	}


	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request, String shopCode) {

		//String savePath = "D:\\reImg";

		List<StoreDTO> lists = dao.reviewList(shopCode);
		request.setAttribute("lists", lists);
		request.setAttribute("shopCode", shopCode);

		System.out.println("리뷰컨트롤");

		return "store/reviewList";
	}

	@RequestMapping(value = "/menuArticle", method = {RequestMethod.POST,RequestMethod.GET})
	public String menuArticle(HttpServletRequest request,String menuCode,String userId) {

		StoreDTO dto = dao.menuListOne(menuCode);

		request.setAttribute("userId", userId);
		request.setAttribute("dto", dto);

		return "store/menuArticle";
	}


	@RequestMapping(value = "/cartInsert", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartInsert(HttpServletRequest request, StoreDTO dto,String userId) {

		System.out.println("cartInsert 들어옴");

		//데이터 받기
		int cAmount = Integer.parseInt(request.getParameter("cAmount"));
		int cQty = Integer.parseInt(request.getParameter("cQty"));
		String menuCode = request.getParameter("menuCode");
		String shopCode = request.getParameter("shopCode");
		
		System.out.println("cart userId" + userId);

		//shopCode Select
		if(dao.cartChkShop(userId, shopCode).isEmpty()) {

			//원래 음식점 리스트 delete
			System.out.println("cartChk 들어옴");
			dao.deleteCart(userId);

		}

		//update
		if(!dao.selectCart(userId,menuCode).isEmpty()) {

			System.out.println("updateCart 들어옴");

			dto.setcQty(cQty);
			dto.setcAmount(cAmount);

			dao.updateCart(dto);
			
			System.out.println("cartUpdate userId: " + userId);

			request.setAttribute("dto", dto);

			return "redirect:/cartSelect.action?menuCode=" + menuCode + "&userId=" + userId;

		}

		//물리적 insert
		System.out.println("cartInsert userId: " + userId);
		dto.setUserId(userId);
		dto.setMenuCode(menuCode);
		dto.setcQty(cQty);
		dto.setcAmount(cAmount);
		dto.setShopCode(shopCode);

		dao.insertCart(dto);

		request.setAttribute("dto", dto);
		
		return "redirect:/cartSelect.action?menuCode=" + menuCode + "&userId=" + userId;

	}

	@RequestMapping(value = "/cartSelect", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartSelect(HttpServletRequest request,StoreDTO dto) {


		System.out.println("cartSelect 들어옴");

		String userId = request.getParameter("userId");

		List<StoreDTO> lists = dao.selectList(userId);

		request.setAttribute("lists", lists);
		return "store/cart";
	}

	//찜
	@RequestMapping(value = "/heart", method = {RequestMethod.POST,RequestMethod.GET})
	public String heart(HttpServletRequest request, StoreDTO dto,String chk,String shopCode,String ceoId,String userId) {

		System.out.println("heart 들어옴");

		System.out.println("chk는 " + chk);

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

	//음식점 리스트 출력(시연)
	@RequestMapping(value="/storeList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request,StoreDTO dto ,RedirectAttributes ra) throws Exception{

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

		//검색 처리
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

		//글보기 주소 정리
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
		
		System.out.println("orderByRe 들어옴");
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
		
		System.out.println("orderByO 들어옴");
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
		
		System.out.println("orderByRes 들어옴");
		String cp = request.getContextPath();
		
		List<StoreDTO> lists = dao.orderByRes();
		
		String articleUrl = 
				cp + "/page.action" ;

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl",articleUrl);
		
		return "store/storeList";
		
	}

}

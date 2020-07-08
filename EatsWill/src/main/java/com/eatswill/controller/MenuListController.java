package com.eatswill.controller;


import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatswill.dao.MenuListDAO;
import com.eatswill.dto.MenuListDTO;


@Controller
public class MenuListController {

	@Autowired
	MenuListDAO dao;

	@RequestMapping(value = "/menu", method = {RequestMethod.GET,RequestMethod.POST})
	public String menu(HttpServletRequest request,String shopCode) throws Exception{

		List<MenuListDTO> lists = dao.menuList(shopCode);

		request.setAttribute("lists", lists);

		return "store/menuList";

	}

	@RequestMapping(value = "/info", method = {RequestMethod.GET,RequestMethod.POST})
	public String shopInfo(HttpServletRequest request,String shopCode,String ceoId) throws Exception{


		//String shopCode = request.getParameter("shopCode");

		System.out.println("info shopCode=>" + shopCode);

		List<MenuListDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("lists", lists);

		return "store/StoreInfo";
	}

	@RequestMapping(value = "/page", method = {RequestMethod.GET,RequestMethod.POST})
	public String page(HttpServletRequest request,String shopCode,String ceoId) {

		String userId = "suzi";
		String chk = null;


		System.out.println("info shopCode=>" + shopCode);

		List<MenuListDTO> lists = dao.shopInfo(ceoId, shopCode);
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
		return "store/StorePage";
	}


	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request) {

		String savePath = "D:\\reImg";

		List<MenuListDTO> lists = dao.reviewList();
		request.setAttribute("lists", lists);
		request.setAttribute("savePath", savePath);

		System.out.println("리뷰컨트롤");

		return "store/reviewList";
	}

	@RequestMapping(value = "/menuArticle", method = {RequestMethod.POST,RequestMethod.GET})
	public String menuArticle(HttpServletRequest request) {

		String userId = "suzi"; //세션
		String menuCode = request.getParameter("menuCode");

		MenuListDTO dto = dao.menuListOne(menuCode);

		request.setAttribute("userId", userId);
		request.setAttribute("dto", dto);

		return "store/menuArticle";
	}


	@RequestMapping(value = "/cartInsert", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartInsert(HttpServletRequest request, MenuListDTO dto) {

		System.out.println("cartInsert 들어옴");

		//데이터 받기
		String userId = request.getParameter("userId");
		int cAmount = Integer.parseInt(request.getParameter("cAmount"));
		int cQty = Integer.parseInt(request.getParameter("cQty"));
		String menuCode = request.getParameter("menuCode");
		String shopCode = request.getParameter("shopCode");

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

			request.setAttribute("dto", dto);

			return "redirect:/cartSelect.action?menuCode=" + menuCode + "&userId=" + userId;

		}

		//물리적 insert
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
	public String cartSelect(HttpServletRequest request,MenuListDTO dto) {


		System.out.println("cartSelect 들어옴");

		String userId = request.getParameter("userId");

		List<MenuListDTO> lists = dao.selectList(userId);

		request.setAttribute("lists", lists);
		return "store/cart";
	}

	//찜
	@RequestMapping(value = "/heart", method = {RequestMethod.POST,RequestMethod.GET})
	public String heart(HttpServletRequest request, MenuListDTO dto,String chk,String shopCode,String ceoId,String userId) {

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
	public String list(HttpServletRequest request,MenuListDTO dto) throws Exception{

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

		List<MenuListDTO> shop_lists = dao.shopList();

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

		request.setAttribute("shop_lists", shop_lists);
		request.setAttribute("articleUrl",articleUrl);


		return "store/StoreList";

	}

}

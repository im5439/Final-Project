package com.eatswill.controller;

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
	public String list(HttpServletRequest request) throws Exception{

		String shopCode = "ck_2";

		System.out.println(shopCode);


		List<MenuListDTO> lists = dao.menuList(shopCode);

		request.setAttribute("lists", lists);

		return "store/menuList";

	}

	@RequestMapping(value = "/info", method = {RequestMethod.GET,RequestMethod.POST})
	public String shopInfo(HttpServletRequest request) throws Exception{

		String ceoId = "ceo";

		MenuListDTO dto = dao.shopInfo(ceoId);
		request.setAttribute("dto", dto);
		return "store/StoreInfo";
	}

	@RequestMapping(value = "/page", method = {RequestMethod.GET,RequestMethod.POST})
	public String page() {

		return "store/StorePage";
	}


	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request) {

		List<MenuListDTO> lists = dao.reviewList();
		request.setAttribute("lists", lists);

		System.out.println("리뷰컨트롤");

		return "store/reviewList";
	}

	@RequestMapping(value = "/menuArticle", method = {RequestMethod.POST,RequestMethod.GET})
	public String menuArticle(HttpServletRequest request) {

		//int menuPrice = (Integer.parseInt(request.getParameter("menuPrice")));
		//System.out.println(menuPrice);
		String userId = "hye";
		String menuCode = request.getParameter("menuCode");
		System.out.println("menuCode->" + menuCode);

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
		System.out.println("1");
		int cAmount = Integer.parseInt(request.getParameter("cAmount"));
		System.out.println("2");
		int cQty = Integer.parseInt(request.getParameter("cQty"));
		System.out.println("3");
		String menuCode = request.getParameter("menuCode");
		System.out.println(menuCode);
		String shopCode = request.getParameter("shopCode");
		//String shopCode = "ck_2";
		System.out.println("5");
		
		
		
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
		System.out.println("6");
		dto.setMenuCode(menuCode);
		System.out.println("7");
		dto.setcQty(cQty);
		System.out.println("8");
		dto.setcAmount(cAmount);
		System.out.println("9");
		dto.setShopCode(shopCode);
	
		dao.insertCart(dto);
	
		request.setAttribute("dto", dto);
		System.out.println("12");
		return "redirect:/cartSelect.action?menuCode=" + menuCode + "&userId=" + userId;

	}

	@RequestMapping(value = "/cartSelect", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartSelect(HttpServletRequest request,MenuListDTO dto) {
		
		
		System.out.println("cartSelect 들어옴");
	
		String menuCode = request.getParameter("menuCode");

		System.out.println(menuCode);
		
		String userId = request.getParameter("userId");
		
		List<MenuListDTO> lists = dao.selectList(userId);
		
		request.setAttribute("lists", lists);
		return "store/cart";
	}
	


}

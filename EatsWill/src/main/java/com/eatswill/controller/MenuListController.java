package com.eatswill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatswill.dao.MenuListDAO;
import com.eatswill.dto.MenuListDTO;

@Controller
public class MenuListController {
	
	@Autowired
	@Qualifier("menuListDAO")
	MenuListDAO dao;

	@RequestMapping(value = "/menu", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request) throws Exception{

		String shopCode = "KR_1";
		System.out.println(shopCode);
		List<MenuListDTO> lists = dao.menuList(shopCode);
		System.out.println(lists);
		
		request.setAttribute("lists", lists);
		return "store/menuList";
	}

	@RequestMapping(value = "/info", method = {RequestMethod.GET,RequestMethod.POST})
	public String shopInfo(HttpServletRequest request) throws Exception{
		
		String ceoId = "ceo1";
		MenuListDTO dto = dao.shopInfo(ceoId);
		request.setAttribute("dto", dto);
		System.out.println("가게정보컨트롤");
		return "store/storeInfo";
	}
	
	@RequestMapping(value = "/page", method = {RequestMethod.GET,RequestMethod.POST})
	public String page() {
	
		return "store/storePage";
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
		
		String menuCode = request.getParameter("menuCode");
		System.out.println("menuCode->" + menuCode);
		MenuListDTO dto = dao.menuListOne(menuCode);
		
		request.setAttribute("dto", dto);
		return "store/menuArticle";
	}
	

}

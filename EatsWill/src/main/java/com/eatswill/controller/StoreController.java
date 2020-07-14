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
	
	//메뉴리스트
	@RequestMapping(value = "/menu", method = {RequestMethod.GET,RequestMethod.POST})
	public String menu(HttpServletRequest request,String shopCode,String userId,String ceoId) throws Exception{

		List<StoreDTO> lists = dao.menuList(shopCode);

		System.out.println("menuList" + ceoId);

		request.setAttribute("lists", lists);
		request.setAttribute("userId", userId);
		request.setAttribute("ceoId", ceoId);

		return "store/menuList";

	}
	
	//매장정보
	@RequestMapping(value = "/info", method = {RequestMethod.GET,RequestMethod.POST})
	public String shopInfo(HttpServletRequest request,String shopCode,String ceoId) throws Exception{

		System.out.println("info shopCode: " + shopCode);

		if(dao.shopInfo(ceoId, shopCode).isEmpty()) {
			List<StoreDTO> lists = 
					dao.shopInfonotreview(ceoId, shopCode);
			request.setAttribute("lists", lists);

			return "store/storeInfo";
		}
		List<StoreDTO> lists = 
				dao.shopInfo(ceoId, shopCode);
		request.setAttribute("lists", lists);

		return "store/storeInfo";
	}
	
	//storePage
	@RequestMapping(value = "/page", method = {RequestMethod.GET,RequestMethod.POST})
	public String page(HttpServletRequest request,String shopCode,String ceoId) {

		String userId = "suzi";

		System.out.println("info shopCode=>" + shopCode);

		List<StoreDTO> lists = dao.selectList(userId);

		request.setAttribute("lists", lists);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("userId", userId);
		return "store/storePage";

	}

	
	//리뷰
	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request, String shopCode, StoreDTO dto,String userId) {

		List<StoreDTO> lists = dao.reviewList(shopCode, dto.getCount()+1);
		System.out.println("review renum" + (dto.getCount()+1));
		System.out.println("userId=" + userId);

		request.setAttribute("lists", lists);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("userId", userId);
		
		//신고 3번일시 리뷰,신고 테이블 자동삭제
		dao.deleteReview();
		dao.deleteReport(); 

		return "store/reviewList";
	}
	
	//신고
	@RequestMapping(value = "/report", method = {RequestMethod.POST,RequestMethod.GET})
	public String report
	(HttpServletRequest request,String userId,String reNum,StoreDTO dto,String menuCode,String shopCode,String ceoId,String count) {

		System.out.println("report 들어옴");
		System.out.println("report Id: " + userId);
		System.out.println("report reNum: " + reNum);

		dto.setReNum(Integer.parseInt(reNum));
		dto.setUserId(userId);

		dao.insertReport(dto);

		request.setAttribute("dto", dto);

		return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;
	}
	
	//메뉴 상세페이지(모달창)
	@RequestMapping(value = "/menuArticle", method = {RequestMethod.POST,RequestMethod.GET})
	public String menuArticle(HttpServletRequest request,String menuCode,String userId,String ceoId) {

		StoreDTO dto = dao.menuListOne(menuCode);

		System.out.println("article ceoId: " + ceoId);

		request.setAttribute("userId", userId);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("dto", dto);

		return "store/menuArticle";
	}

	//장바구니 inset/update/delete
	@RequestMapping(value = "/cartInsert", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartInsert(HttpServletRequest request, StoreDTO dto,String userId,String ceoId,String menuCode,String shopCode) {

		System.out.println("cartInsert 들어옴");

		//데이터 받기
		int cAmount = Integer.parseInt(request.getParameter("cAmount"));
		int cQty = Integer.parseInt(request.getParameter("cQty"));
	
		System.out.println("cart ceoId" + ceoId);
		System.out.println("cart userId" + userId);

		//다른 매장의 메뉴를 장바구니에 담을시 원래 매장코드의 메뉴 delete
		if(dao.cartChkShop(userId, shopCode).isEmpty()) {
			
			System.out.println("cartChk 들어옴");
			System.out.println("if문 안 cart ceoId" + ceoId);
			System.out.println("if문 안 cart userId" + userId);
			
			dao.deleteCart(userId);
		
		}

		//이미 메뉴코드가 장바구니안에 들어있을시 수량만 update
		if(!dao.selectCart(userId,menuCode).isEmpty()) {

			System.out.println("updateCart 들어옴");

			dto.setcQty(cQty);
			dto.setcAmount(cAmount);

			dao.updateCart(dto);

			System.out.println("cart ceoId" + ceoId);
			System.out.println("cart userId" + userId);

			request.setAttribute("dto", dto);

			return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;

		}

		//장바구니 insert
	
		dto.setUserId(userId);
		dto.setMenuCode(menuCode);
		dto.setcQty(cQty);
		dto.setcAmount(cAmount);
		dto.setShopCode(shopCode);

		dao.insertCart(dto);

		request.setAttribute("dto", dto);

		return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;

	}

	//찜테이블 물리적(insert,delete)
	@RequestMapping(value = "/heartInDel", method = {RequestMethod.POST,RequestMethod.GET})
	public String heartInDel(HttpServletRequest request, StoreDTO dto,String chk,String shopCode,String ceoId,String userId) {

		System.out.println("heart Indel 들어옴");

		System.out.println(chk);
		
		//review테이블에 데이터가 없을시
		if(dao.shopInfo(ceoId, shopCode).isEmpty()) {

			//chk in/del 검증
			//찜테이블에 인서트가 되어있으면
			if(chk.equals("in") || chk=="in") {
				
				dao.heartDelete(userId, shopCode);
				
				List<StoreDTO> lists = dao.shopInfonotreview(ceoId, shopCode);
				request.setAttribute("userId", userId);
				request.setAttribute("lists", lists);
				
				//delete 후 "chk" del로 변경
				chk = "del";

				request.setAttribute("chk", chk);

				return "store/heart";
			}
			
			//찜테이블에 데이터가 없을시(찜을 안눌렀을시)
			List<StoreDTO> lists = dao.shopInfonotreview(ceoId, shopCode);

			request.setAttribute("userId", userId);
			request.setAttribute("lists", lists);
			
			//chk에 "in"을 담음
			chk = "in";

			dto.setShopCode(shopCode);
			dto.setUserId(userId);

			dao.heartInsert(dto);

			request.setAttribute("chk", chk);
			return "store/heart";
		}
		
		//review테이블에 데이터가 있을시 (dao.shopInfo) 사용
		if(chk.equals("in") || chk=="in") {

			dao.heartDelete(userId, shopCode);

			List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
			request.setAttribute("userId", userId);
			request.setAttribute("lists", lists);

			chk = "del";

			request.setAttribute("chk", chk);

			return "store/heart";
		}

		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);

		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);

		chk = "in";


		dto.setShopCode(shopCode);
		dto.setUserId(userId);

		dao.heartInsert(dto);

		request.setAttribute("chk", chk);
		return "store/heart";
	}
	
	//찜테이블 검증
	@RequestMapping(value = "/heart", method = {RequestMethod.POST,RequestMethod.GET})
	public String heart(HttpServletRequest request, StoreDTO dto,String chk,String shopCode,String ceoId,String userId) {

		System.out.println("heart검증 들어옴");
		
		//review테이블에 데이터가 없을시 (dao.shopInfonotreview) 사용
		if(dao.shopInfo(ceoId, shopCode).isEmpty()) {

			List<StoreDTO> lists = dao.shopInfonotreview(ceoId, shopCode);
			request.setAttribute("userId", userId);
			request.setAttribute("lists", lists);
			
			//heart테이블에 데이터가 있을시
			if(!dao.heartSelect(userId, shopCode).isEmpty()) {
				chk = "in";
			
			}else {
				//없을시
				chk = "del";
			}

			request.setAttribute("chk", chk);
			return "store/heart";

		}

		//review테이블에 데이터가 있을시 (dao.shopInfo) 사용
		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);

		if(!dao.heartSelect(userId, shopCode).isEmpty()) {
			chk = "in";

		}else {
			chk = "del";
		}

		request.setAttribute("chk", chk);
		return "store/heart";

	}

	//음식점 리스트 출력
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
	
	//리뷰순 정렬
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
	
	//주문순 정렬
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
	
	//별점순 정렬
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

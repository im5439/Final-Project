package com.eatswill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatswill.dao.StoreDAO;
import com.eatswill.dto.CustomDTO;
import com.eatswill.dto.StoreDTO;
import com.eatswill.util.MyUtil;

@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;

	@Autowired
	MyUtil myUtil;

	// 메인메뉴리스트
	@RequestMapping(value = "/menu", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu(HttpServletRequest request, String shopCode, String userId, String ceoId) throws Exception {

		System.out.println("menu 들어옴");

		List<StoreDTO> lists = dao.menuList(shopCode);

		System.out.println("menuList" + ceoId);

		request.setAttribute("lists", lists);
		request.setAttribute("userId", userId);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("shopCode", shopCode);

		return "store/menuList";

	}

	// 매장정보
	@RequestMapping(value = "/info", method = { RequestMethod.GET, RequestMethod.POST })
	public String shopInfo(HttpServletRequest request, String shopCode, String ceoId) throws Exception {

		System.out.println("shopInfo 들어옴");

		System.out.println("info shopCode: " + shopCode);

		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("lists", lists);

		return "store/storeInfo";
	}

	// storePage
	@RequestMapping(value = "/page", method = { RequestMethod.GET, RequestMethod.POST })
	public String page(HttpServletRequest request, String shopCode, String ceoId, String userId) {

		System.out.println("page 들어옴");

		// userId session처리

		HttpSession session = request.getSession();
		CustomDTO dto = (CustomDTO) session.getAttribute("customInfo");

		if (dto == null || dto.equals("")) {
			userId = "guest"; // 세션값이 없을때 user로 임의의 아이디 부여

			request.setAttribute("userId", userId);
			request.setAttribute("shopCode", shopCode);
			request.setAttribute("ceoId", ceoId);

			System.out.println("shopCode=>" + shopCode);
			System.out.println("userId==>" + userId);
			return "store/storePage";
		}

		System.out.println("shopCode=>" + shopCode);
		System.out.println("userId==>" + userId);

		request.setAttribute("shopCode", shopCode);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("userId", dto.getId());

		return "store/storePage";

	}

	// 리뷰
	@RequestMapping(value = "/review", method = { RequestMethod.POST, RequestMethod.GET })
	public String review(HttpServletRequest request, String shopCode, String userId) {

		System.out.println("review 들어옴");
		System.out.println("shopCode ----> " + shopCode);
		System.out.println("userId ----> " + userId);
		List<StoreDTO> lists = dao.reviewList(shopCode);

		request.setAttribute("lists", lists);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("userId", userId);

		return "store/reviewList";
	}

	// 신고
	@RequestMapping(value = "/report", method = { RequestMethod.POST, RequestMethod.GET })
	public String report(HttpServletRequest request, String userId, String reNum, StoreDTO dto, String menuCode,
			String shopCode, String ceoId, String count) {

		System.out.println("report 들어옴");
		System.out.println("report Id: " + userId);
		System.out.println("report reNum: " + reNum);
		System.out.println("report shopCode: " + shopCode);

		dto.setReNum(Integer.parseInt(reNum));
		dto.setUserId(userId);

		dao.insertReport(dto);

		request.setAttribute("dto", dto);

		// 신고 카운트가 3번이됐다면
		// 리뷰,신고테이블에서 데이터 삭제
		dao.deleteReview();
		dao.deleteReport();

		// 후 조회
		List<StoreDTO> lists = dao.reviewList(shopCode);

		request.setAttribute("lists", lists);

		return "store/reviewList";
	}

	// 메뉴 상세페이지(모달창)
	@RequestMapping(value = "/menuArticle", method = { RequestMethod.POST, RequestMethod.GET })
	public String menuArticle(HttpServletRequest request, String menuCode, String userId, String ceoId,
			String shopCode) {

		System.out.println("menuArticle 들어옴");

		System.out.println(shopCode);

		StoreDTO dto = dao.menuListOne(menuCode);
		List<StoreDTO> lists = dao.sideMenuList(shopCode);

		System.out.println("article ceoId: " + ceoId);

		request.setAttribute("userId", userId);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("dto", dto);
		request.setAttribute("lists", lists);

		return "store/menuArticle";
	}

	// 장바구니 inset/update/delete
	@RequestMapping(value = "/cartInsert", method = { RequestMethod.POST, RequestMethod.GET })
	public String cartInsert(HttpServletRequest request, StoreDTO dto, String userId, String ceoId, String menuCode,
			String shopCode) {

		System.out.println("cartInsert 들어옴");

		int cAmount = Integer.parseInt(request.getParameter("cAmount")); // 총액
		int cQty = Integer.parseInt(request.getParameter("cQty")); // 수량
		int addAmount = Integer.parseInt(request.getParameter("addAmount")); // 사이드메뉴의 총액
		int a = cAmount + addAmount;

		System.out.println("a--------->" + a);

		System.out.println("addAmount: " + addAmount);

		// 체크박스에서 내가 선택한 메뉴코드,이름,가격을 받음
		String sideMenuCode = request.getParameter("sideMenuCode");
		String sideMenuName = request.getParameter("sideMenuName");
		String sideMenuPrice = request.getParameter("sideMenuPrice");

		String[] sideMenuCodeArr = null;
		String[] sideMenuNameArr = null;
		String[] sideMenuPriceArr = null;
		int[] sideMenuPriceI = null;

		// 변수안에 담겨서 온 데이터를 ,로 구분해서 배열안에넣음
		// 마지막 , 자름
		if (sideMenuCode != null && sideMenuCode.trim().length() > 0) {
			sideMenuCode = sideMenuCode.substring(0, sideMenuCode.length() - 1);
			sideMenuCodeArr = sideMenuCode.split(",");

			sideMenuName = sideMenuName.substring(0, sideMenuName.length() - 1);
			sideMenuNameArr = sideMenuName.split(",");

			sideMenuPrice = sideMenuPrice.substring(0, sideMenuPrice.length() - 1);
			sideMenuPriceArr = sideMenuPrice.split(",");

			// 메뉴가격은 데이터 타입 변환
			sideMenuPriceI = new int[sideMenuPriceArr.length];

			for (int j = 0; j < sideMenuPriceArr.length; j++) {

				sideMenuPriceI[j] = Integer.parseInt(sideMenuPriceArr[j]);

				System.out.println("sideMenuPriceL[j]= " + sideMenuPriceArr[j]);

			}
		}
		// 다른 매장의 메뉴를 장바구니에 담을시 원래 매장코드의 메뉴 delete
		if (dao.cartChkShop(userId, shopCode).isEmpty()) {

			dao.deleteCart(userId);
		}

		// 이미 메뉴코드가 장바구니안에 들어있을시 수량,금액만 update
		// 메인메뉴
		if (!dao.selectCart(userId, menuCode).isEmpty()) {

			dto.setMenuCode(menuCode);
			dto.setSideMenuCode(menuCode); // 메인메뉴는 자기자신의 코드를 넣음
			dto.setcQty(cQty);
			dto.setcAmount(cAmount);

			System.out.println("cart ceoId----------------->" + ceoId);
			System.out.println("cart userId--------------->" + userId);
			System.out.println("cart menuCode--------------->" + dto.getMenuCode());
			System.out.println("cart getSideMenuCode--------------->" + dto.getSideMenuCode());
			System.out.println("cart sideMenuCode--------------->" + sideMenuCode);
			System.out.println("cart cQty--------------->" + cQty);
			System.out.println("cart cAmount--------------->" + cAmount);

			dao.updateCart(dto);

			// 사이드메뉴
			if (menuCode != sideMenuCode && (sideMenuCode != null && !sideMenuCode.equals(""))) {

				for (int i = 0; i < sideMenuCodeArr.length; i++) {

					dto.setSideMenuCode(sideMenuCodeArr[i]);
					dto.setcQty(1);
					dto.setcAmount(sideMenuPriceI[i]);

					// 사이드메뉴 두개를 담았는데 한개는 장바구니에 담겨있고
					// 한개는 없을때 insert/update
					if (dao.chkCartSide(userId, menuCode, sideMenuCodeArr[i]).isEmpty()) {
						dao.insertCart(dto);
					} else {
						dao.updateCart(dto);
					}

				}

			}

			request.setAttribute("dto", dto);

			return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId + "&shopCode=" + shopCode
					+ "&ceoId=" + ceoId + "&addAmount=" + addAmount;

		}

		// 장바구니 insert

		// 메인메뉴
		dto.setUserId(userId);
		dto.setMenuCode(menuCode);
		dto.setSideMenuCode(menuCode);
		dto.setcQty(cQty);
		dto.setcAmount(cAmount);
		dto.setShopCode(shopCode);

		dao.insertCart(dto);

		// 사이드메뉴
		if (sideMenuCode != null && !sideMenuCode.equals("")) {

			for (int i = 0; i < sideMenuCodeArr.length; i++) {

				dto.setUserId(userId);
				dto.setMenuCode(menuCode);
				dto.setSideMenuCode(sideMenuCodeArr[i]);
				dto.setMenuName(sideMenuNameArr[i]);
				dto.setcQty(1);
				dto.setcAmount(sideMenuPriceI[i]);

				dao.insertCart(dto);

			}

		}

		request.setAttribute("dto", dto);

		return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId + "&shopCode=" + shopCode + "&ceoId="
				+ ceoId;

	}

	// 장바구니 select(page에서 처음 장바구니를 띄워주기위해서)
	@RequestMapping(value = "/selectCartAll", method = { RequestMethod.POST, RequestMethod.GET })
	public String selectCartAll(HttpServletRequest request, String userId, String ceoId, String menuCode,
			String shopCode) {

		System.out.println("selectCartAll 들어옴---------------------");

		List<StoreDTO> lists = dao.selectCartMain(userId);

		List<StoreDTO> lists1 = dao.selectCartSide(userId);

		List<StoreDTO> lists2 = dao.selectMenuPrice(userId);

		// int addAmount = Integer.parseInt(request.getParameter("addAmount"));

		// StoreDTO addprice = dao.selectMenuPrice(menuCode);

		int listsu = lists.size(); // 매장의 메뉴 개수
		int listSideSu = 0; // 매장의 메뉴의 사이드메뉴 개수

		int[] priceAmountArr = new int[listsu]; // 메뉴들의 수로 배열 선언
		int priceAmount = 0; // 주문하는 메뉴들의 총 금액 초기화
		int priceSideAmount = 0; // 주문하는 사이드 메뉴들의 총 금액 초기화

		listSideSu = lists1.size(); // 매장의 메뉴의 사이드메뉴 개수
		int listSideGroup = lists2.size(); // 각 메뉴별 사이드메뉴들의 가격의 합이 나오는 리스트 개수

		System.out.println("listsu->" + listsu);
		System.out.println("listSideSu->" + listSideSu);
		System.out.println("listSideGroup->" + listSideGroup);

		int[] sidePrice = new int[listSideSu];

		for (int i = 0; i < listsu; i++) {

			System.out.println(lists.get(i).getcAmount());
			priceAmountArr[i] = lists.get(i).getcAmount();
			priceAmount += priceAmountArr[i]; // 주문할 금액들의 합
			System.out.println("main Amount--> " + priceAmount);
			System.out.println("main getMenuCode--> " + lists.get(i).getMenuCode());

		}

		// 주문하는 사이드 메뉴들의 총 금액 계산
		for (int i = 0; i < listSideSu; i++) {
			priceSideAmount += lists1.get(i).getcAmount();
			sidePrice[i] = lists1.get(i).getcAmount();
			System.out.println("side Amount--> " + priceSideAmount);
			request.setAttribute("sidePrice" + i, sidePrice[i]);
			System.out.println("sidePrice[i]= " + sidePrice[i]);
		}

		request.setAttribute("listsu", listsu);
		request.setAttribute("listSideSu", listSideSu);
		request.setAttribute("listSideGroup", listSideGroup);
		request.setAttribute("priceAmount", priceAmount + priceSideAmount); // 사이드메뉴+메인메뉴 총액

		request.setAttribute("lists", lists);
		request.setAttribute("lists1", lists1);
		request.setAttribute("lists2", lists2);

		return "store/cart";
	}

	// 장바구니 delete
	@RequestMapping(value = "/deleteCart", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteCart(HttpServletRequest request, StoreDTO dto, String userId, String ceoId, String menuCode,
			String shopCode) {

		System.out.println("deleteCart 들어옴");
		System.out.println("userId: " + userId);
		System.out.println("menuCode: " + menuCode);

		dao.deleteCartOne(userId, menuCode);

		List<StoreDTO> lists = dao.selectCartMain(userId);

		List<StoreDTO> lists1 = dao.selectCartSide(userId);

		List<StoreDTO> lists2 = dao.selectMenuPrice(userId);

		int listsu = lists.size(); // 매장의 메뉴 개수
		int listSideSu = 0; // 매장의 메뉴의 사이드메뉴 개수
		int listSideGroup = lists2.size(); // 각 메뉴별 사이드메뉴들의 가격의 합이 나오는 리스트 개수

		int[] priceAmountArr = new int[listsu]; // 메뉴들의 수로 배열 선언
		int priceAmount = 0; // 주문하는 메뉴들의 총 금액 초기화
		int priceSideAmount = 0; // 주문하는 사이드 메뉴들의 총 금액 초기화

		for (int i = 0; i < listsu; i++) {

			System.out.println(lists.get(i).getcAmount());
			priceAmountArr[i] = lists.get(i).getcAmount();
			priceAmount += priceAmountArr[i]; // 주문할 금액들의 합
			System.out.println("main Amount--> " + priceAmount);
			System.out.println("main getMenuCode--> " + lists.get(i).getMenuCode());

		}

		listSideSu = lists1.size(); // 매장의 메뉴의 사이드메뉴 갯수

		System.out.println("listSideSu->" + listSideSu);

		// 주문하는 사이드 메뉴들의 총 금액 계산
		for (int i = 0; i < listSideSu; i++) {
			priceSideAmount += lists1.get(i).getcAmount();
			System.out.println("side Amount--> " + priceSideAmount);

		}

		request.setAttribute("listsu", listsu);
		request.setAttribute("priceAmount", priceAmount + priceSideAmount); // 사이드메뉴+메인메뉴 총액
		request.setAttribute("lists", lists);
		request.setAttribute("lists1", lists1);
		request.setAttribute("lists2", lists2);
		request.setAttribute("listSideGroup", listSideGroup);

		return "store/cart";
	}

	// 찜테이블 물리적(insert,delete)
	@RequestMapping(value = "/heartInDel", method = { RequestMethod.POST, RequestMethod.GET })
	public String heartInDel(HttpServletRequest request, StoreDTO dto, String chk, String shopCode, String ceoId,
			String userId) {

		System.out.println("heart Indel 들어옴");
		System.out.println(chk);

		// chk in/del 검증
		// 찜테이블에 인서트가 되어있으면
		if (chk.equals("in") || chk == "in") {

			dao.heartDelete(userId, shopCode);

			List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
			request.setAttribute("userId", userId);
			request.setAttribute("lists", lists);

			// delete 후 "chk" del로 변경
			chk = "del";

			request.setAttribute("chk", chk);

			return "store/heart";
		}

		// 찜테이블에 데이터가 없을시(찜을 안눌렀을시)
		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);

		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);

		// chk에 "in"을 담음
		chk = "in";

		dto.setShopCode(shopCode);
		dto.setUserId(userId);

		dao.heartInsert(dto);

		request.setAttribute("chk", chk);
		return "store/heart";

	}

	// 찜테이블 검증
	@RequestMapping(value = "/heart", method = { RequestMethod.POST, RequestMethod.GET })
	public String heart(HttpServletRequest request, StoreDTO dto, String chk, String shopCode, String ceoId,
			String userId) {

		System.out.println("heart검증 들어옴");

		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);

		// heart테이블에 데이터가 있을시
		if (!dao.heartSelect(userId, shopCode).isEmpty()) {
			chk = "in";

		} else {
			// 없을시
			chk = "del";
		}
		request.setAttribute("chk", chk);
		return "store/heart";

	}

	// 음식점 리스트 출력
	@RequestMapping(value = "/storeList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(HttpServletRequest request, StoreDTO dto) throws Exception {

		System.out.println("storeList 들어옴");
		
		String category = request.getParameter("category");
		
		if(category ==null || category.equals("")) {
			category="";
		}
		System.out.println("category=" + category);
		
		String cp = request.getContextPath();
		
		int shopCount = dao.shopCount(category);

		String articleUrl = cp + "/page.action" ;

		request.setAttribute("shopCount", shopCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("category", category);

		return "store/storeList";

	}

	// 리뷰순 정렬
	@RequestMapping(value = "/orderByRe.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderByRe(HttpServletRequest request, StoreDTO dto) throws Exception {

		System.out.println("orderByRe 들어옴");
		String cp = request.getContextPath();

		List<StoreDTO> lists = dao.orderByRe();

		String articleUrl = cp + "/page.action";

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl", articleUrl);

		return "store/storeList";

	}

	// 주문순 정렬
	@RequestMapping(value = "/orderByO.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderByO(HttpServletRequest request, StoreDTO dto) throws Exception {

		System.out.println("orderByO 들어옴");
		String cp = request.getContextPath();

		List<StoreDTO> lists = dao.orderByO();

		String articleUrl = cp + "/page.action";

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl", articleUrl);

		return "store/storeList";

	}

	// 별점순 정렬
	@RequestMapping(value = "/orderByRes.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderByRes(HttpServletRequest request, StoreDTO dto) throws Exception {

		System.out.println("orderByRes 들어옴");
		String cp = request.getContextPath();

		List<StoreDTO> lists = dao.orderByRes();

		String articleUrl = cp + "/page.action";

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl", articleUrl);

		return "store/storeList";

	}

	// 결제창
	@RequestMapping(value = "/order.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String order(HttpServletRequest request, String userId, String shopCode, String shopName) throws Exception {

		System.out.println("결제창 들어옴");
		int priceAmount = Integer.parseInt(request.getParameter("priceAmount"));
		System.out.println("priceAmount----->" + priceAmount);
		
		HttpSession session = request.getSession();
		CustomDTO dto = (CustomDTO) session.getAttribute("customInfo");

		List<StoreDTO> lists = dao.selectOrderInfo(dto.getId()); // 고객정보
		List<StoreDTO> lists1 = dao.selectCartAll(dto.getId()); // 카트에 담겨있는 메뉴들

		StoreDTO dto1 = dao.selectOrderShopName(dto.getId());
		shopName = dto1.getShopName();
		shopCode = dto1.getShopCode();

		System.out.println("shopName------->" + shopName);

		request.setAttribute("lists", lists);
		request.setAttribute("lists1", lists1);
		request.setAttribute("userId", dto.getId());
		request.setAttribute("shopName", shopName);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("priceAmount", priceAmount); // 총액

		return "store/payment";

	}

	// 레알 결제
	@RequestMapping(value = "/order_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String order_ok(HttpServletRequest request, String orderShopCode, String orderRequest, StoreDTO dto,
			String deliveryAddr1, String deliveryAddr2) throws Exception {

		System.out.println("orderReal 들어옴");

		int priceAmount = Integer.parseInt(request.getParameter("priceAmount")); // 결제할 금액 (포인트 사용전)
		int userPoint = Integer.parseInt(request.getParameter("userPoint")); // 내가 사용한 포인트
		int oAmount = priceAmount-userPoint; //결제할 금액 - 내가 사용한 포인트
		
		HttpSession session = request.getSession();
		CustomDTO dto1 = (CustomDTO) session.getAttribute("customInfo");

		// 오더메인 인서트
		dto.setUserId(dto1.getId());
		dto.setoAmount(oAmount);
		dto.setShopCode(orderShopCode);
		dto.setRequest(orderRequest);
		dto.setDeliveryAddr1(deliveryAddr1);
		dto.setDeliveryAddr2(deliveryAddr2);

		dao.insertOrderMain(dto);

		List<StoreDTO> lists = dao.selectPreOrderDe(dto1.getId()); // 오더디테일

		// 오더디테일 인서트
		for (int i = 0; i < lists.size(); i++) {

			System.out.println("if문들어옴");

			dto.setMenuCode(lists.get(i).getSideMenuCode());
			dto.setoQty(lists.get(i).getcQty()); 
			
			dao.insertOrderDetail(dto);

		}

		// 장바구니삭제
		dao.deleteCart(dto1.getId());

		// 사용자가 사용한 포인트 차감(update)
		if (userPoint != 0) {

			dto.setUserPoint(userPoint);
			dto.setReUserId(dto1.getId());

			dao.useUserPoint(dto);
		}

		// 결제금액의 5프로 포인트적립
		dao.updateOrderPoint(dto1.getId());

		System.out.println("완료");

		return "store/paymentChk";
	}
	
	 @RequestMapping(value="/updateCQTY", method ={RequestMethod.GET,RequestMethod.POST}) 
	  public String updateCQTY(HttpServletRequest request,String menuCode) throws Exception{
		 
		 HttpSession session = request.getSession();
			CustomDTO dto = (CustomDTO) session.getAttribute("customInfo");
			
			int cQty = Integer.parseInt(request.getParameter("cQty"));	
			System.out.println("menuCode====" + menuCode);
			int cAmount = Integer.parseInt(request.getParameter("cAmount"));
			System.out.println("cAmount====" + cAmount);
			
			dao.updateQTY(cQty, dto.getId(),menuCode,cAmount);

			List<StoreDTO> lists = dao.selectCartMain(dto.getId());

			List<StoreDTO> lists1 = dao.selectCartSide(dto.getId());

			List<StoreDTO> lists2 = dao.selectMenuPrice(dto.getId());
			
			request.setAttribute("lists", lists);
			request.setAttribute("lists1", lists1);
			request.setAttribute("lists2", lists2);
			
			int listsu = lists.size(); // 매장의 메뉴 개수
			int listSideSu = 0; // 매장의 메뉴의 사이드메뉴 개수

			int[] priceAmountArr = new int[listsu]; // 메뉴들의 수로 배열 선언
			int priceAmount = 0; // 주문하는 메뉴들의 총 금액 초기화
			int priceSideAmount = 0; // 주문하는 사이드 메뉴들의 총 금액 초기화

			listSideSu = lists1.size(); // 매장의 메뉴의 사이드메뉴 개수
			int listSideGroup = lists2.size(); // 각 메뉴별 사이드메뉴들의 가격의 합이 나오는 리스트 개수

			System.out.println("listsu->" + listsu);
			System.out.println("listSideSu->" + listSideSu);
			System.out.println("listSideGroup->" + listSideGroup);

			int[] sidePrice = new int[listSideSu];

			for (int i = 0; i < listsu; i++) {

				System.out.println(lists.get(i).getcAmount());
				priceAmountArr[i] = lists.get(i).getcAmount();
				priceAmount += priceAmountArr[i]; // 주문할 금액들의 합
				System.out.println("main Amount--> " + priceAmount);
				System.out.println("main getMenuCode--> " + lists.get(i).getMenuCode());

			}

			// 주문하는 사이드 메뉴들의 총 금액 계산
			for (int i = 0; i < listSideSu; i++) {
				priceSideAmount += lists1.get(i).getcAmount();
				sidePrice[i] = lists1.get(i).getcAmount();
				System.out.println("side Amount--> " + priceSideAmount);
				request.setAttribute("sidePrice" + i, sidePrice[i]);
				System.out.println("sidePrice[i]= " + sidePrice[i]);
			}

			request.setAttribute("listsu", listsu);
			request.setAttribute("listSideSu", listSideSu);
			request.setAttribute("listSideGroup", listSideGroup);
			request.setAttribute("priceAmount", priceAmount + priceSideAmount); // 사이드메뉴+메인메뉴 총액
 
		 return "store/cart";
		 
	 }

	// ajax shopList
	  @RequestMapping(value="/stores", method ={RequestMethod.GET,RequestMethod.POST}) 
	  public String stores(HttpServletRequest request,StoreDTO dto) throws Exception{
	  
	  
		  System.out.println("stores.action 들어옴!");
			
			String cp = request.getContextPath();
			List<StoreDTO> lists = dao.shopList();
			
			String category = request.getParameter("category");
			System.out.println("category=" + category);
			
			if(category==null || category.equals("")) {
				System.out.println("카테고리 아무것도 없음");
				
				category = "";
			}
			
			//음식점 페이징 테스트로 하나의 페이지에 2개씩 보여줌
			//페이징을 주고 버튼을 누를때마다 ajax로 페이지에서 값을 가져와서 보여줄 수 있도록
			//더보기 버튼을 누를 때마다 내용물 출력
			String pageNum = request.getParameter("pageNum");
					
			int currentPage = 1; 
					
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			int numPerPage =4; //한페이지의 음식점 수 , 실제로 데이터 많아지면 10개씩 
			int shopCountall = dao.shopCountall();
			int totalPage = myUtil.getPageCount(numPerPage, shopCountall);
		
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<StoreDTO> page_lists = dao.shopPaging(start, end,category);
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, cp + "/stores.action");
			
			
			String articleUrl = 
					cp + "/page.action" ;
			
			request.setAttribute("lists",lists);
			request.setAttribute("articleUrl",articleUrl);
			
			request.setAttribute("page_lists",page_lists);
			request.setAttribute("pageIndexList",pageIndexList);
			request.setAttribute("shopCountall",shopCountall);

			
			return "store/stores";

		}

}

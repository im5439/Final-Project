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

	//���θ޴�����Ʈ
	@RequestMapping(value = "/menu", method = {RequestMethod.GET,RequestMethod.POST})
	public String menu(HttpServletRequest request,String shopCode,String userId,String ceoId,String part) throws Exception{

		System.out.println("menu ����");

		List<StoreDTO> lists = dao.menuList(shopCode);

		System.out.println("menuList" + ceoId);

		request.setAttribute("lists", lists);
		request.setAttribute("userId", userId);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("shopCode", shopCode);

		return "store/menuList";

	}

	//��������
	@RequestMapping(value = "/info", method = {RequestMethod.GET,RequestMethod.POST})
	public String shopInfo(HttpServletRequest request,String shopCode,String ceoId) throws Exception{

		System.out.println("shopInfo ����");

		System.out.println("info shopCode: " + shopCode);

		List<StoreDTO> lists = 
				dao.shopInfo(ceoId, shopCode);
		request.setAttribute("lists", lists);

		return "store/storeInfo";	
	}

	//storePage
	@RequestMapping(value = "/page", method = {RequestMethod.GET,RequestMethod.POST})
	public String page(HttpServletRequest request,String shopCode,String ceoId) {

		System.out.println("page ����");

		String userId = "user";

		System.out.println("info shopCode=>" + shopCode);

		request.setAttribute("shopCode", shopCode);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("userId", userId);
		return "store/storePage";

	}


	//����
	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request, String shopCode, StoreDTO dto,String userId) {

		System.out.println("review ����");

		List<StoreDTO> lists = dao.reviewList(shopCode, dto.getCount()+1);
		System.out.println("review renum" + (dto.getCount()+1));
		System.out.println("userId=" + userId);

		request.setAttribute("lists", lists);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("userId", userId);

		return "store/reviewList";
	}

	//�Ű�
	@RequestMapping(value = "/report", method = {RequestMethod.POST,RequestMethod.GET})
	public String report
	(HttpServletRequest request,String userId,String reNum,StoreDTO dto,String menuCode,String shopCode,String ceoId,String count) {

		System.out.println("report ����");
		System.out.println("report Id: " + userId);
		System.out.println("report reNum: " + reNum);
		System.out.println("shopCode: " + shopCode);

		dto.setReNum(Integer.parseInt(reNum));
		dto.setUserId(userId);

		dao.insertReport(dto);

		request.setAttribute("dto", dto);

		//�Ű� ī��Ʈ�� 3���̵ƴٸ� ����
		dao.deleteReview();
		dao.deleteReport(); 

		//�� ��ȸ
		List<StoreDTO> lists = dao.reviewList(shopCode, dto.getCount()+1);
		System.out.println("review renum" + (dto.getCount()+1));
		System.out.println("userId=" + userId);
		System.out.println("shopCode: " + shopCode);

		request.setAttribute("lists", lists);

		return "store/reviewList";
	}

	//�޴� ��������(���â)
	@RequestMapping(value = "/menuArticle", method = {RequestMethod.POST,RequestMethod.GET})
	public String menuArticle(HttpServletRequest request,String menuCode,String userId,String ceoId,String shopCode) {

		System.out.println("menuArticle ����");

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

	//��ٱ��� inset/update/delete
	@RequestMapping(value = "/cartInsert", method = {RequestMethod.POST,RequestMethod.GET})
	public String cartInsert(HttpServletRequest request, StoreDTO dto,String userId,String ceoId,String menuCode,String shopCode) {

		System.out.println("cartInsert ����");

		//������ �ޱ�
		int cAmount = Integer.parseInt(request.getParameter("Amount"));
		int cQty = Integer.parseInt(request.getParameter("cQty"));

		System.out.println("cart ceoId" + ceoId);
		System.out.println("cart userId" + userId);

		//�ٸ� ������ �޴��� ��ٱ��Ͽ� ������ ���� �����ڵ��� �޴� delete
		if(dao.cartChkShop(userId, shopCode).isEmpty()) {

			System.out.println("cartChk ����");
			System.out.println("if�� �� cart ceoId" + ceoId);
			System.out.println("if�� �� cart userId" + userId);

			dao.deleteCart(userId);

		}

		//�̹� �޴��ڵ尡 ��ٱ��Ͼȿ� ��������� ������ update
		if(!dao.selectCart(userId,menuCode).isEmpty()) {

			System.out.println("updateCart ����");

			dto.setcQty(cQty);
			dto.setcAmount(cAmount);

			dao.updateCart(dto);

			System.out.println("cart ceoId" + ceoId);
			System.out.println("cart userId" + userId);

			request.setAttribute("dto", dto);
			request.setAttribute("shopCode", shopCode);
			request.setAttribute("ceoId", ceoId);
			request.setAttribute("userId", userId);

			return "store/storePage";

		}

		//��ٱ��� insert

		dto.setUserId(userId);
		dto.setMenuCode(menuCode);
		dto.setcQty(cQty);
		dto.setcAmount(cAmount);
		dto.setShopCode(shopCode);

		dao.insertCart(dto);

		request.setAttribute("dto", dto);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("userId", userId);

		return "store/storePage";

	}

	//��ٱ��� select �� delete �� select
	@RequestMapping(value = "/selectCartAll", method = {RequestMethod.POST,RequestMethod.GET})
	public String selectCartAll(HttpServletRequest request,String userId,String ceoId,String menuCode,String shopCode) {

		System.out.println("selectCartAll ����");
		System.out.println("userId: " + userId);


		List<StoreDTO> lists = dao.selectCartAll(userId);

		int listsu = lists.size(); //������ �޴� ����

		int[] priceAmountArr = new int[listsu] ; //�޴����� ���� �迭 ����
		int priceAmount=0; //�ֹ��ϴ� �޴����� �� �ݾ� �ʱ�ȭ

		for(int i=0;i<listsu;i++) {

			System.out.println(lists.get(i).getcAmount());
			priceAmountArr[i] = lists.get(i).getcAmount();
			priceAmount += priceAmountArr[i]; // �ֹ��� �ݾ׵��� ��
			System.out.println(priceAmount);
		}

		System.out.println("lists�� ���ڵ� ������: " + listsu);

		request.setAttribute("listsu", listsu);
		request.setAttribute("priceAmount", priceAmount);


		request.setAttribute("lists", lists);


		return "store/cart";
	}

	//��ٱ��� delete
	@RequestMapping(value = "/deleteCart", method = {RequestMethod.POST,RequestMethod.GET})
	public String deleteCart(HttpServletRequest request, StoreDTO dto,String userId,String ceoId,String menuCode,String shopCode) {

		System.out.println("deleteCart ����");
		System.out.println("userId: " + userId);
		System.out.println("menuCode: " + menuCode);

		dao.deleteCartOne(userId, menuCode);

		List<StoreDTO> lists = dao.selectCartAll(userId);
		request.setAttribute("lists", lists);

		return "store/cart";
	}

	//�����̺� ������(insert,delete)
	@RequestMapping(value = "/heartInDel", method = {RequestMethod.POST,RequestMethod.GET})
	public String heartInDel(HttpServletRequest request, StoreDTO dto,String chk,String shopCode,String ceoId,String userId) {

		System.out.println("heart Indel ����");
		System.out.println(chk);

		//chk in/del ����
		//�����̺��� �μ�Ʈ�� �Ǿ�������
		if(chk.equals("in") || chk=="in") {

			dao.heartDelete(userId, shopCode);

			List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
			request.setAttribute("userId", userId);
			request.setAttribute("lists", lists);

			//delete �� "chk" del�� ����
			chk = "del";

			request.setAttribute("chk", chk);

			return "store/heart";
		}

		//�����̺��� �����Ͱ� ������(���� �ȴ�������)
		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);

		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);

		//chk�� "in"�� ����
		chk = "in";

		dto.setShopCode(shopCode);
		dto.setUserId(userId);

		dao.heartInsert(dto);

		request.setAttribute("chk", chk);
		return "store/heart";

	}

	//�����̺� ����
	@RequestMapping(value = "/heart", method = {RequestMethod.POST,RequestMethod.GET})
	public String heart(HttpServletRequest request, StoreDTO dto,String chk,String shopCode,String ceoId,String userId) {

		System.out.println("heart���� ����");
		System.out.println("1");

		System.out.println(shopCode);
		System.out.println(ceoId);



		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);


		//heart���̺��� �����Ͱ� ������
		if(!dao.heartSelect(userId, shopCode).isEmpty()) {
			System.out.println("3");
			chk = "in";

		}else {
			//������
			System.out.println("4");
			chk = "del";
		}
		System.out.println("5");

		request.setAttribute("chk", chk);
		return "store/heart";

	}

	//������ ����Ʈ ���
	@RequestMapping(value="/storeList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request,StoreDTO dto) throws Exception{

		System.out.println("storeList ����");

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

	//����� ����
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

	//�ֹ��� ����
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

	//������ ����
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
package com.eatswill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatswill.dao.StoreDAO;
import com.eatswill.dto.StoreDTO;
import com.eatswill.util.MyUtil;


@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;
	
	@Autowired()
	MyUtil myUtil;

	//���θ޴�����Ʈ
	@RequestMapping(value = "/menu", method = {RequestMethod.GET,RequestMethod.POST})
	public String menu(HttpServletRequest request,String shopCode,String userId,String ceoId) throws Exception{

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
		
		//int addAmount = Integer.parseInt(request.getParameter("addAmount"));
		
		//userId sessionó��
		String userId = "james";

		System.out.println("shopCode=>" + shopCode);

		request.setAttribute("shopCode", shopCode);
		request.setAttribute("ceoId", ceoId);
		request.setAttribute("userId", userId);
		//request.setAttribute("addAmount", addAmount);
		return "store/storePage";

	}


	//����
	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request, String shopCode,String userId) {

		System.out.println("review ����");
		System.out.println("shopCode ----> " + shopCode);
		List<StoreDTO> lists = dao.reviewList(shopCode);
		
		request.setAttribute("lists", lists);
		request.setAttribute("shopCode", shopCode);
		request.setAttribute(userId, userId);
		
		return "store/reviewList";
	}

	//�Ű�
	@RequestMapping(value = "/report", method = {RequestMethod.POST,RequestMethod.GET})
	public String report
	(HttpServletRequest request,String userId,String reNum,StoreDTO dto,String menuCode,String shopCode,String ceoId,String count) {

		System.out.println("report ����");
		System.out.println("report Id: " + userId);
		System.out.println("report reNum: " + reNum);
		System.out.println("report shopCode: " + shopCode);

		dto.setReNum(Integer.parseInt(reNum));
		dto.setUserId(userId);

		dao.insertReport(dto);

		request.setAttribute("dto", dto);

		//�Ű� ī��Ʈ�� 3���̵ƴٸ� 
		//����,�Ű����̺��� ������ ����
		dao.deleteReview();
		dao.deleteReport(); 

		//�� ��ȸ
		List<StoreDTO> lists = dao.reviewList(shopCode);
	
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

		int cAmount = Integer.parseInt(request.getParameter("cAmount")); //�Ѿ�
		int cQty = Integer.parseInt(request.getParameter("cQty")); //����
		//int addAmount = Integer.parseInt(request.getParameter("addAmount")); //���̵�޴��� �Ѿ�
		
		//System.out.println("addAmount: " + addAmount);
		
		//üũ�ڽ����� ���� ������ �޴��ڵ�,�̸�,������ ����
		String sideMenuCode = request.getParameter("sideMenuCode");
		String sideMenuName = request.getParameter("sideMenuName");
		String sideMenuPrice = request.getParameter("sideMenuPrice") ; 
		
		String[] sideMenuCodeArr = null;
		String[] sideMenuNameArr = null;
		String[] sideMenuPriceArr = null;
		int[]  sideMenuPriceI =  null;
		
		//�����ȿ� ��ܼ� �� �����͸� ,�� �����ؼ� �迭�ȿ�����
		//������ , �ڸ�
		if (sideMenuCode != null && sideMenuCode.trim().length()>0) {
			sideMenuCode = sideMenuCode.substring(0, sideMenuCode.length()-1);
			sideMenuCodeArr = sideMenuCode.split(",");
		
			sideMenuName = sideMenuName.substring(0, sideMenuName.length()-1);
			sideMenuNameArr = sideMenuName.split(",");
		
			sideMenuPrice = sideMenuPrice.substring(0,sideMenuPrice.length()-1) ;
			sideMenuPriceArr = sideMenuPrice.split(",");
		
			//�޴������� ������ Ÿ�� ��ȯ
			sideMenuPriceI = new int [sideMenuPriceArr.length];
		
			for(int j=0; j<sideMenuPriceArr.length; j++) {
			
				sideMenuPriceI[j] = Integer.parseInt(sideMenuPriceArr[j]);
			
				System.out.println("sideMenuPriceArr[j]= " + sideMenuPriceArr[j]);
			
			}
		}
		//�ٸ� ������ �޴��� ��ٱ��Ͽ� ������ ���� �����ڵ��� �޴� delete
		if(dao.cartChkShop(userId, shopCode).isEmpty()) {

			dao.deleteCart(userId);
		}

		//�̹� �޴��ڵ尡 ��ٱ��Ͼȿ� ��������� ����,�ݾ׸� update
		//���θ޴�
		if(!dao.selectCart(userId,menuCode).isEmpty()) {
			
			dto.setMenuCode(menuCode);
			dto.setSideMenuCode(menuCode);
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
			

			//���̵�޴� 
			if(menuCode != sideMenuCode  && (sideMenuCode!=null && !sideMenuCode.equals(""))) {
				
				for(int i=0; i<sideMenuCodeArr.length; i++) {
				
					dto.setSideMenuCode(sideMenuCodeArr[i]);
					dto.setcQty(1);
					dto.setcAmount(sideMenuPriceI[i]);
					
					//���̵�޴� �ΰ��� ��Ҵµ� �Ѱ��� ��ٱ��Ͽ� ����ְ�
					//�Ѱ��� ������ insert/update
					if(dao.chkCartSide(userId,menuCode,sideMenuCodeArr[i]).isEmpty())  {
						dao.insertCart(dto);
					}
					else {
						dao.updateCart(dto);
					}
				
				}

			}
		
			request.setAttribute("dto", dto);
	
			return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;

		}

		//��ٱ��� insert

		//���θ޴�
		dto.setUserId(userId);
		dto.setMenuCode(menuCode);
		dto.setSideMenuCode(menuCode);
		dto.setcQty(cQty);
		dto.setcAmount(cAmount);
		dto.setShopCode(shopCode);

		dao.insertCart(dto);
		
		//���̵�޴�
		if(sideMenuCode!=null && !sideMenuCode.equals("")) {
			
			for(int i=0; i<sideMenuCodeArr.length; i++) {
			
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

		return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId;

	}

	//��ٱ��� select(page���� ó�� ��ٱ��ϸ� ����ֱ����ؼ�)
	@RequestMapping(value = "/selectCartAll", method = {RequestMethod.POST,RequestMethod.GET})
	public String selectCartAll(HttpServletRequest request,String userId,String ceoId,String menuCode,String shopCode) {

		System.out.println("selectCartAll ����---------------------");
		
		List<StoreDTO> lists = dao.selectCartMain(userId);

		List<StoreDTO> lists1 = dao.selectCartSide(userId);
		
		List<StoreDTO> lists2 = dao.selectMenuPrice(userId);
		
		//int addAmount = Integer.parseInt(request.getParameter("addAmount"));
		
		//StoreDTO addprice = dao.selectMenuPrice(menuCode);
		
		int listsu = lists.size(); //������ �޴� ����
		int listSideSu = 0; //������ �޴��� ���̵�޴� ����
		

		int[] priceAmountArr = new int[listsu] ; //�޴����� ���� �迭 ����
		int priceAmount=0; //�ֹ��ϴ� �޴����� �� �ݾ� �ʱ�ȭ
		int priceSideAmount=0; //�ֹ��ϴ� ���̵� �޴����� �� �ݾ� �ʱ�ȭ
		
		listSideSu = lists1.size(); //������ �޴��� ���̵�޴� ����
		int listSideGroup = lists2.size(); //�� �޴��� ���̵�޴����� ������ ���� ������ ����Ʈ ����
		
		System.out.println("listsu->" + listsu );
		System.out.println("listSideSu->" + listSideSu );
		System.out.println("listSideGroup->" + listSideGroup );
		
		int []sidePrice = new int[listSideSu];
		
		for(int i=0;i<listsu;i++) {

			System.out.println(lists.get(i).getcAmount());
			priceAmountArr[i] = lists.get(i).getcAmount();
			priceAmount += priceAmountArr[i]; // �ֹ��� �ݾ׵��� ��
			System.out.println("main Amount--> " + priceAmount);
			System.out.println("main getMenuCode--> " + lists.get(i).getMenuCode());
			
		}

		
		//�ֹ��ϴ� ���̵� �޴����� �� �ݾ� ���
		for(int i=0;i<listSideSu;i++) {
				priceSideAmount += lists1.get(i).getcAmount();
				sidePrice[i] = lists1.get(i).getcAmount();
				System.out.println("side Amount--> " + priceSideAmount);
				request.setAttribute("sidePrice"+i, sidePrice[i]);
				System.out.println("sidePrice[i]= " + sidePrice[i]);
		}		

		request.setAttribute("listsu", listsu);
		request.setAttribute("listSideSu", listSideSu);
		request.setAttribute("listSideGroup", listSideGroup);
		request.setAttribute("priceAmount", priceAmount + priceSideAmount); //���̵�޴�+���θ޴� �Ѿ�
		
		request.setAttribute("lists1", lists1);
		request.setAttribute("lists", lists);
		request.setAttribute("lists2", lists2);
		
		
		return "store/cart";
	}

	//��ٱ��� delete
	@RequestMapping(value = "/deleteCart", method = {RequestMethod.POST,RequestMethod.GET})
	public String deleteCart(HttpServletRequest request, StoreDTO dto,String userId,String ceoId,String menuCode,String shopCode) {

		System.out.println("deleteCart ����");
		System.out.println("userId: " + userId);
		System.out.println("menuCode: " + menuCode);

		dao.deleteCartOne(userId, menuCode);

		List<StoreDTO> lists = dao.selectCartMain(userId);

		List<StoreDTO> lists1 = dao.selectCartSide(userId);
		
		List<StoreDTO> lists2 = dao.selectMenuPrice(userId);
		
		int listsu = lists.size(); //������ �޴� ����
		int listSideSu = 0; //������ �޴��� ���̵�޴� ����
		int listSideGroup = lists2.size(); //�� �޴��� ���̵�޴����� ������ ���� ������ ����Ʈ ����

		int[] priceAmountArr = new int[listsu] ; //�޴����� ���� �迭 ����
		int priceAmount=0; //�ֹ��ϴ� �޴����� �� �ݾ� �ʱ�ȭ
		int priceSideAmount=0; //�ֹ��ϴ� ���̵� �޴����� �� �ݾ� �ʱ�ȭ
		
		for(int i=0;i<listsu;i++) {

			System.out.println(lists.get(i).getcAmount());
			priceAmountArr[i] = lists.get(i).getcAmount();
			priceAmount += priceAmountArr[i]; // �ֹ��� �ݾ׵��� ��
			System.out.println("main Amount--> " + priceAmount);
			System.out.println("main getMenuCode--> " + lists.get(i).getMenuCode());
			
		}

	
		listSideSu = lists1.size(); //������ �޴��� ���̵�޴� ����

		System.out.println("listSideSu->" + listSideSu );
		
		
		//�ֹ��ϴ� ���̵� �޴����� �� �ݾ� ���
		for(int i=0;i<listSideSu;i++) {
				priceSideAmount += lists1.get(i).getcAmount();
				System.out.println("side Amount--> " + priceSideAmount);
			
		}		

		request.setAttribute("listsu", listsu);
		request.setAttribute("priceAmount", priceAmount + priceSideAmount); //���̵�޴�+���θ޴� �Ѿ�
		request.setAttribute("lists", lists);	
		request.setAttribute("lists1", lists1);
		request.setAttribute("lists2", lists2);
		request.setAttribute("listSideGroup", listSideGroup);

		return "store/cart";
	}

	//�����̺� ������(insert,delete)
	@RequestMapping(value = "/heartInDel", method = {RequestMethod.POST,RequestMethod.GET})
	public String heartInDel(HttpServletRequest request, StoreDTO dto,String chk,String shopCode,String ceoId,String userId) {

		System.out.println("heart Indel ����");
		System.out.println(chk);

		//chk in/del ����
		//�����̺� �μ�Ʈ�� �Ǿ�������
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

		//�����̺� �����Ͱ� ������(���� �ȴ�������)
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
		
		List<StoreDTO> lists = dao.shopInfo(ceoId, shopCode);
		request.setAttribute("userId", userId);
		request.setAttribute("lists", lists);


		//heart���̺� �����Ͱ� ������
		if(!dao.heartSelect(userId, shopCode).isEmpty()) {
			chk = "in";

		}else {
			//������
			chk = "del";
		}
		request.setAttribute("chk", chk);
		return "store/heart";

	}

	//������ ����Ʈ ���
	@RequestMapping(value="/storeList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request,StoreDTO dto) throws Exception{

		System.out.println("storeList ����");

		String cp = request.getContextPath();
		
		String category = request.getParameter("category");
		
		if(category==null || category.equals("")) {
			System.out.println("ī�װ� �ƹ��͵� ����");
			category = "";
		}
		
		//������ ����¡ �׽�Ʈ�� �ϳ��� �������� 2���� ������
		//����¡�� �ְ� ��ư�� ���������� ajax�� ���������� ���� �����ͼ� ������ �� �ֵ���
		//������ ��ư�� ���� ������ ���빰 ���
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		int shopCount = dao.shopCount(category);
		
		int numPerPage =1;
		int totalPage = myUtil.getPageCount(numPerPage, shopCount);
	
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		System.out.println("category= " + category);
		List<StoreDTO> page_lists = dao.shopPaging(start, end);
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, cp + "/storeList.action");
		
		List<StoreDTO> lists = dao.shopList();

		String articleUrl = 
				cp + "/page.action" ;

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl",articleUrl);
		
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("page_lists",page_lists);
		request.setAttribute("shopCount", shopCount);
		

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
	
	//����������
	@RequestMapping(value="/", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(HttpServletRequest request,StoreDTO dto) throws Exception{

		return "store/main";

	}
		
	//������ ����
	@RequestMapping(value="/stores", method = {RequestMethod.GET,RequestMethod.POST})
	public String stores(HttpServletRequest request,StoreDTO dto) throws Exception{
		
		String cp = request.getContextPath();
		List<StoreDTO> lists = dao.shopList();
		
		String category = request.getParameter("category");
		
		if(category==null || category.equals("")) {
			System.out.println("ī�װ� �ƹ��͵� ����");
			category = "";
		}
		
		//������ ����¡ �׽�Ʈ�� �ϳ��� �������� 2���� ������
		//����¡�� �ְ� ��ư�� ���������� ajax�� ���������� ���� �����ͼ� ������ �� �ֵ���
		//������ ��ư�� ���� ������ ���빰 ���
		String pageNum = request.getParameter("pageNum");
				
		int currentPage = 2; //���������� ������ �� , ������ ������ �������� 10���� 
				
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int numPerPage =1;
		int shopCountall = dao.shopCountall();
		int totalPage = myUtil.getPageCount(numPerPage, shopCountall);
	
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<StoreDTO> page_lists = dao.shopPaging(start, end);
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

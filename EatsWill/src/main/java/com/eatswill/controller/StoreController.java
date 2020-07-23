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


@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;

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
	public String page(HttpServletRequest request,String shopCode,String ceoId,String userId) {

		System.out.println("page ����");
		
		//userId sessionó��
		
		HttpSession session = request.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");
		
		if(dto==null || dto.equals("")) {
			 userId="guest"; //���ǰ��� ������ user�� ������ ���̵� �ο�
			 
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


	//����
	@RequestMapping(value = "/review", method = {RequestMethod.POST,RequestMethod.GET})
	public String review(HttpServletRequest request, String shopCode,String userId) {

		System.out.println("review ����");
		System.out.println("shopCode ----> " + shopCode);
		System.out.println("userId ----> " + userId);
		List<StoreDTO> lists = dao.reviewList(shopCode);
		
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
		int addAmount = Integer.parseInt(request.getParameter("addAmount")); //���̵�޴��� �Ѿ�
		int a = cAmount+addAmount;
		
		System.out.println("a--------->" + a);
		
		System.out.println("addAmount: " + addAmount);
		
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
			
				System.out.println("sideMenuPriceL[j]= " + sideMenuPriceArr[j]);
			
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
			dto.setSideMenuCode(menuCode); //���θ޴��� �ڱ��ڽ��� �ڵ带 ����
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
	
			return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId + "&addAmount=" + addAmount;

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

		return "redirect:/page.action?menuCode=" + menuCode + "&userId=" + userId +"&shopCode=" + shopCode + "&ceoId=" + ceoId   ;

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
			
			request.setAttribute("lists", lists);
			request.setAttribute("lists1", lists1);
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
	@RequestMapping(value="/storeList.action", method = RequestMethod.POST)
	public String list(HttpServletRequest request,StoreDTO dto,String searchKey,String searchValue,String index) throws Exception{

		System.out.println("storeList ����");
		//System.out.println("A: " + searchKey + "B: " + searchValue + "C: " + index);
		String cp = request.getContextPath();

		List<StoreDTO> lists = dao.shopList((searchKey+searchValue));

		String articleUrl = cp + "/page.action" ;

		request.setAttribute("lists", lists);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("searchKey", searchKey);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("index", index);

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
	
	//����â
	@RequestMapping(value="/order.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String order(HttpServletRequest request,String userId,String shopCode) throws Exception{
		
		System.out.println("����â ����");
		int priceAmount = Integer.parseInt("priceAmount");
		System.out.println("priceAmount----->" + priceAmount);
		
		HttpSession session = request.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");
		
		List<StoreDTO> lists = dao.selectOrderInfo(dto.getId());
		List<StoreDTO> lists1 = dao.selectCartAll(dto.getId());
		
		request.setAttribute("lists", lists);
		request.setAttribute("lists1", lists1);
		request.setAttribute("userId", dto.getId());
		request.setAttribute("shopCode", shopCode);
		request.setAttribute("priceAmount", priceAmount);
		
		return "store/payment";
		
	}
	

}

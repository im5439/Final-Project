package com.eatswill.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.StoreDTO;

public class StoreDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;

	}

	//���θ޴� ��ü���
	public List<StoreDTO> menuList(String shopCode) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.menuList",shopCode);

		return lists;
	}

	//���̵�޴� ��ü���
	public List<StoreDTO> sideMenuList(String shopCode) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.sideMenuList",shopCode);

		return lists;
	}

	//������ ����
	public StoreDTO shopInfo (String ceoId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("ceoId", ceoId);

		StoreDTO dto = sessionTemplate.selectOne("storeMapper.shopInfo",map);

		return dto;
	}


	//���� ����Ʈ
	public List<StoreDTO> reviewList(String shopCode) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.reviewList",shopCode);
		return lists;
	}

	//�Ű� �μ�Ʈ
	public void insertReport(StoreDTO dto) {	
		sessionTemplate.insert("storeMapper.insertReport",dto);	
	}


	//�Ű� ����Ʈ(�Ű�,�������̺�)
	public void deleteReport() {
		sessionTemplate.delete("storeMapper.deleteReport");

	}

	public void deleteReview() {
		sessionTemplate.delete("storeMapper.deleteReview");

	}

	//�Ѱ����޴� ��������(���)
	public StoreDTO menuListOne(String menuCode) {
		StoreDTO dto = sessionTemplate.selectOne("storeMapper.menuListOne", menuCode);
		return dto;
	}

	//��ٱ��� �μ�Ʈ
	public void insertCart(StoreDTO dto) {

		sessionTemplate.insert("storeMapper.insertCart",dto);

	}

	//��ٱ��� ������Ʈ
	public void updateCart(StoreDTO dto) {
		sessionTemplate.update("storeMapper.updateCart",dto);
	}

	//��ٱ��� ����Ʈ ����
	public List<StoreDTO> selectCart(String userId,String menuCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("menuCode", menuCode);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCart", map);

		return lists;


	}
	//��ٱ��� ����Ʈ ���̵�޴� ����
	public List<StoreDTO> chkCartSide(String userId,String menuCode, String sideMenuCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("menuCode", menuCode);
		map.put("sideMenuCode", sideMenuCode);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.chkCartSide", map);

		return lists;
	}	

	//��ٱ��� ����Ʈ(����)
	public List<StoreDTO> selectCartAll(String userId) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCartAll", userId);
		return lists;

	}
	//��ٱ��� ����Ʈ(����)
	public List<StoreDTO> selectCartMain(String userId) {


		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCartMain", userId);
		return lists;

	}
	//��ٱ��� ����Ʈ(���̵�)
	public List<StoreDTO> selectCartSide(String userId) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCartSide", userId);
		return lists;

	}
	//��ٱ��� �޴��ڵ庰 ���̵�޴� �հ�
	public List<StoreDTO> selectMenuPrice(String userId) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectMenuPrice",userId);
		return lists;

	}

	//��ٱ��Ͽ��� ���� ���� ����� ��� ������Ʈ
	public void updateQTY(StoreDTO dto) {

		sessionTemplate.update("storeMapper.updateQTY",dto);

	}

	//��ٱ��� ����
	public void deleteCart(String userId) {

		sessionTemplate.delete("storeMapper.deleteCart",userId);
	}

	//��ٱ��� �ϳ��� ����
	public void deleteCartOne(String userId,String menuCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("menuCode", menuCode);
		map.put("userId", userId);

		sessionTemplate.delete("storeMapper.deleteCartOne",map);

	}

	//��ٱ��� ���ڵ� �������ִ��� ����
	public List<StoreDTO> cartChkShop(String userId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("userId", userId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.cartChkShop",map);

		return lists;

	}

	//�����̺� �μ�Ʈ

	public void heartInsert(StoreDTO dto) {

		sessionTemplate.insert("storeMapper.heartInsert",dto);
	}

	//�����̺� ����Ʈ(����)

	public List<StoreDTO> heartSelect(String userId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("userId", userId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.heartSelect",map);

		return lists;

	}

	//�����̺� ����Ʈ

	public void heartDelete(String userId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("userId", userId);

		sessionTemplate.delete("storeMapper.heartDelete",map);
	}


	//������ ��ü ����Ʈ
	public List<StoreDTO> shopList(){

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.shopList");

		return lists;

	}

	//������ ����Ʈ ����¡(start, end) + ī�װ�
	public List<StoreDTO> shopPaging(int start, int end, String category, String search){
		System.out.println("search: " + search);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		map.put("search", search);

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.shopPaging",map);
		return lists;

	}


	//������ ī��Ʈ all
	public int shopCountall() {

		int shopCountall = sessionTemplate.selectOne("storeMapper.shopCountall");

		return shopCountall;

	}

	//������ ī��Ʈ(category��)
	public int shopCount(String category ,String search ) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("search", search);
		int shopCount = sessionTemplate.selectOne("storeMapper.shopCount",map);

		return shopCount;

	}


	//������ ����Ʈ ����� ����
	public List<StoreDTO> orderByRe(int start, int end, String category, String search){

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		map.put("search", search);

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByRe",map);

		return lists;

	}

	//������ ����Ʈ �ֹ��� ����
	public List<StoreDTO> orderByO(int start, int end, String category, String search){

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		map.put("search", search);

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByO",map);

		return lists;

	}

	//������ ����Ʈ ������ ����
	public List<StoreDTO> orderByRes(int start, int end, String category, String search){

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		map.put("search", search);

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByRes",map);

		return lists;

	}

	// ����â ����Ʈ
	//��INFO
	public StoreDTO selectOrderInfo(String userId){

		StoreDTO dto = 
				sessionTemplate.selectOne("storeMapper.selectOrderInfo",userId);

		return dto;

	}

	//shopName ����Ʈ
	public StoreDTO selectOrderShopName(String userId){

		StoreDTO dto = sessionTemplate.selectOne("storeMapper.selectOrderShopName",userId);
		return dto;

	}

	//���� �޴��ڵ� ����Ʈ
	public List<StoreDTO> selectPreOrderDe(String userId){

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.selectPreOrderDe",userId);
		return lists;

	}

	//���� �������� �μ�Ʈ
	public void insertOrderMain(StoreDTO dto) {	
		sessionTemplate.insert("storeMapper.insertOrderMain",dto);	
	}

	//���� ���������� �μ�Ʈ
	public void insertOrderDetail(StoreDTO dto) {	
		sessionTemplate.insert("storeMapper.insertOrderDetail",dto);	
	}

	//����Ʈ�� ������ ����Ʈ ����
	public void useUserPoint(StoreDTO dto) {	
		sessionTemplate.update("storeMapper.useUserPoint",dto);	
	}

	//������ �����ݾ� 5���� ����Ʈ ����
	public void updateOrderPoint(String userId) {	
		sessionTemplate.update("storeMapper.updateOrderPoint",userId);	
	}

	//�ֹ���ȣ ��ȸ
	public StoreDTO selectOrderOne(String userId) {	

		StoreDTO dto = sessionTemplate.selectOne("storeMapper.selectOrderOne",userId);
		return dto;

	}


}


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

	//�޴� ��ü���
	public List<StoreDTO> menuList(String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);

		System.out.println(shopCode);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.menuList",map);

		return lists;
	}

	//������ ����
	public List<StoreDTO>  shopInfo (String ceoId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("ceoId", ceoId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.shopInfo",map);

		return lists;
	}


	//maxNum
	public int getMaxNum(){
		int maxNum = 0;
		maxNum = sessionTemplate.selectOne("storeMapper.maxNum");
		return maxNum;

	}

	//���� ����Ʈ
	public List<StoreDTO> reviewList(String shopCode,int reNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("reNum", reNum);
		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.reviewList",map);
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

	//�Ѱ����޴� ��������
	public StoreDTO menuListOne(String menuCode) {
		StoreDTO dto = sessionTemplate.selectOne("storeMapper.menuListOne", menuCode);
		return dto;
	}

	//��ٱ��� �μ�Ʈ

	public void insertCart(StoreDTO dto) {

		System.out.println("DAO insert ���� ");
		sessionTemplate.insert("storeMapper.insertCart",dto);

	}

	//��ٱ��� ������Ʈ

	public void updateCart(StoreDTO dto) {
		sessionTemplate.update("storeMapper.updateCart",dto);
	}

	//��ٱ��� ����Ʈ ���

	public List<StoreDTO> selectList(String userId) {

		System.out.println("��ٱ��� ����Ʈ ���̿� ����");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectList", map);
		System.out.println("��ٱ��� ����Ʈ ����Ʈ ����");
		System.out.println(lists.size());
		return lists;
	}

	//��ٱ��� ����Ʈ ����
	public List<StoreDTO> selectCart(String userId,String menuCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("menuCode", menuCode);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCart", map);
		System.out.println("��ٱ��� ����Ʈ ���� ����");
		System.out.println(lists.size());
		return lists;


	}

	//��ٱ��� ����

	public void deleteCart(String userId) {

		sessionTemplate.delete("storeMapper.deleteCart",userId);
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

	//�Ѱ��� �������� ����Ʈ
	public StoreDTO shopSelectOne(String shopcode){

		StoreDTO dto =
				sessionTemplate.selectOne("storeMapper.shopSelectOne");

		return dto;
	}

	//������ ����Ʈ ����� ����

	public List<StoreDTO> orderByRe(){

		System.out.println("����� ���� dao ����");

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByRe");

		return lists;

	}

	//������ ����Ʈ �ֹ��� ����

	public List<StoreDTO> orderByO(){

		System.out.println("�ֹ��� ���� dao ����");

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByO");

		return lists;

	}

	//������ ����Ʈ ������ ����

	public List<StoreDTO> orderByRes(){

		System.out.println("������ ���� dao ����");

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByRes");

		return lists;

	}


}


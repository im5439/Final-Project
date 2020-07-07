package com.eatswill.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.MenuListDTO;

public class MenuListDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;

	}

	//�޴� ��ü���
	public List<MenuListDTO> menuList(String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);

		System.out.println(shopCode);

		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.menuList",map);

		return lists;
	}

	//������ ����
	public MenuListDTO shopInfo (String ceoId) {

		MenuListDTO dto = sessionTemplate.selectOne("menuListMapper.shopInfo",ceoId);
		return dto;
	}


	//maxNum
	public int getMaxNum(){
		int maxNum = 0;
		maxNum = sessionTemplate.selectOne("menuListMapper.maxNum");
		return maxNum;

	}

	//���� ����Ʈ
	public List<MenuListDTO> reviewList() {
		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.reviewList");
		return lists;
	}

	//���� �Է�
	public void insertReview(MenuListDTO dto) {
		sessionTemplate.insert("menuListMapper.insertReview",dto);
	}

	//�Ѱ����޴� ��������
	public MenuListDTO menuListOne(String menuCode) {
		MenuListDTO dto = sessionTemplate.selectOne("menuListMapper.menuListOne", menuCode);
		return dto;
	}

	//��ٱ��� �μ�Ʈ

	public void insertCart(MenuListDTO dto) {
		
		System.out.println("DAO insert ���� ");
		sessionTemplate.insert("menuListMapper.insertCart",dto);

	}

	//��ٱ��� ������Ʈ

	public void updateCart(MenuListDTO dto) {
		sessionTemplate.update("menuListMapper.updateCart",dto);
	}

	//��ٱ��� ����Ʈ ���

	public List<MenuListDTO> selectList(String userId) {

		System.out.println("��ٱ��� ����Ʈ ���̿� ����");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);

		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.selectList", map);
		System.out.println("��ٱ��� ����Ʈ ����Ʈ ����");
		System.out.println(lists.size());
		return lists;
	}
	
	//��ٱ��� ����Ʈ ����
	public List<MenuListDTO> selectCart(String userId,String menuCode) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("menuCode", menuCode);

		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.selectCart", map);
		System.out.println("��ٱ��� ����Ʈ ���� ����");
		System.out.println(lists.size());
		return lists;
		
		
	}

	//��ٱ��� ����

	public void deleteCart(String userId) {

		sessionTemplate.delete("menuListMapper.deleteCart",userId);
	}

	public List<MenuListDTO> cartChkShop(String userId,String shopCode) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("userId", userId);

		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.cartChkShop",map);
		
		return lists;
		
	}
}


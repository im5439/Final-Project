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
		System.out.println("dao���� lists: " + lists);
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

}
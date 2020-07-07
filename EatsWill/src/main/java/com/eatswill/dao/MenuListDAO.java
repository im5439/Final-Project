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

	//메뉴 전체출력
	public List<MenuListDTO> menuList(String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);

		System.out.println(shopCode);

		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.menuList",map);
		System.out.println("dao에서 lists: " + lists);
		return lists;
	}

	//음식점 정보
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
	
	//리뷰 리스트
	public List<MenuListDTO> reviewList() {
		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.reviewList");
		return lists;
	}
	
	//리뷰 입력
	public void insertReview(MenuListDTO dto) {
		sessionTemplate.insert("menuListMapper.insertReview",dto);
	}
	
	//한가지메뉴 상세페이지
		public MenuListDTO menuListOne(String menuCode) {
			MenuListDTO dto = sessionTemplate.selectOne("menuListMapper.menuListOne", menuCode);
			return dto;
		}

}
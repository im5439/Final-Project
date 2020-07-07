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

	//장바구니 인서트

	public void insertCart(MenuListDTO dto) {
		
		System.out.println("DAO insert 들어옴 ");
		sessionTemplate.insert("menuListMapper.insertCart",dto);

	}

	//장바구니 업데이트

	public void updateCart(MenuListDTO dto) {
		sessionTemplate.update("menuListMapper.updateCart",dto);
	}

	//장바구니 리스트 출력

	public List<MenuListDTO> selectList(String userId) {

		System.out.println("장바구니 셀렉트 디에이오 들어옴");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);

		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.selectList", map);
		System.out.println("장바구니 셀렉트 리스트 성공");
		System.out.println(lists.size());
		return lists;
	}
	
	//장바구니 셀렉트 검증
	public List<MenuListDTO> selectCart(String userId,String menuCode) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("menuCode", menuCode);

		List<MenuListDTO> lists = sessionTemplate.selectList("menuListMapper.selectCart", map);
		System.out.println("장바구니 셀렉트 검증 성공");
		System.out.println(lists.size());
		return lists;
		
		
	}

	//장바구니 삭제

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


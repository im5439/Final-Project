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

	//메인메뉴 전체출력
	public List<StoreDTO> menuList(String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
	

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.menuList",map);

		return lists;
	}
	
	//사이드메뉴 전체출력
		public List<StoreDTO> sideMenuList(String shopCode) {

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("shopCode", shopCode);

			List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.sideMenuList",map);

			return lists;
		}

	//음식점 정보
	public List<StoreDTO>  shopInfo (String ceoId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("ceoId", ceoId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.shopInfo",map);

		return lists;
	}

	//리뷰없는 음식점 정보
	public List<StoreDTO>  shopInfonotreview (String ceoId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("ceoId", ceoId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.shopInfonotreview",map);

		return lists;
	}


	//maxNum
	public int getMaxNum(){
		int maxNum = 0;
		maxNum = sessionTemplate.selectOne("storeMapper.maxNum");
		return maxNum;

	}

	//리뷰 리스트
	public List<StoreDTO> reviewList(String shopCode,int reNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("reNum", reNum);
		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.reviewList",map);
		return lists;
	}

	//신고 인서트
	public void insertReport(StoreDTO dto) {	
		sessionTemplate.insert("storeMapper.insertReport",dto);	
	}


	//신고 딜리트(신고,리뷰테이블)
	public void deleteReport() {
		sessionTemplate.delete("storeMapper.deleteReport");

	}

	public void deleteReview() {
		sessionTemplate.delete("storeMapper.deleteReview");

	}

	//한가지메뉴 상세페이지
	public StoreDTO menuListOne(String menuCode) {
		StoreDTO dto = sessionTemplate.selectOne("storeMapper.menuListOne", menuCode);
		return dto;
	}

	//장바구니 인서트

	public void insertCart(StoreDTO dto) {

		System.out.println("DAO insert 들어옴 ");
		sessionTemplate.insert("storeMapper.insertCart",dto);

	}

	//장바구니 업데이트

	public void updateCart(StoreDTO dto) {
		sessionTemplate.update("storeMapper.updateCart",dto);
	}

	//장바구니 셀렉트 검증
	public List<StoreDTO> selectCart(String userId,String menuCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("menuCode", menuCode);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCart", map);
		System.out.println("장바구니 셀렉트 검증 성공");
		System.out.println(lists.size());
		return lists;


	}

	//장바구니 셀렉트
	public List<StoreDTO> selectCartAll(String userId) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCartAll", map);
		System.out.println("장바구니 셀렉트 성공");
		return lists;

	}

	//장바구니 삭제

	public void deleteCart(String userId) {

		sessionTemplate.delete("storeMapper.deleteCart",userId);
	}

	//장바구니 하나씩 삭제

	public void deleteCartOne(String userId,String menuCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("menuCode", menuCode);
		map.put("userId", userId);

		sessionTemplate.delete("storeMapper.deleteCartOne",map);

	}

	//장바구니 샵코드 데이터있는지 검증
	public List<StoreDTO> cartChkShop(String userId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("userId", userId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.cartChkShop",map);

		return lists;

	}

	//찜테이블 인서트

	public void heartInsert(StoreDTO dto) {

		sessionTemplate.insert("storeMapper.heartInsert",dto);
	}

	//찜테이블 셀렉트(검증)

	public List<StoreDTO> heartSelect(String userId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("userId", userId);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.heartSelect",map);

		return lists;

	}

	//찜테이블 딜리트

	public void heartDelete(String userId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("userId", userId);

		sessionTemplate.delete("storeMapper.heartDelete",map);
	}


	//음식점 전체 리스트
	public List<StoreDTO> shopList(){

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.shopList");

		return lists;

	}

	//한가지 음식점을 셀렉트
	public StoreDTO shopSelectOne(String shopcode){

		StoreDTO dto =
				sessionTemplate.selectOne("storeMapper.shopSelectOne");

		return dto;
	}

	//음식점 리스트 리뷰순 정렬

	public List<StoreDTO> orderByRe(){

		System.out.println("리뷰순 정렬 dao 들어옴");

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByRe");

		return lists;

	}

	//음식점 리스트 주문순 정렬

	public List<StoreDTO> orderByO(){

		System.out.println("주문순 정렬 dao 들어옴");

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByO");

		return lists;

	}

	//음식점 리스트 별점순 정렬

	public List<StoreDTO> orderByRes(){

		System.out.println("별점순 정렬 dao 들어옴");

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.orderByRes");

		return lists;

	}


}


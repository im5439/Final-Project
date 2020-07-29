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

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.menuList",shopCode);

		return lists;
	}

	//사이드메뉴 전체출력
	public List<StoreDTO> sideMenuList(String shopCode) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.sideMenuList",shopCode);

		return lists;
	}

	//음식점 정보
	public StoreDTO shopInfo (String ceoId,String shopCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("ceoId", ceoId);

		StoreDTO dto = sessionTemplate.selectOne("storeMapper.shopInfo",map);

		return dto;
	}


	//리뷰 리스트
	public List<StoreDTO> reviewList(String shopCode) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.reviewList",shopCode);
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

	//한가지메뉴 상세페이지(모달)
	public StoreDTO menuListOne(String menuCode) {
		StoreDTO dto = sessionTemplate.selectOne("storeMapper.menuListOne", menuCode);
		return dto;
	}

	//장바구니 인서트
	public void insertCart(StoreDTO dto) {

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

		return lists;


	}
	//장바구니 셀렉트 사이드메뉴 검증
	public List<StoreDTO> chkCartSide(String userId,String menuCode, String sideMenuCode) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("menuCode", menuCode);
		map.put("sideMenuCode", sideMenuCode);

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.chkCartSide", map);

		return lists;
	}	

	//장바구니 셀렉트(전부)
	public List<StoreDTO> selectCartAll(String userId) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCartAll", userId);
		return lists;

	}
	//장바구니 셀렉트(메인)
	public List<StoreDTO> selectCartMain(String userId) {


		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCartMain", userId);
		return lists;

	}
	//장바구니 셀렉트(사이드)
	public List<StoreDTO> selectCartSide(String userId) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectCartSide", userId);
		return lists;

	}
	//장바구니 메뉴코드별 사이드메뉴 합계
	public List<StoreDTO> selectMenuPrice(String userId) {

		List<StoreDTO> lists = sessionTemplate.selectList("storeMapper.selectMenuPrice",userId);
		return lists;

	}

	//장바구니에서 직접 수량 변경시 디비에 업데이트
	public void updateQTY(StoreDTO dto) {

		sessionTemplate.update("storeMapper.updateQTY",dto);

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

	//음식점 리스트 페이징(start, end) + 카테고리
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


	//음식점 카운트 all
	public int shopCountall() {

		int shopCountall = sessionTemplate.selectOne("storeMapper.shopCountall");

		return shopCountall;

	}

	//음식점 카운트(category별)
	public int shopCount(String category ,String search ) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("search", search);
		int shopCount = sessionTemplate.selectOne("storeMapper.shopCount",map);

		return shopCount;

	}


	//음식점 리스트 리뷰순 정렬
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

	//음식점 리스트 주문순 정렬
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

	//음식점 리스트 별점순 정렬
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

	// 결제창 셀렉트
	//고객INFO
	public StoreDTO selectOrderInfo(String userId){

		StoreDTO dto = 
				sessionTemplate.selectOne("storeMapper.selectOrderInfo",userId);

		return dto;

	}

	//shopName 셀렉트
	public StoreDTO selectOrderShopName(String userId){

		StoreDTO dto = sessionTemplate.selectOne("storeMapper.selectOrderShopName",userId);
		return dto;

	}

	//결제 메뉴코드 셀렉트
	public List<StoreDTO> selectPreOrderDe(String userId){

		List<StoreDTO> lists = 
				sessionTemplate.selectList("storeMapper.selectPreOrderDe",userId);
		return lists;

	}

	//결제 오더메인 인서트
	public void insertOrderMain(StoreDTO dto) {	
		sessionTemplate.insert("storeMapper.insertOrderMain",dto);	
	}

	//결제 오더디테일 인서트
	public void insertOrderDetail(StoreDTO dto) {	
		sessionTemplate.insert("storeMapper.insertOrderDetail",dto);	
	}

	//포인트로 결제시 포인트 차감
	public void useUserPoint(StoreDTO dto) {	
		sessionTemplate.update("storeMapper.useUserPoint",dto);	
	}

	//결제후 결제금액 5프로 포인트 적립
	public void updateOrderPoint(String userId) {	
		sessionTemplate.update("storeMapper.updateOrderPoint",userId);	
	}

	//주문번호 조회
	public StoreDTO selectOrderOne(String userId) {	

		StoreDTO dto = sessionTemplate.selectOne("storeMapper.selectOrderOne",userId);
		return dto;

	}


}


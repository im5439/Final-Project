package com.eatswill.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CeoDTO;
import com.eatswill.dto.OrderDTO;
import com.eatswill.dto.SalesDTO;

public class CeoDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//사장님 회원가입
	public void insertData(CeoDTO dto){
		
		sessionTemplate.insert("CeoMapper.insertCeo",dto);
		
	}
	
	//로그인 인증
	public CeoDTO getReadData(String ceoId){
		
		CeoDTO dto = sessionTemplate.selectOne("CeoMapper.getReadData",ceoId);
		
		return dto;
		
	}
	
	//매장추가
	public void insertStore(CeoDTO dto) {
		
		sessionTemplate.insert("CeoMapper.insertStore", dto);
		
	}
	
	//사장님 해당 아이디의 보유 매장리스트출력 
	public List<CeoDTO> getStoreList(String ceoId){
		
		List<CeoDTO> shopList = sessionTemplate.selectList("CeoMapper.getStoreList", ceoId);
		
		return shopList;
		
	}
	
	//사장님 해당 아이디의 매장개수
	public int getStoreCount(String ceoId) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getStoreCount", ceoId);
		
		return result;
		
	}
	
	//사장님 해당 아이디의 총주문상태
	public int ceoIdOrderStatus(String ceoId, String orderStatus) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ceoId", ceoId);
		params.put("orderStatus", orderStatus);
		
		int result = sessionTemplate.selectOne("CeoMapper.ceoIdOrderStatus", params);
		
		return result;
		
	}
	
	
	//해당 매장 삭제
	public void deleteStore(String shopCode) {
		
		sessionTemplate.delete("CeoMapper.deleteStore", shopCode);
		
	}
	
	
	//해당 매장의 리뷰가져오기
	public List<CeoDTO> getStoreReview(String ceoId, String shopCode, int start, int end){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("shopCode", shopCode);
		params.put("ceoId", ceoId);
		params.put("start", start);
		params.put("end", end);
		
		List<CeoDTO> reviewList = sessionTemplate.selectList("CeoMapper.getStoreReivew", params);
		
		return reviewList;
		
	}
	
	//해당 매장의 리뷰 개수
	public int getReviewCount(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getReviewCount", shopCode);
		
		return result;
		
	}
	
	//해당 매장 리뷰 평균
	public double getAvgReScore(String shopCode) {
		
		double result = sessionTemplate.selectOne("CeoMapper.getAvgReScore", shopCode);
		
		return result;
		
	}
	
	//매장 정보 불러오기
	public CeoDTO getStoreName(String shopCode) {
		
		CeoDTO dto = sessionTemplate.selectOne("CeoMapper.getStoreName", shopCode);
		
		return dto;
	}
	
	//사장님 답글 추가(업데이트)
	public void ceoReviewAdd(CeoDTO dto) {
		
		sessionTemplate.update("CeoMapper.ceoReviewAdd", dto);
		
	}

	//사장님 답글 삭제(업데이트)
	public void ceoReviewDel(String renum) {
		
		sessionTemplate.update("CeoMapper.ceoReviewDel", renum);
		
	}
	
	//메뉴추가
	public void insertMenu(CeoDTO dto) {
		
		sessionTemplate.insert("CeoMapper.insertMenu", dto);
		
	}
	
	//메뉴삭제
	public void deleteMenu(String menuCode) {
		
		sessionTemplate.delete("CeoMapper.deleteMenu", menuCode);
		
	}
	
	//매장 메뉴 불러오기
	public List<CeoDTO> getStoreMenu(String shopCode) {
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getStoreMenu", shopCode); 
		
		return lists;
		
	}
	
	//매장 주문확인
	public List<CeoDTO> getOrderChk(String shopCode){
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getOrderChk", shopCode);
		
		return lists;
		
	}
	
	//주문상태 업데이트 - 100들어오면 준비중(200) / 200 들어오면 배달완료(300)
	public void orderUpdate(String orderCode, String orderStatus) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		if(orderStatus.equals("100")) {
			params.put("orderStatus", "200");
		} else if(orderStatus.equals("200")) {
			params.put("orderStatus", "300");
		}
		params.put("orderCode", orderCode);
		
		sessionTemplate.update("CeoMapper.orderUpdate", params);
		
	}
	
	//주문상태 업데이트 - 배달취소 '400'
	public void orderCancel(String orderCode) {
		
		sessionTemplate.update("CeoMapper.orderCancel", orderCode);
		
	}
	
	//주문 메뉴 detail
	public List<OrderDTO> getOrderDetail(String orderCode){
		
		List<OrderDTO> lists = sessionTemplate.selectList("CeoMapper.getOrderDetail", orderCode);
		
		return lists;
		
	}
	
	//매장별 메뉴 전체 개수구하기
	public int getMenuCount(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getMenuCount", shopCode);
		
		return result;
		
	}
	
	//매장별 메뉴 리스트
	public List<CeoDTO> getMenuList(String shopCode, int start, int end){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("shopCode", shopCode);
		params.put("start", start);
		params.put("end", end);
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getMenuList", params);
		
		return lists;
		
	}
	
	//일별 매출 가져오기 
	public List<SalesDTO> getDaySales(String shopCode){
		
		List<SalesDTO> lists = sessionTemplate.selectList("CeoMapper.getDaySales", shopCode);
		
		return lists;
		
	}

	//월별 매출 가져오기 
	public List<SalesDTO> getMonthSales(String shopCode){
		
		List<SalesDTO> lists = sessionTemplate.selectList("CeoMapper.getMonthSales", shopCode);
		
		return lists;
		
	}
	
	//매장별 총매출
	public int getTotSales(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getTotSales", shopCode);
		
		return result;
		
	}
	
	//매장별 주문count
	public int getOrderCount(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getOrderCount", shopCode);
		
		return result;
		
	}

	//매장별 찜count
	public int getHeartCount(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getHeartCount", shopCode);
		
		return result;
		
	}
	
	//매장별 주문상태별 카운트
	public int getOSCount100(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getOSCount100", shopCode);
		
		return result;
		
	}

	//매장별 주문상태별 카운트
	public int getOSCount200(String shopCode) {
		
		
		int result = sessionTemplate.selectOne("CeoMapper.getOSCount200", shopCode);
		
		return result;
		
	}
	
	
}

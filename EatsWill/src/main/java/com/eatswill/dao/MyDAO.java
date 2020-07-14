package com.eatswill.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.MyDTO;

public class MyDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	// 주문 목록 리스트
	public List<MyDTO> getBuyList(String userId) {

		List<MyDTO> lists = sessionTemplate.selectList("myMapper.getBuyList", userId);

		return lists;
	}
	
	// 주문 취소
	public void myOrderCancel(String orderCode) {
		sessionTemplate.update("myMapper.myOrderCancel",orderCode);
	}

	// review 작성 시에 가게 정보 출력
	public MyDTO getReadData(String orderCode) {
		
		MyDTO dto = sessionTemplate.selectOne("myMapper.getReadReviewData", orderCode);

		return dto;
	}

	// review num 최대값
	public int getMaxReNum() {
		int maxReNum = 0;
		maxReNum = sessionTemplate.selectOne("myMapper.maxReNum");

		return maxReNum;
	}

	// review insert
	public void reviewInsert(MyDTO dto) {
		sessionTemplate.insert("myMapper.reviewInsert", dto);
	}
	
	// 나의 리뷰 개수 확인
	public int getMyReviewCnt(String userId) {
		int myReviewCnt = 0;
		myReviewCnt = sessionTemplate.selectOne("myMapper.myReviewCnt",userId);
		
		return myReviewCnt;
	}
	
	// 나의 리뷰 리스트
	public List<MyDTO> getMyReviewList(String userId){
		List<MyDTO> lists = sessionTemplate.selectList("myMapper.getMyReviewList", userId);
		
		return lists;
	}
	
	// review delete
	public void reviewDelete(int renum) {
		sessionTemplate.delete("myMapper.reviewDelete", renum);
	}

	// 찜 매장 리스트
	public List<MyDTO> getHeartList(String userId) {
		List<MyDTO> lists = sessionTemplate.selectList("myMapper.getHeartList", userId);

		return lists;
	}
}

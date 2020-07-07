package com.eatswill.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.MyDTO;

public class MyDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	// 주문목록 리스트
	public List<MyDTO> getBuyList(String userId){
		
		List<MyDTO> lists = sessionTemplate.selectList("myMapper.getBuyList", userId);
		
		return lists;
	}
	
	// review에 정보 출력
	public MyDTO getReadData(String orderCode) {
		MyDTO dto = sessionTemplate.selectOne("myMapper.getReadReviewData",orderCode);
		
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
	
}

package com.eatswill.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CeoDTO;

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
	
	//가게코드 maxCode 가져오기
	public int getMaxCode() {
		
		int result = sessionTemplate.selectOne("CeoMapper.getMaxCode");
		
		return result;
	}
	
	//매장추가
	public void insertStore(CeoDTO dto) {
		
		sessionTemplate.insert("CeoMapper.insertStore", dto);
		
	}
	
	//사장님 해당 아이디의 보유 매장리스트출력 
	public List<CeoDTO> getShopList(String ceoId){
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getShopList", ceoId);
		
		return lists;
		
	}
	
	//사장님 해당 아이디의 매장개수
	public int getShopCount(String ceoId) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getShopCount", ceoId);
		
		return result;
		
	}
	
	
	
}

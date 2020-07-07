package com.eatswill.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CeoDTO;

public class CeoDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//����� ȸ������
	public void insertData(CeoDTO dto){
		
		sessionTemplate.insert("CeoMapper.insertData",dto);
		
	}
	
	//�α��� ����
	public CeoDTO getReadData(String ceoId){
		
		CeoDTO dto = sessionTemplate.selectOne("CeoMapper.getReadData",ceoId);
		
		return dto;
		
	}
	
}

package com.eatswill.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CeoDTO;

public class CeoDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//����� ȸ������
	public void insertData(CeoDTO dto){
		
		sessionTemplate.insert("CeoMapper.insertCeo",dto);
		
	}
	
	//�α��� ����
	public CeoDTO getReadData(String ceoId){
		
		CeoDTO dto = sessionTemplate.selectOne("CeoMapper.getReadData",ceoId);
		
		return dto;
		
	}
	
	//�����ڵ� maxCode ��������
	public int getMaxCode() {
		
		int result = sessionTemplate.selectOne("CeoMapper.getMaxCode");
		
		return result;
	}
	
	//�����߰�
	public void insertStore(CeoDTO dto) {
		
		sessionTemplate.insert("CeoMapper.insertStore", dto);
		
	}
	
	//����� �ش� ���̵��� ���� ���帮��Ʈ��� 
	public List<CeoDTO> getShopList(String ceoId){
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getShopList", ceoId);
		
		return lists;
		
	}
	
	//����� �ش� ���̵��� ���尳��
	public int getShopCount(String ceoId) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getShopCount", ceoId);
		
		return result;
		
	}
	
	
	
}

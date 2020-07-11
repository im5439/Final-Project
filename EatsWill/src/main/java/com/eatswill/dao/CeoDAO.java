package com.eatswill.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<CeoDTO> getStoreList(String ceoId){
		
		List<CeoDTO> shopList = sessionTemplate.selectList("CeoMapper.getStore", ceoId);
		
		return shopList;
		
	}
	
	//����� �ش� ���̵��� ���尳��
	public int getStoreCount(String ceoId) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getStoreCount", ceoId);
		
		return result;
		
	}
	
	//�ش� ������ ���䰡������
	public List<CeoDTO> getStoreReview(String ceoId, String shopCode){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("shopCode", shopCode);
		params.put("ceoId", ceoId);
		
		List<CeoDTO> reviewList = sessionTemplate.selectList("CeoMapper.getStoreReivew", params);
		
		return reviewList;
		
	}
	
	
}

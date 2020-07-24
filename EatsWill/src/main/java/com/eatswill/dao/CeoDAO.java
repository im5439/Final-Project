package com.eatswill.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CeoDTO;
import com.eatswill.dto.OrderDTO;

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
	
	//�����߰�
	public void insertStore(CeoDTO dto) {
		
		sessionTemplate.insert("CeoMapper.insertStore", dto);
		
	}
	
	//����� �ش� ���̵��� ���� ���帮��Ʈ��� 
	public List<CeoDTO> getStoreList(String ceoId){
		
		List<CeoDTO> shopList = sessionTemplate.selectList("CeoMapper.getStoreList", ceoId);
		
		return shopList;
		
	}
	
	//����� �ش� ���̵��� ���尳��
	public int getStoreCount(String ceoId) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getStoreCount", ceoId);
		
		return result;
		
	}
	
	//�ش� ���� ����
	public void deleteStore(String shopCode) {
		
		sessionTemplate.delete("CeoMapper.deleteStore", shopCode);
		
	}
	
	
	//�ش� ������ ���䰡������
	public List<CeoDTO> getStoreReview(String ceoId, String shopCode){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("shopCode", shopCode);
		params.put("ceoId", ceoId);
		
		List<CeoDTO> reviewList = sessionTemplate.selectList("CeoMapper.getStoreReivew", params);
		
		return reviewList;
		
	}
	
	//�ش� ������ ���� ����
	public int getReviewCount(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getReviewCount", shopCode);
		
		return result;
		
	}
	
	//�ش� ���� ���� ���
	public double getAvgReScore(String shopCode) {
		
		double result = sessionTemplate.selectOne("CeoMapper.getAvgReScore", shopCode);
		
		return result;
		
	}
	
	//���� ���� �ҷ�����
	public CeoDTO getStoreName(String shopCode) {
		
		CeoDTO dto = sessionTemplate.selectOne("CeoMapper.getStoreName", shopCode);
		
		return dto;
	}
	
	//����� ��� �߰�(������Ʈ)
	public void ceoReviewAdd(CeoDTO dto) {
		
		sessionTemplate.update("CeoMapper.ceoReviewAdd", dto);
		
	}

	//����� ��� ����(������Ʈ)
	public void ceoReviewDel(String renum) {
		
		sessionTemplate.update("CeoMapper.ceoReviewDel", renum);
		
	}
	
	//�޴��߰�
	public void insertMenu(CeoDTO dto) {
		
		sessionTemplate.insert("CeoMapper.insertMenu", dto);
		
	}
	
	//�޴�����
	public void deleteMenu(String menuCode) {
		
		sessionTemplate.delete("CeoMapper.deleteMenu", menuCode);
		
	}
	
	//���� �޴� �ҷ�����
	public List<CeoDTO> getStoreMenu(String shopCode) {
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getStoreMenu", shopCode); 
		
		return lists;
		
	}
	
	//���� �ֹ�Ȯ��
	public List<CeoDTO> getOrderChk(String shopCode){
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getOrderChk", shopCode);
		
		return lists;
		
	}
	
	//�ֹ����� ������Ʈ
	public void orderUpdate(String orderCode) {
		
		sessionTemplate.update("CeoMapper.orderUpdate", orderCode);
		
	}
	
	//�ֹ� �޴� detail
	public List<OrderDTO> getOrderDetail(String orderCode){
		
		List<OrderDTO> lists = sessionTemplate.selectList("CeoMapper.getOrderDetail", orderCode);
		
		return lists;
		
	}
	
	//���庰 �޴� ��ü �������ϱ�
	public int getMenuCount(String shopCode) {
		
		int result = sessionTemplate.selectOne("CeoMapper.getMenuCount", shopCode);
		
		return result;
		
	}
	
	//���庰 �޴� ����Ʈ
	public List<CeoDTO> getMenuList(String shopCode, int start, int end){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("shopCode", shopCode);
		params.put("start", start);
		params.put("end", end);
		
		List<CeoDTO> lists = sessionTemplate.selectList("CeoMapper.getMenuList", params);
		
		return lists;
		
	}
	
}

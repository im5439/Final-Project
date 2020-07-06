package com.eatswill.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.OrderMainDTO;

public class OrderMainDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public List<OrderMainDTO> getList(int userId){
		List<OrderMainDTO> lists = sessionTemplate.selectList("OrderMainMapper.getList",userId);
		
		return lists;
	}
	
}

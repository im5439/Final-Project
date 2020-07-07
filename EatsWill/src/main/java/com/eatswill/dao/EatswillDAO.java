package com.eatswill.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CustomDTO;

public class EatswillDAO {

private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sqlSessionTemplate) throws Exception {
		this.sessionTemplate = sqlSessionTemplate;
	}
	
	public void insertCustom(CustomDTO dto){
		
		sessionTemplate.insert("mapper.insertCustom", dto);
	}
	
	public boolean selectCustom(String id) {
		
		String custom = sessionTemplate.selectOne("mapper.selectCustom", id);
		
		// ���̵� �����ϸ� false ���
		if(custom!=null && !custom.equals("")) {
			return false;
		} 
		
		// ���̵� ������ ���
		return true;
	}
	
	public int testA(){
		
		int num = 0;

		num = sessionTemplate.selectOne("mapper.test");
		
		return num;
	}
	
	public int testB(){
		
		int num = 0;

		num = sessionTemplate.selectOne("mapper.test");
		
		return num;
	}
	
	public CustomDTO findIdPw(String id) {
		
		CustomDTO custom = sessionTemplate.selectOne("mapper.findIdPw", id);
	
		return custom;
	}
	
	public CustomDTO checkIdPw(String id, String pwd) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		params.put("pwd", pwd);
		
		CustomDTO custom = sessionTemplate.selectOne("mapper.checkIdPw", params);
	
		return custom;
	}
}

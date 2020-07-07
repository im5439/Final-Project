package com.eatswill.dao;

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
		
		// 아이디가 존재하면 false 출력
		if(custom!=null && !custom.equals("")) {
			return false;
		} 
		
		// 아이디가 없으면 통과
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
}

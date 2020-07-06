package com.eatswill.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class EatswillDAO {

private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sqlSessionTemplate) throws Exception {
		this.sessionTemplate = sqlSessionTemplate;
	}
	
	public int testA(){
		
		int num = 0;

		num = sessionTemplate.selectOne("mapper.test");
		
		return num;
	}
}

package com.eatswill.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CustomDTO;

public class CustomDAO {

private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sqlSessionTemplate) throws Exception {
		this.sessionTemplate = sqlSessionTemplate;
	}
	
	public void insertCustom(CustomDTO dto){
		
		sessionTemplate.insert("customMapper.insertCustom", dto);
	}
	
	public boolean selectCustom(String id) {
		
		String custom = sessionTemplate.selectOne("customMapper.selectCustom", id);
		
		// 아이디가 존재하면 false 출력
		if(custom!=null && !custom.equals("")) {
			return false;
		} 
		
		// 아이디가 없으면 통과
		return true;
	}
	
	public void updateCustom(CustomDTO dto){
		
		sessionTemplate.update("customMapper.updateCustom", dto);
		
	}
	
	public void deleteCustom(String id){
		
		sessionTemplate.delete("customMapper.deleteCustom", id);
		
	}
	
	public boolean checkPw(String id, String pw) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		params.put("pw", pw);
		
		CustomDTO custom = sessionTemplate.selectOne("customMapper.checkPw", params);
		
		// 아이디 패스워드가 일치하지않으면 false 출력
		if(custom==null) {
			return false;
		} 
		
		// 일치한다면 통과
		return true;
	}
	
	public CustomDTO renewSession(String id) {
		
		CustomDTO custom = sessionTemplate.selectOne("customMapper.renewSession", id);
		
		return custom;
	}
	
	public CustomDTO tryId(String name, String email) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("user", "USERNAME");
		params.put("id", name);
		params.put("email", email);
		
		CustomDTO custom = sessionTemplate.selectOne("customMapper.tryIdPw", params);
	
		return custom;
	}
	
	public CustomDTO tryPw(String id, String email) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("user", "USERID");
		params.put("id", id);
		params.put("email", email);
		
		CustomDTO custom = sessionTemplate.selectOne("customMapper.tryIdPw", params);
	
		return custom;
	}
	
	public CustomDTO checkIdPw(String id, String pw) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		params.put("pw", pw);
		
		CustomDTO custom = sessionTemplate.selectOne("customMapper.checkIdPw", params);
	
		return custom;
	}
	
	public String countCart(String id) {
		
		String cnt = sessionTemplate.selectOne("customMapper.countCart", id);
		
		return cnt;
	}
}

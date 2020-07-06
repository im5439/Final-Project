package com.eatswill.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eatswill.dao.EatswillDAO;
import com.eatswill.dto.CustomDTO;

@Controller
public class MyController {
	
	@Autowired
	@Qualifier("eatswillDAO")
	EatswillDAO dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "index";
	}
	
	@RequestMapping(value = "/choice.action", method = RequestMethod.GET)
	public String choice() {		
		return "custom/Signup";
	}
	
	@RequestMapping(value = "/insert.action", method = RequestMethod.POST)
	public String insert(HttpServletRequest req, CustomDTO dto) {	
		
		dao.insertCustom(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/test.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String test(String id) {	
		
		// 아이디 존재
		if(!dao.selectCustom(id)) {
			return "fail";
		}
		
		// 아이디 없음(통과)
		return "pass";
	}
	
}

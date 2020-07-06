package com.eatswill.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatswill.dao.EatswillDAO;

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
	public String insert(HttpServletRequest req, String id) {	
		
		int test = dao.testA();
		
		req.setAttribute("id", id);
		req.setAttribute("test", test);
		
		return "aaa";
	}
	
}

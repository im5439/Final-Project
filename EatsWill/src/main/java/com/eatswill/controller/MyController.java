package com.eatswill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatswill.dao.OrderMainDAO;
import com.eatswill.dto.OrderMainDTO;

@Controller
public class MyController {
	// OrderMainDAO °¡Á®¿È
	@Autowired
	@Qualifier("orderMainDAO")
	OrderMainDAO dao;
	
	@RequestMapping(value = "/myOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myOrder(HttpServletRequest req) throws Exception {
		
		String userId = "user";
		List<OrderMainDTO> lists = dao.getList(userId);

		
		req.setAttribute("lists", lists);
		return "custom/myOrder";
	}
	
}

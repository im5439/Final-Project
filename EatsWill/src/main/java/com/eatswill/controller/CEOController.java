package com.eatswill.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eatswill.dao.CeoDAO;
import com.eatswill.dto.CeoDTO;
import com.eatswill.dto.CeoInfo;

@SessionAttributes("CeoInfo")
@Controller("CEOController")
public class CEOController {

	@ModelAttribute("ceoInfo")
	public CeoInfo ceoInfo() {
		return new CeoInfo();
	}
	
	@Autowired
	@Qualifier("ceoDAO")
	CeoDAO dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
		
	}
	
	//메인페이지 & 로그인
	@RequestMapping(value = "/CEO.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String ceo(HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		String ceoId = request.getParameter("ceoId");
		String ceoPw = request.getParameter("ceoPw");
		
		System.out.println(ceoId);
		System.out.println(ceoPw);
		
		if(ceoId != null) {
			
			CeoDTO dto = dao.getReadData(ceoId);
			
			
			if(dto == null || !dto.getCeoPw().equals(ceoPw) ) {
				
				System.out.println("아이디비번틀림");
				return "CEO/ceo";
				
			} else {
				
				CeoInfo info = new CeoInfo();
				info.setCeoId(dto.getCeoId());
				info.setCeoName(dto.getCeoName());
			    session.setAttribute("ceoInfo", info);
				
			}
			
		}
		
		
		ceoId = "";
		ceoPw = "";
		
		return "CEO/ceo";
		
	}
	
	//로그아웃
	@RequestMapping(value = "/logout_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/CEO.action";
		
	}

	//회원가입 페이지
	@RequestMapping(value = "/ceoSignup.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String ceoSignup() {
		
		return "CEO/ceoSignup";
		
	}
	
	//회원가입 완료
	@RequestMapping(value = "/ceoSignup_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String ceoSignup_ok(HttpServletRequest request, CeoDTO dto) {
		
		dao.insertData(dto);

		return "redirect:/CEO.action";
		
	}
	
	@RequestMapping(value = "/addStore.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String addStore(HttpServletRequest request, CeoDTO dto) {
		
		return "CEO/addStore";
		
	}
	
	
	
}

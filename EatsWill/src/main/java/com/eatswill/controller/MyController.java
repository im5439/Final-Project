package com.eatswill.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main() {		
		return "index";
	}
	
	@RequestMapping(value = "/signup.action", method = RequestMethod.GET)
	public String signup() {		
		return "custom/Signup";
	}
	
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String login() {		
		return "custom/Login";
	}
	
	@RequestMapping(value = "/login_ok.action", method = RequestMethod.POST)
	public String login_ok(HttpServletRequest req, String id, String pwd) {	
		
		CustomDTO dto = dao.checkIdPw(id, pwd);
		
		if (dto == null) {
			return "redirect:/login.action";
		}
		
		HttpSession session = req.getSession(); 		// 세션 만들기
		session.setAttribute("customInfo", dto); 		// 세션에 올리기
		
		return "redirect:/main.action";
	}
	
	@RequestMapping(value = "/insert.action", method = RequestMethod.POST)
	public String insert(CustomDTO dto) {	
		
		dao.insertCustom(dto);
		
		return "redirect:/main.action";
	}
	
	// 시간되면 String 대신 MVC로 클래스 가져와서 되는지 확인
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
	
	@RequestMapping(value = "/findidpw.action", method = RequestMethod.GET)
	public String findidpw() {
		
		return "custom/FindIdPw";
	}
	
	@RequestMapping(value = "/findidpw_ok.action", method = RequestMethod.POST)
	public String findidpw_ok(HttpServletRequest req, String id, String email) {	
		
		// String id = req.getParameter("id");
		// String email = req.getParameter("email");

		CustomDTO dto = dao.findIdPw(id);

		/*
		if (dto == null || !dto.getEmail().equals(email)) {
			req.setAttribute("message", "아이디 또는 이메일을 정확히 입력하세요.");
			url = "/proj3/findPwd.jsp";
			forward(req, resp, url);
			return;

		}
		*/
		
		// 아이디가 존재하지 않을 경우
		if (dto == null) {
			// String message = "Error";
			
			return "redirect:/findidpw.action";
			// return "redirect:/findidpw.action?message=" + message;
		}
		
		String senderName = "EatsWill";
		String senderEmail = "EatsWill@eatswill.com";
		String receiverEmail = email;
		String subject = "회원님의 비밀번호";
		String content = dto.getName() + " 회원님의 비밀번호는 [" + dto.getPwd() + "] 입니다.";

		String host = "localhost";

		Properties prop = System.getProperties();
		Session ssn = Session.getInstance(prop, null);

		try {

			MimeMessage message = new MimeMessage(ssn);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));

			message.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));

			message.setSubject(subject, "UTF-8");

			message.setContent(content, "text/plain;charset=UTF-8");

			Transport tp = ssn.getTransport("smtp");
			tp.connect(host, "", ""); // ip,id,pw
			tp.sendMessage(message, message.getAllRecipients());
			tp.close();

		} catch (Exception e) {
			System.out.print(e.toString());
		}
		
		return "redirect:/login.action";
	}
	
}

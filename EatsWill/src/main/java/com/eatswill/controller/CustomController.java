package com.eatswill.controller;

import java.util.Map;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.eatswill.dao.CustomDAO;
import com.eatswill.dto.CustomDTO;

@Controller
public class CustomController {
	
	@Autowired
	@Qualifier("customDAO")
	CustomDAO dao;
	
	// 테스트용
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "test3";
	}
	
	// 메인 페이지
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main() {		
		return "main";
	}
	
	// 주문표 확인 기능
	@RequestMapping(value = "/cartList.action", method = RequestMethod.POST)
	@ResponseBody
	public String countCart(String id) {	

		String cnt = dao.countCart(id);
		
		return cnt;
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/signup.action", method = RequestMethod.GET)
	public String signup() {		
		return "custom/signup";
	}
	
	// 아이디 중복 확인 기능
	@RequestMapping(value = "/idcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String id) {	
		
		// 아이디 존재(거부)
		if(!dao.selectCustom(id)) {
			return "fail";
		}
		
		// 아이디 없음(통과)
		return "pass";
	}
	
	// 회원가입 데이터 DB에 입력
	@RequestMapping(value = "/insert.action", method = RequestMethod.POST)
	public String insert(CustomDTO dto) {	
		
		dao.insertCustom(dto);
		
		return "redirect:/main.action";
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String login(HttpServletRequest req, String message) {	
		
		if(message!=null && !message.equals("")) {
			Map<String, ?> reaMap = RequestContextUtils.getInputFlashMap(req);
			if(reaMap!=null) {
				message = (String)reaMap.get("message");
			}
			
			req.setAttribute("message", message);
		}
		
		return "custom/login";
	}
	
	// 로그인 확인 기능
	@RequestMapping(value = "/login_ok.action", method = RequestMethod.POST)
	public String login_ok(HttpServletRequest req, RedirectAttributes rea, String id, String pw) {	
		
		CustomDTO dto = dao.checkIdPw(id, pw);
		
		if (dto == null) {
			String message = "";
			
			// message = URLEncoder.encode("아이디 또는 패스워드를 정확히 입력하세요.", "UTF-8");
			message = "아이디 또는 패스워드를 정확히 입력하세요.";
			rea.addFlashAttribute("message", message);	// redirect에 post 방식으로 메소드 넘김
		
			return "redirect:/login.action";
		}
		
		HttpSession session = req.getSession(); 		// 세션 만들기
		session.setAttribute("customInfo", dto); 		// 세션에 올리기
		session.setAttribute("cart", 0); 
		
		return "redirect:/main.action";
	}
	
	// 로그아웃 기능
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {	
		
		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); 			// 세션에 있는 데이터 삭제
		session.removeAttribute("cart");
		session.invalidate();
		
		return "redirect:/main.action";
	}
	
	// 아이디/비밀번호 찾기 페이지
	@RequestMapping(value = "/findidpw.action", method = RequestMethod.POST)
	public String findidpw(HttpServletRequest req, String mode) {
		
		req.setAttribute("mode", mode);
		
		return "custom/findIdPw";
	}
	
	// 아이디/비밀번호 데이터 확인 후 메일로 전송(서버 켜있어야함) - 시간되면 메일 api로 변경
	@RequestMapping(value = "/findidpw_ok.action", method = RequestMethod.POST)
	public String findidpw_ok(HttpServletRequest req, CustomDTO dto) {	
		
		String subject = "";
		String content = "";

		if(dto.getName()!=null && !dto.getName().equals("")) {
			
			dto = dao.tryId(dto.getName(), dto.getEmail());
			subject = "회원님의 아이디";
			content = dto.getName() + " 회원님의 아이디는 [" + dto.getId() + "] 입니다.";
			
		} else if(dto.getId()!=null && !dto.getId().equals("")) {
			
			dto = dao.tryPw(dto.getId(), dto.getEmail());
			subject = "회원님의 비밀번호";
			content = dto.getName() + " 회원님의 비밀번호는 [" + dto.getPw() + "] 입니다.";
		}
		
		// 아이디가 존재하지 않을 경우
		/*
		if (dto == null) {
			String message = "Error";
			
			return "redirect:/findidpw.action";
		}
		*/
		
		String senderName = "EatsWill";
		String senderEmail = "EatsWill@eatswill.com";
		String receiverEmail = dto.getEmail();
		// String subject = "회원님의 비밀번호";
		// String content = dto.getName() + " 회원님의 비밀번호는 [" + dto.getPw() + "] 입니다.";

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
			tp.connect(host, "", ""); 								// ip,id,pw
			tp.sendMessage(message, message.getAllRecipients());
			tp.close();

		} catch (Exception e) {
			System.out.print(e.toString());
		}
		
		return "redirect:/login.action";
	}
	
	// 정보 수정 페이지
	@RequestMapping(value = "/updateInfo.action", method = RequestMethod.GET)
	public String updateInfo() {
		
		return "custom/updateInfo";
	}

	// 회원가입 데이터 DB에 입력
	@RequestMapping(value = "/update.action", method = RequestMethod.POST)
	public String update(HttpServletRequest req, CustomDTO dto) {	
		
		dao.updateCustom(dto);
		
		dto = dao.renewSession(dto.getId());
		
		HttpSession session = req.getSession(); 		// 세션 만들기
		session.setAttribute("customInfo", dto); 		// 세션에 올리기
		
		return "redirect:/main.action";
	}
	
	// 회원 탈퇴 페이지
	@RequestMapping(value = "/deleteInfo.action", method = RequestMethod.GET)
	public String deleteInfo() {
		
		return "custom/deleteInfo";
	}
	
	// 패스워드 확인 기능
	// 시간되면 String 대신 MVC로 클래스 가져와서 되는지 확인	
	@RequestMapping(value = "/pwcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String pwcheck(String id, String pw) {	

		// 정보 불일치
		if(!dao.checkPw(id, pw)) {
			return "fail";
		}

		return "pass";
	}
	
	// 회원 탈퇴 페이지
	@RequestMapping(value = "/delete.action", method = RequestMethod.POST)
	public String delete(HttpServletRequest req, String id) {
		
		dao.deleteCustom(id);
		
		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); 			// 세션에 있는 데이터 삭제
		session.removeAttribute("cart");
		session.invalidate();
		
		return "redirect:/main.action";
	}
}

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
	
	// �׽�Ʈ��
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "test3";
	}
	
	// ���� ������
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main() {		
		return "main";
	}
	
	// �ֹ�ǥ Ȯ�� ���
	@RequestMapping(value = "/cartList.action", method = RequestMethod.POST)
	@ResponseBody
	public String countCart(String id) {	

		String cnt = dao.countCart(id);
		
		return cnt;
	}
	
	// ȸ������ ������
	@RequestMapping(value = "/signup.action", method = RequestMethod.GET)
	public String signup() {		
		return "custom/signup";
	}
	
	// ���̵� �ߺ� Ȯ�� ���
	@RequestMapping(value = "/idcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String id) {	
		
		// ���̵� ����(�ź�)
		if(!dao.selectCustom(id)) {
			return "fail";
		}
		
		// ���̵� ����(���)
		return "pass";
	}
	
	// ȸ������ ������ DB�� �Է�
	@RequestMapping(value = "/insert.action", method = RequestMethod.POST)
	public String insert(CustomDTO dto) {	
		
		dao.insertCustom(dto);
		
		return "redirect:/main.action";
	}
	
	// �α��� ������
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
	
	// �α��� Ȯ�� ���
	@RequestMapping(value = "/login_ok.action", method = RequestMethod.POST)
	public String login_ok(HttpServletRequest req, RedirectAttributes rea, String id, String pw) {	
		
		CustomDTO dto = dao.checkIdPw(id, pw);
		
		if (dto == null) {
			String message = "";
			
			// message = URLEncoder.encode("���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���.", "UTF-8");
			message = "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���.";
			rea.addFlashAttribute("message", message);	// redirect�� post ������� �޼ҵ� �ѱ�
		
			return "redirect:/login.action";
		}
		
		HttpSession session = req.getSession(); 		// ���� �����
		session.setAttribute("customInfo", dto); 		// ���ǿ� �ø���
		session.setAttribute("cart", 0); 
		
		return "redirect:/main.action";
	}
	
	// �α׾ƿ� ���
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {	
		
		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); 			// ���ǿ� �ִ� ������ ����
		session.removeAttribute("cart");
		session.invalidate();
		
		return "redirect:/main.action";
	}
	
	// ���̵�/��й�ȣ ã�� ������
	@RequestMapping(value = "/findidpw.action", method = RequestMethod.POST)
	public String findidpw(HttpServletRequest req, String mode) {
		
		req.setAttribute("mode", mode);
		
		return "custom/findIdPw";
	}
	
	// ���̵�/��й�ȣ ������ Ȯ�� �� ���Ϸ� ����(���� ���־����) - �ð��Ǹ� ���� api�� ����
	@RequestMapping(value = "/findidpw_ok.action", method = RequestMethod.POST)
	public String findidpw_ok(HttpServletRequest req, CustomDTO dto) {	
		
		String subject = "";
		String content = "";

		if(dto.getName()!=null && !dto.getName().equals("")) {
			
			dto = dao.tryId(dto.getName(), dto.getEmail());
			subject = "ȸ������ ���̵�";
			content = dto.getName() + " ȸ������ ���̵�� [" + dto.getId() + "] �Դϴ�.";
			
		} else if(dto.getId()!=null && !dto.getId().equals("")) {
			
			dto = dao.tryPw(dto.getId(), dto.getEmail());
			subject = "ȸ������ ��й�ȣ";
			content = dto.getName() + " ȸ������ ��й�ȣ�� [" + dto.getPw() + "] �Դϴ�.";
		}
		
		// ���̵� �������� ���� ���
		/*
		if (dto == null) {
			String message = "Error";
			
			return "redirect:/findidpw.action";
		}
		*/
		
		String senderName = "EatsWill";
		String senderEmail = "EatsWill@eatswill.com";
		String receiverEmail = dto.getEmail();
		// String subject = "ȸ������ ��й�ȣ";
		// String content = dto.getName() + " ȸ������ ��й�ȣ�� [" + dto.getPw() + "] �Դϴ�.";

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
	
	// ���� ���� ������
	@RequestMapping(value = "/updateInfo.action", method = RequestMethod.GET)
	public String updateInfo() {
		
		return "custom/updateInfo";
	}

	// ȸ������ ������ DB�� �Է�
	@RequestMapping(value = "/update.action", method = RequestMethod.POST)
	public String update(HttpServletRequest req, CustomDTO dto) {	
		
		dao.updateCustom(dto);
		
		dto = dao.renewSession(dto.getId());
		
		HttpSession session = req.getSession(); 		// ���� �����
		session.setAttribute("customInfo", dto); 		// ���ǿ� �ø���
		
		return "redirect:/main.action";
	}
	
	// ȸ�� Ż�� ������
	@RequestMapping(value = "/deleteInfo.action", method = RequestMethod.GET)
	public String deleteInfo() {
		
		return "custom/deleteInfo";
	}
	
	// �н����� Ȯ�� ���
	// �ð��Ǹ� String ��� MVC�� Ŭ���� �����ͼ� �Ǵ��� Ȯ��	
	@RequestMapping(value = "/pwcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String pwcheck(String id, String pw) {	

		// ���� ����ġ
		if(!dao.checkPw(id, pw)) {
			return "fail";
		}

		return "pass";
	}
	
	// ȸ�� Ż�� ������
	@RequestMapping(value = "/delete.action", method = RequestMethod.POST)
	public String delete(HttpServletRequest req, String id) {
		
		dao.deleteCustom(id);
		
		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); 			// ���ǿ� �ִ� ������ ����
		session.removeAttribute("cart");
		session.invalidate();
		
		return "redirect:/main.action";
	}
}

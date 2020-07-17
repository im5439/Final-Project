package com.eatswill.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.eatswill.dao.CustomDAO;
import com.eatswill.dto.CustomDTO;
import com.eatswill.dto.MyDTO;

@Controller
public class CustomController {

	@Autowired
	@Qualifier("customDAO")
	CustomDAO dao;
	
	// �׽�Ʈ��
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "main2";
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
	// �ð��Ǹ� String ��� MVC�� Ŭ���� �����ͼ� �Ǵ��� Ȯ��
	@RequestMapping(value = "/idcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String id) {

		// ���̵� ����(�ź�)
		if (!dao.selectCustom(id)) {
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
		
		if (message != null && !message.equals("")) {
			Map<String, ?> reaMap = RequestContextUtils.getInputFlashMap(req);
			if (reaMap != null) {
				message = (String) reaMap.get("message");
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
			rea.addFlashAttribute("message", message); // redirect�� post ������� �޼ҵ� �ѱ�

			return "redirect:/login.action";
		}

		HttpSession session = req.getSession(); // ���� �����
		session.setAttribute("customInfo", dto); // ���ǿ� �ø���
		session.setAttribute("cart", 0);

		return "redirect:/main.action";
	}
	
	// īī�� �α��� Ȯ�� ���
	@RequestMapping(value = "/kakaoLogin_ok.action", method = RequestMethod.POST)
	public String kakaoLogin_ok(HttpServletRequest req, String kakaoSession, String kakaoSession2) {

		CustomDTO dto = new CustomDTO();

		dto.setId(kakaoSession);
		dto.setName(kakaoSession);
		dto.setEmail(kakaoSession2);
		
		HttpSession session = req.getSession(); // ���� �����
		session.setAttribute("customInfo", dto); // ���ǿ� �ø���
		session.setAttribute("cart", 0);

		return "redirect:/main.action";
	}

	// �α׾ƿ� ���
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {

		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); // ���ǿ� �ִ� ������ ����
		session.removeAttribute("cart");   
	    session.invalidate();

		return "redirect:/main.action";
	}

	// ���̵�/��й�ȣ ã�� ������
	@RequestMapping(value = "/findidpw.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String findidpw(HttpServletRequest req, String mode, String message) {
		
		if (message != null && !message.equals("")) {
			Map<String, ?> reaMap = RequestContextUtils.getInputFlashMap(req);
			if (reaMap != null) {
				mode = (String) reaMap.get("mode");
				message = (String) reaMap.get("message");
			}

			req.setAttribute("message", message);
		}
		
		req.setAttribute("mode", mode);

		return "custom/findIdPw";
	}
	/*
	// ���̵�/��й�ȣ ������ Ȯ�� �� ���Ϸ� ����(���� ���־����) - �ð��Ǹ� ���� api�� ����
	@RequestMapping(value = "/findidpw_ok.action", method = RequestMethod.POST)
	public String findidpw_ok(HttpServletRequest req, CustomDTO dto, RedirectAttributes rea) {

		String message = "";
		String subject = "";
		String content = "";

		if (dto.getName() != null && !dto.getName().equals("")) {

			dto = dao.tryId(dto.getName(), dto.getEmail());
			
			if (dto == null) { 
				message = "�̸��� ��Ȯ�� �Է��ϼ���.";
				rea.addFlashAttribute("mode", "id");
				rea.addFlashAttribute("message", message); 
				return "redirect:/findidpw.action"; 
			}
			
			subject = "ȸ������ ���̵�";
			content = dto.getName() + " ȸ������ ���̵�� [" + dto.getId() + "] �Դϴ�.";

		} else if (dto.getId() != null && !dto.getId().equals("")) {

			dto = dao.tryPw(dto.getId(), dto.getEmail());
			
			if (dto == null) { 
				message = "���̵� ��Ȯ�� �Է��ϼ���.";
				rea.addFlashAttribute("mode", "pw");
				rea.addFlashAttribute("message", message);
				return "redirect:/findidpw.action"; 
			}
			
			subject = "ȸ������ ��й�ȣ";
			content = dto.getName() + " ȸ������ ��й�ȣ�� [" + dto.getPw() + "] �Դϴ�.";
		}

		String senderName = "EatsWill";
		String senderEmail = "EatsWill@eatswill.com";
		String receiverEmail = dto.getEmail();
		// String subject = "ȸ������ ��й�ȣ";
		// String content = dto.getName() + " ȸ������ ��й�ȣ�� [" + dto.getPw() + "] �Դϴ�.";

		String host = "localhost";

		Properties prop = System.getProperties();

		Session ssn = Session.getInstance(prop, null);

		try {

			MimeMessage send_message = new MimeMessage(ssn);
			send_message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));

			send_message.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));

			send_message.setSubject(subject, "UTF-8");

			send_message.setContent(content, "text/plain;charset=UTF-8");

			Transport tp = ssn.getTransport("smtp");
			tp.connect(host, "", ""); // ip,id,pw
			tp.sendMessage(send_message, send_message.getAllRecipients());
			tp.close();

		} catch (Exception e) {
			System.out.print(e.toString());
		}

		return "redirect:/login.action";
	}
	*/
	
	// ���̵�/��й�ȣ ������ Ȯ�� �� ���Ϸ� ����(���� ���־����) - �ð��Ǹ� ���� api�� ����
	@RequestMapping(value = "/findidpw_ok.action", method = RequestMethod.POST)
	public String findidpw_ok(HttpServletRequest req, CustomDTO dto) {
		
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		
		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("shoon0615@gmail.com", "s1632000");
			}
		};
		
		Session session = Session.getDefaultInstance(props, auth);

		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("admin@example.com", "Example.com Admin"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("dlacndghks12@gmail.com", "Mr. Users"));
			msg.setSubject("Your Example.com account has been activated");
			msg.setText("This is a test");
			Transport.send(msg);
		} catch (Exception e) {
			System.out.println("I am here??? ");
	   		e.printStackTrace();
		} 
		return "redirect:/login.action";
	}
	
	// ȸ������ ������ DB�� �Է�
	@RequestMapping(value = "/update.action", method = RequestMethod.POST)
	public String update(HttpServletRequest req, CustomDTO dto) {

		dao.updateCustom(dto);

		dto = dao.renewSession(dto.getId());

		HttpSession session = req.getSession(); // ���� �����
		session.setAttribute("customInfo", dto); // ���ǿ� �ø���

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
		if (!dao.checkPw(id, pw)) {
			return "fail";
		}

		return "pass";
	}

	// ȸ�� Ż�� ������
	@RequestMapping(value = "/delete.action", method = RequestMethod.POST)
	public String delete(HttpServletRequest req, String id) {

		dao.deleteCustom(id);

		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); // ���ǿ� �ִ� ������ ����
		session.removeAttribute("cart");
		session.invalidate();

		return "redirect:/main.action";
	}

	// ���� �ֹ� ��� ����
	@RequestMapping(value = "/myOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myOrder(HttpServletRequest req) throws Exception {
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");	
		
		List<MyDTO> lists = dao.getBuyList(dto.getId());
		String reviewUrl = cp + "/reviewCreated.action?";
		String myOrderCancel = cp + "/myOrderCancel.action?";
		
		
		req.setAttribute("lists", lists);
		req.setAttribute("reviewUrl", reviewUrl);
		req.setAttribute("myOrderCancel", myOrderCancel);
		
		return "custom/myOrder";
	}
	
	// �ֹ� ����ϱ�
	@RequestMapping(value = "/myOrderCancel.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myOrderCancel(HttpServletRequest req) throws Exception {
		String orderCode = req.getParameter("orderCode");
		dao.myOrderCancel(orderCode);
		
		return "redirect:/myOrder.action";
	}
	
	
	
	// ���� �ۼ�â ����
	@RequestMapping(value = "/reviewCreated.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewCreated(HttpServletRequest req) throws Exception {
		String orderCode = req.getParameter("orderCode");
		
		MyDTO dto = dao.getReadData(orderCode);
		req.setAttribute("dto", dto);
		
		return "custom/reviewCreated";
	}
	
	// ���� ��Ͻ� ����
	@RequestMapping(value = "/reviewCreated_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewCreated_ok(HttpServletRequest req, MyDTO dto) throws Exception {
		
		MultipartFile uploadfile = dto.getUploadfile();
		
		//String path = req.getSession().getServletContext().getRealPath("resource/reImg");
		if(uploadfile!=null) {
			String reImg = uploadfile.getOriginalFilename();
			dto.setReImg(reImg);
			try {
				File file = new File("d:/reImg/" + reImg);
				uploadfile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		int maxReNum = dao.getMaxReNum();
		HttpSession session = req.getSession();
		CustomDTO cdto = (CustomDTO)session.getAttribute("customInfo");
		
		dto.setOrderCode(req.getParameter("orderCode"));
		dto.setShopCode(req.getParameter("shopCode"));
		dto.setUserId(cdto.getId());
		dto.setReNum(maxReNum + 1);
		
		dao.reviewInsert(dto);
		
		return "redirect:/myReview.action";
	}
	
	
	// ���� ���� ����
	@RequestMapping(value = "/heartStore.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String heartStore(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");	
		
		List<MyDTO> lists = dao.getHeartList(dto.getId());
		
		req.setAttribute("lists", lists);
		
		return "custom/heartStore";
	}
	
	// ���� ���� ����
	@RequestMapping(value = "/myReview.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myReivew(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");	
		
		int myReviewCnt = dao.getMyReviewCnt(dto.getId());
		List<MyDTO> lists = dao.getMyReviewList(dto.getId());
		
		req.setAttribute("myReviewCnt", myReviewCnt);
		req.setAttribute("lists", lists);
		
		return "custom/myReview";
	}
	
	// ���� �����ϱ�
	@RequestMapping(value = "/reviewDelete.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewDelete(HttpServletRequest req) throws Exception {
		int reNum = Integer.parseInt(req.getParameter("reNum"));
		dao.reviewDelete(reNum);
		return "redirect:/myReview.action";
	}

}
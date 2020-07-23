package com.eatswill.controller;

import java.io.File;
import java.nio.channels.SeekableByteChannel;
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
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
	
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	// 테스트용
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "main2";
	}

	// 메인 페이지
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main(HttpServletRequest req, String message) {
		
		if (message != null && !message.equals("")) {
			Map<String, ?> reaMap = RequestContextUtils.getInputFlashMap(req);
			if (reaMap != null) {
				message = (String) reaMap.get("message");
			}

			req.setAttribute("message", message);
		}
		
		return "main";
	}

	// 주문표 확인 기능
	@RequestMapping(value = "/cartList.action", method = RequestMethod.POST)
	@ResponseBody
	public String countCart(String id) {

		String cnt = dao.countCart(id);

		return cnt;
	}
	
	// 주문표 이동 기능
	@RequestMapping(value = "/cartOpen.action", method = RequestMethod.POST)
	@ResponseBody
	public String cartOpen(String id) {

		String cnt = dao.cartOpen(id);

		return cnt;
	}	

	// 회원가입 페이지
	@RequestMapping(value = "/signup.action", method = RequestMethod.GET)
	public String signup() {
		return "custom/signup";
	}

	// 아이디 중복 확인 기능
	// 시간되면 String 대신 MVC로 클래스 가져와서 되는지 확인
	@RequestMapping(value = "/idcheck.action", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String id) {

		// 아이디 존재(거부)
		if (!dao.selectCustom(id)) {
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
		
		if (message != null && !message.equals("")) {
			Map<String, ?> reaMap = RequestContextUtils.getInputFlashMap(req);
			if (reaMap != null) {
				message = (String) reaMap.get("message");
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
			rea.addFlashAttribute("message", message); // redirect에 post 방식으로 메소드 넘김

			return "redirect:/login.action";
		}

		HttpSession session = req.getSession(); // 세션 만들기
		session.setAttribute("customInfo", dto); // 세션에 올리기
		session.setAttribute("cart", 0);

		return "redirect:/main.action";
	}
	
	// 카카오 로그인 확인 기능
	@RequestMapping(value = "/kakaoLogin_ok.action", method = RequestMethod.POST)
	public String kakaoLogin_ok(HttpServletRequest req, String kakaoSession, String kakaoSession2) {

		CustomDTO dto = new CustomDTO();

		dto.setId(kakaoSession);
		dto.setName(kakaoSession);
		dto.setEmail(kakaoSession2);
		
		HttpSession session = req.getSession(); // 세션 만들기
		session.setAttribute("customInfo", dto); // 세션에 올리기
		session.setAttribute("cart", 0);

		return "redirect:/main.action";
	}

	// 로그아웃 기능
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {

		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); // 세션에 있는 데이터 삭제
		session.removeAttribute("cart");   
	    session.invalidate();

		return "redirect:/main.action";
	}

	// 아이디/비밀번호 찾기 페이지
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
	
	// 아이디/비밀번호 데이터 확인 후 메일로 전송
	@RequestMapping(value = "/findidpw_ok.action", method = RequestMethod.POST)
	public String findidpw_ok(HttpServletRequest req, CustomDTO dto, RedirectAttributes rea) {

		String message = "";
		String subject = "";
		String content = "";

		if (dto.getName() != null && !dto.getName().equals("")) {

			dto = dao.tryId(dto.getName(), dto.getEmail());
			
			if (dto == null) { 
				message = "이름 또는 이메일을 정확히 입력하세요.";
				rea.addFlashAttribute("mode", "id");
				rea.addFlashAttribute("message", message); 
				return "redirect:/findidpw.action"; 
			}
			
			subject = "회원님의 아이디";
			content = dto.getName() + " 회원님의 아이디는 [" + dto.getId() + "] 입니다.";

		} else if (dto.getId() != null && !dto.getId().equals("")) {

			dto = dao.tryPw(dto.getId(), dto.getEmail());
			
			if (dto == null) { 
				message = "아이디 또는 이메일을 정확히 입력하세요.";
				rea.addFlashAttribute("mode", "pw");
				rea.addFlashAttribute("message", message);
				return "redirect:/findidpw.action"; 
			}
			
			subject = "회원님의 비밀번호";
			content = dto.getName() + " 회원님의 비밀번호는 [" + dto.getPw() + "] 입니다.";
		}

		String senderName = "EatsWill";
		String senderEmail = "EatsWill@eatswill.com";
		String receiverEmail = dto.getEmail();
		
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", mailSender.getHost());
		props.put("mail.smtp.port", mailSender.getPort());
		
		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailSender.getUsername(), mailSender.getPassword());
			}
		};
		
		Session session = Session.getDefaultInstance(props, auth);

		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail, "Mr. Users"));
			msg.setSubject(subject);
			msg.setText(content);
			Transport.send(msg);

		} catch (Exception e) {
	   		e.printStackTrace();
		} 
		return "redirect:/login.action";
	}
	
	// 정보 수정 페이지
	@RequestMapping(value = "/updateInfo.action", method = RequestMethod.GET)
	public String updateInfo(HttpServletRequest req, RedirectAttributes rea) {
		
		String message = "";
		
		HttpSession session = req.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");	
		
		if (dto.getId() == dto.getName() || dto.getId().equals(dto.getName())) { 
			message = "카카오계정은 이용할수없는 기능입니다.";
			rea.addFlashAttribute("message", message); 
			return "redirect:/main.action"; 
		}
		
		return "custom/updateInfo";
	}
	
	// 회원가입 데이터 DB에 입력
	@RequestMapping(value = "/update.action", method = RequestMethod.POST)
	public String update(HttpServletRequest req, CustomDTO dto) {

		dao.updateCustom(dto);

		dto = dao.renewSession(dto.getId());

		HttpSession session = req.getSession(); // 세션 만들기
		session.setAttribute("customInfo", dto); // 세션에 올리기

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
		if (!dao.checkPw(id, pw)) {
			return "fail";
		}

		return "pass";
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/delete.action", method = RequestMethod.POST)
	public String delete(HttpServletRequest req, String id) {

		dao.deleteCustom(id);

		HttpSession session = req.getSession();
		session.removeAttribute("customInfo"); // 세션에 있는 데이터 삭제
		session.removeAttribute("cart");
		session.invalidate();

		return "redirect:/main.action";
	}

	// 나의 주문 목록 띄우기
	@RequestMapping(value = "/myOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myOrder(HttpServletRequest req) throws Exception {
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");	
		
		List<MyDTO> lists = dao.getBuyList(dto.getId());
		String reviewUrl = cp + "/reviewCreated.action?";
		String myOrderCancel = cp + "/myOrderCancel.action?";
		String storeUrl = cp + "/page.action";
		
		req.setAttribute("lists", lists);
		req.setAttribute("reviewUrl", reviewUrl);
		req.setAttribute("myOrderCancel", myOrderCancel);
		req.setAttribute("storeUrl", storeUrl);
		
		return "custom/myOrder";
	}
	
	// 주문 취소하기
	@RequestMapping(value = "/myOrderCancel.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myOrderCancel(HttpServletRequest req) throws Exception {
		String orderCode = req.getParameter("orderCode");
		dao.myOrderCancel(orderCode);
		
		return "redirect:/myOrder.action";
	}
	
	
	
	// 리뷰 작성창 띄우기
	@RequestMapping(value = "/reviewCreated.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewCreated(HttpServletRequest req) throws Exception {
		String orderCode = req.getParameter("orderCode");
		
		MyDTO dto = dao.getReadData(orderCode);
		req.setAttribute("dto", dto);
		
		return "custom/reviewCreated";
	}
	
	// 리뷰 등록시 실행
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
		dao.pointUpdate(cdto.getId());
		
		cdto = dao.renewSession(cdto.getId());
		session.setAttribute("customInfo", cdto);
		
		return "redirect:/myReview.action";
	}
	
	
	// 찜한 매장 띄우기
	@RequestMapping(value = "/heartStore.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String heartStore(HttpServletRequest req) throws Exception {
		String cp = req.getContextPath();
		HttpSession session = req.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");	
		
		List<MyDTO> lists = dao.getHeartList(dto.getId());
		String storeUrl = cp + "/page.action";
		
		req.setAttribute("lists", lists);
		req.setAttribute("storeUrl", storeUrl);
		
		return "custom/heartStore";
	}
	
	// 나의 리뷰 띄우기
	@RequestMapping(value = "/myReview.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myReivew(HttpServletRequest req) throws Exception {
		String cp = req.getContextPath();
		HttpSession session = req.getSession();
		CustomDTO dto = (CustomDTO)session.getAttribute("customInfo");	
		
		int myReviewCnt = dao.getMyReviewCnt(dto.getId());
		List<MyDTO> lists = dao.getMyReviewList(dto.getId());
		String storeUrl = cp + "/page.action";
		
		req.setAttribute("myReviewCnt", myReviewCnt);
		req.setAttribute("lists", lists);
		req.setAttribute("storeUrl", storeUrl);
		
		return "custom/myReview";
	}
	
	// 리뷰 삭제하기
	@RequestMapping(value = "/reviewDelete.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewDelete(HttpServletRequest req) throws Exception {
		int reNum = Integer.parseInt(req.getParameter("reNum"));
		dao.reviewDelete(reNum);
		
		return "redirect:/myReview.action";
	}

}

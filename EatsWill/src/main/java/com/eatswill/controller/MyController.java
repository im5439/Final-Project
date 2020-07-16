package com.eatswill.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.eatswill.dao.MyDAO;
import com.eatswill.dto.CustomDTO;
import com.eatswill.dto.MyDTO;

@Controller
public class MyController {
	
	// OrderMainDAO ������
	@Autowired
	@Qualifier("myDAO")
	MyDAO dao;
	
	// Ȩȭ��
		@RequestMapping(value = "/eatsWill.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String eatsWill(HttpServletRequest req) throws Exception {
			
			return "home";
		}
	
	// ���� �ֹ� ��� ����
	@RequestMapping(value = "/myOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myOrder(HttpServletRequest req) throws Exception {
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
	    CustomDTO cdto = (CustomDTO)session.getAttribute("customInfo");   
		
		List<MyDTO> lists = dao.getBuyList(cdto.getId());
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
		
		HttpSession session = req.getSession();
	    CustomDTO cdto = (CustomDTO)session.getAttribute("customInfo"); 
		
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
		
		dto.setOrderCode(req.getParameter("orderCode"));
		dto.setShopCode(req.getParameter("shopCode"));
		dto.setUserId(cdto.getId()); // ����
		dto.setReNum(maxReNum + 1);
		
		dao.reviewInsert(dto);
		
		return "redirect:/myReview.action";
	}
	
	
	// ���� ���� ����
	@RequestMapping(value = "/heartStore.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String heartStore(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
	    CustomDTO cdto = (CustomDTO)session.getAttribute("customInfo");   
		
		// ����
		String userId = cdto.getId();
		List<MyDTO> lists = dao.getHeartList(userId);
		
		req.setAttribute("lists", lists);
		
		return "custom/heartStore";
	}
	
	// ���� ���� ����
	@RequestMapping(value = "/myReview.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myReivew(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
	    CustomDTO cdto = (CustomDTO)session.getAttribute("customInfo");   
		
		// ����
		String userId = cdto.getId();
		
		int myReviewCnt = dao.getMyReviewCnt(userId);
		List<MyDTO> lists = dao.getMyReviewList(userId);
		
		req.setAttribute("myReviewCnt", myReviewCnt);
		req.setAttribute("lists", lists);
		
		return "custom/myReview";
	}
	
	// ����
	@RequestMapping(value = "/a.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String a(HttpServletRequest req) throws Exception {
		
		return "custom/locationWatchPosition";
	}
}

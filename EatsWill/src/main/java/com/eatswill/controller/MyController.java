package com.eatswill.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.eatswill.dao.MyDAO;
import com.eatswill.dto.MyDTO;

@Controller
public class MyController {
	
	// OrderMainDAO ������
	@Autowired
	@Qualifier("myDAO")
	MyDAO dao;
	
	// ���� �ֹ� ���
	@RequestMapping(value = "/myOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String myOrder(HttpServletRequest req) throws Exception {
		String cp = req.getContextPath();
		
		String userId = "user";
		List<MyDTO> lists = dao.getBuyList(userId);
		String reviewUrl = cp + "/reviewCreated.action?";
		
		req.setAttribute("lists", lists);
		req.setAttribute("reviewUrl", reviewUrl);
		
		return "custom/myOrder";
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
		
		dto.setOrderCode(req.getParameter("orderCode"));
		dto.setShopCode(req.getParameter("shopCode"));
		dto.setpNum(0);
		dto.setUserId("user"); // ���߿� ���ǿ� �� �޾ƿ���
		dto.setReNum(maxReNum + 1);
		
		dao.reviewInsert(dto);
		
		return "custom/myOrder"; // ���߿� redirect:/myReview.action�� ����.
	}
}

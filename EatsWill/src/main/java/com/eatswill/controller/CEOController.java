package com.eatswill.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

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

	// ���������� & �α���
	@RequestMapping(value = "/CEO.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceo(HttpServletRequest request, HttpSession session) {

		String ceoId = request.getParameter("ceoId");
		String ceoPw = request.getParameter("ceoPw");

		if (ceoId != null) {

			CeoDTO dto = dao.getReadData(ceoId);

			if (dto == null || !dto.getCeoPw().equals(ceoPw)) {

				System.out.println("���̵���Ʋ��");
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

	// �α׾ƿ�
	@RequestMapping(value = "/logout_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/CEO.action";

	}

	// ȸ������ ������
	@RequestMapping(value = "/ceoSignup.action")
	public String ceoSignup() {

		return "CEO/ceoSignup";

	}

	// ȸ������ �Ϸ�
	@RequestMapping(value = "/ceoSignup_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceoSignup_ok(HttpServletRequest request, CeoDTO dto) {

		dao.insertData(dto);

		return "redirect:/CEO.action";

	}

	// �����߰� ������
	@RequestMapping(value = "/addStore.action")
	public String addStore() {

		return "CEO/addStore";

	}

	// DB�� �����߰�
	@RequestMapping(value = "/addStore_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String addStore_ok(HttpServletRequest request, HttpSession session, CeoDTO dto) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		dto.setCeoId(ceoId);
		dto.setShopAddr(dto.getShopAddr1().concat(dto.getShopAddr2()));
		
		//�����̹����������� ���ε�
		MultipartFile uploadfile = dto.getUploadfile();
		String path = request.getSession().getServletContext().getRealPath("resources/img");
		String newFileName = null;
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();
		if(uploadfile!=null) {
			String shopImg = uploadfile.getOriginalFilename();
			
			// ���� Ȯ����
			String fileExt = shopImg.substring(shopImg.lastIndexOf("."));
			if(fileExt == null || fileExt.equals(""))
				return null;
			
			// ������ ������ ���ο� ���ϸ��� �����.
			newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", 
					         Calendar.getInstance());
			newFileName += System.nanoTime();
			newFileName += fileExt;
			
			dto.setShopImg(newFileName);
			try {
				File file = new File(path + newFileName);
				uploadfile.transferTo(file);
				dao.insertStore(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/addStore.action";
		}

		return "redirect:/addStore.action";

	}

	// ������� ������
	@RequestMapping(value = "/ceoReview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceoReview(HttpServletRequest request, HttpSession session, CeoDTO dto) {

		CeoInfo info = (CeoInfo) session.getAttribute("ceoInfo");
		String ceoId = info.getCeoId();
		System.out.println(ceoId);

		List<CeoDTO> lists = dao.getShopList(ceoId);

		int storeCount = dao.getShopCount(ceoId);

		request.setAttribute("lists", lists);
		request.setAttribute("storeCount", storeCount);

		return "CEO/ceoReview";

	}
	
	
	
	
	

}

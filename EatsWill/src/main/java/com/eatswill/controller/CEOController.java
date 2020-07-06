package com.eatswill.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CEOController {
	
	
	@RequestMapping(value = "/CEO.action", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView home(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("CEO/CEO");
		
		return mav;
	}
	
}

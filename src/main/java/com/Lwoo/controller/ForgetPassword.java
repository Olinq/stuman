package com.Lwoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.service.AdminService;

@Controller
@RequestMapping("")
public class ForgetPassword {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("forgetPassword")
	public ModelAndView forget(){
		ModelAndView mav=new ModelAndView("forgetPassword");
		Admin admin=adminService.getLock(1);
		mav.addObject("admin",admin);
		return mav;
		
	}
	
}

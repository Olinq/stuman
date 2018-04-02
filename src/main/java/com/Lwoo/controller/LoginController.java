package com.Lwoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Asso;
import com.Lwoo.service.AdminService;
import com.Lwoo.service.AssoService;

@Controller
@RequestMapping("")
public class LoginController {
	@Autowired
	AdminService adminService;
	@Autowired
	AssoService assoService;
	@RequestMapping(value="checkAdminLogin",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView loginIn(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("checkAdminLogin----"+username+":"+password);
		 Admin admin=adminService.checkLogin(username, password);
		if(admin==null){
			ModelAndView mav = new ModelAndView("redirect:/login.jsp"); 
			request.getSession().setAttribute("login", "用户名或者密码错误");
			return mav; 
		}
		if(1!=admin.getLock()){
			ModelAndView mav = new ModelAndView("redirect:/listSomeAsso"); 
			mav.addObject("admin", admin);
			return mav;
		}
		ModelAndView mav = new ModelAndView("redirect:/listCategory"); 
		mav.addObject("admin", admin);
	    return mav; 
	}
	
	@RequestMapping(value="listSomeAsso",method = RequestMethod.POST)
	@ResponseBody
	public String loginUsualAsso(Admin admin,Model model){
		Asso asso= assoService.get(admin.getAssoId());
		model.addAttribute("asso", asso);
		return "usualAdmin/listSomeAsso";
	}
	
}

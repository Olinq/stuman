package com.Lwoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(value="checkAdminLogin")
	public ModelAndView loginIn(HttpServletRequest request,HttpServletResponse response,HttpSession httpSession){
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
			System.out.println("++in checkAdminLogin");
			ModelAndView mav = new ModelAndView("redirect:/listSomeAsso"); 
			httpSession.setAttribute("admin", admin);
//			attr.addFlashAttribute("admin", admin);//重定向传值，页面一刷新就清空
			return mav;
		}
		System.out.println("------------------------------");
		ModelAndView mav = new ModelAndView("redirect:/listCategory"); 
		httpSession.setAttribute("admin", admin);//重定向传值
	    return mav; 
	}
	
	@RequestMapping(value="listSomeAsso")
	public String loginUsualAsso(HttpServletRequest request,HttpSession httpSession){
		Admin admin=(Admin) httpSession.getAttribute("admin");
		System.out.println("===loginUsualAsso"+admin);
		Asso asso= assoService.get(admin.getAssoId());
		httpSession.setAttribute("admin", admin);
		request.getSession().setAttribute("asso", asso);
		return "usualAdmin/listSomeAsso";
	}
	@RequestMapping(value="logout")
	@ResponseBody
	public ModelAndView logout(Admin admin,Model model,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("redirect:login.jsp"); 
		request.getSession().setAttribute("login", "");
		return mav;
	}
	
}

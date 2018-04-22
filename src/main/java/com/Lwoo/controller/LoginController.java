package com.Lwoo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Asso;
import com.Lwoo.pojo.User;
import com.Lwoo.service.AdminService;
import com.Lwoo.service.AssoService;
import com.Lwoo.service.UserService;

@Controller
@RequestMapping("")
public class LoginController {
	@Autowired
	AdminService adminService;
	@Autowired
	AssoService assoService;
	@Autowired
	UserService userService;
	
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
			int tag=userService.getListNostatu(admin.getAssoId(), 0).size();
			httpSession.setAttribute("tag", tag);
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
		System.out.println("===loginUsualAsso  "+admin);
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
 	@ResponseBody
    @RequestMapping(value="user/userLoginIn", method = RequestMethod.POST)
     public Map<String,String> getUser(@RequestBody Map<String,String> usermap,HttpSession httpSession){
 		String username=usermap.get("username");
 		String password=usermap.get("password");
 		System.out.println("checkAdminLogin----"+username+":"+password);
 		User user=userService.checkLogin(username, password);
		System.out.println("------------------------------"+user);
		String result="false";
		String statu="0";
		if(user!=null){
			result="true";
			statu=user.getStatu().toString();
			if(statu=="1"){
				httpSession.setAttribute("user", user);//重定向传值
			}
		}
		Map<String,String> rel=new HashMap<String,String>();
		rel.put("result", result);
		rel.put("statu",statu );//用户是否是正式会员
     return rel;
    }
 	//用户注销
	@ResponseBody
    @RequestMapping(value="user/logoutUser", method = RequestMethod.POST)
     public Map<String,String> logout(HttpSession httpSession){
		httpSession.setAttribute("user", null);
		System.out.println("user/logout");
		Map<String,String> rel=new HashMap<String,String>();
		rel.put("result", "注销成功");
		return rel;
    }
}

package com.Lwoo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.service.AdminService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("listAdmin")
	  public String adminList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
	      PageHelper.startPage(page, 8);
	      List<Admin> admins = adminService.list();
	      System.out.println("----adminsController\n"+admins);
	      PageInfo<Admin> pageInfo=new PageInfo<Admin>(admins);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("admins",admins);
	      return "admin/listAdminJsp";
	  }
	//增加管理员
	@RequestMapping("addAdmin")
	public ModelAndView addAdmin(Admin admin){
		adminService.add(admin);
		ModelAndView mav = new ModelAndView("redirect:/listAdmin");
	    return mav;
	}	
	 //删除管理员
	@RequestMapping("deleteAdminById")
	public ModelAndView deleteAdmin(Admin admin){
		adminService.delete(admin);
		ModelAndView mav = new ModelAndView("redirect:/listAdmin");
		return mav;
	}
	//编辑管理员
	@RequestMapping("editAdmin")
	public ModelAndView editAdmin(Admin ad,HttpSession httpSession){
		Admin admin=(Admin) httpSession.getAttribute("admin");
		System.out.println("===editAdmin  "+admin);
		httpSession.setAttribute("admin", admin);
		Admin Eadmin= adminService.get(ad.getId());
		System.out.println("editAdmin------\n"+Eadmin);
		ModelAndView mav = new ModelAndView("admin/editAdmin");
		mav.addObject("Eadmin", Eadmin);
		return mav;
	}
	@RequestMapping("updateAdmin")
	public ModelAndView updateAdmin(Admin ad,HttpSession httpSession){
		System.out.println("updateAdmin----"+ad);
		adminService.update(ad);
		Admin admin=(Admin) httpSession.getAttribute("admin");
		httpSession.setAttribute("admin", adminService.get(admin.getId()));
		if(1!=admin.getLock()){//普通管理员
			ModelAndView mav = new ModelAndView("redirect:/listSomeAsso");
			return mav;
		}
		ModelAndView mav = new ModelAndView("redirect:/listAdmin");
		return mav;
	}
	//编辑管理员
		@RequestMapping("selfEditAdmin")
		public ModelAndView seleEditAdmin(Admin ad,HttpSession httpSession){
			Admin admin=(Admin) httpSession.getAttribute("admin");
			System.out.println("===seleEditAdmin"+admin);
			httpSession.setAttribute("admin", admin);
			ModelAndView mav = new ModelAndView("admin/editAdmin");
			mav.addObject("Eadmin", admin);
			return mav;
		}
}

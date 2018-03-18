package com.Lwoo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	      PageHelper.startPage(page, 5);
	      List<Admin> admins = adminService.list();
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
	public ModelAndView editAdmin(Admin ad){
		Admin admin= adminService.get(ad.getId());
		System.out.println("editAdmin------\n"+admin);
		ModelAndView mav = new ModelAndView("admin/editAdmin");
		mav.addObject("admin", admin);
		return mav;
	}
	@RequestMapping("updateAdmin")
	public ModelAndView updateAdmin(Admin admin){
		System.out.println("updateAdmin----\n"+admin);
		adminService.update(admin);
		ModelAndView mav = new ModelAndView("redirect:/listAdmin");
		return mav;
	}
}

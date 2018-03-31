package com.Lwoo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Category;
import com.Lwoo.service.AdminService;
import com.Lwoo.service.CategoryService;
@Controller
@RequestMapping("")
public class FindController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	AdminService adminService;
	//查找社团类型名
	@RequestMapping("findCatagoryData")
	public ModelAndView findCatagoryData(String findData){
		System.out.println("======"+findData);
		List<Category> categorys=new ArrayList<Category>();
		if(isInteger(findData)){
			Integer id=Integer.parseInt(findData);
			System.out.println(id);
			Category category=categoryService.get(id);
			if(category!=null){
				categorys.add(category);
			}
		}
		if(categorys.isEmpty()){
			System.out.println("======"+2222);
			categorys=categoryService.search(findData);
		}
		System.out.println(categorys);
		ModelAndView mav = new ModelAndView("admin/listCategory");
		mav.addObject("categorys",categorys);
		return mav;
	}
	@RequestMapping("findAdminData")
	public ModelAndView findAdminData(String findData){
		System.out.println("======"+findData);
		List<Admin> admins=new ArrayList<Admin>();
		if(isInteger(findData)){//根据ID查找
			Integer id=Integer.parseInt(findData);
			System.out.println(id);
			Admin admin=adminService.get(id);
			if(admin!=null){
				admins.add(admin);
			}
		}
		if(admins.isEmpty()){//如果Id找不到则根据名称找
			System.out.println("======"+2222);
			admins=adminService.search(findData);
		}
		System.out.println(admins);
		ModelAndView mav = new ModelAndView("admin/listAdminJsp");
		mav.addObject("admins",admins);
		return mav;
	}
	//判断字符串是否为数字
	public static boolean isInteger(String str) {  
	        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
	        return pattern.matcher(str).matches();  
	 }
}

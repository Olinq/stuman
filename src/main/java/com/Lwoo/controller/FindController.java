package com.Lwoo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Asso;
import com.Lwoo.pojo.Category;
import com.Lwoo.pojo.User;
import com.Lwoo.service.AdminService;
import com.Lwoo.service.AssoService;
import com.Lwoo.service.CategoryService;
import com.Lwoo.service.UserService;
@Controller
@RequestMapping("")
public class FindController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	AdminService adminService;
	@Autowired
	UserService userService;
	@Autowired
	AssoService assoService;
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
	//查找用户
	@RequestMapping("findUserData")
	public ModelAndView findUserData(String findData){
		System.out.println("======"+findData);
		List<User> users=new ArrayList<User>();
		if(isInteger(findData)){//根据ID查找
			Integer id=Integer.parseInt(findData);
			System.out.println(id);
			User user=userService.get(id);
			if(user!=null){
				users.add(user);
			}
		}
		if(users.isEmpty()){//如果Id找不到则根据名称找
			System.out.println("======"+2222);
			users=userService.search(findData);
		}
		System.out.println(users);
		ModelAndView mav = new ModelAndView("admin/listUser");
		mav.addObject("users",users);
		return mav;
	}
	//查找社团
	@RequestMapping("findAssoData")
	public ModelAndView findAssoData(String findData){
		System.out.println("======"+findData);
		List<Asso> assos=new ArrayList<Asso>();
		if(isInteger(findData)){//根据ID查找
			Integer id=Integer.parseInt(findData);
			System.out.println(id);
			Asso asso=assoService.get(id);
			if(asso!=null){
				assos.add(asso);
			}
		}
		if(assos.isEmpty()){//如果Id找不到则根据名称找
			System.out.println("======"+2222);
			assos=assoService.search(findData);
		}
		System.out.println(assos);
		ModelAndView mav = new ModelAndView("admin/listAsso");
		mav.addObject("assos",assos);
		return mav;
	}
	//判断字符串是否为数字
	public static boolean isInteger(String str) {  
	        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
	        return pattern.matcher(str).matches();  
	 }
}

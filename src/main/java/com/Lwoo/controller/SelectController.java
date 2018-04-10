package com.Lwoo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Asso;
import com.Lwoo.pojo.Category;
import com.Lwoo.service.AdminService;
import com.Lwoo.service.AssoService;
import com.Lwoo.service.CategoryService;
@Controller
@RequestMapping("")
public class SelectController {

	@Autowired
	AssoService assoService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="getAssoList",method = RequestMethod.POST)
	@ResponseBody
	public List<Asso> getAssoList(@RequestBody Map<String, String> mapj){
		System.out.println("---"+mapj.get("str"));
		List<Asso> assos=assoService.list();
		return assos;
	}
	
	@RequestMapping(value="getCatagoryList",method = RequestMethod.POST)
	@ResponseBody
	public List<Category> getCatagoryList(@RequestBody Map<String, String> mapj){
		System.out.println("-----getCatagoryList");
		List<Category> categorys=categoryService.getCatagoryList();
		System.out.println(categorys);
		return categorys;
	}
	@RequestMapping(value="getAdminList",method = RequestMethod.POST)
	@ResponseBody
	public List<Admin> getAdminList(@RequestBody Map<String, String> mapj){
		System.out.println("-----getAdminList");
		List<Admin> admins=adminService.list();
	
		return admins;
	}
}

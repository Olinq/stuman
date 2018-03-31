package com.Lwoo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Category;
import com.Lwoo.service.AdminService;
import com.Lwoo.service.CategoryService;
import com.Lwoo.service.UserService;

@Controller
@RequestMapping("")
public class CheckNameController {
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	AdminService adminService;
	//检查数据库是否存在同名
	@RequestMapping(value="checkAdminUsername",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkUsername(@RequestBody Map<String, String> map){
		String validData=map.get("username");
		System.out.println("checkUsername----"+validData);
		Admin admin=adminService.findByUsername(validData);
		String result="true";
		if(admin!=null){
			result="false";
		}
		Map<String,String> rel=new HashMap<String,String>();
		rel.put("result", result);
		System.out.println(rel);
		return rel;
	}
	@RequestMapping(value="checkAdminemail",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkAdminemail(@RequestBody Map<String, String> map){
		String validData=map.get("email");
		System.out.println("checkEmail----"+validData);
		Admin admin=adminService.findByEmail(validData);
		String result="true";
		if(admin!=null){
			result="false";
		}
		Map<String,String> rel=new HashMap<String,String>();
		rel.put("result", result);
		System.out.println(rel);
		return rel;
	}
	//检查类型名是否重复
	@RequestMapping(value="checkCategory",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkCategory(@RequestBody Map<String, String> map){
		String validData=map.get("category");
		System.out.println("checkCategory----"+validData);
		Category category=categoryService.findByUsername(validData);
		String result="true";
		if(category!=null){
			result="false";
		}
		Map<String,String> rel=new HashMap<String,String>();
		rel.put("result", result);
		System.out.println(rel);
		return rel;
	}
	
	
}

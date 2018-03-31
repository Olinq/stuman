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
import com.Lwoo.service.AdminService;

@Controller
@RequestMapping("")
public class LoginController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="checkAdminLogin",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkCategory(@RequestBody Map<String, String> map){
		String username=map.get("username");
		String password=map.get("password");
		System.out.println("checkAdminLogin----"+username+":"+password);
		 Admin admin=adminService.checkLogin(username, password);
		 Map<String, String> rel=new HashMap<String,String>();
		String result="true";
		if(admin==null){
			result="false";
		}
		rel.put("result", result);
		System.out.println(rel);
		return rel;
	}
}

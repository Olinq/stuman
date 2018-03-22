package com.Lwoo.controller;

import java.util.HashMap;
import java.util.List;
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
public class SelectController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="getAssoList",method = RequestMethod.POST)
	@ResponseBody
	public List<Admin> getAssoList(@RequestBody Map<String, String> mapj){
		System.out.println("---"+mapj.get("str"));
		List<Admin> admins=adminService.list();
	
		return admins;
	}
}

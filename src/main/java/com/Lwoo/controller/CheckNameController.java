package com.Lwoo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Lwoo.pojo.Category;
import com.Lwoo.pojo.User;
import com.Lwoo.service.CategoryService;
import com.Lwoo.service.UserService;

@Controller
@RequestMapping("")
public class CheckNameController {
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value="checkUsername",method = RequestMethod.POST)
	@ResponseBody
	public String checkUsername(String username){
		Map<String,String> map=new HashMap<String,String>();
		System.out.println("checkUsername----"+username);
		User user=userService.findByUsername(username);
		String result="true";
		if(user!=null){
			result="false";
		}
		return result;
	}
	@RequestMapping(value="checkCategory",method = RequestMethod.POST)
	@ResponseBody
	public String checkCategory(@RequestBody Map<String, String> map){
		String validData=map.get("validData");
		System.out.println("checkUsername----"+validData);
		Category category=categoryService.findByUsername(validData);
		String result="true";
		if(category!=null){
			result="false";
		}
		return result;
	}
	
	
}

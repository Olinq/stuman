package com.Lwoo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Lwoo.pojo.User;
import com.Lwoo.service.UserService;

@Controller
@RequestMapping("")
public class CheckNameController {
	@Autowired
	UserService userService;
	@RequestMapping(value="checkUsername",method = RequestMethod.POST)
	@ResponseBody
	public String checkUserame(String username){
		Map<String,String> map=new HashMap<String,String>();
		System.out.println("checkUsername----"+username);
		User user=userService.findByUsername(username);
		String result="true";
		if(user!=null){
			result="false";
		}
		return result;
	}
}

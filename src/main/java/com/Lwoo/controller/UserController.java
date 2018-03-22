package com.Lwoo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Asso;
import com.Lwoo.pojo.User;
import com.Lwoo.service.AssoService;
import com.Lwoo.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping("listUser")
	  public String UserList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
		  PageHelper.startPage(page, 10);
		  List<User>users = userService.list();
		System.out.println("----userController\n" +users);
	      PageInfo<User> pageInfo=new PageInfo<User>(users);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("users",users);
	      return "admin/listUser";
	  }
	//
	@RequestMapping("addPage")
	public String addPage(){
	    return "admin/addUser";
	}
	//增加社团类型
	@RequestMapping("addUser")
	public ModelAndView addUser(User user){
		System.out.println("=---addUser"+user);
		userService.add(user);
		ModelAndView mav = new ModelAndView("redirect:/listUser");
	    return mav;
	}	
	 //删除管理员
		@RequestMapping("deleteUserById")
		public ModelAndView deleteAdmin(User user){
			userService.delete(user);
			ModelAndView mav = new ModelAndView("redirect:/listUser");
			return mav;
		}
		//编辑管理员
		@RequestMapping("editUser")
		public ModelAndView editAdmin(User user1){
			User user= userService.get(user1.getId());
			System.out.println("editUser------\n"+user);
			ModelAndView mav = new ModelAndView("admin/editUser");
			mav.addObject("user", user);
			return mav;
		}
		@RequestMapping("updateUser")
		public ModelAndView updateAdmin(User user){
			System.out.println("updateUser----\n"+user);
			userService.update(user);
			ModelAndView mav = new ModelAndView("redirect:/listUser");
			return mav;
		}
	
}

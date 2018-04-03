package com.Lwoo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Category;
import com.Lwoo.service.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("listCategory")
	  public String categorysList(@RequestParam(required=true,defaultValue="1") Integer page,Model model,HttpSession httpSession){
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
//		   for (Category c : categorys) {
//	            System.out.println(c);
//	            List<Asso> ps = c.getAssos();
//	            for (Asso p : ps) {
//	                System.out.println("\t"+p);
//	            }
//	        }
		Admin admin=(Admin) httpSession.getAttribute("admin");
		httpSession.setAttribute("admin", admin);//将用户登录信息存到session中
		 PageHelper.startPage(page, 5);
	      List<Category> categorys = categoryService.list();
	      System.out.println("----categorysController\n"+categorys);
	      PageInfo<Category> pageInfo=new PageInfo<Category>(categorys);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("categorys",categorys);
	      return "admin/listCategory"; 
	  }
	//增加社团类型
	@RequestMapping("addCategory")
	public ModelAndView addCategory(Category category,HttpSession httpSession){
		Admin admin=(Admin) httpSession.getAttribute("admin");
		httpSession.setAttribute("admin", admin);//将用户登录信息存到session中
		System.out.println("=---addCategory"+category);
		categoryService.add(category);
		ModelAndView mav = new ModelAndView("redirect:/listCategory");
	    return mav;
	}	
	 //删除社团类型
		@RequestMapping("deleteCategoryById")
		public ModelAndView deleteAdmin(Category category){
			categoryService.delete(category);
			ModelAndView mav = new ModelAndView("redirect:/listCategory");
			return mav;
		}
		//编辑社团类型
		@RequestMapping("editCategory")
		public ModelAndView editAdmin(Category category1,HttpSession httpSession){
			Category category= categoryService.get(category1.getId());
			System.out.println("editCategory------\n"+category);
			ModelAndView mav = new ModelAndView("admin/editCategory");
			mav.addObject("category", category);
			return mav;
		}
		@RequestMapping("updateCategory")
		public ModelAndView updateAdmin(Category category,HttpSession httpSession){
			Admin admin=(Admin) httpSession.getAttribute("admin");
			httpSession.setAttribute("admin", admin);//将用户登录信息存到session中
			System.out.println("updateCategory----\n"+category);
			categoryService.update(category);
			ModelAndView mav = new ModelAndView("redirect:/listCategory");
			return mav;
		}
}

package com.Lwoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Asso;
import com.Lwoo.pojo.Category;
import com.Lwoo.pojo.News;
import com.Lwoo.pojo.User;
import com.Lwoo.service.AssoService;
import com.Lwoo.service.CategoryService;
import com.Lwoo.service.NewsService;
import com.Lwoo.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class StartController {
	@Autowired
	AssoService assoService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	NewsService newsService;
	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	public ModelAndView startUp(){
		System.out.println("----startUp---");
		ModelAndView mav=new ModelAndView("index");
		List<Category> categorys=categoryService.list();
		mav.addObject("categorys", categorys);
		System.out.println(categorys);
		return mav;
	}
	@RequestMapping("team")
	public ModelAndView team(Integer cid){
		System.out.println("----team---");
		ModelAndView mav=new ModelAndView("team");
		List<Category> categorys=categoryService.list();
		if(null==cid){
			cid=categorys.get(0).getId();
		}
		String type=categoryService.get(cid).getCategory();
		List<Asso> assos=assoService.getListByCid(cid);
		mav.addObject("type",type);
		mav.addObject("categorys", categorys);
		mav.addObject("assos", assos);
		System.out.println(assos);
		return mav;
	}
	@RequestMapping("/team/all")
	public ModelAndView teamAll(){
		System.out.println("----team---");
		ModelAndView mav=new ModelAndView("team");
		List<Category> categorys=categoryService.list();
		String type="全部社团";
		List<Asso> assos=assoService.list();
		mav.addObject("type",type);
		mav.addObject("categorys", categorys);
		mav.addObject("assos", assos);
		System.out.println(assos);
		return mav;
	}
	@RequestMapping("about")
	public ModelAndView about(int id){
		System.out.println("----about---");
		ModelAndView mav=new ModelAndView("about");
		Asso asso=assoService.get(id);
		mav.addObject("asso", asso);
		System.out.println(asso);
		return mav;
	}
	@RequestMapping("active")
	public ModelAndView active(@RequestParam(required=true,defaultValue="10") Integer total){
		System.out.println("----active---");
		ModelAndView mav=new ModelAndView("active");
		PageHelper.startPage(1, total);//进入主页显示10条消息
		List<News> news=newsService.list();
		PageInfo<News> pageInfo=new PageInfo<News>(news);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("news", news);
		System.out.println(news);
		return mav;
	}
	
	@RequestMapping("/active/content")
	public ModelAndView content(int id){
		System.out.println("----/active/content---");
		ModelAndView mav=new ModelAndView("content");
		News news=newsService.get(id);
		mav.addObject("news", news);
		System.out.println(news);
		return mav;
	}
	@RequestMapping("/team/findData")
	public ModelAndView findData(String findData){
		System.out.println("----/team/findData---");
		ModelAndView mav=new ModelAndView("team");
		List<Category> categorys=categoryService.list();
		List<Asso> assos=assoService.search(findData);
		mav.addObject("categorys", categorys);
		mav.addObject("assos", assos);
		System.out.println(assos);
		return mav;
	}
	@RequestMapping("/active/findData")
	public ModelAndView activefindData(String findData){
		System.out.println("----/active/findData---");
		ModelAndView mav=new ModelAndView("active");
		List<News> news=newsService.search(findData);
		mav.addObject("news", news);
		System.out.println(news);
		return mav;
	}
	@RequestMapping("/user/AssertUserform")
	public ModelAndView AssertUserform(User user){
		System.out.println("----/active/findData---");
		System.out.println("=---addUser"+user);
		userService.add(user);
		User user1=userService.findByUsername(user.getUsername());
		ModelAndView mav = new ModelAndView("successRegister");
		mav.addObject(user1);
	    return mav;
	}
}

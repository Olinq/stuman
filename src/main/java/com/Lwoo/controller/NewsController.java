package com.Lwoo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.News;
import com.Lwoo.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class NewsController {
   @Autowired
   NewsService newsService;

	@RequestMapping("listNews")
	  public String newsList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
	      PageHelper.startPage(page, 8);
	      List<News> newss = newsService.list();
	      System.out.println("----newssController\n"+newss);
	      PageInfo<News> pageInfo=new PageInfo<News>(newss);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("newss",newss);
	      return "admin/listNews";
	}
	 //删除社团
	@RequestMapping("deleteNewsById")
	public ModelAndView deleteAsso(News news){
		newsService.delete(news);
		ModelAndView mav = new ModelAndView("redirect:/listNews");
		return mav;
	}
	@RequestMapping("editNews")
	public ModelAndView editNews(News ad){
		News news= newsService.get(ad.getId());
		System.out.println("editNews------\n"+news);
		ModelAndView mav = new ModelAndView("admin/editNews");
		mav.addObject("news", news);
		return mav;
	}
	@RequestMapping("updateNews")
	public ModelAndView updateNews(News news){
		System.out.println("updateNews----"+news);
		newsService.update(news);
		ModelAndView mav = new ModelAndView("redirect:/listNews");
		return mav;
	}
	
	//跳转添加页面
		@RequestMapping("addNewsPage")
		public String addPage(){
		    return "admin/addNews";
		}
		//增加社团类型
		@RequestMapping("addNews")
		public ModelAndView addUser(News news){
			System.out.println("=---addUser"+news);
			news.setTime(new Date());
			newsService.add(news);
			ModelAndView mav = new ModelAndView("redirect:/listNews");
		    return mav;
		}	
   
}

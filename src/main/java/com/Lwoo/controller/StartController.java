package com.Lwoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Asso;
import com.Lwoo.service.AssoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class StartController {
	@Autowired
	AssoService assoService;
	
	@RequestMapping("/")
	public ModelAndView startUp(@RequestParam(required=true,defaultValue="12") Integer total){
		System.out.println("----startUp---");
		PageHelper.startPage(1, total);//进入主页显示12个社团
		ModelAndView mav=new ModelAndView("index");
		List<Asso> assos=assoService.list();
		PageInfo<Asso> pageInfo=new PageInfo<Asso>(assos);
		mav.addObject("pageInfo",pageInfo);
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
}

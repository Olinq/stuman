package com.Lwoo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Asso;
import com.Lwoo.service.AssoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class AssoController {
	@Autowired
	AssoService assoService;
	
	@RequestMapping("listAsso")
	  public String assoList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		System.out.println("Method---assoList");
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
	      PageHelper.startPage(page, 10);
	      List<Asso> assos = assoService.list();
	      System.out.println("----assosController\n"+assos);
	      PageInfo<Asso> pageInfo=new PageInfo<Asso>(assos);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("assos",assos);
	      return "admin/listAsso";
	  }
	//增加社团
	@RequestMapping("addAsso")
	public ModelAndView addAsso(Asso asso){
		assoService.add(asso);
		ModelAndView mav = new ModelAndView("redirect:/listAsso");
	    return mav;
	}	
	 //删除社团
	@RequestMapping("deleteAssoById")
	public ModelAndView deleteAsso(Asso asso){
		assoService.delete(asso);
		ModelAndView mav = new ModelAndView("redirect:/listAsso");
		return mav;
	}
	//编辑社团
	@RequestMapping("editAsso")
	public ModelAndView editAsso(Asso ad){
		Asso asso= assoService.get(ad.getId());
		System.out.println("editAsso------\n"+asso);
		ModelAndView mav = new ModelAndView("admin/editAsso");
		mav.addObject("asso", asso);
		return mav;
	}
	@RequestMapping("updateAsso")
	public ModelAndView updateAsso(Asso asso){
		System.out.println("updateAsso----\n"+asso);
		assoService.update(asso);
		ModelAndView mav = new ModelAndView("redirect:/listAsso");
		return mav;
	}
	
	@RequestMapping("getListByCid")
	  public String getListByCid(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model,int id){
		System.out.println("Method---assoList");
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
	      PageHelper.startPage(page, 10);
	      List<Asso> assos = assoService.getListByCid(id);
	      System.out.println("----assosController\n"+assos);
	      PageInfo<Asso> pageInfo=new PageInfo<Asso>(assos);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("assos",assos);
	      return "admin/listAsso";
	  }
}

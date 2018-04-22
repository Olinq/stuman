package com.Lwoo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.Asso;
import com.Lwoo.pojo.Category;
import com.Lwoo.service.AssoService;
import com.Lwoo.service.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class AssoController {
	@Autowired
	AssoService assoService;
	@Autowired
	CategoryService categoryService;
	@RequestMapping("listAsso")
	  public String assoList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		System.out.println("Method---assoList");
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
	      PageHelper.startPage(page, 8);
	      List<Asso> assos = assoService.list();
	      System.out.println("----assosController\n"+assos);
	      PageInfo<Asso> pageInfo=new PageInfo<Asso>(assos);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("assos",assos);
	      model.addAttribute("category","全部类型社团");
	      return "admin/listAsso";
	  }
	//跳转添加页面
		@RequestMapping("addAssoPage")
		public String addPage(){
		    return "admin/addAsso";
		}
	//增加社团
	@RequestMapping("addAsso")
	public ModelAndView addAsso(MultipartFile file,Asso asso,HttpServletRequest request){
		System.out.println(asso);
		  //图片上传成功后，将图片的地址写到数据库
		String pojoPath =request.getServletContext().getRealPath("/img/logo");//保存图片的路径
        System.out.println(pojoPath);
        //获取原始图片的拓展名
        String originalFilename = file.getOriginalFilename();
        //新的文件名字
        String newFileName = UUID.randomUUID()+originalFilename;
        System.out.println(newFileName);
        File targetFile = new File(pojoPath,newFileName); 
        	//把本地文件上传到封装上传文件位置的全路径
           try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        asso.setLogo(newFileName);
		System.out.println(asso);
        assoService.add(asso);
		ModelAndView mav = new ModelAndView("redirect:/listAsso");
	    return mav;
	}
	
	 //删除社团
	@RequestMapping("deleteAssoById")
	public ModelAndView deleteAsso(Asso asso,HttpSession httpSession){
		assoService.delete(asso);
		ModelAndView mav = new ModelAndView("redirect:/listAsso");
		return mav;
	}
	//编辑社团
	@RequestMapping("editAsso")
	public ModelAndView editAsso(Asso ad,HttpSession httpSession){
		Asso asso= assoService.get(ad.getId());
		System.out.println("editAsso------\n"+asso);
		Admin admin=(Admin)httpSession.getAttribute("admin");
		
		if(1!=admin.getLock()){//普通管理员页面
			ModelAndView mav = new ModelAndView("usualAdmin/editSomeAsso");
			mav.addObject("asso", asso);
			return mav;
		}
		ModelAndView mav = new ModelAndView("admin/editAsso");
		mav.addObject("asso", asso);
		return mav;
	}
	@RequestMapping("updateAsso")
	public ModelAndView updateAsso(Asso asso,MultipartFile file,HttpServletRequest request,HttpSession httpSession){
		Admin admin=(Admin)httpSession.getAttribute("admin");
		String pojoPath =request.getServletContext().getRealPath("/img/logo");//保存图片的路径
		if(""!=file.getOriginalFilename()){
			System.out.println("===更改图片---------");
			  //图片上传成功后，将图片的地址写到数据库
	        System.out.println(pojoPath);
	        //删除原有图片
	        File f=new File(pojoPath+ "\\" +asso.getLogo());
	        if(f.exists()){//检查File是否存在
	        	f.delete();//删除File文件
	        	System.out.println("+++++++++删除");
	        }
	        //获取原始图片的拓展名
	        String originalFilename = file.getOriginalFilename();
	        //新的文件名字
	        String newFileName = UUID.randomUUID()+originalFilename;
	        System.out.println(newFileName);
	        File targetFile = new File(pojoPath,newFileName); 
	        	//把本地文件上传到封装上传文件位置的全路径
	           try {
				file.transferTo(targetFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        asso.setLogo(newFileName);
		}
		System.out.println("updateAsso----\n"+asso);
		assoService.update(asso);
		
		if(1!=admin.getLock()){//如果不是超级管路 则跳转社团管理员
			ModelAndView mav = new ModelAndView("redirect:/listSomeAsso");
			return mav;
		}
		ModelAndView mav = new ModelAndView("redirect:/listAsso");
		return mav;
	}
	
	@RequestMapping("getListByCid")
	  public String getListByCid(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model,int id){
		System.out.println("Method---assoList");
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
			Category category=categoryService.get(id);
	      PageHelper.startPage(page, 10);
	      List<Asso> assos = assoService.getListByCid(id);
	      System.out.println("----assosController\n"+assos);
	      PageInfo<Asso> pageInfo=new PageInfo<Asso>(assos);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("assos",assos);
	      model.addAttribute("category",category.getCategory());
	      return "admin/listAsso";
	  }
}

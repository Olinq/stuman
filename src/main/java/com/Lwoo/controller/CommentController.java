package com.Lwoo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Lwoo.pojo.Comment;
import com.Lwoo.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class CommentController {
	@Autowired
	CommentService commentService;
	@RequestMapping("listComment")
	  public String commentList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model){
		System.out.println("Method---commentList");
	      //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
	      PageHelper.startPage(page, 8);
	      List<Comment> comments = commentService.list();
	      System.out.println("----commentsController\n"+comments);
	      PageInfo<Comment> pageInfo=new PageInfo<Comment>(comments);
	      model.addAttribute("pageInfo",pageInfo);
	      model.addAttribute("comments",comments);
	      return "admin/listComment";
	  }
}

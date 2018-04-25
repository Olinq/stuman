package com.Lwoo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Comment;
import com.Lwoo.pojo.Replay;
import com.Lwoo.service.CommentService;
import com.Lwoo.service.ReplayService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class CommentController {
	@Autowired
	CommentService commentService;
	@Autowired
	ReplayService replayService;
	  @RequestMapping("listComment")
	  public String commentList(HttpServletRequest request,Model model){
		  //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
		  List<Comment> comments = commentService.list();
		  model.addAttribute("comments",comments);
		  return "admin/listComment";
	  }
		 //删除留言板
		@RequestMapping("deleteCommentById")
		public ModelAndView deleteComment(Comment	comment,HttpSession httpSession){
			commentService.delete(comment);
			ModelAndView mav = new ModelAndView("redirect:/listComment");
			return mav;
		}
		//显示留言板下回复
		  @RequestMapping("listReplay")
		  public String listReplay(@RequestParam(required=true,defaultValue="1") Integer page,int id,Model model){
			  //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。
			  Comment comment = commentService.get(id);
			  System.out.println("----commentsController\n"+comment);
			  model.addAttribute("comment",comment);
			  return "admin/listReplay";
		  }
		  //删除留言
			@RequestMapping("deleteReplayById")
			public String deleteReplayById(int id,int cid,HttpSession httpSession,Model model){
				Replay r=new Replay();
				r.setId(id);
				System.out.println("---deleteId----"+id);
				replayService.delete(r);
				Comment comment = commentService.get(cid);
				 model.addAttribute("comment",comment);
				  return "admin/listReplay";
			}
			 //留言页
			@RequestMapping("addReplayPage")
			public String addReplayPage(int id,HttpSession httpSession,Model model){
				System.out.println("---addReplayPage----"+id);
				Comment comment = commentService.get(id);
				 model.addAttribute("comment",comment);
				  return "admin/addReplay";
			}
			 //添加留言
			@RequestMapping("addReplay")
			public String addReplay(Replay Replay,HttpSession httpSession,Model model){
				System.out.println("---addReplay----"+Replay);
				replayService.add(Replay);
				Comment comment=commentService.get(Replay.getCommId());
				System.out.println(comment);
				 model.addAttribute("comment",comment);
				  return "admin/listReplay";
			}
			 //评论
			@RequestMapping("review")
			public String review(int id,HttpSession httpSession,Model model){
				System.out.println("---review----"+id);
				Comment comment = commentService.get(id);
				 model.addAttribute("comment",comment);
				  return "review";
			}
}

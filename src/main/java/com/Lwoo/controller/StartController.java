package com.Lwoo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.pojo.Asso;
import com.Lwoo.pojo.Category;
import com.Lwoo.pojo.Comment;
import com.Lwoo.pojo.News;
import com.Lwoo.pojo.Replay;
import com.Lwoo.pojo.User;
import com.Lwoo.service.AssoService;
import com.Lwoo.service.CategoryService;
import com.Lwoo.service.CommentService;
import com.Lwoo.service.NewsService;
import com.Lwoo.service.ReplayService;
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
	@Autowired
	CommentService commentService;
	@Autowired
	ReplayService replayService;
	@RequestMapping("/")
	public ModelAndView startUp(){
		System.out.println("----startUp---");
		ModelAndView mav=new ModelAndView("index");
		List<Category> categorys=categoryService.list();
		List<Asso> assos=assoService.list();
		List<News> newss=newsService.listNewer(8,0);
		List<News> annous=newsService.listNewer(8,1);
		List<News> school=newsService.listNewer(5, 2);
		System.out.println(annous);
		mav.addObject("categorys", categorys);
		mav.addObject("assos", assos);
		mav.addObject("newss", newss);
		mav.addObject("annous", annous);
		mav.addObject("schools", school);
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
		List<News> news=newsService.list(0);
		PageInfo<News> pageInfo=new PageInfo<News>(news);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("news", news);
		mav.addObject("isannou", 0);
		System.out.println(news);
		return mav;
	}
	
	@RequestMapping("active/school")
	public ModelAndView activeschool(@RequestParam(required=true,defaultValue="10") Integer total){
		System.out.println("----active---");
		ModelAndView mav=new ModelAndView("active");
		PageHelper.startPage(1, total);//进入主页显示10条消息
		List<News> news=newsService.list(2);
		PageInfo<News> pageInfo=new PageInfo<News>(news);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("news", news);
		mav.addObject("isannou", 2);
		System.out.println(news);
		return mav;
	}
	//公告
	@RequestMapping("active/isannou")
	public ModelAndView activeisannou(@RequestParam(required=true,defaultValue="10") Integer total){
		System.out.println("----active---");
		ModelAndView mav=new ModelAndView("active");
		PageHelper.startPage(1, total);//进入主页显示10条消息
		List<News> news=newsService.list(1);
		PageInfo<News> pageInfo=new PageInfo<News>(news);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("news", news);
		mav.addObject("isannou", 1);
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
	public ModelAndView activefindData(String findData,int isannou){
		System.out.println("----/active/findData---"+isannou);
		ModelAndView mav=new ModelAndView("active");
		List<News> news=newsService.searchType(findData,isannou);
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
	
	
	@RequestMapping("user/comment")
	public ModelAndView comment(){
		System.out.println("----comment---");
		List<Comment> comments=commentService.list();
		ModelAndView mav=new ModelAndView("comments");
		List<Comment> lists=null;
		if(comments.size()>=8){
		//显示前面八条数据
			lists=comments.subList(0, 8);
		}else{
			lists=comments;
		}
		mav.addObject("lists", lists);
		return mav;
	}
	@RequestMapping("user/comment/all")
	public ModelAndView commentAll(){
		System.out.println("----comment---");
		ModelAndView mav=new ModelAndView("comments");
		List<Comment> lists=commentService.list();
		System.out.println(lists);
		mav.addObject("lists", lists);
		return mav;
	}
	@RequestMapping("user/comment/add")
	public String commentAdd(Comment comment,Model model){
		System.out.println("----comment---");
		commentService.add(comment);
		List<Comment> lists=commentService.list();
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "comments";
	}
	//用户回复
	@ResponseBody
    @RequestMapping(value="user/replay/add", method = RequestMethod.POST)
     public Map<String,String> replayadd(@RequestBody Map<String,String> replay,HttpSession httpSession){
		System.out.println("user/replay/add");
		Replay repla=new Replay();
		System.out.println(replay.get("replay"));
		repla.setCommId(Integer.parseInt(replay.get("commId")));
		repla.setUid(Integer.parseInt(replay.get("uid")));
		repla.setReplay(replay.get("replay"));
		System.out.println(repla);
		String result="true";
		if(replayService.add(repla)!=1){
			 result="false";
		}
		System.out.println(result);
		Map<String,String> rel=new HashMap<String,String>();
		rel.put("result", result);
		return rel;
    }
	@RequestMapping("changeMsg")
	public ModelAndView changeMsg(User user){
		System.out.println("----startUp-user--"+user);
		ModelAndView mav=new ModelAndView("index");
		userService.update(user);
		List<Category> categorys=categoryService.list();
		List<Asso> assos=assoService.list();
		List<News> newss=newsService.listNewer(8,0);
		List<News> annous=newsService.listNewer(8,1);
		List<News> school=newsService.listNewer(5, 2);
		System.out.println(annous);
		mav.addObject("categorys", categorys);
		mav.addObject("assos", assos);
		mav.addObject("newss", newss);
		mav.addObject("annous", annous);
		mav.addObject("schools", school);
		System.out.println(categorys);
		return mav;
	}
	@RequestMapping("usercommentDel")
	public ModelAndView usercommentDel(Comment comment){
		System.out.println("----comment---");
		commentService.delete(comment);
		List<Comment> comments=commentService.list();
		ModelAndView mav=new ModelAndView("comments");
		List<Comment> lists=null;
		if(comments.size()>=8){
		//显示前面八条数据
			lists=comments.subList(0, 8);
		}else{
			lists=comments;
		}
		mav.addObject("lists", lists);
		return mav;
	}
	
}

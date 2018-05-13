<%@ page language="java" import="com.Lwoo.pojo.User" contentType="text/html; charset=UTf-8"
    pageEncoding="UTf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <script src="${ctx}/webjars/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
	setBackground();
	 var user = '<%= session.getAttribute("user")%>';
     console.log("user:::" + user);
     if(user!='null'){
    	 $("#login").css("display","none");
    	 $("#reg").css("display","none");
  		 $("#user1").css("display","");
  		 $("#user2").css("display","");
  		 
     }else{
    	 $("#user1").css("display","none");
    	 $("#user2").css("display","none");
  		 $("#login").css("display","");
  		 $("#reg").css("display","");
     }
     $("#username").val("");
     $("#password").val("");
     $("#email").val("");
     $("#assoId").val("");
     $("#sex").val("");
});
var t = 0;
function setBackground(){
    switch (t%4){
        case 0 : {
            $("#head").css("background","url(${ctx}/assets/images/bg1.jpg) top center");
            break;
        }
        case 1 : {
            $("#head").css("background","url(${ctx}/assets/images/bg2.jpg) top center");
            break;
        }
        case 2 :{
            $("#head").css("background","url(${ctx}/assets/images/bg3.jpg) top center");
            break;
        }
    }
    t = setTimeout(function(){
        setBackground();
    },5000);
}

function checkUser(){
		if(""==$("#username").val()){
			$("#nameLog").html("用户名不为空");
			if(""==$("#password").val()){
				$("#pwdLog").html("密码不为空");
			}
			return;
		}
        $.ajax({
         	url : "${ctx }/user/userLoginIn",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({username: $("#username").val(),password:$("#password").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
      		 	if("true"==jsonArry.result+""&&"1"!=jsonArry.statu+""){
        			mizhu.alert('提示信息', '尚未通过审核，请耐心等待');
        		}else if("true"==jsonArry.result+""&&"1"==jsonArry.statu+""){
	         		$("#login").css("display","none");
	         		$("#user").css("display","");
	         		console.log("登录成功");
	         		window.location.reload();//刷新当前页面.
	         		$("#username").val("");
	         		$("#password").val("");
        		}else{
        			mizhu.alert('提示信息', '未注册或者账户名密码错误');
        		}
        }
        });
}

function checkLogout(){
    $.ajax({
     	url : "${ctx }/user/logoutUser",
     	type : "post",
     	contentType: 'application/json;charset=UTF-8', 
     	dataType : "json",
    	success : function(msg) {
    		var jsonArry=eval(msg); //将json类型字符串转换为json对象
  		 	console.log(jsonArry);
       		console.log("注销成功");
       		$("#user1").css("display","none");
       		$("#user2").css("display","none");
       		 $("#login").css("display","");
       		$("#reg").css("display","");
    }
    });
} $(document).ready(function(){
            var nav=$(".nav_top"); //得到导航对象
             var win=$(window); //得到窗口对象
             var sc=$(document);//得到document文档对象。
          	var navHeight = nav.offset().top; //这是导航相对于文档的高度            
             win.scroll(function(){                            
              if(sc.scrollTop() >= navHeight){      //   当滚动条据上边的高度高于这个导航相对于文档的高度。就要让他固定啦                              
                    nav.addClass("nav_fix_pos");
             }else{
                   nav.removeClass("nav_fix_pos");                    
             };
             });
        });
</script>
<header id="header">
	<div id="head" class="parallax" parallax-speed="1">
		<h2 style="text-align:center;margin-top:10px">
			<img src="${ctx }/assets/images/stuman.png"  style="margin-top:-120px;margin-bottom:-180px;"/>
		</h2>
	</div>

	<nav class="navbar navbar-default navbar-sticky nav_top">
		<div class="container-fluid">
			<div class="navbar-collapse collapse">
				
				<ul class="nav navbar-nav navbar-center" style="width:100%">
					<li  style="width:100px"></li>
					<li ><a href="/stuman/">首页</a></li>
					<li ><a href="/stuman/team">缤纷社团</a></li>
					<li class="dropdown">
						<a href="#"  class="dropdown-toggle" data-toggle="dropdown">活动预告<b class="caret"></a></b>
						<ul class="dropdown-menu">
							<li><a href="${ctx }/active">社团新闻</a></li>
							<li><a href="${ ctx}/active/school">学校新闻</a></li>
							<li><a href="${ctx }/active/isannou">通知</a></li>
						</ul>
					</li>
					<li><a href="${ctx }/about?id=1">关于我们</a></li>
					<li ><a href="${ctx }/user/comment">留言板</a></li>
					<li style="float:right" id="reg"><a href="${ctx }/userAdd.jsp"  data-target='#modalRegister'>注册</a></li>
					<li class="dropdown" style="float:right" id="login">
				   	   <a href="#" class="dropdown-toggle" data-toggle="dropdown">
							登录<span class="caret"></span>
						</a>
						<div class="dropdown-menu"  style="width:300px;margin-left: -200px;" id="formLogin">
							
								<div class="container-fluid">
									<form action="${ctx }/user/userLoginIn" id="userLoginIn">
										<div class="form-group">
											<label>用户名&nbsp;&nbsp;<span id="nameLog" style="color:red"></span></label>
											<input class="form-control" name="username" id="username" type="text" required="required">
										</div>
										<div class="form-group">
											<label>密码 &nbsp;&nbsp;<span id="pwdLog" style="color:red"></span></label>
											<input class="form-control" name="password" id="password" type="password" required="required"><br>
											<a href="${ctx }/forgetPassword.jsp" style="margin-left:200px">忘记密码</a>
										</div>
										<button type="button" id="btnLogin" onclick="checkUser()" class="btn btn-primary btn-lg btn-block">登录</button>
									</form>
								</div>
							</div>
					</li>
					<li  style="float:right;display:none" id="user2"><a href="#" onclick="checkLogout()" data-toggle="modal" data-target='#modalRegister'>注销</a></li>
					<li class="dropdown"  style="float:right;display:none" id="user1">
						<a href="#"  class="dropdown-toggle" data-toggle="dropdown" style="color:#a42500">
							${user.realname }<span class="caret"></span>
						</a>
						<ul class="dropdown-menu" style="text-align:center">
		                    <li><a href="${ctx }/personMsg.jsp">修改信息</a></li>
		                    <li><hr/></li>
		                    <li><a href="#"  data-toggle="modal" data-target="#myModalt">我的社团</a>
								
		                    </li>
                		</ul>
					</li>
				</ul>
			</div><!--/.nav-collapse -->			
		</div>	
		<!-- 模态框（Modal） -->
<div class="modal fade" id="myModalt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
       <div class="modal-content">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">所属社团信息:${user.asso.tname }</h4>
           </div>
           <div class="modal-body">
           	 <img src="${ctx }/img/logo/${user.asso.logo}" alt="" style="width:100%;">  
           ${user.asso.description }</div>
           <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
           </div>
       </div><!-- /.modal-content -->
   </div><!-- /.modal -->
</div>
	</nav>
</header>
<article class="post">
					<header class="entry-header">
 						<div class="entry-meta"> 
 							<span class="posted-on"><time class="entry-date published" id="mytime"></time></span>
 						</div>
 					</header>
</article>

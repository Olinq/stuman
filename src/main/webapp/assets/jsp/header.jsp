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
  		 $("#user").css("display","");
     }else{
    	 $("#user").css("display","none");
  		 $("#login").css("display","");
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
        $.ajax({
         	url : "${ctx }/user/userLoginIn",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({username: $("#username").val(),password:$("#password").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
        		if("true"!=jsonArry.result+""){
        			mizhu.alert('提示信息', '未注册或者账户名密码错误');
        		}else if("1"!=jsonArry.statu+""){
        			mizhu.alert('提示信息', '尚未通过审核，请耐心等待');
        		}else{
	         		//要执行的代码
		         	if("true"==jsonArry.result+""){
		         		$("#login").css("display","none");
		         		$("#user").css("display","");
		         		console.log("登录成功");
		         		 window.location.reload();//刷新当前页面.
		         		$("#username").val("");
		         		$("#password").val("");
		         	}else{
		         		$("#username").val("");
		         		$("#password").val("");
		         		mizhu.alert('提示信息', '账户名或者密码错误');
		         	}
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
       		$("#user").css("display","none");
       		 $("#login").css("display","");
    }
    });
}
</script>
<header id="header">
	<div id="head" class="parallax" parallax-speed="1">
		<h2 style="text-align:center;margin-top:10px">
			<img src="${ctx }/assets/images/stuman.png"  style="margin-top:-120px;margin-bottom:-180px;"/>
		</h2>
	</div>

	<nav class="navbar navbar-default navbar-sticky">
		<div class="container-fluid">
			<div class="navbar-collapse collapse">
				
				<ul class="nav navbar-nav navbar-center" style="width:1000px">
					<li  style="width:100px"></li>
					<li ><a href="/stuman/">首页</a></li>
					<li ><a href="/stuman/team">社团</a></li>
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
				</ul>
				<ul class="nav navbar-nav navbar-right"  id="login">
					<li class="dropdown" id="login">
				   	   <a href="#" class="dropdown-toggle" data-toggle="dropdown">
							登录<span class="caret"></span>
						</a>
						<div class="dropdown-menu" style="width:300px" id="formLogin">
							
								<div class="container-fluid">
									<form action="${ctx }/user/userLoginIn">
										<div class="form-group">
											<label>用户名</label>
											<input class="form-control" name="username" id="username" type="text">
										</div>
										<div class="form-group">
											<label>密码</label>
											<input class="form-control" name="password" id="password" type="password"><br>
											<a href="#" style="margin-left:200px">忘记密码</a>
										</div>
										<button type="button" id="btnLogin" onclick="checkUser()" class="btn btn-primary btn-lg btn-block">登录</button>
									</form>
								</div>
							</div>
					</li>
					<li><a href="${ctx }/userAdd.jsp"  data-target='#modalRegister'>注册</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right" style="display:none;" id="user">
				<li class="dropdown">
						<a href="#"  class="dropdown-toggle" data-toggle="dropdown" style="color:#a42500">
							${user.username }<span class="caret"></span>
						</a>
						<ul class="dropdown-menu" style="text-align:center">
		                    <li><a href="personMsg.jsp">修改信息</a></li>
		                    <li><hr/></li>
		                    <li><a href="#">个人信息</a></li>
                		</ul>
					</li>
					<li><a href="#" onclick="checkLogout()" data-toggle="modal" data-target='#modalRegister'>注销</a></li>
				</ul>
			</div><!--/.nav-collapse -->			
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

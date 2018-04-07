<%@ page language="java" contentType="text/html; charset=UTf-8"
    pageEncoding="UTf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <script src="${ctx}/webjars/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
	setBackground();
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
//两秒后清除提示
function clear(){
	$("#log").html("");
}
setInterval("clear()",2000);

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
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
	         		alert("1");
	         	}else{
	         		alert("0");
	         		
	         	}
        }
        });
}
</script>
<header id="header">
	<div id="head" class="parallax" parallax-speed="1">
		<h2 style="text-align:center;margin-top:10px">
			<span class="title">学生社团联合</span>
			<span class="tagline">华南理工大学广州学院<br>
		</h2>
	</div>

	<nav class="navbar navbar-default navbar-sticky">
		<div class="container-fluid">
			<div class="navbar-collapse collapse">
				
				<ul class="nav navbar-nav" style="width:1000px">
					<li  style="width:100px"></li>
					<li class="active"><a href="/stuman/">首页</a></li>
					<li class="active"><a href="/stuman/team">社团</a></li>
					<li><a href="${ctx }/active">活动预告</a></li>
			<!--	<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-left.jsp">Left Sidebar</a></li>
							<li><a href="sidebar-right.jsp">Right Sidebar</a></li>
							<li><a href="single.jsp">Blog Post</a></li>
						</ul>
					</li>
			-->
					<li><a href="${ctx }/about?id=1">关于我们</a></li>
					<li ><a href="#">留言板</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							登录<span class="caret"></span>
						</a>
						<div class="dropdown-menu" style="width:300px" id="formLogin">
							
								<div class="container-fluid">
									<form>
										<div class="form-group">
											<label>用户名</label>
											<input class="form-control" name="username" id="username" type="text">
										</div>
										<div class="form-group">
											<label>密码</label>
											<input class="form-control" name="password" id="password" type="password"><br>
											<a href="#" style="margin-left:200px">忘记密码</a>
										</div>
										<button type="submit" id="btnLogin" onclick="checkUser()" class="btn btn-primary btn-lg btn-block">登录</button>
									</form>
								</div>
							
						</div>
					</li>
					<li><a href="#" data-toggle="modal" data-target='#modalRegister'>注册</a></li>
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

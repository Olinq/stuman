<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<script src="${ctx}/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${ctx}/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<link href="${ctx}/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>
.left {
	text-align: left;
}

.right {
	text-align: right;
}

.disabled {
	disabled: true;
}
</style>
</head>
<body>
	<div>
		<a href="${ctx }/login.jsp">返回登录页面</a>
	</div>
	<div
		style="width: 600px; height: 600px; margin: 60px auto auto auto; color: blue; text-align: center">
		<table class="table">
			<tr>
				<td class="right">用户名：<input type="text" id="forgetUsername"
					name="username" /></td>
				<td><span id="log" style="color: red"></span></td>
			</tr>
			<tr>
				<td class="right">邮&nbsp;&nbsp;&nbsp;箱：<input  type="text"
					id="email" name="email" /></td>
				<td class="left"><input type="button" id="sendValid"
					value="发送验证码" />&nbsp;&nbsp;&nbsp;<span id="emailLog" style="color: red"></span></td>
			</tr>
			<tr>
				<td class="right">验证码：<input type="text"
					id="valid" name="valid" /></td>
				<td class="left"><input type="button" id="validNum" value="确定" /></td>
			</tr>
		</table>
	</div>

	<script>
	$().ready(function() {
		$("#sendValid").attr('disabled',false);
		$("#validNum").attr('disabled',false);
			$('#forgetUsername').keyup(function() {
				$.ajax({
					url : "${ctx}/checkUserUsername",
					type : "post",
					contentType : 'application/json;charset=UTF-8',
					dataType : "json",
					data : JSON.stringify({
						username : $("#forgetUsername").val()
					}),
					success : function(msg) {
						var jsonArry = eval(msg); //将json类型字符串转换为json对象
						console.log(jsonArry);
						//要执行的代码
						if ("true" == jsonArry.result + "") {
							//					            	alert("checkAdminUsername");
							$("#log").html("用户名不存在");
							$("#sendValid").attr('disabled',true);
							$("#validNum").attr('disabled',true);
						}else{
							$("#log").html("");
							$("#sendValid").attr('disabled',false);
							$("#validNum").attr('disabled',false);
						}
					}
				});
			});
			
			$("#sendValid").click(function(){
				$("#emailLog").html("");
				if(""==$("#email").val()){
					alert("请输入邮箱");
					return;
				}
				 var email=$("#email").val();
				  if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/))
				  {
				   alert("邮箱格式不正确！请重新输入");
				   $("#email").focus();
				   return;
				  }
				$.ajax({
					url : "${ctx}/senderEmail",
					type : "post",
					contentType : 'application/json;charset=UTF-8',
					dataType : "json",
					data : JSON.stringify({
						email : $("#email").val()
					}),
					success : function(msg) {
						var jsonArry = eval(msg); //将json类型字符串转换为json对象
						console.log(jsonArry);
						//要执行的代码
						if ("true" == jsonArry.result + "") {
							$("#emailLog").html("发送成功");
						}else{
							$("#emailLog").html("发送失败，请重试");
						}
					}
				});
				
			});
			$("#validNum").click(function(){
				alert("1111");
			});
		});
	//倒计时60秒
		var countdown=60; 
		function settime(val) { 
		if (countdown == 0) { 
		val.removeAttribute("disabled");    
		val.value="免费获取验证码"; 
		countdown = 60; 
		} else { 
		val.setAttribute("disabled", true); 
		val.value="重新发送(" + countdown + ")"; 
		countdown--; 
		} 
		setTimeout(function() { 
		settime(val) 
		},1000) 
		} 
	</script>
</body>
</html>
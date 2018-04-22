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
</style>
</head>
<body style="background-color:#badcf5;">
	<div style="margin:20px auto auto 30px ">
		<a href="${ctx }/" >返回首页</a>
	</div>
	<div id="display"
		style="width: 600px; height: 200px; margin: 60px auto 0px auto; color: blue; text-align: center">
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
					value="获取验证码"/></td><td><span id="emailLog" style="color: red"></span></td>
			</tr>
			<tr>
				<td class="right">验证码：<input type="text"
					id="valid" name="valid"/></td>
				<td class="left"><input type="button" id="validNum" value="确定" /></td><td><span id="val" style="color: red"></span></td>
			</tr>
		</table>
		<span id="result" style="color: red"></span>
	</div>
	
	<div id="change" style="display:none;width:350px; height: 600px; margin: 0px auto auto auto; color: blue; text-align: center">
			<table class="table">
			<tr>
				<td class="right">密&nbsp;&nbsp;&nbsp;码：<input  type="text"
					id="password" name="password" /></td>
				<td class="left"></td>
			</tr>
			<tr>
				<td class="right">再次输入密码：<input type="text"
					id="TwoPassword" name="TwoPassword"/></td>
				<td class="left"><input type="button" id="submit" value="修改" /></td>
			</tr>
		</table>
	</div>
	<script>
	//倒计时60秒
	var countdown=60; 
	function settime(val) { 
		if (countdown == 0) { 
			val.attr("disabled", false);    
			val.html("获取验证码"); 
			countdown = 60; 
			return;
		} else { 
			val.attr("disabled", true); 
			val.html("重新发送(" + countdown + ")"); 
			countdown--; 
		} 
		setTimeout(function() { 
			settime(val) 
			},1000); 
	}
	$().ready(function() {
		$("#sendValid").attr('disabled',true);
		$("#validNum").attr('disabled',true);
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
						url : "${ctx}/checkUserEmail",
						type : "post",
						contentType : 'application/json;charset=UTF-8',
						dataType : "json",
						data : JSON.stringify({
							username : $("#forgetUsername").val(),
							email:$("#email").val()
						}),
						success : function(msg) {
							var jsonArry = eval(msg); //将json类型字符串转换为json对象
							console.log(jsonArry);
							//要执行的代码
							if ("true" != jsonArry.result + "") {
								$("#emailLog").html("邮箱与用户名不匹配");
							}else{
								$("#log").html("");
								$.ajax({								//邮箱与用户名匹配则请求发送验证码
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
									},
									 error: function (XMLHttpRequest, textStatus, errorThrown) {
						                    // 状态码
						                    console.log(XMLHttpRequest.status);
						                    // 状态
						                    console.log(XMLHttpRequest.readyState);
						                    // 错误信息   
						                    console.log(textStatus);
						                    $("#emailLog").html("发送失败，请重试");
						                }
								});
							}
						}
				});
			});
			$("#validNum").click(function(){
				if(""==$("#valid").val()){
					alert("请输入验证码");
					return;
				}
				 $.ajax({
						url : "${ctx}/validData",
						type : "post",
						contentType : 'application/json;charset=UTF-8',
						dataType : "json",
						data : JSON.stringify({
							valid : $("#valid").val()
						}),
						success : function(msg) {
							var jsonArry = eval(msg); //将json类型字符串转换为json对象
							console.log(jsonArry);
							//要执行的代码
							if ("true" != jsonArry.result + "") {
								$("#val").html("验证失败，请重试");
							}else{
								$("#val").html("验证成功");
								$("#change").show();
							}
						}
					});
			});
			$("#submit").click(function(){
				if(""==$("#password").val()){
					alert("请输入密码");
					return;
				}
				if($("#TwoPassword").val()!=$("#password").val()){
					alert("两次密码输入不一致");
					return;
				}
				 $.ajax({
						url : "${ctx}/changeUserPassword",
						type : "post",
						contentType : 'application/json;charset=UTF-8',
						dataType : "json",
						data : JSON.stringify({
							email : $("#email").val(),
							username : $("#forgetUsername").val(),
							password : $("#password").val()
						}),
						success : function(msg) {
							var jsonArry = eval(msg); //将json类型字符串转换为json对象
							console.log(jsonArry);
							//要执行的代码
							if ("true" != jsonArry.result + "") {
								$("#result").html("修改失败，请重试");
							}else{
								$("#result").html("修改成功");
								$("#change").hide();
							}
						}
					});
			});
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td{
width:100px;
height:100px;
text-align:center;
}
</style>
</head>
<body>
<div style="margin:80px auto;width:500px; text-align:center"><img src="img/success1.png" alt="图片">恭喜您完成注册！<br><br><span style="color:red">未审核不可登陆</span></div>
<table style="border-collapse:collapse;margin:100px auto" border="1" bordercolor="#a0c6e5">
			<thead>
				<tr>
					<th>ID</th>
					<th>用户名</th>
					<th>邮箱</th>
					<th>申请状态</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${user.id}</td>
					<td>${user.username }</td>
					<td>${user.email }</td>
					<td>待审核...</td>
				</tr>
			</tbody>
		</table>
		<div style="margin:10px auto;width:500px; text-align:center">
			<a href="${ctx }/">【返回首页】</a>
		</div>
</body>
</html>
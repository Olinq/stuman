<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生社团管理系统</title>
  <%
  	/*
  	 1、request.getScheme() 返回协议的名称   http，和后面的"://" 拼起来就成了 http://
       2、request.getServerName() 这是获取你的服务器的名称，如果你的应用部署在本机那么其就返回localhost或者127.0.0.1 ，这2个是等价的
       3、request.getServerPort()  是你应用使用的端口，比如8080或者80
  	*/
      String path = request.getContextPath();//web项目的根路径，就是webapp
      String basePath = request.getScheme() + "://"
                  + request.getServerName() + ":" + request.getServerPort()
                  + path + "/";
%>
  	<script src="<%=basePath %>/webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="<%=basePath %>/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
    <link href="<%=basePath %>/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="<%=basePath %>/css/style.css" rel="stylesheet">
    <script src="<%=basePath %>/js/admin.js"></script>
</head>
<body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>精彩，青春，活力</title>

	<link rel="shortcut icon" href="assets/images/gt_favicon.png">
	<link href="${ctx}/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<!-- Custom styles -->
	<link rel="stylesheet" href="${ctx}/assets/css/styles.css">
	<link rel="stylesheet" href="${ctx}/assets/css/templatemo_style.css">
	<!--[if lt IE 9]> <script src="assets/js/html5shiv.js"></script> <![endif]-->
</head>
<body class="home">
<script type="text/javascript">
function showTime(){
    nowtime=new Date();
    year=nowtime.getFullYear();
    month=nowtime.getMonth()+1;
    date=nowtime.getDate();
    document.getElementById("mytime").innerText=year+"年"+month+"月"+date+" "+nowtime.toLocaleTimeString();
}

setInterval("showTime()",1000);

</script>


<%@ page language="java" contentType="text/html; charset=UTf-8"
    pageEncoding="UTf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <script src="${ctx}/webjars/jquery/3.1.1/jquery.min.js"></script>
	<script src="${ctx}/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
	<script src="${ctx}/assets/js/template.js"></script>
<script>
$(function(){
	setBackground();
});
var t = 0;
function setBackground(){
    switch (t%3){
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
    },4000);
}
</script>
<header id="header">
	<div id="head" class="parallax" parallax-speed="1">
		<h1 id="logo" style="text-align:center">
			<span class="title">学生社团联合</span>
			<span class="tagline">华南理工大学广州学院<br>
		</h1>
	</div>

	<nav class="navbar navbar-default navbar-sticky">
		<div class="container-fluid">
			
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
			</div>
			
			<div class="navbar-collapse collapse">
				
				<ul class="nav navbar-nav">
					<li class="active"><a href="/stuman/">Home</a></li>
					<li><a href="about.jsp">About</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-left.jsp">Left Sidebar</a></li>
							<li><a href="sidebar-right.jsp">Right Sidebar</a></li>
							<li><a href="single.jsp">Blog Post</a></li>
						</ul>
					</li>
					<li><a href="blog.jsp">Blog</a></li>
				</ul>
			
			</div><!--/.nav-collapse -->			
		</div>	
	</nav>
</header>
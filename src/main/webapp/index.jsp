<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<header id="header">
	<div id="head" class="parallax" parallax-speed="2">
		<h1 id="logo" class="text-center">
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
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-left.html">Left Sidebar</a></li>
							<li><a href="sidebar-right.html">Right Sidebar</a></li>
							<li><a href="single.html">Blog Post</a></li>
						</ul>
					</li>
					<li><a href="blog.html">Blog</a></li>
				</ul>
			
			</div><!--/.nav-collapse -->			
		</div>	
	</nav>
</header>

<main id="main">

	<div class="container">
		<div class="row section recentworks topspace">
			
			<h2 class="section-title"><span>社团一览</span></h2>
			
			<div class="thumbnails recentworks row">
				
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<a class="thumbnail" href="sidebar-right.html">
						<span class="img">
							<img src="assets/images/s1.jpg" alt="">
							<span class="cover"><span class="more">See details &rarr;</span></span>
						</span>
						<span class="title">Sample title - big data solutions</span>
					</a>
					<span class="details"><a href="">Web design</a> | <a href="">Wordpress</a> | <a href="">Logotype</a></span>
					<h4></h4>
					<p></p>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<a class="thumbnail" href="sidebar-right.html">
						<span class="img">
							<img src="assets/images/s1.jpg" alt="">
							<span class="cover"><span class="more">See details &rarr;</span></span>
						</span>
						<span class="title">Pure ipsum - development services for people</span>
					</a>
					<span class="details"><a href="">Web design</a> | <a href="">Wordpress</a></span>
					<h4></h4>
					<p></p>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<a class="thumbnail" href="sidebar-right.html">
						<span class="img">
							<img src="assets/images/s1.jpg" alt="">
							<span class="cover"><span class="more">See details &rarr;</span></span>
						</span>
						<span class="title">Lorem studios - interior and patio design</span>
					</a>
					<span class="details"><a href="">Web design</a> | <a href="">Logotype</a></span>
					<h4></h4>
					<p></p>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<a class="thumbnail" href="sidebar-right.html">
						<span class="img">
							<img src="assets/images/s1.jpg" alt="">
							<span class="cover"><span class="more">See details &rarr;</span></span>
						</span>
						<span class="title">Pure ipsum - development services for people</span>
					</a>
					<span class="details"><a href="">Web design</a> | <a href="">Wordpress</a></span>
					<h4></h4>
					<p></p>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<a class="thumbnail" href="sidebar-right.html">
						<span class="img">
							<img src="assets/images/s1.jpg" alt="">
							<span class="cover"><span class="more">See details &rarr;</span></span>
						</span>
						<span class="title">Lorem studios - interior and patio design</span>
					</a>
					<span class="details"><a href="">Web design</a> | <a href="">Logotype</a></span>
					<h4></h4>
					<p></p>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<a class="thumbnail" href="sidebar-right.html">
						<span class="img">
							<img src="assets/images/s1.jpg" alt="">
							<span class="cover"><span class="more">See details &rarr;</span></span>
						</span>
						<span class="title">Lorem studios - interior and patio design</span>
					</a>
					<span class="details"><a href="">Web design</a> | <a href="">Logotype</a></span>
					<h4></h4>
					<p></p>
				</div>
			</div>

		</div> <!-- /section -->
	</div>	<!-- /container -->

</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>
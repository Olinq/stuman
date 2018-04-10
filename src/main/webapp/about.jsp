<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>
<main id="main">

	<div class="container">

		<div class="row topspace">
			
			<!-- Sidebar -->
			<aside class="col-sm-2 sidebar sidebar-right">

			</aside>
			<!-- /Sidebar -->

			<!-- Article main content -->
			<article class="col-sm-8 maincontent">
				<h3>${asso.tname}</h3>
				<br/><br/>
				<p><img src="${ctx }/img/logo/${asso.logo}" alt="" class="" width="100%" height="600px"></p>
				<br/><br/>
				<h5>社团介绍</h5><br/>
				<p class="phelper">${asso.description}</p>
				<div style="height:200px"></div>
			</article>
			<!-- /Article -->
			

		</div>
	</div>	<!-- /container -->
	
</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>

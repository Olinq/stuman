<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<p>社团成立时间：<fmt:formatDate pattern="yyyy-MM-dd" 
            value="${asso.createtime }" /></p>
				<p>指导老师：${asso.teacher }</p>
				<br/><br/>
				<p><img src="${ctx }/img/logo/${asso.logo}" width="400px" height="400px"></p>
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

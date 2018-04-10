<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>

<main id="main">

	<div class="container">
		
		<div class="row topspace">
			<div class="col-sm-14 col-sm-offset-2" style="margin:0px 0px">
															
 				<article class="post">
            <h1 class="entry-title"> ${news.title}</h1>
				               <div style="text-align:center;margin-bottom:30px">${news.time}&nbsp;&nbsp;&nbsp;<span class=""> 文章作者</span>： <span href="#">${news.author}</span></div>
				               <hr/>
				               ${news.content}
				               	<br/>
				               
    								<hr/>
				</article><!-- #post-## -->
			</div> 
		</div> <!-- /row post  -->
	</div>	<!-- /container -->

</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>

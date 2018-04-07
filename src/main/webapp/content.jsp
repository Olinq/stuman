<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>
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

<main id="main">

	<div class="container" style="margin-bottom:400px">
		
		<div class="row topspace">
			<div class="col-sm-9 col-sm-offset-2">
															
 				<article class="post">
					<header class="entry-header">
 						<div class="entry-meta"> 
 							<span class="posted-on"><time class="entry-date published" id="mytime"></time></span>			
 						</div> 
					</header> 
					<div class="entry-content"> 
						 <div class="post_section">
            
				                <h5>${news.title}</h5>
								<br/>
								<br/>
				               	<p class="phelper">${news.content}</p>
				               	<br/>
				               	<br/>
				               ${news.time}&nbsp;&nbsp;&nbsp;
				               <span class=""> 文章作者</span>： <span href="#">${news.author}</span>
    							<hr/>
            			</div>
            		</div> 
				</article><!-- #post-## -->
			</div> 
		</div> <!-- /row post  -->
	</div>	<!-- /container -->

</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>

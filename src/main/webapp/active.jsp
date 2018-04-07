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

	<div class="container">
		
		<div class="row topspace">
			<div class="col-sm-9 col-sm-offset-2">
															
 				<article class="post">
					<header class="entry-header">
 						<div class="entry-meta"> 
 							<span class="posted-on"><time class="entry-date published" id="mytime"></time></span>			
 						</div> 
					</header> 
					<div class="entry-content"> 
					<c:forEach items="${news }" var="n">
						 <div class="post_section">
            
				                <h5>${n.title}</h5>
				
				               ${n.time}&nbsp;&nbsp;&nbsp;
				               <span class=""> 文章作者</span>： <span href="#">${n.author}</span>
				                <div class="content">
				               	 	<p>${n.content}</p>
				                 </div>       
								<a href="${ctx }/active/content?id=${n.id}" class="more">Reading more...</a> | <a href="#" class="comment">Comments (225)</a>
    							<hr/>
            			</div>
            		</c:forEach>
            		</div> 
           			<div style="text-align:right;margin:50px 50px">
							<span aria-hidden="true">
									<c:if test="${pageInfo.pageSize!=pageInfo.total}">
									<h5><a href="${ctx }/active?total=${pageInfo.total}" style="color:blue">查看更多&raquo;&raquo;&raquo;&raquo;</a></h5>
									</c:if>
							</span>
					</div>
				</article><!-- #post-## -->

			</div> 
		</div> <!-- /row post  -->
	</div>	<!-- /container -->

</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>

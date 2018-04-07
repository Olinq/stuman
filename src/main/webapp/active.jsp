<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>
<main id="main">

	<div class="container" >
					
		<div class="row topspace">
			<div class="col-sm-9 col-sm-offset-2">
															
 				<article class="post">
					<header class="entry-header">
 						<div class="entry-meta"> 
 							<div id="respond">
						<form action="${ctx }/active/findData">
							<div class="row">
							<div class="col-md-6"></div>
								<div class="col-md-4 text-right" style="line-height: 40px;">
									<div class="form-group">
										<input type="text" name="findData" class="form-control" style="margin-left: 25;height: 40px;" required="required" placeholder="根据标题查找">
									</div>
								</div>
								<div class="col-md-1 text-left"  style="line-height: 40px;">
  									<button type="submit" class="btn btn-action" style="height: 40px;">查找</button>
								</div>
							</div>
						</form>
					</div> <!-- /respond -->
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

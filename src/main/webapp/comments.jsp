<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>

<main id="main">
					
<div class="container">
		   <div id="respond">
		   <h3 id="reply-title">留言</h3>
				<form  action="" method="post" id="commentform" class="">
					<div class="form-group">
								<label for="inputComment">Comment</label>
								<textarea class="form-control" rows="6"></textarea>
					</div>
					<div class="row">
						<div class="col-md-14">
								<div class="col-md-14 text-right">
									<input type="hidden" name="uid" value="${user.id}">
  									<button type="submit" class="btn btn-info">Submit</button>
  								</div>
						</div>
					</div>
				</form>
		</div>
	</div>	<!-- /container -->

</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>
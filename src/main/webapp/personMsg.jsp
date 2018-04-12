<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>

<main id="main">
					
<div class="container" style="margin-bottom:200px">
				<div id="respond">
						<h3 id="reply-title">个人信息</h3><br/><br/>
						<form action="" method="post" id="commentform" class="">
							<div class="form-group">
								<label for="inputName">Name</label>
								<input type="text" class="form-control" name="user.username" id="inputName" value="${user.username }">
							</div>
							<div class="form-group">
								<label for="inputEmail">Password<i class="text-danger">*</i></label>
								<input type="password" class="form-control" name="user.password" id="inputEmail" value="${user.password }">
							</div>
							<div class="form-group">
								<label for="inputWeb">Email address</label>
								<input type="email" class="form-control" name="user.email" id="inputWeb" value="${user.email }">
							</div>
						
							<div class="row">
								<div class="col-md-8 text-right">
  									<button type="submit" class="btn btn-info">Submit</button>
								</div>
							</div>
						</form>
					</div> <!-- /respond -->
	</div>	<!-- /container -->

</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<jsp:include page="./assets/jsp/assetsHeader.jsp" />
<jsp:include page="./assets/jsp/header.jsp" />

<main id="main">

<div class="container">
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2">

			<div id="comments">
				<h3 class="comments-title">留言表</h3>
				<br>
				
				<ol class="comments-list">
				<c:forEach items="${lists}" var="list">
					<li class="comment">
						<div>
							<div class="comment-meta">
								<span class="author"><a href="#">${list.user.username}</a></span> <span
									class="date"><a href="#">${list.time }</a></span>
									<span class="reply"><a href="#" style="color:blue" onclick="see(${list.id})">查看留言(${list.totalReplay})</a></span>
								<span class="reply"><a href="#" style="color:blue">回复</a></span>
							</div>

							<div class="comment-body">${list.comment}</div>
						</div>
						<div id="replay${list.id}">
							<c:forEach items="${list.replays }" var="replay">
						<ul class="children">
							<li class="comment">
								<div>
									<div class="comment-meta-children">
										<span class="author"><a href="#">${replay.user.username }</a></span> <span
											class="date"><a href="#">${replay.time}</a></span> 
									</div>
									<!-- .comment-meta -->

									<div class="comment-body-children">${replay.replay}</div>
									<!-- .comment-body -->
								</div>
							</li>
						</ul>
						</c:forEach>
						</div>
						<!-- .children -->
					</li>
					</c:forEach>
				</ol>

				<div class="clearfix"></div>
				<div id="respond">
					<h4 id="reply-title">留言</h4>
					<form action="${ctx }/user/comment/add" method="post" id="commentform" onsubmit="return mySubmit()">
						<div class="form-group">
							<label for="inputComment">Comment</label>
							<textarea class="form-control" rows="6" name="comment" required="required"></textarea>
						</div>
						<div class="row">
							<div class="col-md-14">
								<div class="col-md-14 text-right">
									<input type="hidden" name="uid" value="${user.id}">
									<button type="submit" id="submitComment" class="btn btn-info" >Submit</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
//控制评论的显示隐藏
$(function(){
	for(int item=0;i<parseInt('${lists.size()}');i++){
		$("#replay"+i).toggle();
	}
	
});
	function see(item){
		$("#replay"+item).toggle();
	}
	function mySubmit(){
		var user = '<%= session.getAttribute("user")%>';
	     console.log("user:::" + user);
	     if(user=='null'){
	    	 mizhu.alert('提示信息', '请先登录');
	    	return false;
	     }
		return true;
	}
</script>
<!-- /container --> </main>
<jsp:include page="./assets/jsp/assetsFooter.jsp" />
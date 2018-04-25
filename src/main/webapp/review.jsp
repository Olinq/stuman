<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<jsp:include page="./assets/jsp/assetsHeader.jsp" />
<jsp:include page="./assets/jsp/header.jsp" />
<main id="main">

<div class="container"
	style="background: #f3eee9; padding-top: 60px; margin-top: -50px;">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-2" style="margin-left: 55px">
			<div class="rstory">
				<div class="opbtn"></div>
				<p class="rstory_m">
					<font>${comment.comment }</font>
				</p>
				<p class="attribution" style="margin-left: 10px">
					发表自&nbsp;&nbsp;<a href="#non">${comment.user.realname }</a>&nbsp;&nbsp;
					at&nbsp;&nbsp; ${comment.time }
				</p>
			</div>
			<div style="font-size:1.0em;margin:20px auto 10px 100px;height:1.6em;width:800px;box-shadow: inset 0 0 1px 1px white;"><font style="margin:2px auto 2px 2px">评论</font><a href="#reply-title" style="float:right">[发评论]</a></div>
			<section class="rcomments">
				<c:forEach items="${comment.replays }" var="replay" varStatus="status">
					<article class="rcomment">
							<div class="rcomment-img" style="width:50;height:50"></div>

						<div class="rcomment-body">
							<div class="text">
								<p>${replay.replay }</p>
							</div>
							<p class="attribution">
								发表自&nbsp;&nbsp;<a href="#non">${replay.user.realname }</a>&nbsp;&nbsp;
								at&nbsp;&nbsp; ${replay.time } &nbsp;&nbsp;#${status.index + 1}
							</p>
						</div>
					</article>
				</c:forEach>
			</section>
			<div id="comments" style="width: 800px;margin-left:100px">
				<div id="respond">
					<h4 id="reply-title">评论</h4>
					<form action="${ctx }/user/comment/add" method="post"
						id="commentform" onsubmit="return replySubmit()">
						<div class="form-group">
							<label for="inputComment">Reply</label>
							<textarea class="form-control" rows="6" name="comment"
								style="margin-left: -60px; margin-top: 10px" required="required"></textarea>
						</div>
						<div class="row">
							<div class="col-md-14">
								<div class="col-md-13 text-right" style="margin-right: 65px;">
									<input type="hidden" name="uid" value="${user.id}">
									<input type="hidden" id="commId" name="commId" value="${comment.id}">
									<button type="submit" id="submitComment" class="btn btn-info">Submit</button>
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
function replySubmit(){
		var user = '<%=session.getAttribute("user")%>';
	     console.log("user:::" + user);
	     if(user=='null'){
	    	 mizhu.alert('提示信息', '请先登录');
	    	return false;
	     }
		return true;
	}
</script>
</main>
<jsp:include page="./assets/jsp/assetsFooter.jsp" />
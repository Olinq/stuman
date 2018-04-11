<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>

<main id="main">
					
<div class="container">
<div class="row">
			<div class="col-sm-8 col-sm-offset-2">

				<div id="comments">	
					<h3 class="comments-title">3 Comments</h3>
					<a href="#comment-form" class="leave-comment">Leave a Comment</a>
					
					<ol class="comments-list">
						<li class="comment">
							<div>
								<img src="assets/images/avatar_man.png" alt="Avatar" class="avatar">
												
								<div class="comment-meta">
									<span class="author"><a href="#">John Doe</a></span>
									<span class="date"><a href="#">January 22, 2011 at 4:55 pm</a></span>
									<span class="reply"><a href="#">Reply</a></span>
								</div>

								<div class="comment-body">
									Morbi velit eros, sagittis in facilisis non.
								</div>
							</div>

							<ul class="children">
								<li class="comment">
									<div>
										<img src="assets/images/avatar_man.png" alt="Avatar" class="avatar">
																
										<div class="comment-meta">
											<span class="author"><a href="#">John Doe</a></span>
											<span class="date"><a href="#">January 22, 2011 at 4:55 pm</a></span>
											<span class="reply"><a href="#">Reply</a></span>
										</div><!-- .comment-meta -->

										<div class="comment-body">
											Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.
										</div><!-- .comment-body -->
									</div>
								</li>
							</ul><!-- .children -->
						</li>

						<li class="comment">
							<div>
								<img src="assets/images/avatar_woman.png" alt="Avatar" class="avatar">
								
								<div class="comment-meta">
									<span class="author"><a href="#">Jonnes</a></span>
									<span class="date"><a href="#">January 22, 2011 at 4:55 pm</a></span>
									<span class="reply"><a href="#">Reply</a></span>
								</div><!-- .comment-meta -->

								<div class="comment-body">
									Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.												</div><!-- .comment-body -->
							</div>
						</li>
					</ol>
					
					<div class="clearfix"></div>
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
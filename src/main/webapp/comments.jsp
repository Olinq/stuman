<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<jsp:include page="./assets/jsp/assetsHeader.jsp" />
<jsp:include page="./assets/jsp/header.jsp" />

<main id="main">

<div class="container">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-2" style="margin-left:-20px">
		<h3 class="comments-title">留言表</h3>
				<br>
		<c:forEach items="${lists}" var="list">
			<div class="story">
				<div class="opbtn"></div>
				<p class="story_t">#${list.user.realname}</p>
				<p class="story_time">2015/07/12 20:48</p>
				<p class="story_m"><a href="#">${list.comment}</a>
					<span class="story_reply">
						<span
						class="reply" id="location${list.id}"><a
						href="#location${list.id+2}" style="color: blue;"
						onclick="see(${list.id})">查看留言(${list.totalReplay})</a></span> <span
						class="reply"><a href="#" style="color:blue"
						data-toggle="modal" data-target="#myModal"
						onclick="reply(${list.id})">回复</a></span>
						<c:if test="${list.uid==user.id }">
							<span
							class="reply"><a href="${ctx }/usercommentDel?id=${list.id}" style="color: blue">删除</a></span>
						</c:if>
					</span>
				</p>
						<span class="story_hf" id="replay${list.id}" style="display: none">
							<c:forEach items="${list.replays }" var="replay"
												varStatus="status">
												<ul class="children" id="children${list.id}">
										<li class="comment">
											<div>
												<div class="comment-meta-children">
													<span class="author"><a href="#">${replay.user.username }</a></span>
													<span class="date"><a href="#">${replay.time}</a></span><span>#楼层#<a>${status.index + 1}</a></span>
												</div>
												<!-- .comment-meta -->

												<div class="comment-body-children">${replay.replay}</div>
												<!-- .comment-body -->
											</div>
										</li>
									</ul>
							</c:forEach>
						</span>
			</div>
			</c:forEach>
					<div><a href="${ctx }/user/comment/all">查看全部</a></div>
			<div id="comments">
				<div class="clearfix">
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:60px">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">回复</h4>
								</div>
								<form id="form_data">
									<div class="modal-body">
										<label for="name">回复内容</label>
										<textarea class="form-control" rows="4" required="required" id="comm" name="comm"></textarea>
										<input type="hidden" id="uid" value="${user.id }" name="uid" />
										<input type="hidden" id="commId" name="commId">
									</div>
									<div class="modal-footer">
										<button type="button" id="close" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="button" onclick="add_replay()"
											class="btn btn-primary">回复</button>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					<div id="respond">
						<h4 id="reply-title">发帖</h4>
						<form action="${ctx }/user/comment/add" method="post"
							id="commentform" onsubmit="return mySubmit()">
							<div class="form-group">
								<label for="inputComment">Comment</label>
								<textarea class="form-control" rows="6" name="comment"
									required="required"></textarea>
							</div>
							<div class="row">
								<div class="col-md-14">
									<div class="col-md-14 text-right">
										<input type="hidden" name="uid" value="${user.id}">
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
</div>
<script>
	function reply(item){
		$("#commId").val(item);
		
	}
	//设置toggle事件
	function see(item){
		$("#replay"+item).toggle();
	
	}
	function mySubmit(){
		var user = '<%=session.getAttribute("user")%>';
	     console.log("user:::" + user);
	     if(user=='null'){
	    	 mizhu.alert('提示信息', '请先登录');
	    	return false;
	     }
		return true;
	}
	//提交回复
	function add_replay(){
		 var user = '<%=session.getAttribute("user")%>';
	     console.log("user:::" + user);
		  if(user=='null'){
		    	 mizhu.alert('提示信息', '请先登录');
		    	return;
		     }
		 $.ajax({
	         	url : "${ctx }/user/replay/add",
	         	type : "post",
	         	contentType: 'application/json;charset=UTF-8', 
	         	dataType : "json",
	         	data: JSON.stringify({uid: $("#uid").val(),commId:$("#commId").val(),replay:$("#comm").val()}),
	        	success : function(msg) {
	        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
	      		 	console.log(jsonArry);
	        		if("true"==jsonArry.result+""){
	        			$("#close").trigger("click");
	        			mizhu.alert('提示信息', '回复成功');
	        		}else{
	        			$("#close").trigger("click");
	        			mizhu.alert('提示信息', '回复失败，请重试');
	        		}
	        }
	        });
	}
</script> <!-- /container --> </main>
<jsp:include page="./assets/jsp/assetsFooter.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div style="margin-bottom:10px">
		<span class="label label-info" >留言板（${comment.comment}）下的回复内容</span>		
	</div>

	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>回复者</th>
					<th>回复内容</th>
					<th>回复时间</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${comment.replays}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.user.username }</td>
					<td>${c.replay }</td>
					<td>${c.time}</td>
					<td><a deleteLink="true" href="deleteReplayById?id=${c.id}&cid=${comment.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
	<jsp:include page="../jsp/Page.jsp"/>
	</div>
	
</div>
<jsp:include page="../jsp/FooterJsp.jsp" />
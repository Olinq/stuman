<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div style="margin-bottom:10px">
		<span class="label label-info" >留言板管理</span>		
		<div style="float:right;margin-bottom:10px">
		<form method="post" id="findDataForm" action="findCommentData">
			<table title="根据留言查找">
				<tr>
					<td><input  id="findData" name="findData" type="text" class="form-control" placeholder="根据留言查找" required="required"></td>
					<td> <button id="submit" type="submit" class="btn btn-info">查找</button></td>
				</tr>
			</table>
		</form>
		</div>
	</div>

	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>留言者</th>
					<th>留言内容&nbsp;(可进入查看回复)</th>
					<th>留言时间</th>
					<th>删除</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${comments}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.user.username }</td>
					<td><a href="listReplay?id=${c.id}">${c.comment }</a></td>
					<td>${c.time}</td>
					<td><a deleteLink="true" href="deleteCommentById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
					<td><a  href="addReplayPage?id=${c.id}">回复</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="../jsp/FooterJsp.jsp" />
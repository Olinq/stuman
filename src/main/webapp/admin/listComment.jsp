<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div style="margin-bottom:10px">
		<span class="label label-info" >社团类型管理</span>
		<!-- <div style="float:right;margin-bottom:10px">
		<form method="post" id="findDataForm" action="findCatagoryData">
			<table title="根据ID或者名字查找">
				<tr>
					<td><input  id="findData" name="findData" type="text" class="form-control" placeholder="根据ID或者名字查找" required="required"></td>
					<td> <button id="submit" type="submit" class="btn btn-info">查找</button></td>
				</tr>
			</table>
		</form>
		</div>
		 -->
	</div>

	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>留言者ID</th>
					<th>留言内容</th>
					<th>留言时间</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${comments}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.uid }</td>
					<td>${c.comment }</td>
					<td>${c.time}</td>
					<td><a deleteLink="true" href="deleteCommentById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
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
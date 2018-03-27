<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<span class="label label-info" >社团管理</span>
	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table style="table-layout:fixed" class="table table-striped table-bordered table-hover  table-condensed" >
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>LOGO</th>
					<th>社团名字</th>
					<th>社团描述</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${assos}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.logo }</td>
					<td>${c.tname}</td>
					<td data-toggle="tooltip"  title="${c.description}" 
					style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${c.description}</td>
					<td><a href="editAdmin?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="deleteAdminById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
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
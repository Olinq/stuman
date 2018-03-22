<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<span class="label label-info" >用户管理</span>
	<div style="text-align:right;">
	<span class="fix-to-right"><a class="btn btn-info" href="addPage">增加会员</a></span>
	</div>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>性别</th>
					<th>联系方式</th>
					<th>会员状态</th>
					<th>会员所属社团</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.username }</td>
					<td>${c.password }</td>
					<td>${c.sex }</td>
					<td>${c.tel }</td>
					<td>${c.statu }</td>
					<td>${c.assoId }</td>
					<td><a href="editUser?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="deleteUserById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
	<jsp:include page="../jsp/Page.jsp"/>
	</div>
	<div>
	
	</div>
	
</div>

<jsp:include page="../jsp/FooterJsp.jsp" />
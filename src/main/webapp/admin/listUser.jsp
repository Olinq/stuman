<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div style="margin-bottom:10px">
		<h3>用户管理>><span class="label label-success">${tname}</span>
			<div style="float:right;margin-bottom:10px">
		<form action="${ctx }/export" style="float:left;margin-left:-200px">
	                <input name="tid" type="hidden" value="${tid}">  
	                <button id="btnExport" type="submit" class="btn btn-blue">导出会员数据到Excel表</button>  
        </form>  
		<form method="post" id="findDataForm" action="findUserData">
			<table title="根据ID或者名字查找">
				<tr>
					<td><input  id="findData" name="findData" type="text" class="form-control" placeholder="根据ID或者名字查找" required="required"></td>
					<td width="60px"> <button id="submit" type="submit" class="btn btn-info">查找</button></td>
					<td width="100px"><span><a class="btn btn-success" href="addPage">增加会员</a></span></td>
				</tr>
			</table>
		</form>
		</div>
        </h3>
		
	</div>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>密码</th>
					<th>性别</th>
					<th>Email</th>
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
					<td>${c.realname }</td>
					<td>${c.password }</td>
					<td>${c.sex }</td>
					<td>${c.email }</td>
					<td>${c.statu }</td>
					<td>${c.asso.tname }</td>
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
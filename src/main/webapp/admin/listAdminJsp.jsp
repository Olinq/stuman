<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<span class="label label-info" >管理员管理</span>
	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>邮箱</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageInfo.list}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.username }</td>
					<td>${c.password}</td>
					<td>${c.email }</td>
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
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="addAdmin">
	    		<table class="addTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="username" name="username" type="text" class="form-control"  required="required"></td>
	    			</tr>
	    			<tr>
	    				<td>密&nbsp;码</td>
	    				<td><input  id="password" name="password" type="text" class="form-control"  required="required"></td>
	    			</tr>
	    			<tr>
	    				<td>邮&nbsp;箱</td>
	    				<td><input  id="email" name="email" type="email" class="form-control"  required="required" ></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	
</div>

</body>
</html>
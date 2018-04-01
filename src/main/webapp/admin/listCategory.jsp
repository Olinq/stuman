<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div style="margin-bottom:10px">
		<span class="label label-info" >社团类型管理</span>
		<div style="float:right;margin-bottom:10px">
		<form method="post" id="findDataForm" action="findCatagoryData">
			<table title="根据ID或者名字查找">
				<tr>
					<td><input  id="findData" name="findData" type="text" class="form-control" placeholder="根据ID或者名字查找" required="required"></td>
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
					<th>社团类型</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categorys}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.category }</td>
					<td><a href="editCategory?id=${c.id}&&page=${pageInfo.pageNum}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="deleteCategoryById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
	<jsp:include page="../jsp/Page.jsp"/>
	</div>
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增社团类型</div>
	  <div class="panel-body">
	    	<form method="post" id="categoryForm" action="addCategory">
	    		<table class="addTable">
	    			<tr>
	    				<td>社团类型</td>
	    				<td><input  id="category" name="category" type="text" class="form-control" placeholder="字符长度大于6" ><span id="tishi"></span></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button id="submitCategory" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	
</div>
<script>

</script>
<jsp:include page="../jsp/FooterJsp.jsp" />
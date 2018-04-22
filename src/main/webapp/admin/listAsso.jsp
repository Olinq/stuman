<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div style="margin-bottom:10px">
	<h3>
		社团管理>><span class="label label-info" >${category}</span>
		<div style="float:right;margin-bottom:10px">
		<form method="post" id="findDataForm" action="findAssoData">
			<table title="根据ID或者用户字查找">
				<tr>
					<td><input  id="findData" name="findData" type="text" class="form-control" placeholder="根据ID或者用户字查找" required="required"></td>
					<td width="60px"> <button id="submit" type="submit" class="btn btn-info">查找</button></td>
					<td width="100px"><span><a class="btn btn-success" href="addAssoPage">增加社团</a></span></td>
				</tr>
			</table>
		</form>
		</div>
	</h3>
	</div>
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
					<td>${c.id} ${ctx}</td>
					<td>
					<img width="40px" src="img/logo/${c.logo}">
					</td>
					<td>${c.tname}</td>
					<td data-toggle="tooltip"  title="${c.description}" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
					>${c.description}</td>
					<td><a href="editAsso?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="deleteAssoById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
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
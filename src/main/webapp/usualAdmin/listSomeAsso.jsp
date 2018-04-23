<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./listUsualAdminHead.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div  style="margin-bottom:20px;margin-left:40px ">
<h3>
<span class="label label-info">管理的社团</span>
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
					<th>成立时间</th>
					<th>指导老师</th>
					<th>编辑</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${asso.id }</td>
					<td><img width="40px" src="img/logo/${asso.logo}"></td>
					<td>${asso.tname }</td>
					<td data-toggle="tooltip"  title="${c.description}" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
					>${asso.description}</td>
					<td><fmt:formatDate value="${asso.createtime }" pattern="yyyy-MM-dd"/></td>
					<td>${asso.teacher }</td>
					<td><a href="editAsso?id=${asso.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
				</tr>
			</tbody>
		</table>
	</div>
<jsp:include page="../jsp/FooterJsp.jsp" />
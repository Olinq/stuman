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
					<th>属性：值</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>ID：${asso.id }</td>
				</tr>
				<tr>
					<td>LOGO：<img width="40px" src="img/logo/${asso.logo}"></td>
					</tr>
				<tr>
					<td>社团名字：${asso.tname }</td>
					</tr>
				<tr>
					<td data-toggle="tooltip"  title="${c.description}">社团描述 ：
					${asso.description}</td>
					</tr>
				<tr>
					<td>成立时间：<fmt:formatDate value="${asso.createtime }" pattern="yyyy-MM-dd"/></td>
						</tr>
				<tr>
					<td>指导老师：${asso.teacher }</td>
						</tr>
				<tr>
					<td><a href="editAsso?id=${asso.id}"><span class="glyphicon glyphicon-edit"></span>编辑</a></td>
					
				</tr>
			</tbody>
		</table>
	</div>
<jsp:include page="../jsp/FooterJsp.jsp" />
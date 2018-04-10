<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose> 
    <c:when test="${1==admin.lock}">    <!--如果 --> 
		<jsp:include page="../jsp/HeadJsp.jsp"/>
		<jsp:include page="../jsp/Navigator.jsp"/>
 	</c:when>      
   	<c:otherwise>  <!--否则 -->    
		<jsp:include page="../usualAdmin/listUsualAdminHead.jsp"/>
  	</c:otherwise> 
</c:choose>
<div class="workingArea">
	
	<div style="margin-bottom:10px">
		<span class="label label-info" >活动信息管理</span>		
		<div style="float:right;margin-bottom:10px">
		<form method="post" id="findDataForm" action="findNewsData">
			<table title="根据ID或者标题查找">
				<tr>
					<td><input  id="findData" name="findData" type="text" class="form-control" placeholder="根据ID或者标题查找" required="required"></td>
					<td width="60px"> <button id="submit" type="submit" class="btn btn-info">查找</button></td>
					<td width="100px"><span><a class="btn btn-success" href="addNewsPage">增加活动信息</a></span></td>
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
					<th>发布的管理员ID</th>
					<th>标题</th>
					<th>作者</th>
					<th>时间 </th>
					<th>点击量</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${newss}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.aid}</td>
					<td><a href="editNews?id=${c.id}">${c.title}</a></td>
					<td>${c.author }</td>
					<td title="${c.time }">${c.time }</td>
					<td>${c.click }</td>
					<td><a deleteLink="true" href="deleteNewsById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
	<jsp:include page="../jsp/Page.jsp"/>
	</div>
</div>

</body>
</html>
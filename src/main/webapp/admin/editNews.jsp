<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div class="panel panel-warning editDiv">
	  <div class="panel-heading">编辑管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="addNewsForm" action="updateNews">
	    		<table class="editTable">
	    			<tr>
	    				<td>标题</td>
	    					<td><input  id="title" name="title" value="${news.title}" type="text" class="form-control" placeholder="密码长度不小于6"></td>
	    			</tr>	
	    			<tr>
	    				<td>内容</td>
	    					<td>
	    					<textarea id="content" name="content" class="form-control" rows="3">${news.content}</textarea>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<input type="hidden" name="id" value="${news.id}">
	    					<button id="submitNews" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>	
</div>
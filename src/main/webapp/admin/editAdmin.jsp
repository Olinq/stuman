<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div class="panel panel-warning editDiv">
	  <div class="panel-heading">编辑管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="editForm" action="updateAdmin">
	    		<table class="editTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="username" name="username" value="${admin.username}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>密&nbsp;码</td>
	    					<td><input  id="password" name="password" value="${admin.password}" type="text" class="form-control"></td>
	    			</tr>	    			
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<input type="hidden" name="id" value="${admin.id}">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>	
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div class="panel panel-warning editDiv">
	  <div class="panel-heading">编辑社团类型</div>
	  <div class="panel-body">
	    	<form method="post" id="editForm" action="updateCategory">
	    		<table class="editTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="category" name="category" value="${category.category}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<input type="hidden" name="id" value="${category.id}">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>	
</div>
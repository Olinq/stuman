<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div class="panel panel-warning editDiv">
	  <div class="panel-heading">编辑管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="editForm" action="updateUser">
	    		<table class="editTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="username" name="username" value="${user.username}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>密&nbsp;码</td>
	    					<td><input  id="password" name="password" value="${user.password}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>性&nbsp;别</td>
	    					<td><input  id="sex" name="sex" value="${user.sex}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>联系方式</td>
	    					<td><input  id="email" name="email" value="${user.email}" type="text" class="form-control"></td>
	    			</tr>	  
	    			<tr>
	    				<td>会员状态</td>
	    					<td><input  id="statu" name="statu" value="${user.statu}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>所属社团</td>
	    					<td><input  id="assoId" name="assoId" value="${user.assoId}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<input type="hidden" name="id" value="${user.id}">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>	
</div>
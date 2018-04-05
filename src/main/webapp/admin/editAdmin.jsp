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
	<div class="panel panel-warning editDiv">
	  <div class="panel-heading">编辑管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="addAdminForm" action="updateAdmin">
	    		<table class="editTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="Adminusername" name="username" value="${admin.username}" type="text" class="form-control"><span id="tishi"></span></td>
	    			</tr>
	    			<tr>
	    				<td>密&nbsp;码</td>
	    					<td><input  id="password" name="password" value="${admin.password}" type="text" class="form-control" placeholder="密码长度不小于6"></td>
	    			</tr>	
	    			<tr>
	    				<td>邮&nbsp;箱</td>
	    					<td><input  id="Adminemail" name="email" value="${admin.email}" type="text" class="form-control"><span id="tishiEmail"></span>	</td>
	    			</tr>	    			
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<input type="hidden" name="id" value="${admin.id}">
	    					<button id="submitAdmin" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>	
</div>
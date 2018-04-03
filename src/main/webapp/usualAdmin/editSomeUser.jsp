<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="./listUsualAdminHead.jsp"/>
<div class="workingArea">
	<div class="panel panel-warning editDiv">
	  <div class="panel-heading">编辑管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="editForm" action="updateSomeUser">
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
	    					<td>
								<select name="sex" id="sex" class="selectpicker">
										<option value="男" <c:if test="${'男'==user.sex}">selected</c:if>>男</option>
										<option value="女" <c:if test="${'女'==user.sex}">selected</c:if>>女</option>
								</select>
							</td>
	    			</tr>
	    			<tr>
	    				<td>联系方式</td>
	    					<td><input  id="email" name="email" value="${user.email}" type="text" class="form-control"></td>
	    			</tr>	  
	    			<tr>
	    				<td>会员状态</td>
	    					<td><select name="statu" id="statu" class="selectpicker">
								<option value="0" <c:if test="${0==user.statu}">selected</c:if>>未验证</option>
								<option value="1" <c:if test="${1==user.statu}">selected</c:if>>已验证</option>
							</select>
						</td>
	    			</tr>
	    			<tr>
	    				<td>所属社团</td>
	    					<td>
	    						<input text="text" disabled="disabled" value="${sessionScop.admin.assId}"/>
							</td>
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
<script type="text/javascript">
</script>
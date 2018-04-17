<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="./listUsualAdminHead.jsp"/>

<div class="panel panel-warning addDiv" style="margin-top:100px">
	  <div class="panel-heading">新增会员</div>
	  <div class="panel-body">
	    	<form method="post" id="addUserForm" action="addSomeUser">
	    		<table class="addTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="Userusername" name="username"  type="text" class="form-control" placeholder="用户名长度不小于6">
	    				<span id="tishi"></span></td>
	    			</tr>
	    			<tr>
	    				<td>真实姓名</td>
	    				<td><input  id="realname" name="realname"  type="text" class="form-control" placeholder="用户名长度不小于3">
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>密&nbsp;码</td>
	    				<td><input  id="password" name="password" type="password" class="form-control" placeholder="密码长度不小于6"></td>
	    			</tr>
	    			<tr>
	    				<td>再次输入密码</td>
	    				<td><input  id="twoPassword" name="twoPassword" type="password" class="form-control" placeholder="密码长度不小于6"></td>
	    			</tr>
	    			<tr>
	    				<td>性&nbsp;别</td>
	    				<td>
						<select name="sex" id="sex" class="selectpicker">
							<option value="男" selected>男</option>
							<option value="女">女</option>
						</select>
						</td>
	    			</tr>
	    			<tr>
	    				<td>Email</td>
	    				<td><input  id="Useremail" name="email" type="text" class="form-control"><span id="tishiEmail"></span></td>
	    			</tr>
	    			<tr>
	    				<td>会员状态</td>
	    				<td>
	    				<select name="statu" id="statu" class="selectpicker">
							<option value="0" selected>未验证</option>
							<option value="1">已验证</option>
						</select>
						</td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="right">
	    				<input name="assoId" type="hidden" value="${sessionScope.admin.assoId}"/>
	    					<button id="submitUser" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
<jsp:include page="../jsp/FooterJsp.jsp" />
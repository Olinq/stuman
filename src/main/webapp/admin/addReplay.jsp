<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div style="margin-bottom:10px">
		<span class="label label-info" >留言</span>
	</div>
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">回复${comment.comment}</div>
	  <div class="panel-body">
	    	<form method="post" id="categoryForm" action="addReplay">
	    		<table class="addTable">
	    			<tr>
	    				<td>回复内容</td>
	    				<td><input  id="replay" name="replay" type="text" class="form-control" required="required"></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<input  id="uid" name="uid" type="hidden" class="form-control" value="${admin.id}">
	    					<input  id="commId" name="commId" type="hidden" class="form-control"  value="${comment.id }"></td>
	    					<button id="submitReplay" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	
</div>
<script>

</script>
<jsp:include page="../jsp/FooterJsp.jsp" />
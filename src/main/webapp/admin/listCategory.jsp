<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<span class="label label-info" >社团类型管理</span>
	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>社团类型</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categorys}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.category }</td>
					<td><a href="editCategory?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="deleteCategoryById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
	<jsp:include page="../jsp/Page.jsp"/>
	</div>
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增社团类型</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="addCategory">
	    		<table class="addTable">
	    			<tr>
	    				<td>社团类型</td>
	    				<td><input  id="category" name="category" type="text" class="form-control" required="required"> <span id="span"></span></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	
</div>
<script>
$().ready(function() {
	 $("#addForm").validate({
			 onsubmit:true,// 是否在提交时验证
			 onfocusout:false,// 是否在获取焦点时验证
			 onkeyup :false,// 是否在敲击键盘时验证
			
		 rules: {//规则
			 category: {//要对应相对应的input中的name属性
			 required: true
			 },
		 },
		 messages:{//验证错误信息
			 category: {
			 required: "请输入类型名"
			 }
		 },
		 submitHandler: function(form) { //通过之后回调
		 //进行ajax传值
			 $.ajax({
				 	url : "${ctx}/stuman/checkCategory",
				 	type : "post",
				 	contentType: 'application/json;charset=UTF-8', 
				 	dataType : "json",
				 	data: JSON.stringify({category: $("#category").val()}),
			 	success : function(msg) {
				 	//要执行的代码
				 	alert("成功"+msg);
			 }
			 });
		 },
		 invalidHandler: function(form, validator) {return false;}
	 }); 
});
</script>
<jsp:include page="../jsp/FooterJsp.jsp" />
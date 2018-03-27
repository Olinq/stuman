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
$(function() {
	//表单验证JS
	  $("#addForm").validate({
	    //出错时添加的标签
	    errorElement: "span",
	    rules: {
	      txtUserName: {
	        required: true,
	        minlength: 3,
	        maxlength: 16,
	        remote: {
	          type: "post",
	          url: "${ctx}/stuman/checkCategory",
	          data: {
	            username: function() {
	              return $("#category").val();
	            }
	          },
	          dataType: "html",
	          dataFilter: function(data, type) {
	            if (data == "true")
	              return true;
	            else
	              return false;
	          }
	        }
	      }
	    },
	    success: function(label) {
	      //正确时的样式
	      label.text(" ").addClass("success");
	    },
	    messages: {
	      txtUserName: {
	        required: "请输入用户名，3-16个字符（字母、数字、下划线），注册后不能更改",
	        minlength: "用户名长度不能小于3个字符",
	        maxlength: "用户名长度不能大于16个字符",
	        remote: "用户名不可用"
	      }
	    }
	  });
	});
</script>
<jsp:include page="../jsp/FooterJsp.jsp" />
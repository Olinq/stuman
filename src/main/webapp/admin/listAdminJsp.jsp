<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	
	<div style="margin-bottom:10px">
		<span class="label label-info" >管理员管理</span>		
		<div style="float:right;margin-bottom:10px">
		<form method="post" id="findDataForm" action="findAdminData">
			<table title="根据ID或者用户字查找">
				<tr>
					<td><input  id="findData" name="findData" type="text" class="form-control" placeholder="根据ID或者用户字查找" required="required"></td>
					<td> <button id="submit" type="submit" class="btn btn-info">查找</button></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>邮箱</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admins}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.username }</td>
					<td>${c.password}</td>
					<td>${c.email }</td>
					<td><a href="editAdmin?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="deleteAdminById?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
	<jsp:include page="../jsp/Page.jsp"/>
	</div>
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="addAdminForm" action="addAdmin">
	    		<table class="addTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="Adminusername" name="username" type="text" class="form-control"  required="required" placeholder="用户名长度不小于3"><span id="tishi"></span></td>
	    			</tr>
	    			<tr>
	    				<td>密&nbsp;码</td>
	    				<td><input  id="password" name="password" type="password" class="form-control"  required="required" placeholder="密码长度不小于3"></td>
	    			</tr>
	    			<tr>
	    				<td>再次输入密码</td>
	    				<td><input  id="twoPassword" name="twoPassword" type="password" class="form-control"  required="required" placeholder="密码长度不小于3"></td>
	    			</tr>
	    			<tr>
	    				<td>邮&nbsp;箱</td>
	    				<td><input  id="Adminemail" name="email" type="email" class="form-control"  required="required" ><span id="tishiEmail"></span></td>
	    			</tr>
	    			<tr>
	    				<td>所属社团</td>
	    				<td>
							<select name="assoId" id="selectAsso" >
							</select>
						</td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button id="submitAdmin" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	
</div>
<script type="text/javascript">
$(function(){
	setAssoSelect();
});
function setAssoSelect(){
	 var d = {"str":"setAssoSelect"};
	  var str= JSON.stringify(d);
	  $("#selectAsso").empty();  //清空原有select内的数据
	  $("#selectAsso").css({"size":"8"});
	  $("#selectAsso").append("<option value='0'>--请选择--</option>");
      $.ajax({
    	  url:"${ctx}/stuman/getAssoList",
    	  type:"POST",
    	  contentType: 'application/json;charset=UTF-8', 
    	  dataType:"json",
    	  data:str,  // 以json字符串方式传递
    	  success:function(data){
    		  var jsonArry=eval(data); //将json类型字符串转换为json对象
    		  console.log(jsonArry);
    		  console.log("------------------------");
    		  $.each(jsonArry,function(index,item){
    			    var id=item.id;          
    				var tname=item.tname
    			//  console.log(id);
    				$("#selectAsso").append('<option value="'+id+'">'+tname+'</option>');
    		  });
    		  $('#selectAsso').selectpicker('refresh');  
    	      $('#selectAsso').selectpicker('render');//强制使用该render方法重新渲染bootstrap-select ui 
    	  },
    	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
               alert("加载社团信息失败");
           }
      });
	
}
</script>
</body>
</html>
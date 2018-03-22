<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<script type="text/javascript">
$(function(){
	setAssoSelect();
});
function setAssoSelect(){
	 var d = {"str":"setAssoSelect"};
	  var str= JSON.stringify(d);
	  $("#selectAsso").empty();  //清空原有select内的数据
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
    				var username=item.username
    			//  console.log(id);
    				$("#selectAsso").append('<option value="'+id+'">'+username+'</option>');
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
<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增会员</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="addUser">
	    		<table class="addTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="username" name="username"  type="text" class="form-control">
	    				<span id="message"></span></td>
	    			</tr>
	    			<tr>
	    				<td>密&nbsp;码</td>
	    				<td><input  id="password" name="password" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>性&nbsp;别</td>
	    				<td><input  id="sex" name="sex" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>联系方式</td>
	    				<td><input  id="tel" name="tel" type="text" class="form-control"></td>
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
	    			<tr>
	    				<td>所属社团</td>
	    				<td>
							<select name="assoId" id="selectAsso">
							</select>
						</td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="right">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
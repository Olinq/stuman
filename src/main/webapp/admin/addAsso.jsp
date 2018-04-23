<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>

<div class="panel panel-warning addDiv" style="margin-top:100px">
	  <div class="panel-heading">新增社团</div>
	  <div class="panel-body">
	    	<form method="post" id="addAssoForm" action="addAsso" enctype="multipart/form-data">
	    		<table class="addTable">
	    			<tr>
	    				<td>社团名</td>
	    				<td><input  id="tname" name="tname"  type="text" class="form-control">
	    				<span id="tishi"></span></td>
	    			</tr>
	    			<tr>
	    				<td>社团描述</td>
	    				<td>
	    				<textarea id="description" name="description" class="form-control" rows="3" placeholder="不少于30字符"></textarea>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>Logo</td>
	    				<td>
	    					<input type="file" name="file"/>
						</td>
	    			</tr>
	    			<tr>
	    				<td>社团类型</td>
	    				<td>
							<select name="cid" id="AssoType" class="selectpicker">
							</select>
						</td>
	    			</tr>
    				<tr>
	    				<td>成立时间</td>
	    				<td>
							<input type="date" name="createtime"/>
						</td>
	    			</tr>
	    			<tr>
	    				<td>指导老师</td>
	    				<td>
							<input type="text" name="teacher"/>
						</td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="right">
	    					<button id="submitAsso" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	<script type="text/javascript">
$(function(){
	setAssoType();
});
function setAssoType(){
	var d = {"str":"setAssoSelect"};
	  var str= JSON.stringify(d);
	  $("#AssoType").empty();  //清空原有select内的数据
	  $("#AssoType").append("<option value='-1'>--请选择--</option>");
    $.ajax({
  	  url:"${ctx}/stuman/getCatagoryList",
  	  type:"POST",
  	  contentType: 'application/json;charset=UTF-8', 
  	  dataType:"json",
  	  data:str,  // 以json字符串方式传递
  	  success:function(data){
  		  var jsonArry=eval(data); //将json类型字符串转换为json对象
  		  console.log(jsonArry);
  		  console.log("--------addUser----------------");
  		  $.each(jsonArry,function(index,item){
  			    var id=item.id;          
  				var category=item.category
  			//  console.log(id);
  				$("#AssoType").append('<option value="'+id+'">'+category+'</option>');
  		  });
  		  $('#AssoType').selectpicker('refresh');  
  	      $('#AssoType').selectpicker('render');//强制使用该render方法重新渲染bootstrap-select ui 
  	  },
  	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
             alert("加载社团信息失败");
         }
    });
	
}
</script>
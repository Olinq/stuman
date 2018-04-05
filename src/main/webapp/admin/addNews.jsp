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
 <c:if test="${1==admin.lock}">    <!--如果为超级管理员则显示此项 -->
	<script type="text/javascript">
	$(function(){
		setAssoSelect();
	});
	function setAssoSelect(){
		 var d = {"str":"aid"};
		  var str= JSON.stringify(d);
		  $("#aid").empty();  //清空原有select内的数据
		  $("#aid").css({"size":"8"});
		  $("#aid").append("<option value='0'>--请选择--</option>");
	      $.ajax({
	    	  url:"${ctx}/stuman/getAdminList",
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
	    				$("#aid").append('<option value="'+id+'">'+username+'</option>');
	    		  });
	    		  $('#aid').selectpicker('refresh');  
	    	      $('#aid').selectpicker('render');//强制使用该render方法重新渲染bootstrap-select ui 
	    	  },
	    	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
	               alert("加载社团信息失败");
	           }
	      });
	}
	</script>
</c:if>
<div class="panel panel-warning addDiv" style="margin-top:100px">
	  <div class="panel-heading">新增活动信息</div>
	  <div class="panel-body">
	    	<form method="post" id="addNewsForm" action="addNews">
	    		<table class="addTable">
	    			<tr>
	    				<td>标题</td>
	    				<td><input  id="title" name="title"  type="text" class="form-control">
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>内容</td>
	    				<td><textarea id="content" name="content" class="form-control" rows="3"></textarea></td>
	    			</tr>
	    			<tr>
	    				<td>作者</td>
	    				<td><input  id="author" name="author" type="author" class="form-control"></td>
	    			</tr>
	    			<c:choose> 
					    <c:when test="${1==admin.lock}">    <!--如果 --> 
							<tr>
			    				<td>发布管理员</td>
			    				<td>
									<select name="aid" id="aid" class="selectpicker">
									</select>
								</td>
		    				</tr>
					 	</c:when>      
					   	<c:otherwise>  <!--否则 -->    
							<input type="hidden" name="aid" value="${admin.id}"/>
					  	</c:otherwise> 
					</c:choose>
	    			<tr class="submitTR">
	    				<td colspan="2" align="right">
	    					<button id="submitNews" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
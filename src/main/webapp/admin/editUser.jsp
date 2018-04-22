<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
<jsp:include page="../jsp/Navigator.jsp"/>
<div class="workingArea">
	<div class="panel panel-warning editDiv">
	  <div class="panel-heading">编辑管理员</div>
	  <div class="panel-body">
	    	<form method="post" id="addUserForm" action="updateUser">
	    		<table class="editTable">
	    			<tr>
	    				<td>用户名</td>
	    				<td><input  id="username" name="username" value="${user.username}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>真实姓名</td>
	    				<td><input  id="realname" name="realname" value="${user.realname}" type="text" class="form-control"></td>
	    			</tr>
	    			<tr>
	    				<td>专业年级</td>
	    				<td><input  id="uclass" name="uclass"  value="${user.uclass}" type="text" class="form-control" placeholder="例如：2014级计算机科学与技术2班"></td>
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
	    				<td>所属社团：${user.asso.tname}</td>
	    					<td>
								<select name="assoId" id="selectAsso" >
									<option value="${user.assoId }" selected></option>
								</select>
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
$(function(){
	setAssoSelect();
});
function setAssoSelect(){
	 var d = {"str":"setAssoSelect"};
	  var str= JSON.stringify(d);
	 // $("#selectAsso").empty();  //清空原有select内的数据
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
    				$("#selectAsso").append("<option value='"+id+"'>"+tname+"</option>");
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
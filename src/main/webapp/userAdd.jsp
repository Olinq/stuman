<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>
<main id="main">

		<div class="row topspace" >
			<div class="col-sm-9 col-sm-offset-2">
	    	<form action="${ctx}/user/AssertUserform" method="post" id="AssertUserform">
							<div class="form-group">
								<label for="inputName">用户名</label>
								<input type="text" class="form-control" name="username" id="inputName" placeholder="请用学号注册">
								<span id="tishiinputName" style="color:red"></span>
							</div>
							<div class="form-group">
								<label for="inputName">真实姓名</label>
								<input type="text" class="form-control" name="realname" >
							</div>
							<div class="form-group">
								<label for="inputEmail">密码</label>
								<input type="password" class="form-control" id="USERpassword" name="password" >
							</div>
							<div class="form-group">
								<label for="inputEmail">再次输入密码</label>
								<input type="password" class="form-control" name="twoPassword">
							</div>
							<div class="form-group">
								<label for="inputWeb">Email</label>
								<input type="email" class="form-control" id="email" name="email" >
								<span id="tishiinputEmail" style="color:red"></span>
							</div>
							<div class="form-group">
								<label for="inputWeb">性别</label><br>
								<select name="sex" id="sex" style="color:black">
									<option value="男" selected>男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="form-group" id="select">
								<label for="inputWeb">申请社团</label><span id="tishiselectAsso" style="color:red"></span><br>
								<select name="assoId" id="selectAsso">
								</select>
							</div>
							<div class="row">
								<div class="col-md-8 text-right">
									<input type="hidden" class="form-control" id="statu" name="statu" value="0" >
  									<button type="submit" class="btn btn-info">申请会员</button>
								</div>
							</div>
				</form>
			</div> 
		</div> <!-- /row post  -->

</main>
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
    	  url:"${ctx}/getAssoList",
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
    	  },
    	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
               alert("加载社团信息失败");
           }
      });
	
}
</script>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>

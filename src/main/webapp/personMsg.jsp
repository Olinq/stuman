<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>

<main id="main">
					
<div class="container" style="margin-bottom:200px">
				<div id="respond">
						<h3 id="reply-title">个人信息</h3><br/><br/>
						<form action="${ctx }/changeMsg" method="post" id="AssertUserform" class="">
							<div class="form-group">
								<label for="inputName">用户名</label>
								<input type="text" class="form-control" name="username" id="inputName" value="${user.username }">
							</div>
							<div class="form-group">
								<label for="inputName">真实姓名</label>
								<input type="text" class="form-control" name="realname" id="inputName" value="${user.realname }">
							</div>
							<div class="form-group">
								<label for="inputName">专业年级</label>
								<input type="text" class="form-control" name="uclass" id="inputName" value="${user.uclass }">
							</div>
							<div class="form-group">
								<label for="inputEmail">密码<i class="text-danger">*</i></label>
								<input type="password" class="form-control" name="password" id="inputEmail" value="${user.password }">
							</div>
							<div class="form-group">
								<label for="inputWeb">邮箱</label>
								<input type="email" class="form-control" name="email" id="inputWeb" value="${user.email }">
							</div>
							<div class="form-group">
							<label for="inputWeb">性别</label>
								<select name="sex" id="sex" class="selectpicker">
										<option value="男" <c:if test="${'男'==user.sex}">selected</c:if>>男</option>
										<option value="女" <c:if test="${'女'==user.sex}">selected</c:if>>女</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputWeb">所属社团：${user.asso.tname }</label>
								<input type="hidden" name="assoId" value="${user.assoId}">
							</div>
							<div class="row">
								<div class="col-md-8 text-right">
									<input type="hidden" name="statu" value="${user.statu}">
									<input type="hidden" name="id" value="${user.id}">
  									<button type="submit" class="btn btn-info">Submit</button>
								</div>
							</div>
						</form>
					</div> <!-- /respond -->
	</div>	<!-- /container -->
</main>
<script>
$().ready(function() {
	$("#commentform").validate({
		 onsubmit:true,// 是否在提交时验证
		 onfocusout:false,// 是否在获取焦点时验证
		 onkeyup :false,// 是否在敲击键盘时验证
		
		 rules: {//规则
		 username: {//要对应相对应的input中的name属性
			 required: true
		 },
		 realname:{
			 required: true,
		 },
		 password: {//要对应相对应的input中的name属性
			 required: true,
			 minlength:3
		 },
		 email: {//要对应相对应的input中的name属性
			 required: true,
			 email: true
		 },
		 
	 },
	 messages:{//验证错误信息
		 username: {
			 required: "请输入用户名",
		 },
		 realname:{
			 required: "请输入真实姓名",
		 },
		 password: {
			 required: "请输入密码",
		 },
		 email: {
			 required: "请输入电子邮件",
			 email:   "请输入正确邮箱"
		 },
		
	 },
	});
});
</script>
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>
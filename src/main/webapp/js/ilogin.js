$().ready(function() {
	loginInputrule();
});
function loginInputrule(){
	$("#form-signin").validate({
		 onsubmit:true,// 是否在提交时验证
		 onfocusout:false,// 是否在获取焦点时验证
		 onkeyup :false,// 是否在敲击键盘时验证
		
	 rules: {//规则
		 username: {//要对应相对应的input中的name属性
		 	required: true
		 },
		 password: {//要对应相对应的input中的name属性
			 required: true
		}
	 },
	 messages:{//验证错误信息
		 username: {
		 	required: "请输入用户名"
		 },
		 password: {
			required: "请输入密码"
		}
	 },
});
}
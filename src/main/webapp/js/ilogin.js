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
	 },submitHandler: function(form) { //通过之后回调
		//进行ajax传值
		 if($("#username").val()=="")return;
		  $.ajax({
	         	url : "checkAdminLogin",
	         	type : "post",
	         	contentType: "application/json; charset=utf-8", 
	         	dataType : "json",
	         	data: JSON.stringify({username: $("#username").val(),
	         						   password:$("#password").val()}),
	        	success : function(msg) {
	        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
	      		 	console.log(jsonArry);
	         		//要执行的代码
		         	if("true"==jsonArry.result+""){
		         		alert("success");
		         		window.location="listCategory";
		         	}else{
		         		$("#errorMsg").html("用户名或者密码错误");
		         		return false;
		         	}
	        }
	        });
	 },
		 invalidHandler: function(form, validator) {return false;}
});
}
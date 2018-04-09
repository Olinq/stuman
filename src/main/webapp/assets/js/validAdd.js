/**
 * 
 */

$(function(){
	valid();
	$("#tishiinputName").html("");
	$('#inputName').keyup(function(){
    	if($('#inputName').val()=="")return;
        $.ajax({
         	url : "checkUserUsername",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({username: $("#inputName").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
//	            	alert("checkAdminUsername");
	         		$("#tishiinputName").html("用户名不重复");
	         		$("#tishiinputName").css("color","green");
	         	}else{
	         		$("#tishiinputName").html("用户名已经存在");
	         		$("#tishiinputName").css("color","red");
	         	}
        }
        });
    });
});
//邮箱验证
$('#email').keyup(function(){
	var a=$(this).val();
	if(""==a)return;
    $.ajax({
     	url : "checkUseremail",
     	type : "post",
     	contentType: 'application/json;charset=UTF-8', 
     	dataType : "json",
     	data: JSON.stringify({email: $("#email").val()}),
    	success : function(msg) {
    		var jsonArry=eval(msg); //将json类型字符串转换为json对象
  		 	console.log(jsonArry);
  		//要执行的代码
         	if("true"==jsonArry.result+""){
//            	alert("checkAdminUsername");
         		$("#tishiinputEmail").html("邮箱可用");
         		$("#tishiinputEmail").css("color","green");
         	}else{
         		$("#tishiinputEmail").html("邮箱已经存在");
         		$("#tishiinputEmail").css("color","red");
         	}
    }
    });
});
function valid(){
	 $("#AssertUserform").validate({
		 onsubmit:true,// 是否在提交时验证
		 onfocusout:false,// 是否在获取焦点时验证
		 onkeyup :false,// 是否在敲击键盘时验证
		
		 rules: {//规则
		 username: {//要对应相对应的input中的name属性
			 required: true,
			 number:true,
			 digits:true
		 },
		 password: {//要对应相对应的input中的name属性
			 required: true,
			 minlength:3
		 },
		 twoPassword:{
			 required: true,
			 equalTo: "#USERpassword"
		 },
		 email: {//要对应相对应的input中的name属性
			 required: true,
			 email: true
		 },
		 assoId:{
			 min:1
		 }
	 },
	 messages:{//验证错误信息
		 username: {
			 required: "请输入类型名",
			 number:"请用学号注册，审核通过学号验证"
		 },
		 password: {
			 required: "请输入密码",
		 },
		 twoPassword:{
			 required: "请再次输入密码",
			 equalTo: "两次密码输入不一致"
		 },
		 email: {
			 required: "请输入电子邮件",
			 email:   "请输入正确邮箱"
		 },
		 assoId:{
			 min:"请选社团"
		 }
	 },
	});
}
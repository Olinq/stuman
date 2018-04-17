$().ready(function() {
	   rulesValid();//验证category输入框规则
	   check();//验证category名是否存在
});

function rulesValid(){
	 $("#categoryForm").validate({
		 onsubmit:true,// 是否在提交时验证
		 onfocusout:false,// 是否在获取焦点时验证
		 onkeyup :false,// 是否在敲击键盘时验证
		
	 rules: {//规则
		 category: {//要对应相对应的input中的name属性
		 required: true,
		 },
	 },
	 messages:{//验证错误信息
		 category: {
		 required: "请输入类型名",
		 }
	 },
 });
	 
	 $("#addNewsForm").validate({
		 onsubmit:true,// 是否在提交时验证
		 onfocusout:false,// 是否在获取焦点时验证
		 onkeyup :false,// 是否在敲击键盘时验证
		
	 rules: {//规则
		 title: {//要对应相对应的input中的name属性
		 required: true,
		 },
		 content:{
			 required:true
		 },
		 author:{
			 required:true
		 },
	 	aid:{
	   			min:1
	   	 }
	 },
	 messages:{//验证错误信息
		 title: {
		 required: "标题不能为空",
		 },
		 content:{
			required:"内容不能为空"
		 },
		 author:{
			 required:"作者不能为空"
		 },
	 		aid:{
	   			min:"请选择发布者"
	   	 }
	 },
 });
	 $("#addAdminForm").validate({
		 onsubmit:true,// 是否在提交时验证
		 onfocusout:false,// 是否在获取焦点时验证
		 onkeyup :false,// 是否在敲击键盘时验证
		
	 rules: {//规则
		 username: {//要对应相对应的input中的name属性
			 required: true
		 },
		 password: {//要对应相对应的input中的name属性
			 required: true,
			 minlength:3
		 },
		 twoPassword:{
			 required: true,
			 equalTo: "#password"
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
			 min:"请选择社团"
		 }
	 },
 });
 $("#addUserForm").validate({
	 onsubmit:true,// 是否在提交时验证
	 onfocusout:false,// 是否在获取焦点时验证
	 onkeyup :false,// 是否在敲击键盘时验证
	
	 rules: {//规则
	 username: {//要对应相对应的input中的name属性
		 required: true
	 }, 
	 realname:{
		 required:true
	 },
	 password: {//要对应相对应的input中的name属性
		 required: true,
		 minlength:3
	 },
	 twoPassword:{
		 required: true,
		 equalTo: "#password"
	 },
	 email: {//要对应相对应的input中的name属性
		 required: true,
		 email: true
	 },
	 assoId:{
		 min:1
	 },
	
 },
 messages:{//验证错误信息
	 username: {
		 required: "请输入用户名",
	 },
	
	 realname:{
		 required:"请输入真实姓名"
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
		 min:"请选择社团"
	 }
 },
});
 $("#addAssoForm").validate({
	 onsubmit:true,// 是否在提交时验证
	 onfocusout:false,// 是否在获取焦点时验证
	 onkeyup :false,// 是否在敲击键盘时验证
	
 rules: {//规则
	 tname: {//要对应相对应的input中的name属性
	 required: true,
	 },
	 description:{
		 required:true,
		 minlength:30
	 },
	 cid:{
		 min:1
	 }
 },
 messages:{//验证错误信息
	 tname: {
	 required: "请输入社团名",
	 },
	 description:{
		 required:"	请输入社团描述",
		 minlength:"社团描述不少于30个字符"
	 },
	 cid:{
		 min:"请选择社团类型"
	 }
 },
});
}
function msgSuccess(tishiId,validName,typeName){//输入框验证成功 
	$("#submit"+typeName).removeClass("disabled");
	tishiId.removeClass("error");
	tishiId.addClass("blue");
	tishiId.html("字段 "+validName+" 可用");
}
function msgError(tishiId,validName,typeName){//输入框验证失败
	tishiId.removeClass("blue");
	tishiId.addClass("error");
	tishiId.html("字段 "+validName+" 已经存在");
	$("#submit"+typeName).addClass("disabled");//设置提交按钮不可用
}
//验证字符长度
function lengthValid(a,typeName){
	if(""==a||a.length<3)
	{	$("#tishi").removeClass("blue");
		$("#tishi").addClass("error");
		$("#tishi").html("字符长度不小于3");
		$("#submit"+typeName).addClass("disabled");//设置提交按钮不可用
		return false;
	}
	return true;
}
function check(){
    $('#category').keyup(function(){
    	if(!lengthValid($(this).val(),"Category"))return;
        $.ajax({
         	url : "checkCategory",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({category: $("#category").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
	         		msgSuccess($("#tishi"),$("#category").val(),"Category");
	         	}else{
	         		msgError($("#tishi"),$("#category").val(),"Category");
	         		
	         	}
        }
        });
    });
    $('#Adminusername').keyup(function(){
    	if(!lengthValid($(this).val(),"Admin"))return;
        $.ajax({
         	url : "checkAdminUsername",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({username: $("#Adminusername").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
//	            	alert("checkAdminUsername");
	         		msgSuccess($("#tishi"),$("#Adminusername").val(),"Admin");
	         	}else{
	         		msgError($("#tishi"),$("#Adminusername").val(),"Admin");
	         	}
        }
        });
    });
    //邮箱验证
    $('#Adminemail').keyup(function(){
    	var a=$(this).val();
    	if(""==a)return;
        $.ajax({
         	url : "checkAdminemail",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({email: $("#Adminemail").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
//	            	alert("checkAdminUsername");
	         		msgSuccess($("#tishiEmail"),$("#Adminemail").val(),"Admin");
	         	}else{
	         		msgError($("#tishiEmail"),$("#Adminemail").val(),"Admin");
	         	}
        }
        });
    });
    
    $('#Userusername').keyup(function(){
    	if(!lengthValid($(this).val(),"User"))return;
        $.ajax({
         	url : "checkUserUsername",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({username: $("#Userusername").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
//	            	alert("checkAdminUsername");
	         		msgSuccess($("#tishi"),$("#Userusername").val(),"User");
	         	}else{
	         		msgError($("#tishi"),$("#Userusername").val(),"User");
	         	}
        }
        });
    });
    
    //邮箱验证
    $('#Useremail').keyup(function(){
    	var a=$(this).val();
    	if(""==a)return;
        $.ajax({
         	url : "checkUseremail",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({email: $("#Useremail").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
//	            	alert("checkAdminUsername");
	         		msgSuccess($("#tishiEmail"),$("#Useremail").val(),"User");
	         	}else{
	         		msgError($("#tishiEmail"),$("#Useremail").val(),"User");
	         	}
        }
        });
    });
    
    $('#tname').keyup(function(){
    	if(""==$(this).val())return;
        $.ajax({
         	url : "checkAssoname",
         	type : "post",
         	contentType: 'application/json;charset=UTF-8', 
         	dataType : "json",
         	data: JSON.stringify({tname: $("#tname").val()}),
        	success : function(msg) {
        		var jsonArry=eval(msg); //将json类型字符串转换为json对象
      		 	console.log(jsonArry);
         		//要执行的代码
	         	if("true"==jsonArry.result+""){
//	            	alert("checkAdminUsername");
	         		msgSuccess($("#tishi"),$("#tname").val(),"Asso");
	         	}else{
	         		msgError($("#tishi"),$("#tname").val(),"Asso");
	         	}
        }
        });
    });
}

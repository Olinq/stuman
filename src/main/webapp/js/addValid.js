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
		 required: true
		 },
	 },
	 messages:{//验证错误信息
		 category: {
		 required: "请输入类型名"
		 }
	 },
 });
}
function msgSuccess(tishiId,validName){//输入框验证成功 
	$("#submit").removeClass("disabled");
	tishiId.removeClass("error");
	tishiId.addClass("blue");
	tishiId.html("字段 "+validName+" 可用");
}
function msgError(tishiId,validName){//输入框验证失败
	tishiId.removeClass("blue");
	tishiId.addClass("error");
	tishiId.html("字段 "+validName+" 已经存在");
	$("#submit").addClass("disabled");//设置提交按钮不可用
}
function check(){
    $('#category').keyup(function(){
        var a=$(this).val();
        if(""==a)return;
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
	         		msgSuccess($("#tishi"),$("#category").val());
	         	}else{
	         		msgError($("#tishi"),$("#category").val());
	         	}
        }
        });
    });
}

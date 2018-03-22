/**
 * 
 */
$(function(){
	$("#username").blur(function(){
		alert($("#username").val());
		checkName();
	});
	
});
function checkName(){
		   $.ajax({
		    	  url:"${ctx}/stuman/checkUsername",
		    	  type:"POST",
		    	  contentType:'application/json;charset=UTF-8', 
		    	  dataType:"json",
		    	  data:{"username":username},  // 以json字符串方式传递
		    	  async: false,//是否异步
		    	  success:function(data){
		    		  console.log(data);
		  			if("true"!=data){
		  				tishi.innerHTML="<font color='red'>" + name + "已被注册，请更换！</font>";
		  				 $("#username").empty();
		  			}else{
		  				tishi.innerHTML="<font color='red'>" + name + "可以注册！</font>"
		  			} 
		    	  },
		    	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
		    		  alert("请求数据库失败");
		           }
		      });
	}
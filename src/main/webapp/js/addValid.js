///**
// * 
// */
//	$("#category").blur(function(){
//		alert($("#category").val());
//		var data=valid("checkCategory",$("#category").val());
//		console.log(data);
//	});
//
//	
//	function valid(url,data){
//		var d = {"validData":data};
//		var validData= JSON.stringify(data);
//		 $.ajax({
//		  	  url:"${ctx}/stuman/"+url,
//		  	  type:"POST",
//		  	  contentType: 'application/json;charset=UTF-8', 
//		  	  dataType:"json",
//		  	  data:validData,  // 以json字符串方式传递
//		  	  success:function(datas){
//		  		  var jsonArry=eval(datas); //将json类型字符串转换为json对象
//		  		  console.log(jsonArry);
//		  		  return jsonArry;
//		  	  },
//		  	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
//		             alert("加载信息失败");
//		         }
//		    });	
//		
//	}
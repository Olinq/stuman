$(function(){
	setAssoSelect();
});
function setAssoSelect(){
	 var d = {"str":"你多大"};
	  var str= JSON.stringify(d);
	  $("#selectAsso").empty();  //清空原有select内的数据
	  $("#selectAsso").append("<option value='-1'>--请选择--</option>");
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
    				var username=item.username
    			//  console.log(id);
    				$("#selectAsso").append('<option value="'+id+'">'+username+'</option>');
    			//  $("#selectAsso").append("<option value='"+id+"'>"+username+"</option>");
    		  });
    	  },
    	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
               alert("加载社团信息失败");
           }
      });
	
}

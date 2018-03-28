<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
    <nav class="navbar navbar-fixed-top navbar-inverse bs-dark">
        <div class="navbar-header">
          <a class="navbar-brand" style="color:white" href="#">社团后台管理</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li>
              <a href="listCategory">社团类型管理</a>
            </li>
            <li  class="dropdown">
            	<a href="listAsso" class="dropdown-toggle" data-toggle="" role="button" aria-haspopup="true" aria-expanded="false">社团管理<span class="caret"></span></a>
            	 <ul class="dropdown-menu" id="typeId">
                <li><a href="#">Profile</a></li>
                <li><a href="#">Inbox</a></li>
                <li><a href="#">Followers</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Settings</a></li>
              </ul>
            </li>
            <li><a href="listAdmin">管理员管理</a></li>
            <li><a href="listUser">用户管理</a></li>
          </ul>
          <form class="navbar-form navbar-left form-horizontal" role="search">
              <div class="input-group">
                 <input type="text" class="search-box" placeholder="Search">
                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
              </div>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle navbar-img" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              Account 
             
              </a>
            </li>
          </ul>
        </div>
    </nav>
   <script>
$(function(){
	var d = {"str":"你多大"};
	  var str= JSON.stringify(d);
	  $("#typeId").empty();  //清空原有select内的数据
	  $("#typeId").css({"height":"500px","overflow-y":"auto"}); 
    $.ajax({
  	  url:"${ctx}/stuman/getCatagoryList",
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
  				var category=item.category;
  				 $("#typeId").append("<li><a href='getListByCid?id="+id+"'>"+category +"</a></li>");
  				 if(index%5==0&&index!=0){
  					$("#typeId").append("<li role='separator' class='divider'></li>");
  				 }
  					 
  		  });
  	  },
  	  error:function(XMLHttpRequest,textStatus, errorThrown) { 
             alert("加载导航栏下拉框信息失败");
         }
    });	
}
);
</script> 
    
<!-- 
<div class="navitagorDiv">
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	
		<a class="navbar-brand" href="#nowhere" style="color:white">社团后台管理</a>
		<a class="navbar-brand" href="listCategory">社团类型管理<b class="caret"></b> </a>
		<a class="navbar-brand" href="listAsso">社团管理</a>
		<a class="navbar-brand" href="listAdmin">管理员管理</a>
		<a class="navbar-brand" href="listUser">用户管理</a>
	</nav>
</div> -->
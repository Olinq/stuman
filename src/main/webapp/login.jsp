<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生社团管理系统</title>
  	<script src="./webjars/jquery/3.1.1/jquery.min.js"></script>
    <link href="./webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="./webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
    <link href="./css/logincss/ilogin.css"  rel="stylesheet"/>
    <script src="./js/ilogin.js"></script>
    <!-- jQueryValidate -->
    <script src="./js/jQueryValidate/jquery.validate.min.js"></script>
    <script src="./js/jQueryValidate/messages_zh.js"></script>
</head>
<body style="">
<div id="fullscreen_bg" class="fullscreen_bg">
 <form id="form-signin" class="form-signin" action="checkAdminLogin" method="post">
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
         <h3 class="text-center">
                        管理员登录<br/><br/></h3> 
                        <span id="errorMsg" style="color:red">${login}</span>
        <div class="form-group">                
        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>
                            </span>
                            <input id="username" name="username" type="text" class="form-control" placeholder="Use Name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            <input id="password" name="password" type="password" class="form-control" placeholder="Password" />
                        </div>   
                        </div>

		<button id="login" class="btn btn-lg btn-primary btn-block" type="submit">
            Login
		</button>
     </div>
                </div>
               </div>
        </div>
    </div>
</form>
</div>
<script>
</script>
</body>
</html>
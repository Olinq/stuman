<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<span class="navbar-brand"><b style="font-size:22px;color:white;">学生社团</b></span>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class=""><a href="#">主页</a></li>
					<li class=""><a href="#">社团</a></li>
					<li class=""><a href="#">关于</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
							登录<span class="caret"></span>
						</a>
						<div class="dropdown-menu" id="formLogin">
							<div class="row">
								<div class="container-fluid">
									<form>
										<div class="form-group">
											<label>用户名</label>
											<input class="form-control" name="username" id="username" type="text">
										</div>
										<div class="form-group">
											<label>密码</label>
											<input class="form-control" name="password" id="password" type="password"><br>
										</div>
										<button type="submit" id="btnLogin" class="btn btn-primary btn-lg btn-block">登录</button>
									</form>
								</div>
							</div>
						</div>
					</li>
					<li><a href="#" data-toggle="modal" data-target='#modalRegister'>注册</a></li>
				</ul>
				
			</div><!--/.navbar-collapse -->
		</div>
	</nav>
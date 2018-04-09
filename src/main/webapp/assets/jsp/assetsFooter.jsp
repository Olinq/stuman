<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<footer id="footer" style="height:60px;padding:20px 20px;margin-bottom:0px">
	<div>
		<div class="row" style="text-align:center;height:30px" >
			<div class="col-md-12"">
					<p>电话:&nbsp;+234 23 9873237&nbsp;&nbsp;&nbsp;
						邮箱:&nbsp;<a href="mailto:#">some.email@somewhere.com</a>&nbsp;&nbsp;&nbsp;
					地址:&nbsp;广东省广州市花都区新华街道学府路1号华南理工大学广州学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Copyright &copy; 2018, One awesome name here &nbsp;&nbsp;&nbsp;
					 <a href="login.jsp" rel="designer">后台登录</a> 
					</p>
			</div>
		</div> <!-- /row of widgets -->
	</div>
</footer>
<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<script src="${ctx}/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="${ctx}/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/template.js"></script>
<script src="${ctx}/assets/js/ui.js"></script>
<!-- bootstrap-select 插件 -->
<script src="${ctx}/js/bootstrap-select/bootstrap-select.min.js"></script>
<link href="${ctx}/js/bootstrap-select/bootstrap-select.min.css"  rel="stylesheet">
<!-- 组件中文化 -->
<script src="${ctx}/js/bootstrap-select/defaults-zh_CN.min.js"></script>
<!-- jQueryValidate -->
<script src="${ctx}/js/jQueryValidate/jquery.validate.min.js"></script>
<script src="${ctx}/js/jQueryValidate/messages_zh.js"></script>
 <link href="${ctx}/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">	
 <script src="${ctx}/assets/js/validAdd.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div id="templatemo_footer_wrapper">
    <div id="templatemo_footer" class="row">
		    <div class="col-md-14" id="copyright">
    			<ul>
				<li><a href="#" title="关于本站">关于本站</a>　|　<a href="#" title="联系我们">联系我们</a>　|　<a href="http://jwxt.gcu.edu.cn/" title="网站地图" target="_blank">教务系统</a>　|　<a href="http://www.gcu.edu.cn/" title="友情链接">学校官网</a>　|　<a href="${ctx }/" title="学生社团管理">返回首页</a></li>
				<li><p>电话:&nbsp;+234 23 9873237&nbsp;&nbsp;&nbsp;
						邮箱:&nbsp;<a href="mailto:#">some.email@somewhere.com</a>&nbsp;&nbsp;&nbsp;
					地址:&nbsp;广东省广州市花都区新华街道学府路1号华南理工大学广州学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Copyright &copy; 2018, One awesome name here &nbsp;&nbsp;&nbsp;
					 <a href="${ctx }/login.jsp" rel="designer">后台登录</a> 
					</p>
				</li>
				</ul>
			</div>
			<!--  
			<div class="col-md-14">
					<p>电话:&nbsp;+234 23 9873237&nbsp;&nbsp;&nbsp;
						邮箱:&nbsp;<a href="mailto:#">some.email@somewhere.com</a>&nbsp;&nbsp;&nbsp;
					地址:&nbsp;广东省广州市花都区新华街道学府路1号华南理工大学广州学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Copyright &copy; 2018, One awesome name here &nbsp;&nbsp;&nbsp;
					 <a href="login.jsp" rel="designer">后台登录</a> 
					</p>
			</div>
			-->
		</div> <!-- /row of widgets -->
		<div id="bottomLine"></div>
    </div>
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
 <!-- 图片滚动 -->
<script src="${ctx}/assets/js/slider.js"></script>
		<script type="text/javascript">
	$(function(){
		//默认状态下左右滚动
		$("#s1").xslider({
			unitdisplayed:4,
			movelength:1,
			unitlen:176,
			autoscroll:1800
		});
	
	})
	</script>
 
</body>
</html>
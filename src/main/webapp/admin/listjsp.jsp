<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../jsp/HeadJsp.jsp"></jsp:include>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/bootstrapTablecss/demo.css">
<script type="text/javascript" src="../js/bootstrapTablejs/bootstable.js"></script>

<div class="container">
	<div class="row">
		<div class="col-md-12" style="padding:2em 0;">
			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="mytable">
					<thead>
					  <tr>
						<td>姓名</td>
						<td>年龄</td>
						<td>email</td>
					  </tr>
					</thead>
					<tbody>
					  <tr>
						<td>张三</td>
						<td>25</td>
						<td>zs@163.com</td>
					  </tr>
					  <tr>
						<td>李四</td>
						<td>23</td>
						<td>lisi@qq.com</td>
					  </tr>
					  <tr>
						<td>王五</td>
						<td>24</td>
						<td>ww@126.com</td>
					  </tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-12"  style="padding-bottom:2em;">
			<button class="btn btn-info" id="add"><i class="fa fa-plus"></i> 添加新的表格行</button>
		</div>
	</div>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$('#mytable').SetEditable({
		$addButton: $('#add')
	});
</script>
</body>
</html>
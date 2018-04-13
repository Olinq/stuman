<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose> 
    <c:when test="${1==admin.lock}">    <!--如果 --> 
		<jsp:include page="../jsp/HeadJsp.jsp"/>
		<jsp:include page="../jsp/Navigator.jsp"/>
 	</c:when>      
   	<c:otherwise>  <!--否则 -->    
		<jsp:include page="../usualAdmin/listUsualAdminHead.jsp"/>
  	</c:otherwise> 
</c:choose>
<div class="workingArea">
	<div class="panel panel-warning editEditorDiv">
	  <div class="panel-heading">编辑活动信息</div>
	  <div class="panel-body">
	    	<form method="post" id="addNewsForm" action="updateNews" onsubmit="return uptext()">
	    		<table class="editTable">
	    			<tr><td>
	    				<select name="isannou" id="isannou" class="selectpicker">
							<option value="0" <c:if test="${news.isannou==0}">selected</c:if>>社团新闻</option>
							<option value="2" <c:if test="${news.isannou==2}">selected</c:if>>学校新闻</option>
							<option value="1" <c:if test="${news.isannou==1}">selected</c:if>>通知</option>
						</select>
						</td>
					</tr>
	    			<tr>
	    				<td>标题:<input  id="title" name="title" value="${news.title}" type="text" class="form-control" placeholder="密码长度不小于6"></td>
	    			</tr>	
	    			<tr>
	    				<td>内容
	    				 <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
						<script type="text/javascript">
								var ue = UE.getEditor('editor');
								ue.addListener("ready", function () {
							        // editor准备好之后才可以使用
							        ue.setContent('${news.content}');

								});
							    //实例化编辑器
							    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
							    
							    function uptext(){
							        if (!UE.getEditor('editor').hasContents()){
							        	alert('请先填写内容!');
							        	return false;
							        }else{
							        	$("#content").val(UE.getEditor('editor').getContent());
							        	$("#contentText").val(UE.getEditor('editor').getContentTxt());
							        	return true
							        }
							      }
	    				    </script>
	    				    <input type="hidden" id="content" name="content"  class="form-control"> </input>
	    				    <input id="contentText" name="contentText"  type="hidden" class="form-control"></input>
	    				    
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<input type="hidden" name="id" value="${news.id}">
	    					<button id="submitNews" type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>	
</div>
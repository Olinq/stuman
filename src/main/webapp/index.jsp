<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="./assets/jsp/assetsHeader.jsp"/>
<jsp:include page="./assets/jsp/header.jsp"/>

<div id="templatemo_wrapper" class="bg">
	
    
    <div id="templatemo_left_sidebar">
    	<div class="sb_box">
          <div class="content_title"><span></span>社团类型</div>
            <ul class="tmo_list">
                <c:forEach items="${categorys}" var="ca">
						<li><a href="${ctx }/team?cid=${ca.id}">${ca.category}</a></li>
				</c:forEach>
            </ul>
            <a href="${ctx }/team/all" class="read_more" style="margin-top: 2;margin-bottom:20px"></a>
		</div>
		
		<div class="cleaner"></div>        
        <a href="http://www.gcu.edu.cn/" class="sb_ads"><img src="./assets/images/templatemo_ad_2.jpg" alt="image 2"  style="box-shadow:0 0 20px 0 #000000;"/></a>
        <a href="#" class="sb_ads"><img src="./assets/images/templatemo_ad_1.jpg" alt="image 1" style="box-shadow:0 0 20px 0 #000000;"/></a><br>
    
    </div> <!-- end of left sidebar -->
    
    <div id="templatemo_content">
    	<div class="content_title"><span></span>欢迎来到学生社团联合会</div>
        <div class="p_box">
        	<h2>Donec consequat scelerisque nunc</h2>
          <div class="image_frame"><a href="#"><img src="./assets/images/templatemo_image_01.jpg" alt="image 3" /></a></div>
            Gift Red is free website template by templatemo.com for everyone. Feel free to edit and use this template for any purpose. Lorem ipsum dolor sit amet, consect esttur sadipiscing elitnec.<a href="#" class="read_more"></a>
          <div class="cleaner"></div>
		</div>
        <div class="p_box">
        	<h2>Sed volutpat consectetur vehicula</h2>
          <div class="image_frame"><a href="#"><img src="./assets/images/templatemo_image_01.jpg" alt="image 4" /></a></div>
          Vivamus tempor tortor ac est convallis iaculis in sed tortor. Etiam luctus quam in arcu adipiscing auctor. Sed quis justo id magna pretium elementum vitae.<a href="#" class="read_more"></a>
          <div class="cleaner"></div>
		</div>
        <div class="p_box">
        	<h2>Cras dapibus ullamcorper est</h2>
          <div class="image_frame"><a href="#"><img src="./assets/images/templatemo_image_02.jpg" alt="Gift Red" /></a></div>
          Pellentesque non augue eu nibh gravida blandit. In non velit a justo blandit mollis in in erat. Duis dignissim risus in lorem bibendum sed suscipit metus.<a href="#" class="read_more"></a>
          <div class="cleaner"></div>
		</div>   	
    
    </div> <!-- end of content -->
    
    <div id="templatemo_right_sidebar">
    	<div class="content_title"><span></span>社团新闻</div>
        <div class="news_box">
        	<c:forEach items="${newss}" var="news">
        	<p><a href="${ctx }/active/content?id=${news.id}" style="color:#033772">${news.title}</a></p>
            </c:forEach>
			<a href="${ctx }/active" class="more">more</a>
            <div class="cleaner"></div>
		</div>
       
        <div id="special_box">
            <img src="${ctx }/img/logo/社联.jpg"  style="box-shadow:0 0 1px 0 #000000;"/>
            <div class="cleaner"></div>
        </div>	
    </div> <!-- end of right sidebar -->
	<div class="scrolllist" id="s1" style="clear:both"> 
		<a class="abtn aleft" href="#left" title="左移"></a>
		  <div class="imglist_w">
		    <ul class="imglist" style="left: -293.424px;">
			    <c:forEach items="${assos }" var="asso">
			      <li> <a href="${ctx }/about?id=${asso.id}"><img width="150" height="150" src="${ctx }/img/logo/${asso.logo}"></a>
			        <p><a href="#">${asso.tname}</a></p>
			      </li>
			     </c:forEach>
		    </ul>
		    <!--imglist end--> 
		  </div>
		  <a class="abtn aright" href="#right" title="右移"></a> 
	</div>
		<!--scrolllist end-->
	
</div> <!-- end of wrapper -->
<jsp:include page="./assets/jsp/assetsFooter.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="pageNav">
	<span class="navbar-brand">总记录数：${pageInfo.total }</span>
  <ul class="pagination">
  <!-- 首页 -->
    <li <c:if test="${!pageInfo.hasPreviousPage}">class="btn disabled"</c:if>>
      <a href="?page=${pageInfo.firstPage}" aria-label="Previous"
      	<c:if test="${!pageInfo.hasPreviousPage}">class="btn disabled"</c:if>>
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <!-- 上一页 -->
    <li <c:if test="${!pageInfo.hasPreviousPage}">class="btn disabled"</c:if>>
      <a  href="?page=${pageInfo.prePage}" aria-label="Previous" 
      	<c:if test="${!pageInfo.hasPreviousPage}">class="btn disabled"</c:if>>
        <span aria-hidden="true">&lsaquo;</span>
      </a>
    </li>    

         <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接
           //导航页码数  navigatePages;
         -->  
        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">  
            <c:if test="${page_num == pageInfo.pageNum}">  
                <li class="active"><a href="#">${page_num}</a></li>  
            </c:if>  
            <c:if test="${page_num != pageInfo.pageNum}">  
                <li><a href="?page=${page_num}">${page_num}</a></li>  
            </c:if>  
        </c:forEach> 
	<!-- 下一页 -->
    <li <c:if test="${!pageInfo.hasNextPage}">class="disabled"</c:if>>
      <a href="?page=${pageInfo.nextPage}" aria-label="Next"
      	<c:if test="${!pageInfo.hasNextPage}">class="btn disabled"</c:if>>
        <span aria-hidden="true">&rsaquo;</span>
      </a>
    </li>
    <!-- 尾页 -->
    <li <c:if test="${!pageInfo.hasNextPage}">class="disabled"</c:if>>
      <a href="?page=${pageInfo.lastPage}" aria-label="Next"
      	<c:if test="${!pageInfo.hasNextPage}">class="btn disabled"</c:if>>
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

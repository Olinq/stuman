<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../jsp/HeadJsp.jsp"/>
   <nav class="navbar navbar-fixed-top navbar-inverse bs-dark">
        <div class="navbar-header">
          <a class="navbar-brand" style="color:white" href="#">社团后台管理</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li>
              <a href="listSomeAsso${admin.assoId}">社团管理</a>
            </li>
            <li><a href="listSome?${admin.id}">用户管理</a></li>
             <li><a href="listSomeNews?${admin.id}">活动信息管理</a></li>
            </ul>
         
          <div class="nav navbar-brand navbar-right" style="margin-right:30px">
              <a href="logout" style="color:white" role="button">
             	注销 
              </a>
          </div>
        </div>
    </nav>
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
              <a href="listSomeAsso">社团管理</a>
            </li>
            <li><a href="listSomeUser">用户管理</a></li>
             <li><a href="listSomeNews">活动信息管理</a></li>
          </ul>
        <ul class="nav navbar-nav navbar-right" style="margin-right:30px">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"  style="color:#84C2FF">
                    ${sessionScope.admin.username}
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu" style="text-align:center">
                    <li><a href="#">修改信息</a></li>
                </ul>
            </li>
            <li></li>
            <li><a href="logout" >
	             	注销
				</a>
			</li>
        </ul>
    </div>
    </nav>
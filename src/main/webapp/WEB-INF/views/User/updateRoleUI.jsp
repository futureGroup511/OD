<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<title>yemian12</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/yemian12.css">
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-2 col-lg-offset-6 col-md-3 col-md-offset-6 col-xs-5  col-xs-offset-1">
            <p>当前位置：管理员>>修改角色信息</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
<div class="container-one">
  <div class="row form">
  

  	<form:form action="${pageContext.request.contextPath }/user/updateRole" method="POST" modelAttribute="role">
  		<form:hidden path="roleId"/>
    	<div class="col-lg-2 col-lg-offset-3 col-md-3 col-md-offset-3 col-xs-3 col-xs-offfet-3">
        	名称：<form:input path="roleName" class="navbar-link"/>
        </div>
        <div class="col-lg-1  col-md-1 col-xs-2">
        	<input type="submit" class="btn btn-primary btn-xs" value="提交">
        </div>
    </form:form>
    </div>
  </div>
</div>
</body>
</html>
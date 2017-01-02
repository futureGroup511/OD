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
        <div class="col-lg-3 col-lg-offset-7 col-md-3 col-md-offset-6 col-xs-3  col-xs-offset-7">
            <p>当前位置：管理员>>增加角色信息</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-2">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
<div class="container-one">
  <div class="row form">
  

  	<form:form action="${pageContext.request.contextPath }/user/addRole" method="POST" modelAttribute="role">
    	<div class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-3 col-xs-3 col-xs-offfet-3">
        	名称：<input type="text" class="navbar-link" name="roleName">
        </div>
        <div class="col-lg-1  col-md-1 col-xs-1" style="margin-left: -3%;">
        	<input type="submit" class="btn btn-primary btn-xs" value="提交">
        </div>
    </form:form>
    </div>
  </div>
</div>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加角色</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath }/user/addRole" method="POST" modelAttribute="role">
	名称：<input type="text" name="roleName">
	<input type="submit" value="提交">
</form:form>
 
</body>
</html> --%>
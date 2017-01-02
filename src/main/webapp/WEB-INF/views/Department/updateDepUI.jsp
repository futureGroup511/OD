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
            <p>当前位置：管理员>>修改单位信息</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
<div class="container-one">
  <div class="row form">
  	
		
  	<form:form action="${pageContext.request.contextPath }/department/updateDep" method="POST" modelAttribute="department">
    		<form:hidden path="depId"/>
    	<div class="col-lg-2 col-lg-offset-3 col-md-3 col-md-offset-3 col-xs-3 col-xs-offfet-3">
        	名称：
        	<form:input class="navbar-link" path="depName"/>
        </div>
        <div class="col-lg-2 col-lg-offset-1 col-md-3 col-md-offset-1 col-xs-3 col-xs-offfet-1">
        	分管者：
        	<form:input path="depManager" class="navbar-link"/>
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




<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改单位</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
 $(function(){
	 alert("123");
	  
 })
</script>
</head>
<body>
<form:form action="${pageContext.request.contextPath }/department/updateDep" method="POST" modelAttribute="department">
		<form:hidden path="depId"/>
	名称：<form:input path="depName"/>
	分管者：<form:input path="depManager"/>
	<input type="submit" value="提交">
</form:form>

</body>
</html> --%>
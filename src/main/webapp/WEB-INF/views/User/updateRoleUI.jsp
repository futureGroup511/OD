<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加角色</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath }/user/updateRole" method="POST" modelAttribute="role">
	<form:hidden path="roleId"/>
	名称：<form:input path="roleName"/>
	<input type="submit" value="提交">
</form:form>
 
</body>
</html>
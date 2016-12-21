<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加单位</title>
</head>
<body>
<form:form action="addDep" method="POST" modelAttribute="department">
	名称：<input type="text" name="depName">
	分管者：<input type="text" name="depManager">
	<input type="submit" value="提交">
</form:form>

</body>
</html>
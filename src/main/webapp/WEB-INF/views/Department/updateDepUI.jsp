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
</html>
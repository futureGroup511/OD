<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆</title>
</head>
<body>
${message }
<script type="text/javascript">
//在被嵌套时就刷新上级窗口
if(window.parent != window){
	//window.parent.location.reload(true);
	window.parent.location.href="http://localhost:8080/OD";
}
</script>
<form action="${pageContext.request.contextPath }/user/login" method="post">
	账号：<input type="text" name="username">
	密码：<input type="text" name="password">
	<input type="submit" value="登陆">
</form>
</body>
</html>
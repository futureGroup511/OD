<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
</head>
<body>
${message }
<script type="text/javascript">
	
	//在被嵌套时就刷新上级窗口
	if(window.parent != window){
		//window.parent.location.reload(true);
		window.parent.location.href='$("#address").val()';
	}
 

	function checkReg(){
		var loginName = document.frm.username.value;
		var password = document.frm.password.value;
		if( loginName == ""){
			alert("请输入账号！");
			return false;
		}
		if(password == ""){
			alert("请输入密码！");
			return false;
		}
		return true;
	}

</script>

<form name="frm" action="${pageContext.request.contextPath }/user/login" method="post" onsubmit="return checkReg()">
	<input type="hidden" id="address" value="<%=basePath %>">
	账号：<input type="text" name="username" id="username" />
	密码：<input type="password" name="password" id="password" />
	<input type="submit" value="登陆">
</form>
</body>
</html>
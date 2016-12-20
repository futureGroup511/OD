<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎访问组织部互评系统</title>
</head>
<frameset rows="16%,*" cols="100%" frameborder="no" border="0" framespacing="0">
	 <frame src="" scrolling="no"></frame>

<frameset cols="15%,85%" rows="100%" frameborder="yes"  framespacing="1">
	<frame src="${pageContext.request.contextPath }/user/returnMeun" scrolling="no" ></frame>
    <frame src="" frameborder="yes" name="right" framespacing="1"></frame>
    </frameset>
    <noframes></noframes>

</html>
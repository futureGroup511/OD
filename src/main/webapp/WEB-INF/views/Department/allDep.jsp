<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有单位</title>
</head> 
<body>
查询所有单位
<a href="addDepUI">添加单位</a>
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
	    <td>名称</td>
	    <td>分管人</td>
	    <td>编辑</td>

	</tr>

	<c:forEach items="${depList }" var="dep">
		<tr>
			<td>${dep.depName }</td>
			<td>${dep.depManager }</td>
			<td>
				<a href="updateDepUI/${dep.depId }">修改</a> &nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/user/deleteDep/${dep.depId }">删除</a>
			</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有角色</title>
</head>
<body>
查询所有角色
<a href="${pageContext.request.contextPath }/user/addRoleUI">添加角色</a>
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
	    <td>id</td>
	    <td>名称</td>
	    <td>编辑</td>

	</tr>
 
	<c:forEach items="${roleList }" var="role" varStatus="id">
		<tr>
			<td>${id.count }</td>
			<td>${role.roleName }</td>
			<td>
				<a href="${pageContext.request.contextPath }/user/updateRoleUI/${role.roleId }">修改</a> &nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/user/deleteRole/${role.roleId }">删除</a> 
			</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询所有用户</title>
</head>
<body>
查询所有用户===${sessionScope.user.userName }
<a href="addUserUI">增加用户</a>
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
	    <td>姓名</td>
	    <td>账号</td>
	    <td>角色</td>
	    <td>单位</td>
	    <td>职务</td>
	    <td>正/副</td>
	    <td>述职报告</td>
	    <td>描述</td>
	    <td>编辑</td>
	</tr>

	<c:forEach items="${userList }" var="user">
		<tr>
			<td>${user.userName }</td>
			<td>${user.userNum }</td>
			<td>${user.role.roleName }</td>
			<td>${user.department.depName }</td>
			<td>${user.userDuty }</td>
			<td>
				<c:if test="${user.userNp ==0 }">正</c:if>
				<c:if test="${user.userNp ==1 }">副</c:if>
			</td>
			<td>${user.userReport }</td>
			<td>${user.userDesc }</td>
			<td><a href="updateUserUI/${user.userId }">修改</a></td>
		</tr>
	</c:forEach>

</table>
</body>
</html>
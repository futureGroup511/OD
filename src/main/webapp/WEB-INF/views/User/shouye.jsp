<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎访问组织部互评系统</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/user/getAllUser">查看所有用户信息</a>
<a href="${pageContext.request.contextPath }/department/getAllDep">查看所有单位信息</a>

<br>
<c:if test="${sessionScope.user.userRole == 1 }">
校正厅两类
<a href="${pageContext.request.contextPath }/user/xzAllzUI">所有正职</a>
<a href="${pageContext.request.contextPath }/user/xzAllFenGuanUI">分管单位</a>
</c:if>
<c:if test="${sessionScope.user.userRole == 2 }">
<a href="${pageContext.request.contextPath }/user/xfAllFenGuanUI">校副厅1类对分管单位</a>
</c:if>




<c:if test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 0}">
党群部门 正<br>
<a href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">评价所有正职</a><br>

党群部门 正评价本单位所有副职
</c:if>
<c:if test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 1}">
党群部门 副
</c:if>
<c:if test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 0}">
教学书记 正
</c:if>
<c:if test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 1}">
教学书记 副
</c:if>
<c:if test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 0}">
行政教辅部门 正
</c:if>
<c:if test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 1}">
行政教辅部门 副
</c:if>
<c:if test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 0}">
院系院长 正
</c:if>
<c:if test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 1}">
院系院长 副
</c:if>
<br>

</body>
</html>
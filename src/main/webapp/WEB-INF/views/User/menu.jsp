<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.user.userRole == 7 }">
		<a target="right"
			href="${pageContext.request.contextPath }/user/getAllUser">查看所有用户信息</a>
		<br>
		<a target="right" href="${pageContext.request.contextPath }/department/getAllDep">查看所有单位信息</a><br>
		<a target="right" href="${pageContext.request.contextPath }/user/getAllRole">查看所有角色</a>
	</c:if>
	<br>
	<c:if test="${sessionScope.user.userRole == 1 }">
		<a target="right"
			href="${pageContext.request.contextPath }/user/xzAllzUI">所有正职</a>
		<a target="right"
			href="${pageContext.request.contextPath }/user/xzAllFenGuanUI">分管单位</a>
	</c:if>
	<c:if test="${sessionScope.user.userRole == 2 }">
		<a target="right"
			href="${pageContext.request.contextPath }/user/xfAllFenGuanUI">校副厅1类对分管单位</a>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评</a>
		<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/dangqunGetAllDepZFUI">党群部门
			正评价本单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 1}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评教学书记副书记</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a>
		<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAllDepDownUI">评价本单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 1}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a>
		<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/XzGetAllDepDownUI">评价本单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 1}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a>
		<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/YxYzGetDepDownUI">评价自己单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 1}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a>
		<br>
	</c:if>
	<br>
	<a href="evaluate/findByUserIdOrEvalByName">查看自己评价过的人</a><br>
	<a target="right" href="${pageContext.request.contextPath }/user/updateUserUI/${sessionScope.user.userId}">修改个人信息</a><br>
	<a target="right" href="${pageContext.request.contextPath }/user/updatePasswordUI/${sessionScope.user.userId}">修改密码</a><br>
	<a href="${pageContext.request.contextPath }/user/logout">退出</a>
<%-- =======
<a target="right" href="${pageContext.request.contextPath }/user/getAllUser" >查看所有用户信息</a><br>
<a target="right"  href="${pageContext.request.contextPath }/department/getAllDep" >查看所有单位信息</a>

<br>
<c:if test="${sessionScope.user.userRole == 1 }">
<a target="right" href="${pageContext.request.contextPath }/user/xzAllzUI">所有正职</a>
<a target="right" href="${pageContext.request.contextPath }/user/xzAllFenGuanUI">分管单位</a>
</c:if>
<c:if test="${sessionScope.user.userRole == 2 }">
<a target="right" href="${pageContext.request.contextPath }/user/xfAllFenGuanUI">校副厅1类对分管单位</a>
</c:if>
<c:if test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/dangqunGetAllDepZFUI">党群部门 正评价本单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评教学书记副书记</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAllDepDownUI">评价本单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/XzGetAllDepDownUI">评价本单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/YxYzGetDepDownUI">评价自己单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a><br>
</c:if>
<br>
<a href="evaluate/findByUserIdOrEvalByName">查看自己评价过的人</a>
<br>
<a href="${pageContext.request.contextPath }/user/logout">退出</a>
>>>>>>> 97879c303ce865df8793ea39d17f0c787247db21 --%>
</body>
</html>
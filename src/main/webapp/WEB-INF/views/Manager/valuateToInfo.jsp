<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--
    新 Bootstrap 核心 CSS 文件

    我评价了谁
     -->
    <title>查看被评价详细信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="${pageContext.request.contextPath}/evaluate/getUserByNameLY" method="post">
	请输入姓名：<input type="text" name="nameLYY">
	<input type="submit" value="提交">
</form>
<table class="table">
    <tr>
        <th>用户姓名</th>
        <!-- <th>用户账号</th> -->
        <!-- <th>用户正副职</th>
        <th>用户职务</th>
        <th>用户描述</th> -->
        <th>查看评价详细信息</th>
        <%-- <th>用户部门</th>
         <th>用户角色</th>--%>
    </tr>
    <c:forEach items="${requestScope.userList }" var="userInfo">
        <tr>
            <td>${userInfo.userName }</td>
            <%-- <td>${userInfo.userNum }</td> --%>
            <%-- <td>${userInfo.userNp==''?"无信息":userInfo.userNp=='0'?"正职":"副职" }</td> --%>
            <%-- <td>${userInfo.userDuty }</td>
            <td>${userInfo.userDesc }</td> --%>
            <td><a href="${pageContext.request.contextPath}/evaluate/getValuatedOthers/?meId=${userInfo.userId}&nameLY=${userInfo.userName}">查看</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

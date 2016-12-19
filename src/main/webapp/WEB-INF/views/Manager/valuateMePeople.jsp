<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评价人信息及评价信息</title>
</head>
<body>
<table class="table">
    <tr>
        <th>用户姓名</th>
        <th>用户账号</th>
        <th>用户正副职</th>
        <th>用户职务</th>
        <th>用户描述</th>
        <th>查看此人被评详细信息</th>
    </tr>
    <c:forEach items="${requestScope.userList }" var="userInfo">
        <tr>
            <td>${userInfo.userName }</td>
            <td>${userInfo.userNum }</td>
            <td>${userInfo.userNp==''?"无信息":userInfo.userNp=='0'?"正职":"副职" }</td>
            <td>${userInfo.userDuty }</td>
            <td>${userInfo.userDesc }</td>
            <td><a href="${pageContext.request.contextPath}/evaluate/getValuatedMe/${userInfo.userId}">查看</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

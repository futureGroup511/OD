<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <title>查看被评价详细信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <%-- <th>用户部门</th>
             <th>用户角色</th>--%>
        </tr>
        <c:forEach items="${requestScope.pageBean.recordlist }" var="userInfo">
            <tr>
                <td>${userInfo.userName }</td>
                <td>${userInfo.userNum }</td>
                <td>${userInfo.userNp==''?"无信息":userInfo.userNp=='0'?"正职":"副职" }</td>
                <td>${userInfo.userDuty }</td>
                <td>${userInfo.userDesc }</td>
                <td><a href="${pageContext.request.contextPath}/evaluate/getValuatedMe/${userInfo.userId}">查看</a></td>
                    <%--<td>${userInfo.userDep }</td>
                    <td>${userInfo.userRole }</td>--%>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

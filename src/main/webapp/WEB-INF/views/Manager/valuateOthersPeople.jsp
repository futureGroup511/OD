<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/20
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看所有总评结果</title>
</head>
<body>
<table class="table">
    <tr>
        <th>被评价人姓名</th>
        <th>被评人评价职务</th>
        <th>评价级别</th>
        <th>评价类型</th>
        <th>评价描述</th>
    </tr>
        <c:forEach items="${requestScope.evaluatesList }" var="valuatedMeInfo">
            <tr>
                <td>${valuatedMeInfo.evaluatedTo.userName }</td>
                <td>${valuatedMeInfo.evaluatedTo.userDuty }</td>
                <td>${valuatedMeInfo.evalRank }</td>
                <td>${valuatedMeInfo.evalCate }</td>
                <td>${valuatedMeInfo.evalDesc }</td>
            </tr>
        </c:forEach>

</table>
</body>
</html>

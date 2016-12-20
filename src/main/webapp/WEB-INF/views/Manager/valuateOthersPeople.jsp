<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评价人信息及评价信息</title>
</head>
<body>
<table class="table">
    <h3>导出结果</h3>
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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评价人信息及评价信息</title>
</head>
<body>
<table>
    <tr> 
        <td>被评价人姓名</td>
        <td>被评价人职务</td>
        <td>互评平均得分</td>
        <td>正厅分管单位评价平均得分</td>
        <td>副厅评价平均得分</td>
        <td>单位上级评价平均得分</td>
        <td>总评得分</td>
    </tr>
    <c:forEach items="${requestScope.statisticList }" var="statistic">
        <tr>
            <td>${statistic.stati_user.userName }</td>
            <td>${statistic.stati_user.userDuty }</td>
            <td>${statistic.static_hp }</td>
            <td>${statistic.static_ztf }</td>
            <td>${statistic.static_ft }</td>
            <td>${statistic.static_dw }</td>
            <td>${statistic.static_result }</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

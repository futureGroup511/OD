<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/18
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>查看被评价人</title>
</head>
<body>
    <form action="findByUserIdOrEvalByName" method="post">
        <input type="hidden" name="id" value="${user.userId}">
        姓名:<input type="text" name="name" >
        <input type="submit" value="提交">
    </form>
    <c:forEach items="${evaluates}" var="eval" varStatus="status">

    </c:forEach>
</body>
</html>

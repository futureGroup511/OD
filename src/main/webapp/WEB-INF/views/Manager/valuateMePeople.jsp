<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评价人信息及评价信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yemian13.css">
</head>
<body>
<div class="container">
  <div class="row">
        <div class="col-lg-2 col-lg-offset-6 col-md-3 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：管理员>>查看干部被评价结果</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">

    <tr>
        <th>评价人姓名</th>
        <th>评价人职务</th>
        <th>评价级别</th>
        <th>评价类型</th>
        <th>评价描述</th>
    </tr>
    <c:forEach items="${requestScope.evaluatesList }" var="valuatedMeInfo">
        <tr>
            <td>${valuatedMeInfo.evaluatedBy.userName }</td>
            <td>${valuatedMeInfo.evaluatedBy.userDuty }</td>
            <td>${valuatedMeInfo.evalRank }</td>
            <td>${valuatedMeInfo.evalsort }</td>
            <td>${valuatedMeInfo.evalDesc }</td>
        </tr>
    </c:forEach>
    </table>
</div>

</body>
</html>

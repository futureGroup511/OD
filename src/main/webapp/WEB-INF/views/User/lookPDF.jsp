<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/25
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看PDF</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquert.media.js"></script>
    <script type="text/javascript">
        $(function () {

            $('a.media').media({width:800, height:600});

        });
    </script>
</head>
<body>
<a href="${pageContext.request.contextPath}/${url}" class="media">pdf</a>
</body>
</html>

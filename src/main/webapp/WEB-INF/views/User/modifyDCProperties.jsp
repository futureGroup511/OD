<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/24
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>党群副，行政副权重</title>
</head>
<body>
<form action="/OD/user/modifyDCProperties" method="post" id="form">
    <input type="hidden" name="juge" value="2">
    互评成绩权重: <input type="text" name="hpweight" id="hpweight" value="${file.hpweight}">
    厅级打分权重: <input type="text" name="xtweight" id="xtweight" value="${file.xtweight}">
    单位正职权重: <input type="text" name="dwweight" id="dwweight" value="${file.dwweight}">
    <input type="submit" value="提交">
</form>
<p id="message">${message}</p>
</body>
</html>

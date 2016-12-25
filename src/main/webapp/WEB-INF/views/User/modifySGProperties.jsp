<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/24
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改党群正处、行政正处权重</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
    <script>
        function  jugew() {
            var hp = Number(document.getElementById("hpweight").value);
            var xt = Number(document.getElementById("xtweight").value);
            var result = hp+xt;
            if(result === 0.7) $("#form").submit();
            else{
                $("#message").text("输入值非法请重新输入");
                return false;
            }
        }
    </script>
</head>
<body>
    <form action="/OD/user/modifySGProperties" method="post" id="form">
        <input type="hidden" name="juge" value="2">
        互评成绩权重: <input type="text" name="hpweight" id="hpweight" value="${file.hpweight}">
        厅级打分权重: <input type="text" name="xtweight" id="xtweight" value="${file.xtweight}">
        <input type="button" value="提交" onclick="jugew()">
    </form>
    <p id="message">${message}</p>
</body>
</html>

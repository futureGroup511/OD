<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/24
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教学正书记、教学正院长权重</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
    <script>
        /*function  jugew() {
            var hp = Number(document.getElementById("hpweight").value);
            var xt = Number(document.getElementById("xtweight").value);
            var result = Number(hp+xt);
            alert(result);
            if(result === 0.6) $("#form").submit();
            else{
                $("#message").text("输入值非法请重新输入");
                return false;
            }
        }*/
    </script>
</head>
<body>
    <form action="/OD/user/modifyAGProperties" method="post" id="form">
        <input type="hidden" name="juge" value="2">
        互评成绩权重: <input type="text" name="hpweight" id="hpweight" value="${file.hpweight}">
        厅级打分权重: <input type="text" name="xtweight" id="xtweight" value="${file.xtweight}">
        <input type="submit"  value="提交" >
    </form>
    <p id="message">${message}</p>
</body>
</html>
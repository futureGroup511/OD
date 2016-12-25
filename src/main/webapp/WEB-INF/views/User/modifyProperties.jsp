<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/24
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改校厅级所占权重</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
    <script >

        function jugeWeight(){
             var zx = Number(document.getElementById("zx").value);
             var fx = Number(document.getElementById("fx").value);
             var result = zx+fx;
             if(result === 1) {
                 $("#form").submit();
             }
             else{
                 $("#message").text("输入值非法请重新输入")
                 return false;
             }

        }
    </script>
</head>
<body>
    <form action="/OD/user/modifyProperties" method="post" id="form">
        <input type="hidden" name="juge" value="2">
        正校厅级所占权重: <input type="text" name="zx" value="${file.zx}" id="zx">
        副校厅级所占权重: <input type="text" name="fx" value="${file.fx}" id="fx">
        <input type="button" onclick="jugeWeight();" value="提交">
    </form>
    <p id="message">${message}</p>
</body>
</html>

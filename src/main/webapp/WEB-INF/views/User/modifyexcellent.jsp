<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/25
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改优秀比例权重</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
    <script type="text/javascript">
        function jugeNull() {
            var bili=$("#bili").val().trim();
            var xibili=$("#xibili").val().trim();
            if(bili === "" || xibili==="") {
                $("#message").text("请不要填写空值");
            }else{
                $("#form").submit();
            }

        }
    </script>
</head>
<body>
    <form action="/OD/user/modifyexcellent" method="post" id="form">
        <input type="hidden" name="juge" value="2">
        优秀所占比例: <input type="text" name="bili" value="${bl}" id="bili">
        优秀所占比例中副职最低比例: <input type="text" name="xibili" value="${xbl}" id="xibili">
        <button value="提交" type="button" onclick="jugeNull();">提交</button>
    </form>
<p id="message">${message}</p>
</body>
</html>

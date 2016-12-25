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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yemian7.css">
    <script >

        function  jugeNull() {
            var zx=$("#zx").val().trim();
            var fx=$("#fx").val().trim();
            if(zx === "" || fx === ""){
                $("#message").text("请不要填写空值")
            }else $("#form").submit();
        }
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
<div class="container-one">
    <div class="row form">
        <form action="/OD/user/modifyProperties" method="post" id="form">
            <input type="hidden" name="juge" value="2">
            <div class="col-lg-2 col-lg-offset-3 col-md-2 col-md-offset-3 col-xs-3 col-xs-offfet-3">
                正校厅级所占权重: <input type="text" name="zx" value="${file.zx}" id="zx">
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-3 col-xs-offfet-1">
                副校厅级所占权重: <input type="text" name="fx" value="${file.fx}" id="fx">
            </div>
            <div class="col-lg-1  col-md-1 col-xs-2">
                <button type="button" onclick="jugeNull()">提交</button>
            </div>
        </form>
    </div>
</div>
    <p id="message">${message}</p>
</body>
</html>

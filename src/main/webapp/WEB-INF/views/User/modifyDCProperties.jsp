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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shisi.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
    <script>
        function jugeNull() {
            var hp=$("#hpweight").val().trim();
            var xt=$("#xtweight").val().trim();
            var dw=$("#dwweight").val().trim();
            if(hp === "" || xt === "" || dw === "" ){
                $("#message").text("请不要填写空值")
            }else{
                $("#form").submit();
            }
        }
    </script>
</head>
<body>
<div class="main">
        <form action="/OD/user/modifyDCProperties" method="post" id="form">
                <input type="hidden" name="juge" value="2">
            <div class="row">
                <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                    互评成绩权重: <input type="text" name="hpweight" id="hpweight" value="${file.hpweight}"  class="navbar-link">
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                    厅级打分权重: <input type="text" name="xtweight" id="xtweight" value="${file.xtweight}" class="navbar-link">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                    单位正职权重: <input type="text" name="dwweight" id="dwweight" value="${file.dwweight}" class="navbar-link">
                </div>
            </div>
                <button type="button" onclick="jugeNull()"  class="btn btn-primary btn-md">提交</button>
        </form>
</div>
<p id="message">${message}</p>
</body>
</html>

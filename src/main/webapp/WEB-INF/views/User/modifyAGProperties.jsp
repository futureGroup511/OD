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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shisan.css" />

    <script>
        function jugeNull(){
            var hp=$("#hpweight").val().trim();
            var xt=$("#xtweight").val().trim();
            if(hp ==="" || xt===""){
                $("#message").text("请不要填写空值");
            }else{
                $("#form").submit();
            }
        }

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
<div class="main">
    <div class="row">
        <form action="/OD/user/modifyAGProperties" method="post" id="form">
            <input type="hidden" name="juge" value="2">
            <div class="row">
                <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                互评成绩权重：<input type="text" name="hpweight" id="hpweight" value="${file.hpweight}" class="navbar-link">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                    厅级打分权重：<input type="text" name="xtweight" id="xtweight" value="${file.xtweight}" class="navbar-link">
                </div>
            </div>
            <button type="button" class="btn btn-primary btn-md" onclick="jugeNull()">提交</button>
        </form>
    </div>
</div>

    <p id="message">${message}</p>
</body>
</html>

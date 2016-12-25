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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquert.media.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shisan.css" />

    <script type="text/javascript">

        function lookPDF(theURL){
            var pop,w=670,h=450; //window.navigate(theURL);
            pop=window.open(theURL,"winGD","width="+w+",height="+h+",resizable=yes,menubar=no,toolbar=no,location=no,scrollbars=no,status=no")
            pop.moveTo((screen.width-w)/2,(screen.height-h)/2);

        }
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
<div class="main">
    <form action="/OD/user/modifyexcellent" method="post" id="form">
        <input type="hidden" name="juge" value="2">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                优秀所占比例: <input type="text" name="bili" value="${bl}" id="bili"  class="navbar-link">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
                副职最低比例: <input type="text" name="xibili" value="${xbl}" id="xibili" class="navbar-link">
            </div>
        </div>
        <button value="提交" type="button" onclick="jugeNull();"  class="btn btn-primary btn-md">提交</button>
    </form>
</div>


<p id="message">${message}</p>
</body>
</html>

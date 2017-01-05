<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>

        <meta charset="utf-8">
        <title>欢迎访问组织部互评系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
		<script type="text/javascript">
	
	//在被嵌套时就刷新上级窗口
	if(window.parent != window){
		//window.parent.location.reload(true);
		window.parent.location.href='$("#address").val()';
	}
	</script>
</head>

    <body>
     <div class="connect">
        <div class="page-container">
            <h1>河南科技学院干部评价系统</h1>
           <form name="fosrm" id="form" action="${pageContext.request.contextPath }/user/login" method="post">
            	<input type="hidden" id="address" value="<%=basePath %>">

				<div>
					<input type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
				</div>
                <div>
					<input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
                </div>
                <input id="submit" type="submit" value="登录" onclick="juge();">
               	${message }
            </form>

                <%--<p>Henan institute of science and technology department of login system interface.</p>--%>
				<%--<p style="margin-top:20px;font-size:25px;" class="one">河南科技学院用户登录界面</p>--%>
            </div>
        </div>
	 <div class="footer">
		 <p>技术支持：信工学院未来软件工作室&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 河南艾未特网络技术有限公司</p>
	 </div>
		<div class="alert" style="display:none">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a class="btn">确定</a></p>
			</div>
		</div>

        <!-- Javascript -->
		<script src="${pageContext.request.contextPath }/js/js.js" type="text/javascript"></script>
		<script>
		
		$(".btn").click(function(){
			is_hide();
		})
		var u = $("input[name=username]");
		var p = $("input[name=password]");
		function juge(){
			if(u.val() == '' || p.val() =='')
			{
				$("#ts").html("用户名或密码不能为空");
				is_show();
				return false;
			}
			else{
				var reg = /^[0-9A-Za-z]+$/;
				if(!reg.exec(u.val()))
				{
					$("#ts").html("用户名错误");
					is_show();
					return false;
				}
			}
		
			return true;
		}
		
		$("#submit").live('click',function(){
			
		});
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		}
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300) }
		</script>

    </body>

</html>












<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
</head>
<body>
${message }
<script type="text/javascript">
	
	//在被嵌套时就刷新上级窗口
	if(window.parent != window){
		//window.parent.location.reload(true);
		window.parent.location.href='$("#address").val()';
	}
 

	function checkReg(){
		var loginName = document.frm.username.value;
		var password = document.frm.password.value;
		if( loginName == ""){
			alert("请输入账号！");
			return false;
		}
		if(password == ""){
			alert("请输入密码！");
			return false;
		}
		return true;
	}

</script>

<form name="frm" action="${pageContext.request.contextPath }/user/login" method="post" onsubmit="return checkReg()">
	<input type="hidden" id="address" value="<%=basePath %>">
	账号：<input type="text" name="username" id="username" />
	密码：<input type="password" name="password" id="password" />
	<input type="submit" value="登陆">
</form>
</body>
</html> --%>

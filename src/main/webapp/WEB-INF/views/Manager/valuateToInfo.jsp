<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看被评价详细信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eleven.css" />
</head>

<body>
<div class="dangqian">
	           <div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-5 col-md-3 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：老师互评>>党委</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
</div>
<div class="main">
	<div class="row form">
		<form action="${pageContext.request.contextPath}/evaluate/getUserByNameLY" method="post">
	    	<div class="col-lg-2 col-lg-offset-2 col-md-1 col-md-offset-2 col-xs-1 col-xs-offset-2">
	        	请输入姓名：
	        </div>
	        <div class="col-lg-2  col-md-2  col-xs-3">
	        	<input  type="text" name="nameLYY" class="navbar-link">
	        </div>
	        <div class="col-lg-2 col-md-2 col-xs-3">
	             <button type="submit" class="btn btn-primary btn-md">提交</button>
	        </div>
        </form>
    </div>
    <div class="table-responsive">
       <table class="table table-striped" style="font-size:16px;">
        	       <thead>
                        <tr class="active" >
                            <th>用户名</th>
                            <th>查看详细评价信息</th>
                        </tr>
                    </thead>
                    <tbody>
                    	 <c:forEach items="${requestScope.userList }" var="userInfo">
						        <tr>
						            <td>${userInfo.userName }</td>
						            <td><a href="${pageContext.request.contextPath}/evaluate/getValuatedOthers/?meId=${userInfo.userId}&nameLY=${userInfo.userName}">查看</a></td>
						        </tr>
						    </c:forEach>
                        
                    </tbody>

        </table>
    </div>
</div>
</html>







<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看被评价详细信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="${pageContext.request.contextPath}/evaluate/getUserByNameLY" method="post">
	请输入姓名：<input type="text" name="nameLYY">
	<input type="submit" value="提交">
</form>
<table class="table">
    <tr>
        <th>用户姓名</th>
        <th>查看评价详细信息</th>
    </tr>
    <c:forEach items="${requestScope.userList }" var="userInfo">
        <tr>
            <td>${userInfo.userName }</td>
            <td><a href="${pageContext.request.contextPath}/evaluate/getValuatedOthers/?meId=${userInfo.userId}&nameLY=${userInfo.userName}">查看</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
 --%>
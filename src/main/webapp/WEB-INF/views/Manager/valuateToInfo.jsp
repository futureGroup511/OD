<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>当前位置：管理员>>干部打分情况</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eleven.css" />
</head>

<body>
<div class="dangqian">
	           <div class="container">
  <div class="row">
       <div class="col-lg-3 col-lg-offset-7 col-md-4 col-md-offset-5 col-xs-3  col-xs-offset-7">
            <p>当前位置：管理员>>干部打分情况</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-2">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
</div>
<div class="main">
	<div class="row form">
		<form action="${pageContext.request.contextPath}/evaluate/getUserByNameLY" method="post">
	    	<div class="col-lg-3 col-lg-offset-2 col-md-3 col-md-offset-2 col-xs-3 col-xs-offset-2" style="padding-top:5px; font-size:19px;">
	        	请输入姓名：
	        </div>
	        <div class="col-lg-3  col-md-3  col-xs-3">
	        	<input  type="text" name="nameLYY" class="navbar-link">
	        </div>
	        <div class="col-lg-2 col-md-2 col-xs-3">
	             <button type="submit" class="btn btn-primary btn-md" style="border-radius:5px; font-size:18px; background-color:#12A1EC; ">查&nbsp;&nbsp;询</button>
	        </div>
        </form>
    </div>
    <div class="table-responsive">
       <table class="table table-striped" style="font-size:16px;">
        	       <thead>
                        <tr class="active" >
                            <th>序号</th>
                            <th>用户名</th>
                            <th>查看详细评价信息</th>
                            <!-- <th>删除此人评价信息</th> -->
                        </tr>
                    </thead>
                    <tbody>
                    	 <c:forEach items="${requestScope.userList }" var="userInfo" varStatus="id">
						        <tr>
						            <td>${id.count }</td>
						            <td>${userInfo.userName }</td>
						            <td><a href="${pageContext.request.contextPath}/evaluate/getValuatedOthers/?meId=${userInfo.userId}&nameLY=${userInfo.userName}">查看</a></td>
						           <%--  <td><a href="${pageContext.request.contextPath}/evaluate/delteEvaluate/${userInfo.userId}" onClick="if(confirm( '确定要删除此人的评价信息?一旦删除无法恢复!！')==false)return   false;">删除</a></td> --%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传述职报告</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/one.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>

</head>

<body>
<div class="dangqian">
	           <div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-7 col-md-3 col-md-offset-7 col-xs-3  col-xs-offset-7">
            <p>当前位置：述职报告>>上传述职报告</p>
        </div>
        <div class="col-lg-2 col-md-2 col-xs-2">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
<div class="main">
	<form:form action="${pageContext.request.contextPath }/user/uploadResport" method="POST" enctype="multipart/form-data">
		<div class="row">
	            <div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-xs-1 col-xs-offset-1"><p>述职报告：</p></div>
	            <div class="col-lg-2 col-md-2 col-xs-2" style="margin-top:20px;">
					   <input type="file" name="uploadfile" class="choose">
	                   <button type="button" class="btn btn-primary btn-md">浏览</button>

	            </div>
			    <div class="col-lg-2  col-md-2  col-xs-2" style="margin-top:45px; margin-left:-6%;" >
					<input type="submit" class="btn btn-primary btn-md" value="提交">
				</div>
	    </div>

	</form:form>
</div>
</body>
</html>

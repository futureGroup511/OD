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
	<div class="row">
            <!-- <div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-xs-1 col-xs-offset-1"></div> -->
            <div class="col-lg-2 col-lg-offset-2 col-md-2 col-md-offset-2 col-xs-2 col-xs-offset-2 " style="margin-top:20px;padding-left:4%;width:20%;">
            		<c:if test="${sessionScope.user.userReport != '' }">
                   		<button type="button" class="btn btn-primary btn-md" onclick="lookPDF('${pageContext.request.contextPath}/user/lookpdf?reportName=${sessionScope.user.userReport}');">查看述职报告</button>
                   </c:if>
            </div>
    </div>
	    
	<form:form action="${pageContext.request.contextPath }/user/uploadResport" method="POST" enctype="multipart/form-data">
		<div class="row">
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>上传述职报告：</p></div>
	            <div class="col-lg-2 col-md-2 col-xs-2" style="margin-top:0px;margin-left:-5.5%;">
					   <input type="file" name="uploadfile" class="choose">
	                   <button type="button" class="btn btn-primary btn-md">选择述职报告</button>

	            </div>
			    <div class="col-lg-2  col-md-2  col-xs-2" style="margin-top:25px; margin-left:-6%;" >
					<input type="submit" class="btn btn-primary btn-md" value="上传">
				</div>
	    </div>

	</form:form>
</div>
</body>
</html>

<!-- 查看述职报告 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.paginate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/public.js"></script>
<script type="text/javascript">
function lookPDF(theURL){
    var pop,w=670,h=450; //window.navigate(theURL);
    pop=window.open(theURL,"winGD","width="+w+",height="+h+",resizable=yes,menubar=no,toolbar=no,location=no,scrollbars=no,status=no")
    pop.moveTo((screen.width-w)/2,(screen.height-h)/2);

}
</script>
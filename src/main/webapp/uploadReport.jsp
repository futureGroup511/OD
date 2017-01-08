<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传述职报告</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/one.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<style type="text/css">
.file {
	position: relative;
	display: inline-block;
	background: #337AB7;
	border: 1px solid #337AB7;
	border-radius: 4px;
	padding: 4px 12px;
	overflow: hidden;
	color: white;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
	width:136px;
	height:39px;
	font-size: 19px;
	text-align:center;
	margin-top:-6px;
	margin-left:-120%;
}

.file input {
	position: absolute;
	font-size: 19px;
	right: 0;
	top: 0;
	opacity: 0;
	text-align:center;
	
	
	
}

.file:hover {
	color: white;
	text-decoration: none;
}
</style>
</head>

<body>
	<div class="dangqian">
		<div class="container">
			<div class="row" style="margin-top: 30px;">
				<div
					class="col-lg-3 col-lg-offset-7 col-md-4 col-md-offset-5 col-xs-3  col-xs-offset-7">
					<p>当前位置：述职报告>>上传述职报告</p>
				</div>
				<div class="col-lg-2 col-md-3 col-xs-2">
					<p>欢迎 ${sessionScope.user.userName } 登录本系统</p>
				</div>
			</div>
		</div>
		<div class="main">


			<form:form
				action="${pageContext.request.contextPath }/user/uploadResport"
				method="POST" enctype="multipart/form-data">
				<div class="row" style="margin-top: 30px;">
					<div
						class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
						<p style="font-size: 18px;">
							<strong>上传述职报告</strong>
						</p>
					</div>
					<div class="col-lg-1 col-md-2 col-xs-2">
						<a href="javascript:;" class="file" style="padding-top:8px;">选择文件 <input type="file"
							name="uploadfile" id=""></a>

					</div>
					<div class="col-lg-1  col-md-2  col-xs-2 "
						style="margin-top: 25px;">
						<input type="submit" id="up" class="btn btn-primary btn-md" style="font-size:18px;margin-top:-31.5px;margin-left:-80%;" value="上&nbsp;&nbsp;传" >
					</div>
				</div>
				<div class="row">
					<div
						class="col-lg-1 col-md-1 col-md-offset-2 col-xs-1 col-xs-offset-3"
						style="margin-left: 17.3%;">
						<c:if test="${sessionScope.user.userReport != '' }">
							<button type="button" class="btn btn-primary btn-md"
								style="font-size: 18px;"
								onclick="lookPDF('${pageContext.request.contextPath}/user/lookpdf?reportName=${sessionScope.user.userReport}');">查看述职报告</button>
						</c:if>
					</div>
				</div>

			</form:form>
		</div>
</body>
</html>

<!-- 查看述职报告 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.paginate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/public.js"></script>
<script type="text/javascript">

$(function(){
	$("#up").click(function(){
		if($.trim($("input[name='uploadfile']").val())==''){
			alert("请选择文件后在单击上传！");
			return false;
		}	
	});		
})

function lookPDF(theURL){
    var pop,w=670,h=450; //window.navigate(theURL);
    pop=window.open(theURL,"winGD","width="+w+",height="+h+",resizable=yes,menubar=no,toolbar=no,location=no,scrollbars=no,status=no")
    pop.moveTo((screen.width-w)/2,(screen.height-h)/2);

}
</script>
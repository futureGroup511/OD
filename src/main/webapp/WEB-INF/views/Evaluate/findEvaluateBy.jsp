<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/18
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<style>
body {
	border: 1px solid #B4B4B4;
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
	padding-bottom: 30px;
}
</style>
<head>
<title>查看被评价人</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ten.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/xlsx.core.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/blob.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/FileSaver.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/tableexport.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/paging.js"></script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div
				class="col-lg-3 col-lg-offset-7 col-md-3 col-md-offset-6 col-xs-3  col-xs-offset-7">
				<p>当前位置：评价>>查看已评信息</p>
			</div>
			<div class="col-lg-2 col-md-3 col-xs-2">
				<p>欢迎 ${sessionScope.user.userName } 登录本系统</p>
			</div>
		</div>
	</div>
	<div class="row form">
		<form action="/OD/evaluate/findByUserIdOrEvalByName" method="post"
			id="form">
			<input type="hidden" name="id" value="${sessionScope.user.userId}">
			<input type="hidden" name="currentPage" value="${page.currentPage}"
				id="currentPage">
			<div
				class="col-lg-1 col-lg-offset-2 col-md-1 col-md-offset-2 col-xs-1 col-xs-offfet-2"
				style="font-size: 18px;">姓名：</div>
			<div class="col-lg-2  col-md-2  col-xs-3"
				style="margin-left: -3%; padding-top: 5px;">
				<input type="text" name="name" value="${findname}">
			</div>
			
			
			
			<div
				class="col-lg-2 col-lg-offset-1 col-md-1 col-md-offset-2 col-xs-1 col-xs-offfet-2"
				style="font-size: 18px;">分类查询：</div>
			<div class="col-lg-2  col-md-2  col-xs-3"
				style="margin-left: -3%; padding-top: 5px;">
				<select name="fenlei">
					<option value="3">请选择：</option>
					<option value="0" <c:if test="${tempFenlei == 0 }">selected</c:if>>处级干部</option>
					<option value="1" <c:if test="${tempFenlei == 1 }">selected</c:if>>分管单位</option>
				</select>
			</div>
			
			
			
			
		</form>
		<div class="col-lg-2 col-md-2 col-xs-3">
			<button class="btn btn-primary" onclick="subform()">查&nbsp;&nbsp;&nbsp;询</button>
		</div>
	</div>



	<div class="table-responsive">


		<c:if test="${page.recordCount ne 0}">
			<table class="table table-striped" style="font-size: 16px;">
				<tr>
					<th>序号</th>
					<th>姓名</th>
					<%--<th>角色</th>--%>
					<th>单位</th>
					<th>评价类型</th>
					<th>评价等级</th>
				</tr>
				<c:forEach items="${page.recordlist}" var="eval" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${eval.userBy.userName}</td>
						<%--<td>${eval.userBy.role.roleName}</td>--%>
						<td>${eval.userBy.department.depName}</td>
						<td>${eval.evalsort}</td>
						<td>${eval.evalgrade}</td>
					</tr>
				</c:forEach>
				<c:if test="${evalList != null}">
						<c:forEach items="${evalList}" var="eval" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${eval.userBy.userName}</td>
								<%--<td>${eval.userBy.role.roleName}</td>--%>
								<td>${eval.userBy.department.depName}</td>
								<td>${eval.evalsort}</td>
								<td>${eval.evalgrade}</td>
							</tr>
						</c:forEach>
				</c:if>
		
			</table>
			<nav>
				<ul class="pagination">


					<li><a href="#" onclick="turning(1)">首页</a></li>
					<li><a href="#" onclick="turning(${page.currentPage-1})">上一页</a></li>
					<li><a href="#">${page.currentPage }/${page.pageCount }</a></li>
					<li><a href="#"
						onclick="turning(${page.currentPage+1},${page.pageCount})">下一页</a></li>
					<li><a href="#"
						onclick="turning(${page.pageCount},${page.pageCount})">尾页</a></li>
				</ul>
			</nav>

		</c:if>
		
		
		
		
		
		<c:if test="${page.recordCount == 0}">
			<div
				class="col-lg-2 col-lg-offset-2 col-md-2 col-md-offset-2 col-xs-2 col-xs-offset-2">
				没有数据!</div>
		</c:if>

	</div>
</body>
</html>

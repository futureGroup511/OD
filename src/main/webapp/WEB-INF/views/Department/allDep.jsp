<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>yemian5</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/yemian5.css">
</head>

<body>
	<div class="container">
		<div class="row">
			<div
				class="col-lg-1 col-lg-offset-3 col-md-1 col-md-offset-3 col-xs-1 col-xs-offset-2">
					<a><p>
						<a class="btn btn-primary" href="addDepUI"> 
							<img
								src="${pageContext.request.contextPath }/img/yonghuzengjia.png"
								width="25" height="25">增加单位
						</a>
					</p></a>
			</div>
			<div class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-1 col-xs-3  col-xs-offset-4">
            <p>当前位置：管理员>>查看所有单位</p>
        </div>
        <div class="col-lg-2 col-md-4 col-xs-2">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
		</div>
	</div>

	
	<div class="table-responsive">
		${deleteDepMessage }
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr class="two">
					<th>序号</th>
					<th>名称</th>
					<th>分管人</th>
					<th>编辑</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${depList }" var="dep" varStatus="id">
					<tr>
						
						<td>${id.count }</td>
						<td>${dep.depName }</td>
						<td>${dep.depManager }</td>
						<td class="four"><img src="${pageContext.request.contextPath }/img/bian.png">
							<a href="updateDepUI/${dep.depId }">修改</a>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
						<img src="${pageContext.request.contextPath }/img/lajitong.png">
							<a onClick="if(confirm( '确定要删除吗！ ')==false)return   false;" href="${pageContext.request.contextPath }/user/deleteDep/${dep.depId }" style="color: #E11E05;">删除</a>
						</td>
						
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>

</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有单位</title>
</head> 
<body>
查询所有单位
<a href="addDepUI">添加单位</a>
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
	    <td>名称</td>
	    <td>分管人</td>
	    <td>编辑</td>

	</tr>

	<c:forEach items="${depList }" var="dep">
		<tr>
			<td>${dep.depName }</td>
			<td>${dep.depManager }</td>
			<td>
				<a href="updateDepUI/${dep.depId }">修改</a> &nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/user/deleteDep/${dep.depId }">删除</a>
			</td>
		</tr>
	</c:forEach>

</table>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询所有用户</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ui.js"></script>
<script type="text/javascript">
$(document).ready(function () {
		
			var availableTags = ["ActionScript","AppleScript","Asp","BASIC"];
		 	$( "#txtIput" ).autocomplete({
		      source:availableTags;
		   });
		 
		$.ajax({
 			url:'${pageContext.request.contextPath }/user/ajaxgetAllUserName',
 			type:'post',
			data:null,
			dataType:'json',
 			success:function(msg) {
                 /* var datas = eval(msg);
                 $("#txtIput").autocomplete(datas); */
             }
         });
     });
</script>
</head>
<body>
查询所有用户===${sessionScope.user.userName }
<a href="addUserUI">增加用户</a>
<br>根据姓名查询用户
<form action="${ pageContext.request.contextPath}/user/findByNameForUser" method="post">
	姓名：<input name="name" id="txtIput" type="text">
	<input type="submit" value="提交">
</form>
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
	    <td>姓名</td>
	    <td>账号</td>
	    <td>角色</td>
	    <td>单位</td>
	    <td>职务</td>
	    <td>正/副</td>
	    <td>述职报告</td>
	    <td>描述</td>
	    <td>编辑</td>
	</tr>
	<c:if test="${pageBean.recordlist != null }">
		<c:forEach items="${pageBean.recordlist }" var="user">
			<tr>
				<td>${user.userName }</td>
				<td>${user.userNum }</td>
				<td>${user.role.roleName }</td>
				<td>${user.department.depName }</td>
				<td>${user.userDuty }</td>
				<td>
					<c:if test="${user.userNp ==0 }">正</c:if>
					<c:if test="${user.userNp ==1 }">副</c:if>
				</td>
				<td>${user.userReport }</td>
				<td>${user.userDesc }</td>
				<td>
					<a href="${pageContext.request.contextPath }/user/updateUserUI/${user.userId }">修改</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath }/user/deleteUser/${user.userId }">删除</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${user != null }">
				<tr>
					<td>${user.userName }</td>
					<td>${user.userNum }</td>
					<td>${user.role.roleName }</td>
					<td>${user.department.depName }</td>
					<td>${user.userDuty }</td>
					<td>
						<c:if test="${user.userNp ==0 }">正</c:if>
						<c:if test="${user.userNp ==1 }">副</c:if>
					</td>
					<td>${user.userReport }</td>
					<td>${user.userDesc }</td>
					<td>
						<a href="updateUserUI/${user.userId }">修改</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/user/deleteUser/${user.userId }">删除</a>
					</td>
				</tr>
	</c:if>
</table>
<p>
每页显示${pageBean.pageSize }条，总记录数${pageBean.recordCount }条
<a href="javascript:gotoPage(1)">首页</a>
<a href="javascript:gotoPage(${pageBean.currentPage }-1)">上一页</a>
${currentPage }/${pageBean.pageCount }
<a href="javascript:gotoPage(${pageBean.currentPage }+1)">下一页</a>
<a href="javascript:gotoPage(${pageBean.pageCount })">尾页</a>
</p>
<script type="text/javascript">
	function gotoPage(pageNum){
		if(pageNum > "${pageBean.pageCount}"){
			pageNum = "${pageBean.pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}	
		window.location.href="${pageContext.request.contextPath}/user/getAllUser/" + pageNum;
}					
</script>
</body>
</html>

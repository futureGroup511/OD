<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(function(){
		var a = $("form").attr("action");
		//alert(a);
		if(a == "true"){
			//alert("b")
			$("form").attr("action","addUser")
		} else if(a == "false"){
			//alert("c")
			$("form").attr("action","${pageContext.request.contextPath }/user/updateUser")
		}
	})
</script>
</head>
<body>
添加用户页面/修改<%-- ${user.userId != null:updateUser?addUser} --%>
<form:form action="${user.userId == null}" method="POST" modelAttribute="user">
	
	<c:if test="${user.userId !=null }">
		<form:hidden path="userId"/>
	</c:if>
	
	用户名：<form:input path="userName"/><br>
	账号：<form:input path="userNum"/><br>
	密码：<form:input path="userPassword"/><br>
	用户角色:<form:select path="userRole" items="${userRole }" itemLabel="roleName" itemValue="roleId"></form:select><br>
	所属单位：<form:select path="userDep" items="${userDep }" itemLabel="depName" itemValue="depId"></form:select><br>
	正副:<select name="userNp" >
			<option value="0">正</option>
			<option value="1">副</option>
		</select>
	<br>
	职务：<form:input path="userDuty"/><br>
	述职文件：<form:input path="userReport"/><br>
	描述：<form:input path="userDesc"/><br>
	<input type="submit" value="提交">
</form:form>
</body>
</html>
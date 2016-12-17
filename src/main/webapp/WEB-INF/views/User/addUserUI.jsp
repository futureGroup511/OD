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
	
	$(document).ready(function(){
	    $("#button").click(function(){ 
	    	//if(checkout()==true && checkoutname==true && checkpassword ==true){ 
	    	if(submit()==true){ 
	    		$("#form").submit();  
	        } 
	    });  
	});
	
	function submit(){
		if($("#username").val() == ""){
			alert("用户名不能为空");
			return false;
		}
		if($("#usernum").val() == ""){
			alert("账号不能为空！");
			return false;
		}
		if($("#password").val() == ""){
			alert("密码不能为空！");
			return false;
		}
		return true;
	}
	
	function checkout(){
		var username = $("#username").val();
		if(username == ""){
			$("#nameMess").show();
			return false;
		}
		return true;
	}
	
	function checkoutname(){
		var username = $("#username").val();
		if(username == ""){
			$("#nameMess").show();
			return false;
		}else{
			$("#nameMess").hide();
		}
		return true;
	}
	
	function checkoutUsrename(){
		var username = $("#usernum").val();
		$("#usernameMess1").hide();
		if(username == ""){
			$("#usernameMess").show();
			return false;
		} else {
			$("#usernameMess").hide();
			//发送Ajax请求服务器段，是否存在相同账号的用户
			var username = {
				"usernum" : username
			}
			$.ajax({
			//先走校验的action  
			url : '${pageContext.request.contextPath }/user/ajaxgetisOrNotUser',
			type : 'post',
			data : username,
			dataType : 'text',
			success : function(data) {
				if(data == 'true'){
					$("#usernameMess1").show();
					$("#button").attr({"disabled":"disabled"});
					return false;
				} 
				if(data == 'false'){
					$("#button").removeAttr("disabled");//将按钮可用
					$("#usernameMess1").hide();
				}
			}
		}); 
			$("#usernameMess1").hide();
			
		}
		return true;
	}
	
	function checkpassword(){
		var password = $("#password").val();
		if(password == ""){
			$("#passwordMess").show();
			return false;
		} else{
			$("#passwordMess").hide();
		}
		return true;
	}
</script>
</head>
<body>
添加用户页面/修改<%-- ${user.userId != null:updateUser?addUser} --%>
<form:form id="form" action="${user.userId == null}" method="POST" modelAttribute="user" enctype="multipart/form-data">
	
	<c:if test="${user.userId !=null }">
		<form:hidden path="userId"/>
	</c:if>
	
	用户名：<form:input path="userName" id="username" onblur="checkoutname()"/><label id="nameMess"style="font:bold;color: red" hidden>用户名不能为空</label><br>
	账号：<form:input path="userNum" id="usernum" onblur="checkoutUsrename()"/>
	<label id="usernameMess"style="font:bold;color: red" hidden>账号不能为空</label>
	<label id="usernameMess1"style="font:bold;color: red" hidden>此用户已存在</label>
	<br><br>
	<c:if test="${user.userId == null }">
		密码：
		<form:password path="userPassword" id="password" onblur="checkpassword()"/>
		<label id="passwordMess"style="font:bold;color: red" hidden>密码不能为空</label><br>
	</c:if>
	用户角色:<form:select path="userRole" items="${userRole }" itemLabel="roleName" itemValue="roleId"></form:select><br>
	所属单位：<form:select path="userDep" items="${userDep }" itemLabel="depName" itemValue="depId"></form:select><br>
	正副:
			<c:if test="${user.userId != null}">
				<c:if test="${user.userNp == 0 }">
					<select name="userNp" >
						<option value="0" selected="selected">正</option>
						<option value="1">副</option>
						<option value="3">其他</option>
					</select>
				</c:if>
				<c:if test="${user.userNp == 1 }">
					<select name="userNp" >
						<option value="0" >正</option>
						<option value="1" selected="selected">副</option>
						<option value="3">其他</option>
					</select>
				</c:if>
				<c:if test="${user.userNp == 3 }">
					<select name="userNp" >
						<option value="0" >正</option>
						<option value="1">副</option>
						<option value="3" selected="selected">其他</option>
					</select>
				</c:if>
				<c:if test="${user.userNp == null }">
					<select name="userNp" >
						<option value="0" >正</option>
						<option value="1">副</option>
						<option value="3">其他</option>
					</select>
				</c:if>
			</c:if>
			<c:if test="${user.userId == null }">
					<select name="userNp" >
							<option value="0" >正</option>
							<option value="1">副</option>
							<option value="3">其他</option>
					</select>
			</c:if>
	<br>
	职务：<form:input path="userDuty"/><br>
	述职文件：<%-- <form:input path="userReport"/> --%>
		<c:if test="${user.userId == null}">
			<input type="file" name="uploadfile"><br>
		</c:if>
		<c:if test="${user.userId != null}">
			<form:hidden path="userReport"/>
			<input type="file" name="uploadfile"><br>
		</c:if>
	描述：<form:input path="userDesc"/><br>
	<input type="button" id="button" value="提交">
</form:form>
</body>
</html>
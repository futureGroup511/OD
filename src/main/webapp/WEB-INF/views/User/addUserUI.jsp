<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/one.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>

<script type="text/javascript">
	$(function(){
		var a = $("#form").attr("action");
		//alert(a);
		if(a == "true"){
			//alert("b")
			$("#form").attr("action","addUser")
		} else if(a == "false"){
			//alert("c")
			$("#form").attr("action","${pageContext.request.contextPath }/user/updateUser")
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
<div class="dangqian">
	           <div class="container"  style="padding-bottom:50px;padding-top:20px;">
      <div class="row">
        <div class="col-lg-3 col-lg-offset-6 col-md-4 col-md-offset-5 col-xs-3  col-xs-offset-6" style="margin-top:17px;">
            <p>当前位置：管理员>>增加/修改用户信息</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3"  style="margin-top:17px;">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
        </div>
</div>
<div class="main">
	<form:form id="form" action="${user.userId == null}" method="POST" modelAttribute="user" enctype="multipart/form-data">
	
	
	
	<c:if test="${user.userId !=null }">
		<form:hidden path="userId"/>
		<div class="row">
	    	    <div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>用户名：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            <form:input class="navbar-link" path="userName" id="username" onblur="checkoutname()"/><label id="nameMess"style="font:bold;color: red" hidden>用户名不能为空</label><br>
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2 col-xs-2 col-xs-offset-1"><p>账号：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            	<form:input class="navbar-link" path="userNum" id="usernum" readonly="true"/>
	            </div>
	        </div>
	    </div>
	    <div class="row">
	    		<div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>用户角色：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            	<form:select class="form-control" path="userRole" items="${userRole }" itemLabel="roleName" itemValue="roleId"></form:select><br>
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1"><p>所属单位：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<form:select class="form-control" path="userDep" items="${userDep }" itemLabel="depName" itemValue="depId"></form:select><br>
	            </div>
	        </div>
	    </div>
		<div class="row">
	    	    <div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>正副：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<select name="userNp" class="form-control">
					<option value="0" <c:if test="${user.userNp == 0 }">selected</c:if>>正</option>
					<option value="1" <c:if test="${user.userNp == 1 }">selected</c:if>>副</option>
					<option value="3" <c:if test="${user.userNp == 3 }">selected</c:if>>校领导</option>
				</select><br>
	
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>职务：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            	    <form:input path="userDuty" class="navbar-link"/><br>
	            </div>
	    </div>
		<div class="row">
	    	<div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>是否在职：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<select name="userDesc" class="form-control">
								<option value="0"     <c:if test="${user.userDesc == '0' }">selected</c:if>     >在职</option>
								<option value="1"     <c:if test="${user.userDesc == '1' }">selected</c:if>     >不在职</option>
						</select>
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>述职文件：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<form:hidden path="userReport"/>
					   <input type="file" name="uploadfile" class="choose">
	                   <button type="button" class="btn btn-primary btn-md">浏览</button> 
	                   <input type="hidden" name="pageCurr" value="${pageCurr }">
	            </div>
	    </div>
    </c:if>
    
    <c:if test="${user.userId ==null }">
		<div class="row">
	    	    <div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>用户名：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            <form:input class="navbar-link" path="userName" id="username" onblur="checkoutname()"/><label id="nameMess"style="font:bold;color: red" hidden>用户名不能为空</label><br>
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2 col-xs-1 col-xs-offset-1"><p>账号：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            	<form:input class="navbar-link" path="userNum" id="usernum" onblur="checkoutUsrename()"/>
					<label id="usernameMess"style="font:bold;color: red" hidden>账号不能为空</label>
					<label id="usernameMess1"style="font:bold;color: red" hidden>此用户已存在</label>
	            </div>
	        </div>
	    </div>
	    <div class="row">
	    		<div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>用户角色：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            	<form:select class="form-control" path="userRole" items="${userRole }" itemLabel="roleName" itemValue="roleId"></form:select><br>
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1"><p>所属单位：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<form:select class="form-control" path="userDep" items="${userDep }" itemLabel="depName" itemValue="depId"></form:select><br>
	            </div>
	        </div>
	    </div>
		<div class="row">
	    	    <div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>正副：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<select name="userNp" class="form-control">
					<option value="0" <c:if test="${user.userNp == 0 }">selected</c:if>>正</option>
					<option value="1" <c:if test="${user.userNp == 1 }">selected</c:if>>副</option>
					<option value="3" <c:if test="${user.userNp == 3 }">selected</c:if>>校领导</option>
				</select><br>
	
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>职务：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            	    <form:input path="userDuty" class="navbar-link"/><br>
	            </div>
	    </div>
		<div class="row">
	    	<div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>是否在职：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<select name="userDesc" class="form-control">
								<option value="0"     <c:if test="${user.userDesc == '0' }">selected</c:if>     >在职</option>
								<option value="1"     <c:if test="${user.userDesc == '1' }">selected</c:if>     >不在职</option>
						</select>
	            </div>
	            <div class="col-lg-1 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>述职文件：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
					   <input type="file" name="uploadfile" class="choose">
	                   <button type="button" class="btn btn-primary btn-md">浏览</button> 
	            </div>
	       </div>
	     </div>
	    <div class="row" style="margin-top:2%;">
	    	<div class="col-lg-1 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-3"><p>密码：</p></div>
	            <div class="col-lg-2 col-md-3 col-xs-2">
	            		<form:password class="navbar-link" path="userPassword" id="password" onblur="checkpassword()"/>
						<label id="passwordMess"style="font:bold;color: red" hidden>密码不能为空</label><br>
	            </div>
	         </div> 
	    </div>
	</c:if>
	
	
	<div class="row">
	  <div class="col-lg-2 col-lg-offset-4 col-md-3 col-md-offset-3 col-xs-2 col-xs-offset-4 " style="margin-top:2%;">
	     <button type="button" class="btn btn-primary btn-md" id="button">提交</button>
	  </div>
	</div>
</form:form>
</body>
</html>

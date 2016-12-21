<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
</head>
<body>
 
	<form id="form" action="${pageContext.request.contextPath }/user/updatePassword" method="post">
        	<input type="hidden" name="userId" value="${userId }">
        	<p>请输入原始密码：</p>
            <input type="password"  id="psword" onblur="verify(${userId })"> 
            <p id="mess1" style="color:red;display:none">原始密码不正确！</p>

    
        	<p>请输入密码：</p>
            <input type="password" id="password1" name="password" onblur="mess2()"> 
            <p id="mess2" style="color:red;display:none">密码不能为空！</p>

	    
			<p>请再次输入密码：</p>
            <input type="password" id="password2" onblur="mess3()">
         	<p id="mess3" style="color:red;display:none">密码不能为空！</p>
         	<p id="mess4" style="color:red;display:none">两次输入密码不同！</p>

	    
	     	<input type="button" id="button"  value="提交">
     </form>
     
<script type="text/javascript">
	$(document).ready(function(){
	    $("#button").click(function(){  
	        if(checkout()==true){
	        	alert("密码修改后将会重新登陆");
	            $("#form").submit();  
	        }  
	    });  
	});
	
	function verify(id){
		var password = $("#psword").val();
		var date = {
				"id":id,
				"password" : password
		}
		
		$.ajax({
			//先走校验的action
			url : '${pageContext.request.contextPath }/user/ajaxNotOrSuccess',
			type : 'post',
			data : date,
			dataType : 'text',
			success : function(date) {
				if(date == "false"){
					$("#button").attr("disabled","true");
					$("#mess1").show();
				} else{
					$("#button").removeAttr("disabled");
					$("#mess1").hide();
				}
			}

		});
		
	}
    
	function checkout(){
		var a = $("#password1").val();
		var b = $("#password2").val();
		var c = $("#psword").val();
		if(c==null | c ==''){
			alert("请输入原始密码！");
			return false;
		}
		
		if(a==null | a ==''){
			alert("请输入密码！");
			return false;
		}
		if(b ==null | b == ''){
			alert("请再次输入密码！");
			return false;
		}
		if(a != b){
			alert("两次输入密码不相同，请再次输入！");
			return false;
		} else {
			return true;
		}
		
	}
	
	function mess2(){
		if($("#password1").val()==''){
			$("#mess2").show();
		} else{
			$("#mess2").hide();
		}
	}
	
	function mess3(){
		if($("#password2").val()==''){
			$("#mess3").show();
		} else{
			$("#mess3").hide();
		}
		
		if($("#password1").val() != $("#password2").val()){
			$("#mess4").show();
		} else{
			$("#mess4").hide();
		}
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/two.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
</head>

<body>
<div class="dangqian">
   <div class="container">
       <div class="row" style="margin-top:30px;">
         <div class="col-lg-3 col-lg-offset-7 col-md-3 col-md-offset-6 col-xs-3  col-xs-offset-7">
            <p>当前位置：管理员>>修改密码</p>
         </div>
         <div class="col-lg-2 col-md-3 col-xs-2">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
         </div>
     </div>
    </div>
</div>

    </div>
</div>


        	


	    

<form id="form" action="${pageContext.request.contextPath }/user/updatePassword" method="post"> 
	<input type="hidden" name="userId" value="${userId }"> 
	<div class="main">
		<div class="row">
	    	<div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-2 col-xs-8 col-xs-offset-2" style="margin-top:30px; font-size:18px;">
	        	请输入原始密码：
	        	<input type="password"   class="navbar-link" id="psword" onblur="verify(${userId })"> 
            	<p id="mess1" style="color:red;display:none">原始密码不正确！</p>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-2 col-xs-8 col-xs-offset-2" style="margin-top:20px; font-size:18px;">
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入密码：
	        	 <input type="password" id="password1" class="navbar-link" name="password" onblur="mess2()"> 
            <p id="mess2" style="color:red;display:none">密码不能为空！</p>
	        </div>
	    </div>
	    <div class="row">
	    	<div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-2 col-xs-8 col-xs-offset-2" style="margin-top:20px; font-size:18px;">
	        	请再次输入密码：
	        	<input type="password"  class="navbar-link" id="password2" onblur="mess3()">
         	<p id="mess3" style="color:red;display:none">密码不能为空！</p>
         	<p id="mess4" style="color:red;display:none">两次输入密码不同！</p>
	        </div>
	    </div>
	    <div class="row">
	     <div class="col-lg-1 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-8 col-xs-offset-3" style="margin-top:30px; width:10%;">
	       <button type="button" id="button" class="btn btn-primary btn-md" style="font-size:18px; margin-left:88px;">提&nbsp;&nbsp;交</button> 
	    </div>
	</div>
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







<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
     

</body>
</html> --%>
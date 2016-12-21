<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校正厅评价所有正职</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script type="text/javascript"> 

	$(document).ready(function(){
	    $("#button").click(function(){ 
	    	if(checkout()==true){ 
	            //
	        }
	    });  
	});

	function checkout(){
		//得到本次参与评价的总人数
		var count = $("#count").val();
		//a 得到某个人一共评价了多少人，如果少于总数提示；
		var a = 0;
		result = "";
		var inpArr = $("input[type='radio']");
		for(var i=0;i<inpArr.length;i++){
		    if(inpArr[i].checked){
		    	result+=inpArr[i].value+",";
		        a=a+1;
		    }
		}
		$("#result").attr("value",result);
		
		if(count !=a ){
			alert("请对全部人员做出评价");
			return false;
		}
		
		var one=0;
		var two=0;;
		var three=0;
		var four=0;
		
		for(var i=0;i<result.length;i++){
			console.log(1);
			if(result.charAt(i) == 1){
				one = one + 1;
			}
			if(result.charAt(i) == 2){
				two = two + 1;
			}
			if(result.charAt(i) == 3){
				three = three + 1;
			}
			if(result.charAt(i) == 4){
				four = four + 1;
			}
		}
		//alert("one:" + one + "  tow:" + two + "  three:" + three + "  four:" + four);
		//已经得到每一项的人数，接下来就是判断
		//发送Ajax到后台查询本次评价的百分比
		$.ajax({
			//先走校验的action  
			url : '${pageContext.request.contextPath }/user/ajaxgetBili',
			type : 'post',
			data : null,
			dataType : 'text',
			success : function(data) {
				//alert(one);
				var result = one/count*100;
				if(result < data){
					flag = true;
					$("#form").submit();  
				} else{
					alert("本次评价的优秀人数超过50%，请重新评价！")
				}
			}
		}); 
	} 
	
	
	
	
	/* function addResult(a){
		//获得本次评论总人数
		var count = a;
		var num =b;
		//var inpArr = document.getElementsByTagName("input");
		var inpArr = $("input[type='radio']");
		result = "";
		for(var i=0;i<inpArr.length;i++){
		    if(inpArr[i].checked){
		        result+=inpArr[i].value+",";
		        b=b+1;
		    }
		}
		
		$("#result").attr("value",result);
		return false;
	} */
	
</script>
</head>
<body>
<c:if test="${message == null }">
校正厅评价所有正职
====${sessionScope.user.userName }===
<%-- <form id="form" action="${pageContext.request.contextPath }/user/xzAllz"> --%>
<form id="form" action="${pageContext.request.contextPath }${url}">
	<input type="hidden" name="evalEvalto" value="${sessionScope.user.userId }">
	<table border="1" cellpadding="1" cellspacing="0">
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>评价</td>
			<td>述职报告</td>
		</tr>
		
		
	
		<c:forEach items="${userList }" var="user" varStatus="id">
			<input type="hidden" name="evalEvalby" value="${user.userId }">
			<tr>
				<td>${id.count }</td>
				<td>${user.userName }</td>
				<td>
					<input type="radio" name="eval${user.userId }" value="1"> 优秀
					<input type="radio" name="eval${user.userId }" value="2"> 称职
					<input type="radio" name="eval${user.userId }" value="3"> 基本称职
					<input type="radio" name="eval${user.userId }" value="4"> 不称职
				</td>
				<td>
					<%-- <img alt="" height="10" width="10" src="${pageContext.request.contextPath }/upload/1481966691829.png"> --%>
					<a class="image-icon" rel="gallery[modal]" href="${pageContext.request.contextPath }/${user.userReport}">
					<img height="20" width="50" src="${pageContext.request.contextPath }/${user.userReport}"></a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<input type="hidden" id="result" name="resultt" value="">
				<input type="hidden" id="count" value="${userNum }">
				====${userNum }===
				<input type="button" value="提交" id="button" >
			</td>
		</tr>
	</table>
</form>
</c:if>
<c:if test="${message != null }">
	${message }
</c:if>
</body>
</html>


<head>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 begin -->
<script type='text/javascript' src='${pageContext.request.contextPath }/ly/js/jquery.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath }/ly/css/style.min.css" />
</head>

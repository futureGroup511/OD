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
	/* $(function(){
		
	})
	
	function clickk(){
		alert($("input[type='radio']:checked").val());
	} */
	
	
	 
	function addResult(){
		//var inpArr = document.getElementsByTagName("input");
		var inpArr = $("input[type='radio']");
		result = "";
		for(var i=0;i<inpArr.length;i++){
		    if(inpArr[i].checked){
		        result+=inpArr[i].value+",";
		    }
		}
		alert(result);
		$("#result").attr("value",result);
		return false;
	}
</script>
</head>
<body>
校正厅评价所有正职
====${sessionScope.user.userName }==
<form action="${pageContext.request.contextPath }/user/xzAllz">
	<input type="hidden" name="evalEvalto" value="${sessionScope.user.userId }">
	<table border="1" cellpadding="1" cellspacing="0">
		<tr>
			<td>序号</td>
			<td>正职名称</td>
			<td>评价</td>
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
			</tr>
		</c:forEach>
		<tr>
			<td>
				<input type="hidden" id="result" name="resultt" value="">
				<input type="submit" value="提交" id="submit" onclick="addResult()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
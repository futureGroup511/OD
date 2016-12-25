<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>caidan</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/caidan.css">
</head>
<body id="bg">
	<div class="container">
		<div class="leftsidebar_box">
			<div class="line"></div>
			<dl class="channel">
			<c:if test="${sessionScope.user.userRole == 1 }">
				<a target="right"
					href="${pageContext.request.contextPath }/user/xzAllzUI"><dt>评价所有处级干部</dt></a>
				<a target="right"
					href="${pageContext.request.contextPath }/user/xzAllFenGuanUI"><dt>评价分管单位</dt></a>
			</c:if>
			<c:if test="${sessionScope.user.userRole == 2 }">
				<a target="right"
					href="${pageContext.request.contextPath }/user/xfAllzfUI"><dt>评价所有处级干部</dt></a>
				<a target="right"
					href="${pageContext.request.contextPath }/user/xfAllFenGuanUI"><dt>评价分管单位</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 0}">
				<a target="right"
					href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI"><dt>互评</dt></a>
				<a target="right"
					href="${pageContext.request.contextPath }/user/dangqunGetAllDepZFUI"><dt>评价本单位所有副职</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 1}">
				<a target="right"
					href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI"><dt>互评</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 0}">
				<a target="right"
					href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI"><dt>互评</dt></a>
				<a target="right"
					href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAllDepDownUI"><dt>评价本单位所有副职</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 1}">

				<a target="right"
					href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI"><dt>互评</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 0}">
				<a target="right"
					href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI"><dt>互评</dt></a>
				<a target="right"
					href="${pageContext.request.contextPath }/user/XzGetAllDepDownUI"><dt>评价本单位所有副职</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 1}">
				<a target="right"
					href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI"><dt>互评</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 0}">
				<a target="right"
					href="${pageContext.request.contextPath }/user/YxYzGetXzUI"><dt>互评</dt></a>

				<a target="right"
					href="${pageContext.request.contextPath }/user/YxYzGetDepDownUI"><dt>评价自己单位所有副职</dt></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 1}">
				<a target="right"
					href="${pageContext.request.contextPath }/user/YxYzGetXzUI"><dt>与行政教辅部门互评</dt></a>
			</c:if>
			</dl>


			<c:if test="${sessionScope.user.userNum == 'admin'}">
			
				
				<dl class="channel">

					<a target="right"
						href="${pageContext.request.contextPath }/user/getAllUser/1"><dt>查看所有用户信息</dt></a>
					<a target="right"
						href="${pageContext.request.contextPath }/department/getAllDep"><dt>查看所有单位信息</dt></a>
					<a target="right"
						href="${pageContext.request.contextPath }/user/getAllRole"><dt>查看所有角色</dt></a>
		              	<dt>信息管理</dt>
		                <dd><a target="right"
						href="${pageContext.request.contextPath }/user/getAllUser/1">查看所有用户信息</a></dd>
		                <dd><a target="right"
						href="${pageContext.request.contextPath }/department/getAllDep">查看所有单位信息</a></dd>
		                <dd><a target="right"
						href="${pageContext.request.contextPath }/user/getAllRole">查看所有角色</a></dd>
               	</dl>
               		
				<dl class="channel">
					
					<%-- <a target="right"
						href="${pageContext.request.contextPath }/evaluate/valuatedByInfo/1"><dt>查看人的
							被评价</dt></a> --%>
					<a target="right"
						href="${pageContext.request.contextPath }/evaluate/valuateToInfo/1"><dt>查看干部打分情况</dt></a>
					<a target="right"
						href="${pageContext.request.contextPath }/evaluate/seeAllEvaluateResult"><dt>查看总评结果</dt></a>
					<a target="right" onClick="if(confirm( '确定要清空吗！ ')==false)return   false;"
						href="${pageContext.request.contextPath }/user/empetDate"><dt>清空数据</dt></a>
					<%--<a href="/OD/user/modifyexcellent/?juge=1" target="right">修改优秀比例权重</a>
					<a href="/OD/user/modifyProperties/?juge=1" target="right"><dt>修改校厅级权重</dt</a><br>
					<a href="/OD/user/modifySGProperties/?juge=1" target="right"><dt>党群正处、行政正处权重</dt></a>
					<a href="/OD/user/modifySBGProperties/?juge=1" target="right"><dt>教学副书记、教学副院长权重</dt</a>
					<a href="/OD/user/modifyAGProperties/?juge=1" target="right"><dt>教学正书记、教学正院长权重</dt></a>
					<a href="/OD/user/modifyDCProperties/?juge=1" target="right"><dt>党群副处、行政副处权重</dt></a>--%>

				</dl>
						
					<dl class="channel">
		              	<dt>修改权重</dt>
						<dd><a href="/OD/user/modifyexcellent/?juge=1" target="right">修改优秀比例权重</a></dd>
		                <dd><a href="/OD/user/modifyProperties/?juge=1" target="right">校厅级权重</a></dd>
		                <dd><a href="/OD/user/modifySGProperties/?juge=1" target="right">党群正处/行政正处</a></dd>
		                <dd><a href="/OD/user/modifySBGProperties/?juge=1" target="right">教学副书记/教学副院长</a></dd>
		                <dd><a href="/OD/user/modifyAGProperties/?juge=1" target="right">教学正书记/教学正院长</a></dd>
		                <dd><a href="/OD/user/modifyDCProperties/?juge=1" target="right">党群副处/行政副处</a></dd>
               		</dl>
						
				


			</c:if>
			<c:if test="${sessionScope.user.userNum != 'admin'}">
				<dl class="channel">

					<a
						href="/OD/evaluate/findByUserIdOrEvalByName/?id=${sessionScope.user.userId}"
						target="right"><dt>查看自己评价过的人</dt></a>
				</dl>
			</c:if>
			<dl class="channel">
				<a target="right"
					href="${pageContext.request.contextPath }/user/updateUserUI/${sessionScope.user.userId}"><dt>修改个人信息</dt></a>
				<a target="right"
					href="${pageContext.request.contextPath }/user/updatePasswordUI/${sessionScope.user.userId}"><dt>修改密码</dt></a>
				<a onClick="if(confirm( '确定要退出吗！ ')==false)return   false;" href="${pageContext.request.contextPath }/user/logout"><dt>退出</dt></a>
			</dl>

		</div>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.4.js"></script>
	<script type="text/javascript">
		$(".leftsidebar_box dt").css({
			"background-color" : "#1E68B5"
		});
		$(".leftsidebar_box dt img").attr("src",
				"${pageContext.request.contextPath }/images/select_xl01.png");
		$(function() {
			$(".leftsidebar_box dd").hide();
			$(".leftsidebar_box dt")
					.click(
							function() {
								$(".leftsidebar_box dt").css({
									"background-color" : "#1E68B5"
								})
								$(this).css({
									"background-color" : "#238AE3"
								});
								$(this).parent().find('dd').removeClass(
										("menu_chioce"), 6000);
								$(".leftsidebar_box dt img")
										.attr("src",
												"${pageContext.request.contextPath }/images/select_xl01.png");
								$(this)
										.parent()
										.find('img')
										.attr("src",
												"${pageContext.request.contextPath }/images/select_xl01.png");
								$(".menu_chioce").slideUp();
								$(this).parent().find('dd').slideToggle();
								$(this).parent().find('dd').addClass(
										"menu_chioce");
							})
		})
	</script>
</body>
</html>






<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<c:if test="${sessionScope.user.userRole == 1 }">
		校正厅---<br> 
		<a target="right"
			href="${pageContext.request.contextPath }/user/xzAllzUI">所有正职</a>
		<a target="right"
			href="${pageContext.request.contextPath }/user/xzAllFenGuanUI">分管单位</a>
	</c:if>
	<c:if test="${sessionScope.user.userRole == 2 }">
		校副厅<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/xfAllzfUI">校副厅评价所有处级干部</a><br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/xfAllFenGuanUI">校副厅1类对分管单位</a>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评</a>
		<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/dangqunGetAllDepZFUI">党群部门
			正评价本单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 1}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评教学书记副书记</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a>
		<br>
		
		<a target="right"
			href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAllDepDownUI">评价本单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 1}">
		
		<a target="right"
			href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a>
		
		<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/XzGetAllDepDownUI">评价本单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 1}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 0}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a>
		
		<br>
		<a target="right"
			href="${pageContext.request.contextPath }/user/YxYzGetDepDownUI">评价自己单位所有副职</a>
		<br>
	</c:if>
	<c:if
		test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 1}">
		<a target="right"
			href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a>
		<br>
	</c:if>
	<br>
	
	
	<c:if test="${sessionScope.user.userNum == 'admin'}">
		<a target="right" href="${pageContext.request.contextPath }/user/getAllUser/1">查看所有用户信息</a><br>
		<a target="right" href="${pageContext.request.contextPath }/department/getAllDep">查看所有单位信息</a><br>
		<a target="right" href="${pageContext.request.contextPath }/user/getAllRole">查看所有角色</a><br>
		<a target="right" href="${pageContext.request.contextPath }/evaluate/valuatedByInfo/1">查看人的 被评价</a><br/>
		<a target="right" href="${pageContext.request.contextPath }/evaluate/valuateToInfo/1">查看干部打分情况</a><br>
		<a target="right" href="${pageContext.request.contextPath }/evaluate/seeAllEvaluateResult">查看总评结果</a><br>
		=======<a target="right" href="${pageContext.request.contextPath }/user/empetDate">清空数据</a>=====<br>
	</c:if>
	<c:if test="${sessionScope.user.userNum != 'admin'}">
		<a href="/OD/evaluate/findByUserIdOrEvalByName/?id=${sessionScope.user.userId}" target="right">查看自己评价过的人</a><br>
	</c:if>
	
	<a target="right" href="${pageContext.request.contextPath }/user/updateUserUI/${sessionScope.user.userId}">修改个人信息</a><br>
	<a target="right" href="${pageContext.request.contextPath }/user/updatePasswordUI/${sessionScope.user.userId}">修改密码</a><br>
<<<<<<< HEAD
	<a href="${pageContext.request.contextPath }/user/logout">退出</a><br>
	<a href="/OD/user/modifyProperties/?juge=1" target="right">修改校厅级权重</a><br>
	<a href="/OD/user/modifySGProperties/?juge=1" target="right">党群正处、行政正处权重</a>
	<a href="/OD/user/modifySBGProperties/?juge=1" target="right">教学副书记、教学副院长权重</a>
	<a href="/OD/user/modifyAGProperties/?juge=1" target="right">教学正书记、教学正院长权重</a>
	<a href="/OD/user/modifyDCProperties/?juge=1" target="right">党群副处、行政副处权重</a>
<%-- =======
<a target="right" href="${pageContext.request.contextPath }/user/getAllUser" >查看所有用户信息</a><br>
<a target="right"  href="${pageContext.request.contextPath }/department/getAllDep" >查看所有单位信息</a>

<br>
<c:if test="${sessionScope.user.userRole == 1 }">
<a target="right" href="${pageContext.request.contextPath }/user/xzAllzUI">所有正职</a>
<a target="right" href="${pageContext.request.contextPath }/user/xzAllFenGuanUI">分管单位</a>
</c:if>
<c:if test="${sessionScope.user.userRole == 2 }">
<a target="right" href="${pageContext.request.contextPath }/user/xfAllFenGuanUI">校副厅1类对分管单位</a>
</c:if>
<c:if test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/dangqunGetAllDepZFUI">党群部门 正评价本单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 3 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/dangqunGetAllJiaoxueShujiUI">互评教学书记副书记</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAllDepDownUI">评价本单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 4 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/JiaoxueShujiGetAlldangqunUI">互评</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/XzGetAllDepDownUI">评价本单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 5 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/XzGetAllYxYzUI">与院系院长副院长互评</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 0}">
<a target="right" href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a><br>
<a target="right" href="${pageContext.request.contextPath }/user/YxYzGetDepDownUI">评价自己单位所有副职</a><br>
</c:if>
<c:if test="${sessionScope.user.userRole == 6 && sessionScope.user.userNp == 1}">
<a target="right" href="${pageContext.request.contextPath }/user/YxYzGetXzUI">与行政教辅部门互评</a><br>
</c:if>
<br>
<a href="/OD/evaluate/findByUserIdOrEvalByName/?id=${user.userId}" target="right">查看自己评价过的人</a>
<br>
<<<<<<< HEAD
<a href="${pageContext.request.contextPath}/user/logout">退出</a>
=======
<a href="${pageContext.request.contextPath }/user/logout">退出</a>
<<<<<<< HEAD

>>>>>>> 97879c303ce865df8793ea39d17f0c787247db21 --%>

<%-- <!-- by 赵硕 -->
	<a href="${pageContext.request.contextPath }/user/logout">退出</a>
<br/>
<br/>

<a target="right" href="${pageContext.request.contextPath }/evaluate/redirectHere">查看总评结果</a>

</body>
</html>  --%>
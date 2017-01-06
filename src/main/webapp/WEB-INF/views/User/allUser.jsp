<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>查看所有用户</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/yemian4.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/ly/auto/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/ly/auto/jquery.autocomplete.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath }/ly/auto/jquery.autocomplete.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
		$.ajax({
 			url:'${pageContext.request.contextPath }/user/ajaxgetAllUserName',
 			type:'post',
			data:null,
			dataType:'json',
 			success:function(msg) {
                 /* var datas = eval(msg);
                 $("#txtIput").autocomplete(datas); */
                 $('#txtIput').AutoComplete({
         		    //'data': ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve'],
         		    'data': msg,
         		    'itemHeight': 20,
         		    'width': 280
         		})
             }
         });
     })
</script>
</head>

<body>
<div class="container">
  <div class="row" >
        <div class="col-lg-3 col-lg-offset-7 col-md-3 col-md-offset-6 col-xs-3  col-xs-offset-6" style="margin-top:30px;">
            <p>当前位置：管理员>>查看所有用户</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3"  style="margin-top:30px;">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
 <div class="row" style="height:30px;font-size:19px;">
  <form action="${ pageContext.request.contextPath}/user/findByNameForUser" method="post">
		  <div class="col-lg-1 col-md-1 col-md-offset-1 col-xs-1 col-xs-offset-1" >
             <a><p><a href="${ pageContext.request.contextPath}/user/addUserUI" class="btn btn-primary" type="button" style="font-size:18px; margin-left:-52px;"><img src="${pageContext.request.contextPath }/img/yonghuzengjia.png" width="28" height="25">增加用户</a></p></a>
           </div>
	    	<div class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-1 col-xs-3 col-xs-offset-1" style="margin-top:5px;padding-left:20px;">
	        	姓名：<input  name="name" type="text" id="txtIput" class="navbar-link">
	        </div>
	        <div class="col-lg-3 col-md-4 col-xs-4" style="margin-top:5px; margin-left:-30px;">
	        	角色：<select name="role">
	        			<option value="0" <c:if test="${tempRole == 0 }">selected</c:if> >请选择
	        			<option value="1" <c:if test="${tempRole == 1 }">selected</c:if>>校正厅</option>
	        			<option value="2" <c:if test="${tempRole == 2 }">selected</c:if>>校副厅</option>
	        			<option value="3" <c:if test="${tempRole == 3 }">selected</c:if>>机关党群</option>
	        			<option value="4" <c:if test="${tempRole == 4 }">selected</c:if>>教学单位党务</option>
	        			<option value="5" <c:if test="${tempRole == 5 }">selected</c:if>>机关行政</option>
	        			<option value="6" <c:if test="${tempRole == 6 }">selected</c:if>>教学单位行政</option>
	        		</select>
	        </div>
	        
	        <div class="col-lg-1 col-md-1 col-xs-1">
	        	<button type="submit" class="btn btn-primary" style="height:39px; font-size:18px; margin-left:-20px;">查&nbsp;&nbsp;询</button>
	        </div>
        </form>
  </div>
</div>

<div class="table-responsive">
	
    ${userDeleteMessage }
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>序号</th>
         <th>姓名</th>
         <th>账号</th>
         <th>角色</th>
         <th>单位</th>
         <th>职务</th>
         <th>正/副</th>
         <!-- <th>述职报告</th> -->
         <th>是否在职</th>
         <th>编辑</th>
       </tr>
      </thead>
      <tbody>
      
      
      	
      		<c:if test="${pageBean.recordlist != null }">
				<c:forEach items="${pageBean.recordlist }" var="user" varStatus="id">
					<tr>
						<td>${id.count }</td>
						<td>${user.userName }</td>
						<td>${user.userNum }</td>
						<td>${user.role.roleName }</td>
						<td>${user.department.depName }</td>
						<td>${user.userDuty }</td>
						<td>
							<c:if test="${user.userNp ==0 }">正</c:if>
							<c:if test="${user.userNp ==1 }">副</c:if>
						</td>
						<%-- <td>${user.userReport }</td> --%>
						<td>
							<c:if test="${user.userDesc == '0' }">在职</c:if>
							<c:if test="${user.userDesc == '1' }">不在职</c:if>
						</td>
						<td class="four"><img src="${pageContext.request.contextPath }/img/bian.png"><a href="${pageContext.request.contextPath }/user/updateUserUI/${user.userId }/${currentPage }">修改</a>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath }/img/lajitong.png"><a href="${pageContext.request.contextPath }/user/deleteUser/${user.userId }" style="color:#E11E05;">删除</a>
						<img src="${pageContext.request.contextPath }/img/bian.png"><a onClick="if(confirm( '确定要重置密码吗！ ')==false)return   false;" href="${pageContext.request.contextPath }/user/resetPassword/${user.userId }/${currentPage }">重置密码</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${userr != null }">
				<c:forEach items="${userr }" var="user" varStatus="id">
					<tr>
						<td>${id.count }</td>
						<td>${user.userName }</td>
						<td>${user.userNum }</td>
						<td>${user.role.roleName }</td>
						<td>${user.department.depName }</td>
						<td>${user.userDuty }</td>
						<td>
							<c:if test="${user.userNp ==0 }">正</c:if>
							<c:if test="${user.userNp ==1 }">副</c:if>
						</td>
						<%-- <td>${user.userReport }</td> --%>
						<td>
							<c:if test="${user.userDesc == '0' }">在职</c:if>
							<c:if test="${user.userDesc == '1' }">不在职</c:if>
						</td>
						<td class="four"><img src="${pageContext.request.contextPath }/img/bian.png"><a href="${pageContext.request.contextPath }/user/updateUserUI/${user.userId }/1">修改</a>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath }/img/lajitong.png"><a href="${pageContext.request.contextPath }/user/deleteUser/${user.userId }" style="color:#E11E05;">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
      </tbody>
    </table>
</div>
<c:if test="${userr == null }">
 <div class="container">
  <div class="row">
   <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
           <p class="xixnxi">每页显示${pageBean.pageSize }条，总记录数${pageBean.recordCount }条</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
           <nav>
          <ul class="pagination">
            </li>
            <li><a href="javascript:gotoPage(1)">首页</a></li>
            <li><a href="javascript:gotoPage(${pageBean.currentPage }-1)">上一页</a></li>
            <li><a href="#">${pageBean.currentPage }/${pageBean.pageCount }</a></li>
            <li><a href="javascript:gotoPage(${pageBean.currentPage }+1)">下一页</a></li>
            <li><a href="javascript:gotoPage(${pageBean.pageCount })">尾页</a></li>
            </li>
          </ul>
        </nav>
        </div>
      </div>
</div>
</c:if>
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

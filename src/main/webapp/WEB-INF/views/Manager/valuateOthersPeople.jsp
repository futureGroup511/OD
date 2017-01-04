<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<title>页面8</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/yemian8.css">
</head>
<body>
<div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-6 col-md-3 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：管理员>>具体查询干部打分情况</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
<div class="row">
   <div class="col-lg-2 col-lg-offset-3 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
      <p>评价人：${requestScope.nameLY }</p>
   </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>序号</th>
         <th>单位</th>
         <th>被评人</th>
         <th>评价结果</th>
       </tr>
      </thead>
      <tbody>
        <c:forEach items="${requestScope.evaluatesList }" var="valuatedMeInfo" varStatus="id">
            <tr>
                <td>${id.count }</td>
                <td>${valuatedMeInfo.evalDep.depName }</td>
                <td>${valuatedMeInfo.evaluatedTo.userName }</td>
                <td>
                <c:if test="${valuatedMeInfo.evalRank ==100  }">
                	优秀
                </c:if>
                <c:if test="${valuatedMeInfo.evalRank ==80  }">
                	称职
                </c:if>
                <c:if test="${valuatedMeInfo.evalRank ==60  }">
                	基本称职
                </c:if>
                <c:if test="${valuatedMeInfo.evalRank ==40  }">
                	不称职
                </c:if>
            </tr>
        </c:forEach>
      </tbody>
    </table>
</div>
</body>
</html>






<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看所有总评结果</title>
</head>
<body> 
评价人：${requestScope.nameLY }
<table class="table">
    <tr>
        <th>序号</th>
        <th>单位</th>
        <th>被评人</th>
        <th>评价结果</th>
    </tr>
        <c:forEach items="${requestScope.evaluatesList }" var="valuatedMeInfo" varStatus="id">
            <tr>
                <td>${id.count }</td>
                <td>${valuatedMeInfo.evalDep.depName }</td>
                <td>${valuatedMeInfo.evaluatedTo.userName }</td>
                <td>
                <c:if test="${valuatedMeInfo.evalRank ==1  }">
                	优秀
                </c:if>
                <c:if test="${valuatedMeInfo.evalRank ==2  }">
                	称职
                </c:if>
                <c:if test="${valuatedMeInfo.evalRank ==3  }">
                	基本称职
                </c:if>
                <c:if test="${valuatedMeInfo.evalRank ==4  }">
                	不称职
                </c:if>
            </tr>
        </c:forEach>
</table>
</body>
</html>
 --%>
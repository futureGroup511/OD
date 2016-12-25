<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2016/12/18
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看被评价人</title>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/js/paging.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/]js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xlsx.core.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/blob.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/FileSaver.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tableexport.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ten.css" />
</head>
<style>
    table.gridtable {
                 font-family: verdana,arial ,sans-serif;
                 font-size:11px;
                 color:#333333;
                 border-width: 1px;
                 border-color: #666666;
                 border-collapse: collapse;
             }
</style>

<body>

    <div class="row form">
        <form action="/OD/evaluate/findByUserIdOrEvalByName" method="post" id="form">
            <input type="hidden" name="id" value="${sessionScope.user.userId}">
            <input type="hidden" name="currentPage" value="${page.currentPage}" id="currentPage">
            <div class="col-lg-1 col-lg-offset-2 col-md-1 col-md-offset-2 col-xs-1 col-xs-offfet-2">
            姓名：
            </div>
            <div class="col-lg-2  col-md-2  col-xs-3">
                <input type="text" name="name" value="${findname}">
            </div>
            <div class="col-lg-2 col-md-2 col-xs-3">
                <input type="submit" value="确定">
            </div>
        </form>
    </div>




    <div class="table-responsive">


    <c:if test="${page.recordCount ne 0}">
        <table  class="table table-striped" style="font-size:16px;" >
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>角色</th>
                <th>单位</th>
                <th>评价类型</th>
                <th>评价等级</th>
            </tr>
            <c:forEach items="${page.recordlist}" var="eval" varStatus="status" >
                <tr>
                    <td>${status.index+1}</td>
                    <td>${eval.userBy.userName}</td>
                    <td>${eval.userBy.role.roleName}</td>
                    <td>${eval.userBy.department.depName}</td>
                    <td>${eval.evalsort}</td>
                    <td>${eval.evalgrade}</td>
                </tr>
            </c:forEach>
        </table>
        <nav>
            <ul class="pagination">
                <li><a href="#" onclick="turning(1)">首页</a></li>
                <li><a href="#" onclick="turning(${page.currentPage-1})">上一页</a></li>
                <li><a href="#">${page.currentPage }/${page.pageCount }</a></li>
                <li><a href="#" onclick="turning(${page.currentPage+1},${page.pageCount})">下一页</a></li>
                <li><a href="#" onclick="turning(${page.pageCount},${page.pageCount})">尾页</a></li>
            </ul>
        </nav>

    </c:if>
    <c:if test="${page.recordCount == 0}">
        没有数据
    </c:if>
    </div>
</body>
</html>

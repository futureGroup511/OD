<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>当前位置：管理员>>干部总评结果</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yemian7.css">
    <script type="text/javascript"  src="${pageContext.request.contextPath}/js/paging.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/ly/auto/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/ly/auto/jquery.autocomplete.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/ly/auto/jquery.autocomplete.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xlsx.core.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/blob.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/FileSaver.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tableexport.js"></script>
    <style rel="stylesheet" href="${pageContext.request.contextPath}/js/myJs/bootstrap.min.css"    />


</head>
<style>
    table.gridtable {
        font-family: verdana,arial,sans-serif;
        font-size:11px;
        color:#333333;
        border-width: 1px;
        border-color: #666666;
        border-collapse: collapse;
    }
</style>
<script>
    /*getAlldepartmentName*/
    $(document).ready(function(){
        $.ajax({
                url:'${pageContext.request.contextPath }/evaluate/getAlldepartmentName',
                type:'post',
                data:null,
                success:function (msg) {
                        $("#dw").AutoComplete({
                            'data':msg,
                            'itemHeight': 20,
                            'width': 280
                        });
                 }
        });
    });

        $.ajax({
            url:'/OD/user/ajaxgetAllUserName',
            type:'post',
            data:null,
            success:function (msg) {
                $("#name").AutoComplete({
                    'data':msg,
                    'itemHeight':20,
                    'width':280
                });
            }
        });

    $("table").tableExport({
        bootstrap: false
    });
    $(function(){
        $("table").tableExport({formats:["xlsx"]});
    })
</script>
<body>
<div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-7 col-md-3 col-md-offset-6 col-xs-3  col-xs-offset-7">
            <p>当前位置：管理员>>干部总评结果</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-2">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
<div class="container-one">
    <div class="row form">
        <form action="${pageContext.request.contextPath }/evaluate/redirectHere" method="post">
            <div class="col-lg-3 col-md-4 col-xs-3 col-xs-offfet-1" style="margin-left: 10%; font-size:18px; width:30%;">
                姓名：<input type="text" name="userName" value="${requestScope.user.userName}" id="name">
            </div>
            <div class="col-lg-3  col-md-4  col-xs-3" style="font-size:18px; margin-left:-6%; width:30%;">
                单位：<input type="text" name="department.depName" value="${requestScope.user.department.depName}" id="dw">
            </div>
            <div class="col-lg-3  col-md-3  col-xs-2"  style="font-size:18px; margin-left:-6%;">
			              类别:<select name="userRole" >
			                      <option value="">请选择</option>
			                      <option value="3" <c:if test="${tempUesrRole == 3 }">selected</c:if> >机关党群</option>
			                      <option value="4" <c:if test="${tempUesrRole == 4 }">selected</c:if>>教学单位党务</option>
			                      <option value="5" <c:if test="${tempUesrRole == 5 }">selected</c:if>>机关行政</option>
			                      <option value="6" <c:if test="${tempUesrRole == 6 }">selected</c:if>>教学单位行政</option>
			                    </select>
			            </div>
            <div class="col-lg-1  col-md-1 col-xs-1"style="margin-top:-10px; margin-left:-60px;'">
                <input type="submit" class="btn btn-block btn-primary"  style="font-size:18px; background-color:#12A1EC"value="查&nbsp;&nbsp;询">
            </div>
        </form>

    </div>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
        <tr>
            <td>序号</td>
            <td>被评价人单位</td>
            <td>被评价人姓名</td>
            <td>正/副</td>
            <td>总评得分</td>
            <td>对口互评得分</td>
            <td>校领导评价得分</td>
            <td>单位正职评价得分</td>
            <td>查看</td>
        </tr>
        <c:forEach items="${requestScope.statisticList }" var="statistic" varStatus="id">
            <tr>
                <td>${id.count}</td>
                <td>${statistic.stati_user.department.depName}</td>
                <td>${statistic.stati_user.userName}</td>
                <c:if test="${statistic.stati_user.userNp eq 0}">
                <td> 正</td>
                </c:if>
                <c:if test="${statistic.stati_user.userNp eq 1}">
                <td>  副</td>
                </c:if>
                <td>${statistic.static_result }</td>
                <td>${statistic.static_xhp }</td>
                <td>${statistic.static_t }</td>
                <td>${statistic.static_xdw }</td>
                <td><a class="btn" href="/OD/evaluate/getValuatedMe/${statistic.stati_user.userId}">查看</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>

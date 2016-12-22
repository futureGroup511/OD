<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评价人信息及评价信息</title>


    <script type="text/javascript"  src="${pageContext.request.contextPath}/js/paging.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
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
    $("table").tableExport({
        bootstrap: false
    });
    $(function(){
        $("table").tableExport({formats:["xlsx","xls"]});
    })
</script>
<body>
<form:form modelAttribute="pType" action="${pageContext.request.contextPath }/evaluate/redirectHere" method="post">
    <form:select path="roleType">
        <form:option value="1">校正厅</form:option>
        <form:option value="2">校副厅</form:option>
        <form:option value="3">党群部门</form:option>
        <form:option value="4">教学书记副书记</form:option>
        <form:option value="5">行政教辅部门</form:option>
        <form:option value="6">院系院长副院长</form:option>
        <input type="submit" name="确定"/>
    </form:select>
</form:form>

<table class="valuateResult">
    <tr>
        <td>被评价人姓名</td>
        <td>被评价人职务</td>
        <td>互评平均得分</td>
        <td>正厅分管单位评价平均得分</td>
        <td>副厅评价平均得分</td>
        <td>单位上级评价平均得分</td>
        <td>总评得分</td>
    </tr>
    <c:forEach items="${requestScope.statisticList }" var="statistic">
        <tr>
            <td>${statistic.stati_user.userName }</td>
            <td>${statistic.stati_user.userDuty }</td>
            <td>${statistic.static_hp }</td>
            <td>${statistic.static_ztf }</td>
            <td>${statistic.static_ft }</td>
            <td>${statistic.static_dw }</td>
            <td>${statistic.static_result }</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

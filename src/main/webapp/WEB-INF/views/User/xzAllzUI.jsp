<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xinxiguanli</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style1.css" media="screen"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.paginate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script type="text/javascript"> 

	function xuanzhong(){
		//$("input[type='radio']").attr("checked",'checked');
		$(".chenzhi").attr("checked",'checked');
	}

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
				//alert(result);
				//alert(data);
				if(one == '1'){
					result = 50;
				}
				if(result <= data){
					//flag = true;
					//$("#form").submit();  
					var countResult = $("#result").val();
					var countUsre = "";
					var els =document.getElementsByName("evalEvalby");
					for (var i = 0, j = els.length; i < j; i++){
						//alert(els[i].value)
						countUsre = countUsre + (els[i].value)+",";
					}
					
					
					var date = {
							"countUsre":countUsre,
							"countResult" : countResult
					}
					
					$.ajax({
						//先走校验的action
						url : '${pageContext.request.contextPath }/user/ajaxgetBiliAfter',
						type : 'post',
						data : date,
						dataType : 'text',
						success : function(date) {
							//alert("结果:" + date);
							if(date == "true"){
								//alert(date + "提交")
								$("#form").submit(); 
							} else{
								alert("优秀结果里副职所占的比例不能少于30%");
								//alert(date + "不提交");
							}
						} 

					});		
					 
				} else{
					alert("本次评价的优秀人数超过50%，请重新评价！")
				}
			}
		}); 
	} 

</script>

<style>
*{margin:0px; padding:0px;}
body{margin:0 auto; font-size:12px; color:#666; font-family:"微软雅黑", Simsun;}
li{list-style:none;}
img{border:none;}
a, a:visited{text-decoration:none;}
	
.tong{ background:url(../images/images/sy-toubjing_03.gif) repeat-x 0px -11px; width:100%; height:40px;}
.wrap{ width:auto; max-width:620px; margin:0 auto;}
.center{ width:103%; margin:0 auto;}


</style>



</head>
<c:if test="${message == null }">
<body background="images/dotted.png">
		<div class="dangqian">
            <div class="container">
              <div class="row">
                
                <!-- <div class="col-lg-3 col-lg-offset-5 col-md-3 scol-md-offset-3 col-xs-5  col-xs-offset-1">
                    <p>当前位置：老师互评>>党委</p>
                </div>
                <div class="col-lg-2 col-md-3 col-xs-3">
                    <p>欢迎登录本系统</p>
                </div> -->
		     </div>
           </div>
        </div>


<div class="main">
		<div class="row form">
    	<div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-xs-1 col-xs-offfet-1">
        	<button type="button" class="btn btn-primary btn-md" onclick="xuanzhong()">一键选中称职</button>
        </div>
       </div>
        <div class="row">
         <div class="col-sm-12 col-md-12 col-lg-12" style="margin-left:-15;margin-right:-15;">
            <div class="table-responsive">
            <form id="form" action="${pageContext.request.contextPath }${url}">
				<input type="hidden" name="evalEvalto" value="${sessionScope.user.userId }">
                <table class="table table-striped" style="font-size:16px;">
                    <thead>
                        <tr class="active" >
                            <th>序号</th>
                            <td>所属单位</td>
                            <th>姓名</th>
                            <th>评价</th>
                            <th>述职报告</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    
                    	<c:forEach items="${userList }" var="user" varStatus="id">
							<input type="hidden" name="evalEvalby" value="${user.userId }">
							<tr>
								<td>${id.count }</td>
								<td>${user.department.depName }</td>
								<td>${user.userName }</td>
								<td class="biaodan">
		                        	<label class="radio-inline">
		                            	<input type="radio"   name="eval${user.userId }"  id="inlineRadio1" value="1"> 优秀
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio"  class="chenzhi" name="eval${user.userId }" id="inlineRadio2" value="2"> 称职
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio" name="eval${user.userId }" id="inlineRadio3" value="3">基本称职
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio" name="eval${user.userId }" id="inlineRadio3" value="4">不称职
		                            </label>
		                        </td>
								<td>
									<%-- <img alt="" height="10" width="10" src="${pageContext.request.contextPath }/upload/1481966691829.png"> --%>
									<a class="image-icon" rel="gallery[modal]" href="${pageContext.request.contextPath }/${user.userReport}">
									<img height="20" width="50" src="${pageContext.request.contextPath }/${user.userReport}"></a>
								</td>
							</tr>
						</c:forEach>
                        
                    </tbody>
                </table>
                <div class="row form">
		    	<div class="col-lg-2 col-lg-offset-5 col-md-2 col-md-offset-5 col-xs-2 col-xs-offfet-5">
		    		<input type="hidden" id="result" name="resultt" value="">
					<input type="hidden" id="count" value="${userNum }">
		    		<input type="button" class="btn btn-primary btn-md" value="提交" id="button">
		        </div>
		       </div>
                </form>
                </c:if>
<c:if test="${message != null }">
	<div class="container">
	  <img src="${pageContext.request.contextPath }/img/success1.png" width="200" height="200"> 
	  <p>${message }</p>
	</div>
	
</c:if>
            </div>
         </div>
        </div>    
    
</div>    
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.paginate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/public.js"></script>

<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 begin -->
<script type='text/javascript' src='${pageContext.request.contextPath }/ly/js/jquery.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath }/ly/css/style.min.css" />
</div>

</body>
</html>











<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校正厅评价所有正职</title>

</head>
<body>
<c:if test="${message == null }">
校正厅评价所有正职<br>一一键选中称职<input type="button" onclick="xuanzhong()" value="选中">
====${sessionScope.user.userName }===
<form id="form" action="${pageContext.request.contextPath }${url}">
	<input type="hidden" name="evalEvalto" value="${sessionScope.user.userId }">
	<table border="1" cellpadding="1" cellspacing="0">
		<tr>
			<td>序号</td>
			<!-- <td>id</td>
			<td>正副</td>	 -->
			<td>所属单位</td>
			<td>姓名</td>
			<td>评价</td>
			<td>述职报告</td>
		</tr>
		
		
	
		<c:forEach items="${userList }" var="user" varStatus="id">
			<input type="hidden" name="evalEvalby" value="${user.userId }">
			<tr>
				<td>${id.count }</td>
				<td>${user.userId }</td>				
				<td>${user.userNp }</td>
				<td>${user.department.depName }</td>
				<td>${user.userName }</td>
				<td>
					<input type="radio"   name="eval${user.userId }" value="1"> 优秀
					<input type="radio" class="chenzhi" name="eval${user.userId }" value="2"> 称职
					<input type="radio" name="eval${user.userId }" value="3"> 基本称职
					<input type="radio" name="eval${user.userId }" value="4"> 不称职
				</td>
				<td>
					<img alt="" height="10" width="10" src="${pageContext.request.contextPath }/upload/1481966691829.png">
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


 --%>
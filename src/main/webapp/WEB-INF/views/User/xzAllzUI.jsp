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


function zancun(){
	//得到本次参与评价的总人数
	var count = $("#count").val();
	//得到每个人的评价结果；
	 result = "";
	//循环处理评价结果
	 for(var i=1;i<=count;i++){
		var a = $('input[name=eval' + i + ']:checked').val();
		if(a == undefined){
			//alert("kong");
			result += "0,";
		} else{
			result += a + ","
		}
	 } 
	//alert(result);
	$("#result").attr("value",result);
	$('#form').attr("action", "/OD/role/zancun").submit();;	
	//$("#form").submit(); 
	
	
}

function lookPDF(theURL){
    var pop,w=670,h=450; //window.navigate(theURL);
    pop=window.open(theURL,"winGD","width="+w+",height="+h+",resizable=yes,menubar=no,toolbar=no,location=no,scrollbars=no,status=no")
    pop.moveTo((screen.width-w)/2,(screen.height-h)/2);

}
function jugeNull() {
    var bili=$("#bili").val().trim();
    var xibili=$("#xibili").val().trim();
    if(bili === "" || xibili==="") {
        $("#message").text("请不要填写空值");
    }else{
        $("#form").submit();
    }

}
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
	    
	    //暂存
	   /*  $("#zancun").click(function(){ 
	    	if(checkout()==true){ 
	            //
	        }
	    });  */
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
					/* var countResult = $("#result").val();
					var countUsre = "";
					var els =document.getElementsByName("evalEvalby");
					for (var i = 0, j = els.length; i < j; i++){
						countUsre = countUsre + (els[i].value)+",";
					}
					
					
					var date = {
							"countUsre":countUsre,
							"countResult" : countResult
					}
					
					$.ajax({
						url : '${pageContext.request.contextPath }/user/ajaxgetBiliAfter',
						type : 'post',
						data : date,
						dataType : 'text',
						success : function(date) {
							if(date == "true"){ */
								$("#form").submit(); 
						/* 	} else{
								alert("优秀结果里副职所占的比例不能少于30%");
							}
						} 

					});	 */	
					 
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
 <div class="container"">
  <div class="row" style="font-size:14px;">
        <div class="col-lg-3 col-lg-offset-7 col-md-4 col-md-offset-5 col-xs-3 col-xs-offset-7">
            <p>当前位置：评价>>${pingjiaMessage }</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-2">
            <p>欢迎  ${sessionScope.user.userName }  登录本系统</p>
        </div>
  </div>
</div>
        </div>


<div class="main">
<form id="form" action="${pageContext.request.contextPath }${url}">
		<div class="row form">
    	<div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-xs-1 col-xs-offfet-1">
        	<button type="button" class="btn btn-primary btn-md" onclick="xuanzhong()" style="border-radius:5px; font-size:18px;">一键选中称职</button>
        </div>
        <div class="col-lg-1 col-md-1 col-xs-1" >
        	<input type="button" class="btn btn-primary btn-md" style="border-radius:5px; font-size:18px; margin-left:3em;" onclick="zancun()" value="暂存评价结果"></input>
        </div>
        
       </div>
        <div class="row">
         <div class="col-sm-12 col-md-12 col-lg-12" style="margin-left:-15;margin-right:-15;">
            <div class="table-responsive">
            
            	
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
                    	<!-- 本来记录 -->
                    	<c:forEach items="${userList }" var="user" varStatus="id">
							<input type="hidden" name="evalEvalby" value="${user.userId }">
							<tr>
								<td>${id.count }</td>
								<td>${user.department.depName }</td>
								<td>${user.userName }</td>
								<td class="biaodan">
		                        	<label class="radio-inline">
		                            	<%-- <input type="radio"   name="eval${user.userId }"  id="inlineRadio1" value="1"> 优秀 --%>
		                            	<input type="radio"   name="eval${id.count }"  id="inlineRadio1" value="1"> 优秀
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio"  class="chenzhi" name="eval${id.count }" id="inlineRadio2" value="2"> 称职
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio" name="eval${id.count }" id="inlineRadio3" value="3">基本称职
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio" name="eval${id.count }" id="inlineRadio3" value="4">不称职
		                            </label>
		                        </td>
								<td>
									<%-- <img alt="" height="10" width="10" src="${pageContext.request.contextPath }/upload/1481966691829.png"> --%>
									<%-- <a class="image-icon" rel="gallery[modal]" href="${pageContext.request.contextPath }/${user.userReport}">
									<img height="20" width="50" src="${pageContext.request.contextPath }/${user.userReport}"></a> --%>
									<button type="button" onclick="lookPDF('${pageContext.request.contextPath}/user/lookpdf?reportName=${user.userReport}');">查看述职报告</button>
								</td>
							</tr>
						</c:forEach>
						
						<!-- 暂存记录 -->
                    	<c:forEach items="${tempEvalList }" var="temp" varStatus="id">
							<input type="hidden" name="evalEvalby" value="${temp.evalEvalby }">
							<tr>
								<td>${id.count }</td>
								<td>${temp.department.depName }</td>
								<td>${temp.user.userName }</td>
								<td class="biaodan">
		                        	<label class="radio-inline">
		                            	<%-- <input type="radio"   name="eval${user.userId }"  id="inlineRadio1" value="1"> 优秀 --%>
		                            	<input type="radio" name="eval${id.count }"  id="inlineRadio1" value="1"   <c:if test="${temp.evalRank == 1 }">checked</c:if>      > 优秀
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio"  class="chenzhi" name="eval${id.count }" id="inlineRadio2" value="2" <c:if test="${temp.evalRank == 2 }">checked</c:if>> 称职
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio" name="eval${id.count }" id="inlineRadio3" value="3" <c:if test="${temp.evalRank == 3 }">checked</c:if> >基本称职
		                            </label>
		                            <label class="radio-inline">
		                              <input type="radio" name="eval${id.count }" id="inlineRadio3" value="4" <c:if test="${temp.evalRank == 4 }">checked</c:if> >不称职
		                            </label>
		                        </td>
								<td>
									<%-- <img alt="" height="10" width="10" src="${pageContext.request.contextPath }/upload/1481966691829.png"> --%>
									<%-- <a class="image-icon" rel="gallery[modal]" href="${pageContext.request.contextPath }/${user.userReport}">
									<img height="20" width="50" src="${pageContext.request.contextPath }/${user.userReport}"></a> --%>
									<button type="button" onclick="lookPDF('${pageContext.request.contextPath}/user/lookpdf?reportName=${temp.user.userReport}');">查看述职报告</button>
								</td>
							</tr>
						</c:forEach>
                        
                    </tbody>
                </table>
                <div class="row form">
		    	<div class="col-lg-2 col-lg-offset-5 col-md-2 col-md-offset-5 col-xs-2 col-xs-offfet-5">
		    		<input type="hidden" id="result" name="resultt" value="">
					<input type="hidden" id="count" value="${userNum }">
					<!-- 暂存的两个属性  cate和desc -->
					<input type="hidden" name="zancunCate" value="${zancunCate }">
					<input type="hidden" name="zancunDesc" value="${zancunDesc }">
					
		    		<input type="button" class="btn btn-primary btn-md" style="border-radius:5px; font-size:18px;" value="提交" id="button" style="margin-top:30pxl;"><br>
		    		<!-- <input type="button" class="btn btn-primary btn-md" onclick="zancun()" value="暂存"></input> -->
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
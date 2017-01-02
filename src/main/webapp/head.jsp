<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>河南科技学院干部评价系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css">
<script src="${pageContext.request.contextPath }/js/49f8daee.vendors.js"></script>
<script src="${pageContext.request.contextPath }/js/26f2fc0d.index.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.1.11.3.min.js"></script>
</head>

<body>
<div class="donghua">
     <canvas id="waves" >
     </canvas>
</div>
<div id="header">
 <div class="col-lg-12 col-md-12 col-xs-12">
   <div id="slidershow" class="carousel slide" data-ride="carousel">
   <!--设置图片轮番的顺序-->
  <!--<ol class="carousel-indicators">
       <li class="active" data-target="#slidershow" data-slide-to="0"></li>
       <li data-target="#slidershow" data-slide-to="1"></li>
       <li data-target="#slidershow" data-slide-to="2"></li>
       <!-- <li data-target="#slidershow" data-slide-to="3"></li> -->
    </ol>
   <!--设置轮播图片-->
    <div class="carousel-inner">
      <div class="item active">
            <a href="#"><img src="${pageContext.request.contextPath }/img/banner-one.png"></a>
      </div>
      <div class="item">
           <a href="#"><img src="${pageContext.request.contextPath }/img/banner-two.png"></a> 
      </div>
      <div class="item">
           <a href="#"><img src="${pageContext.request.contextPath }/img/banner-three.png"></a>
      </div>
      <%-- <div class="item">
           <a href="#"><img src="${pageContext.request.contextPath }/img/banner-four.png"></a>
      </div> --%>
      <!--<a class="left carousel-control" href="#slidershow" role="button" data-slide="prev">
           <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#slidershow" role="button" data-slide="next">
         <span class="sr-only">Next</span>
      </a>-->
    </div>
  </div>
 </div>
</div>
<div class="container">
    <div class="row">
        <%-- <div class="col-lg-1 col-md-1 col-xs-1">
          <img src="${pageContext.request.contextPath }/img/header-logo.png" id="image1">
        </div>
        <div class="col-lg-3 col-md-3 col-xs-3">
           <p class="one">河南科技学院</p>
        </div> --%>
        <div class="col-lg-1 col-md-1 col-xs-1" >
           <img src="${pageContext.request.contextPath }/img/logo.png" id="image2"> 
        </div>
        <div class="col-lg-5 col-md-5 col-xs-5" style="margin-left:-1%;">
           <p class="two">河南科技学院干部评价系统</p>
        </div>
    </div>
</div>
</body>
</html>

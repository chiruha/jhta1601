<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">


<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/img/fitimg/f1.jpg" alt="New York" width="1000" height="600">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p>The atmosphere in New York is lorem ipsum.</p>
        </div>
      </div>

      <div class="item">
        <img src="resources/img/fitimg/f2.jpg" alt="Chicago" width="1000" height="600">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="resources/img/fitimg/f3.jpg" alt="Los Angeles" width="1000" height="600">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>
      </div>
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3>Fitness Center</h3>
  <p><em>Make S Line with Us!!</em></p>
  <p>건강을 추구하고 아름다운 바디를 만들어드리는 저희 FITNESS 를 찾아주셔서 감사합니다!! <br>전문 강사진들로 구성된 저희 FITNESS 에서 차원이 다른 서비스를 받아보세요</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong></strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="resources/img/center/Tr_Apgujeong_01.jpg" class="img-circle person" alt="몰랑이 1" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong></strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="resources/img/center/Tr_Jongno_02.jpg" class="img-circle person" alt="몰랑이 2" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong></strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="resources/img/center/Tr_Jongno_01.jpg" class="img-circle person" alt="몰랑이 3" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
      </div>
    </div>
  </div>
</div>


  




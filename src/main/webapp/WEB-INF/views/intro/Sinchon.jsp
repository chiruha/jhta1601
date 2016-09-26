<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      
<!--  <style>
#aaa img{
-webkit-filter: grayscale(100%);
filter: gray;
}

#aaa:hover img{
-webkit-filter: grayscale(100%);
filter: none;
} 
</style>
 -->
  <style>
#aaa img{
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
}

#aaa:hover img{
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.9;
} 
</style>
 
 

				<div class="h2Box">
					<h2>신촌점</h2>
					<div class="eng">- The Fitness Sinchon</div>
				</div>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class=""></li>
      <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="2" class=""></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" id="intro">
      <div class="item">
        <img src="resources/img/center/Sinchon_01.jpg" alt="Apgujeong" width="1000" height="600">
      </div>

      <div class="item active">
        <img src="resources/img/center/Sinchon_02.jpg" alt="Chicago" width="1000" height="600">
      </div>
    
      <div class="item">
        <img src="resources/img/center/Sinchon_03.jpg" alt="Los Angeles" width="1000" height="600">
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
	<div class="h3Box">
  		<h2>종로3가 본점 운영시간/상담시간</h2>
	</div>
	
  	<h6>02-333-7896</h6>
  <p>- 더피트니스 신촌점에서는 친절한 고객상담을 약속드립니다.</p>
  	
  <br>
   <div class="rows">
    <div class="col-sm-6">
							<div class="left">
								<h5 class="left-h5">운영시간</h5>
								<div class="timeList">
									<ul>
										<li>
											<span>평일</span>
											<span>am 06 : 00 ~ pm 23 : 00</span>
										</li>
										<li>
											<span>토요일</span>
											<span>am 07 : 00 ~ pm 19 : 00</span>
										</li>
										<li>
											<span>공휴일/일요일</span>
											<span>임의휴관입니다.</span>
										</li>
									</ul>
								</div>
							</div>
				</div>
				<div class="col-sm-6">
							
							<div class="right">
								<h5 class="left-h5">전화상담</h5>
								<div class="timeList">
									<ul>
										<li>
											<span class="tit">평일</span>
											<span class="txt">am 09 : 00 ~ pm 09 : 00</span>
										</li>
										<li>
											<span class="tit">토요일</span>
											<span class="txt">am 09 : 00 ~ pm 07 : 00</span>
										</li>
										<li>
											<span class="tit">공휴일/일요일</span>
											<span class="txt">am 10 : 00 ~ pm 05 : 00 </span>
										</li>
									</ul>
								</div>
							</div>
						</div>
						</div>
						<br>
  <div class="row">
  <br>
    <div class="ftBox">
  		<h2>더 피트니스 트레이너 소개</h2>
	</div>
    <div class="col-sm-4">
      <p class="text-center"><strong>김선영</strong></p><br>
      <a href="#demo" data-toggle="collapse" id=aaa>
        <img src="resources/img/center/Tr_Sinchon_01.jpg" id=aaa class="img-circle person" alt="몰랑이 1" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p> 프로필</p>
        <p>- 생활체육지도자 보디빌딩 3급</p>
        <p>- 선수트레이너 자격 연수</p>
        <p>- 운동재활헬스,마사지,테이핑 수료</p>
        <p>- 케틀벨1:1트레이닝교육수료</p>
        <p>- 장애인스포츠,골프지도자&심판</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>최원종</strong></p><br>
      <a href="#demo2" data-toggle="collapse" id=aaa>
        <img src="resources/img/center/Tr_Sinchon_02.jpg" class="img-circle person" alt="몰랑이 2" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p> 프로필</p>
        <p>- 사회체육학과 졸업</p>
        <p>- 육아체육지도자 자격증</p>
        <p>- 스킨스쿠버 자격증</p>
      	<p>- 시니어 에어로빅</p>
        <p>- 스킨스쿠버 라이센스 취득</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>고은별</strong></p><br>
      <a href="#demo3" data-toggle="collapse" id=aaa>
        <img src="resources/img/center/Tr_Sinchon_03.jpg" class="img-circle person" alt="몰랑이 3" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p> 프로필</p>
        <p>- 생활스포츠지도자 2급</p>
        <p>- 비만관리사 자격증</p>
        <p>- 스포츠재활 마사지 3급</p>
        <p>- 유아체육 지도자 3급</p>
        <p>- 태권도 3단, CPR 교육 이수</p>
      </div>
    </div>
  </div>
  </div>
 
  <div id="band" class="container text-center">
	<div class="h3Box">
  		<h2>신촌지점 본점 찾아오시는 길</h2>
	</div>
    <p>- 서울 신촌동 신촌역 103-57 The Fitness 신촌점</p>
<!-- * Daum 지도 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
 <div class="col-sm-12">
<div id="daumRoughmapContainer1474747282265" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script><script charset="UTF-8" src="http://s1.daumcdn.net/svc/attach/U0301/cssjs/place-map/1609191508/roughmapLander.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1474747282265",
		"key" : "d7jw",
		"mapWidth" : "750",
		"mapHeight" : "400",
		
	}).render();
</script>
</div>

  <!-- <h3 class="text-center">Contact</h3>
  <p class="text-center"><em>We love your opinions!</em></p>

  <div class="row">
    <div class="col-md-4">
      <p>Fan? Drop a note.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>Chicago, US</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +00 1515151515</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div> -->
  <br>
  <h3 class="text-center">Fitness</h3>
  <ul class="nav nav-tabs">
    <li class=""><a data-toggle="tab" href="#tab1" aria-expanded="false">종로3가 본점</a></li>
    <li class=""><a data-toggle="tab" href="#tab2" aria-expanded="false">화정지점</a></li>
    <li class=""><a data-toggle="tab" href="#tab3" aria-expanded="false">종로지점</a></li>
    <li class="active"><a data-toggle="tab" href="#tab4" aria-expanded="true">신촌지점</a></li>
  	<li class=""><a data-toggle="tab" href="#tab5" aria-expanded="false">송파지점</a></li>
  	<li class=""><a data-toggle="tab" href="#tab6" aria-expanded="false">압구정점</a></li>
  </ul>
  <br>

  <div class="tab-content">
    <div id="tab1" class="tab-pane fade">
    	<div><h3>종로3가 본점 </h3><h6>1688-1688</h6></div>
    </div>
    <div id="tab2" class="tab-pane fade">
    	<div><h3>화정지점 </h3><h6>1588-1588</h6></div>
    </div>
    <div id="tab3" class="tab-pane fade">
        <div><h3>종로지점 </h3><h6>555-5555</h6></div>
    </div>
    <div id="tab4" class="tab-pane fade in active">
       	<div><h3>신촌지점 </h3><h6>02-333-7896</h6></div>
    </div>
    <div id="tab5" class="tab-pane fade">
      	<div><h3>송파정점 </h3><h6>031-1688-1688</h6></div>
    </div>
    <div id="tab6" class="tab-pane fade">
      	<div><h3>압구정점 </h3><h6>090-1688-1688</h6></div>
    </div>
  </div>
</div>

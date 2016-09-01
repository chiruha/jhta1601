<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	$(".main ul").hide();  // 하위메뉴 숨기기
		$(".main").find("a:first").css("backgroundColor","hsl(330, 100%, 20%)");
	$(".main").hover(function() { // Mouse in	
		$(this).find("ul").stop().slideDown(500);  // 하위 메뉴 펼치기
	}, function() {  // Mouse out
		$(this).find("ul").stop().slideUp(500);	
	});
	
});

</script>

	<h1><a href="<c:url value='/'/>">Header Page (홈으로 이동)</a> </h1>

	<c:if test="${not empty sessionScope.user }"> <!-- not empty : 값이 있을 경우 -->
		<h5>${sessionScope.user } 님 반갑습니다!</h5>
	</c:if>
	
<nav>
	<ul id="dropmenu">
		<li class="main">
			<a href="">Introduce</a>
			<ul>
				<li><a href="">회사소개</a></li>
				<li><a href="">지점소개</a></li>
				<li><a href="">강사소개</a></li>
				<li><a href="">운동소개</a></li>
			</ul>
		</li>
		<li class="main">
			<a href="">Information</a>
			<ul>
				<li><a href="">공지사항</a></li>
				<li><a href="">이용안내</a></li>
				<li><a href="">시간표</a></li>
				
			</ul>
		</li>
		<li class="main">
			<a href="">Community</a>
			<ul>
				<li><a href="">자유게시판</a></li>
				<li><a href="">Event게시판</a></li>
				<li><a href="">QnA게시판</a></li>
				
			</ul>
		</li>
		<c:choose>
			<c:when test="${empty sessionScope.user }"> <!-- 세션에 아무 값도 들어있지 않을 경우 -->
			<li class="main"><a href="">Login</a>	</li>
			</c:when>
			<c:when test="${sessionScope.user==0 }"> <!-- 회원일 경우 분별미정-->
				<li class="main"><a href="">Logout</a></li>
				<li class="main">
					<a href="">MyPage< /a>	
					<ul>
						<li><a href="">회원정보</a></li>
						<li><a href="">수강정보</a></li>
					</ul>
				</li>
			</c:when>
				<c:when test="${sessionScope.user==1 }"> <!-- 관리자일 경우 -->				
				<li class="main"><a href="">Logout</a></li>
				<li class="main">
					<a href="">MyPage</a>	
					<ul>
						<li><a href="">직원정보</a></li>
						<li><a href="">회원정보</a></li>
						<li><a href="">매출정보</a></li>
					</ul>
				</li>
			</c:when>
			<c:when test="${sessionScope.user==2 }"> <!-- GX강사일 경우 -->				
				<li class="main"><a href="">Logout</a></li>
				<li class="main">
					<a href="">MyPage</a>	
					<ul>
						<li><a href="">강사정보</a></li>
						<li><a href="">회원정보</a></li>
						<li><a href="">스케줄</a></li>
					</ul>
				</li>
			</c:when>
			<c:when test="${sessionScope.user==3 }"> <!-- PT강사일 경우 -->				
				<li class="main"><a href="">Logout</a></li>
				<li class="main">
					<a href="">MyPage</a>	
					<ul>
						<li><a href="">강사정보</a></li>
						<li><a href="">회원정보</a></li>
						<li><a href="">스케줄</a></li>
					</ul>
				</li>
			</c:when>
			<c:when test="${sessionScope.user==3 }"> <!-- 직원일 경우 -->				
				<li class="main"><a href="">Logout</a></li>
				<li class="main">
					<a href="">MyPage</a>	
					<ul>
						<li><a href="">회원관리</a></li>
						<li><a href="">계산</a></li>
					</ul>
				</li>
			</c:when>
		</c:choose>
	
	</ul>
</nav>
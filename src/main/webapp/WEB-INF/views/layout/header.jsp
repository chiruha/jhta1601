<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	$(".main ul").hide();  // 하위메뉴 숨기기
	$(".main").hover(function() { // Mouse in
		$(".mainmenu > a").css("backgroundColor","black");
		$(this).find("a:first").css("backgroundColor","#fed8ea");
		$(this).find("ul").stop().slideDown(500);  // 하위 메뉴 펼치기
	}, function() {  // Mouse out
		$(this).find("a:first").css("backgroundColor", "#770d4a")
		$(this).find("ul").stop().slideUp(500);	
	});
	
});

</script>
<div >
	<h1><a href="<c:url value='/'/>">Header Page (홈으로 이동)</a> </h1>
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
		<li class="main">
			<a href="">Login</a>
		</li>
	
	</ul>
</div>
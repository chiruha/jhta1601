<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<h1><a href="<c:url value='/'/>">Header Page (홈으로 이동)</a>  </h1>
	<h3><a href="<c:url value='/?test=goboot'/>">bootstrap test</a></h3>

	<c:if test="${not empty sessionScope.user }"> <!-- not empty : 값이 있을 경우 -->
		<h5>${sessionScope.user } 님 반갑습니다!</h5>
	</c:if>
	

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Fitness </title>
</head>
<body>
<h1>main page</h1>
<img src="resources/img/f1.jpg"><br>
	<ul>
		<li><a href="<c:url value='/ptrinsert'/>">PT 예약</a></li>
		<li><a href="<c:url value='/gxinsert'/>">GX 예약</a></li>
		<li><a href="<c:url value='/ptment'/>">PT 관리</a></li>
		<li><a href="<c:url value='/PTscOkView'/>">PT강사승인페이지</a></li>
		
		<li><a href="<c:url value='/meminsert'/>">회원등록(이성진)</a></li>
		<li><a href="<c:url value='/memselectAll'/>">회원전체목록보기(이성진)</a></li>
		 <li><a href="<c:url value='/regiInsert'/>">수강등록(insert)-프로그램등록(이성진)</a></li>
		<li><a href="<c:url value='/regiSelect'/>">수강등록 (selectList)전체목록보기(이성진)</a></li> 
		<c:choose>
			<c:when test="${empty sessionScope.memnum}">
			<li><a href="<c:url value='/login'/>">로그인하기(이성진)</a></li>	
			</c:when>
			<c:otherwise>
			${sessionScope.memnum }님 환영합니다.
			<li><a href="<c:url value='/logout'/>">로그아웃하기(이성진)</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="<c:url value='/ctinsert'/>">센터등록</a></li>
		<li><a href="<c:url value='/stfinsert'/>">직원등록</a></li>
		<li><a href="<c:url value='/stflist'/>">직원목록</a></li>
		<li><a href="<c:url value='/posinsert'/>">직급등록</a></li>
		<li><a href="<c:url value='/deptinsert'/>">부서등록</a></li>
		<li><a href="<c:url value='/nocinsert'/>">공지사항 등록</a></li>
		<li><a href="<c:url value='/noclist'/>">공지사항목록</a></li>
		
		<li><a href="<c:url value='/?test=goboot'/>">bootstrap test</a></li>
	</ul>


</body>
</html>

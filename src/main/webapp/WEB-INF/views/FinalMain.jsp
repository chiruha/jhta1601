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
		<li><a href="<c:url value='/exloginsert'/>">운동일지</a></li>
		<li><a href="<c:url value='/refundDay'/>">환불</a></li>
		<li><a href="<c:url value='/ptrinsert'/>">PT 예약</a></li>
		<li><a href="<c:url value='/gxinsert'/>">GX일정입력</a></li>		
		<li><a href="<c:url value='/gxRegisterView'/>">GX일정보기</a></li>
		<li><a href="<c:url value='/PTscOkView'/>">PT강사승인페이지</a></li>
		<li><a href="<c:url value='/MemPTscOkView'/>">회원승인페이지</a></li>
		
		<li><a href="<c:url value='ctsSelect'/>">지점별 (월, month) 매출내역(이성진-미완)</a></li>
		<li><a href="<c:url value='SjRefundInsert'/>">SjRefundInsert 환불계산하기(이성진-완성)</a></li>
		<li><a href="<c:url value='centertotalsalesInsert'/>">지점별 월매출(수입-환불) 계산하기(이성진-완성)</a></li>
		<li><a href="<c:url value='incomeInsert'/>">지점별 월수입 계산하기(이성진-완성)</a></li>
		<li><a href="<c:url value='eventInsert'/>">Event 게시판 등록하기(이성진)</a></li>
		<li><a href="<c:url value='eventSelectAll'/>">Event 게시판 전체목록보기(이성진)</a></li>
		<li><a href="<c:url value='/qnaselectAll'/>">QnA 게시판 (이성진)</a></li>
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
		<li><a href="<c:url value='/trlist'/>">강사목록</a></li>
		<li><a href="<c:url value='/nocinsert'/>">공지사항 등록</a></li>
		<li><a href="<c:url value='/noclist'/>">공지사항목록</a></li>
		
	</ul>


</body>
</html>

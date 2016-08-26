<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
		<li><a href="<c:url value='/ptrinsert'/>">테스트 예약</a></li>		
		<li><a href="<c:url value='/meminsert'/>">회원등록(이성진)</a></li>
		<li><a href="<c:url value='/memselectAll'/>">회원전체목록보기(이성진)1</a></li>
		<li><a href="<c:url value='/ctinsert'/>">센터등록</a></li>
		<li><a href="<c:url value='/stfinsert'/>">직원등록</a></li>
		<li><a href="<c:url value='/posinsert'/>">직급등록</a></li>
		<li><a href="<c:url value='/deptinsert'/>">부서등록</a></li>
		
	</ul>


</body>
</html>

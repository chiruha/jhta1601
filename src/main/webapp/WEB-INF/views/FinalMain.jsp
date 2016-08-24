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
		<li><a href="<c:url value='/stfinsert'/>">테스트 직원추가</a></li>	
		<li><a href="<c:url value='/meminsert'/>">테스트 회원추가</a></li>	
	</ul>


</body>
</html>

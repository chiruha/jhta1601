<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>전체회원보기</h1>
<table border="1" width="1000">
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>전화</th>
		<th>가입일</th>
		<th>등록지점</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.mem_num }</td>
		<td>${dto.mem_name }</td>
		<td>${dto.mem_phone }</td>
		<td>${dto.regdate }</td>
		<td>${dto.ct_code }</td>
	</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="/memselectAll?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="/memselectAll?pageNum=${i }"><span style="color:#555">[${i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
</body>
</html>
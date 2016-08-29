<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
	<h1>공지사항</h1>
	<table border="1" width="700">
		<tr>
			<th>글번호</th>
			<th>스태프번호</th>
			<th>글제목</th>			
			<th>글내용</th>
			<th>작성일</th>			
		</tr>
		<c:forEach var="dto" items="${noclist }">
			<tr>
				<td><c:out value="${dto.nt_num }"/></td>
				<td><c:out value="${dto.stf_num }"/></td>
				<td><c:out value="${dto.stf_title }"/></td>
				<td><c:out value="${dto.nt_content }"/></td>
				<td><c:out value="${dto.nt_date }"/></td>
				<td><c:out value="${dto.nt_hit }"/></td>				
			</tr>
		</c:forEach>
	</table>
	<!-- get방식 보냄 -->
	<ul>
		<li><a href="FinalMain.jsp">테스트홈으로</a></li>		

	</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>
	<h1>공지사항</h1>
	<table border="1" width="700">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>			
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="dto" items="${noclist }">
			<tr>
				<td><c:out value="${dto.nt_num }"/></td>
				<td><c:out value="${dto.nt_title }"/></td>				
				<td><c:out value="${dto.stf_num }"/></td>
				<td><c:out value="${dto.nt_date }"/></td>				
				<td><c:out value="${dto.nt_hit }"/></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div>		
		<form method="post" action="noclist" >
			<input type="checkbox" name="writer" value="writer">작성자
			<input type="checkbox" name="title" value="title">제목
			<input type="checkbox" name="content" value="content">내용
			<input type="text" name="keyword">
			<input type="submit" value="검색">
		</form>
	</div>
	<br>
	<div>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="noclist?pageNum=${i}"><span style="color:green">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="noclist?pageNum=${i}"><span style="color:#555">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	
	
	
</body>
</html>

















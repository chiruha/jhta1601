<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>이벤트 내용 보기</h1>
<form method="post" action="eventUpdate?ev_num=${listone.ev_num}" enctype="multipart/form-data">
글쓴이:<input type="text" name="stf_num" value="${listone.stf_num }">
<table border="1" width="1000">
	<tr>
		<td>글번호: ${listone.ev_num }</td>
		<td>작성일: ${listone.ev_date }</td>
		<td colspan="2"><a href="eventDelete?ev_num=${listone.ev_num}">글삭제</a></td>
	</tr>
	<tr>
		<td colspan="4"><input type="text" name="ev_title" value="${listone.ev_title }"></td>
	</tr>
	<tr>
		<td colspan="4"><img src="/fitness/resources/img/Event/${listone.ev_picture }" width="500" height="500">
		사진변경<input type="file" name="ev_picture">	
		</td>
	</tr>
	<tr>
		<td colspan="4"><input type="text" name="ev_content" value="${listone.ev_content }"></td>
	</tr>
</table>
<input type="submit" value="저장">
<input type="reset" value="취소">
</form>
<br>
<h1>이벤트글 목록</h1>
<table border="1" width="1000">
	<tr>
		<th>이벤트번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.ev_num }</td>
		<td><a href="eventListOne?ev_num=${dto.ev_num}">${dto.ev_title }</a></td>
		<td>${dto.stf_num }</td>
		<td>${dto.ev_date }</td>
	</tr>
	</c:forEach>
</table>

<br>
<!-- 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="eventSelectAll?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="eventSelectAll?pageNum=${i }"><span style="color:#555">[${i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
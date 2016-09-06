<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>이벤트 내용 보기</h1>
<a href="<c:url value='/eventInsert'/>">글쓰기</a>
<table border="1" width="1000">
	<tr>
		<td>글번호: ${selectNew.ev_num }</td>
		<td>작성일: ${selectNew.ev_date }</td>
		<td><a href="eventUpdateList?ev_num=${selectNew.ev_num}">글수정</a></td>
		<td><a href="eventDelete?ev_num=${selectNew.ev_num}">글삭제</a></td>
	</tr>
	<tr>
		<td colspan="4">${selectNew.ev_title }</td>
	</tr>
	<tr>
		<td colspan="4"><img src="/fitness/resources/img/Event/${selectNew.ev_picture }" width="500" height="500"></td>
	</tr>
	<tr>
		<td colspan="4">${selectNew.ev_content }</td>
	</tr>
</table>
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
		<td><a href="eventSelectAll2?ev_num=${dto.ev_num}">${dto.ev_title }</a></td>
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
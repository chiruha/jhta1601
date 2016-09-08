<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>QnA 게시판 전체글보기</h1>
<c:choose>
	<c:when test="${not empty sessionScope.mnum }">
		<a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
	<c:when test="${not empty sessionScope.snum }">
		<a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
</c:choose>
<table border="1" width="700">
	<tr>
		<th>qna글번호</th>
		<th>글제목</th>
		<th>회원번호</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="dto" items="${qnalist }">
	<tr>
		<td>${dto.qna_num }</td>
		<td>
		<c:if test="${dto.qna_lev>0 }">
			<c:forEach var="i" begin="1" end="${dto.qna_lev }">
				&nbsp;&nbsp;
			</c:forEach>
			[re]
		</c:if>
		<a href="qnaListOne?qna_num=${dto.qna_num}">${dto.qna_title }</a></td>
		<td>${dto.mem_num }</td>
		<td>${dto.qna_hit }</td>
		<td>${dto.qna_date }</td>
	</tr>
	</c:forEach>
</table>
<!-- 페이징처리 -->
<div>
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<%--현재페이지인 경우 다른색 표시 --%>
		<c:when test="${i==pu.pageNum }">
			<a href="qnaselectAll?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="qnaselectAll?pageNum=${i }"><span style="color:#555">[${i }]</span></a>		
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
<div>
<form method="post" action="qnaSearch">
	<select name="field">
		<option value="mem_num">글쓴이</option>
		<option value="qna_title">글제목</option>
		<option value="qna_content">글내용</option>
	</select>
	<input type="text" name="keyword">
	<input type="submit" name="검색">
</form>
</div>
<c:choose>
	<c:when test="${not empty sessionScope.mnum }">
		<a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
	<c:when test="${not empty sessionScope.snum }">
		<a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
</c:choose>
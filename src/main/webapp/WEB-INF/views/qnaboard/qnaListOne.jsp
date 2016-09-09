<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>QnA 글 읽기</h1>
<input type="hidden" value="${dto.qna_num }">
<table border="1" width="1000">
	<tr>
		<td>${dto.qna_title }</td>
		<td>${dto.qna_date }</td>

	</tr>
	<tr>
		<c:choose>
			<c:when test="${dto.mem_num<1 }">
				<td colspan="2">admin</td>
			</c:when>
			<c:otherwise>
				<td colspan="2">${dto.mem_num }</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td colspan="2">${dto.qna_content }</td>
	</tr>
</table>
<!-- 수정 및 삭제는 관리자인 경우와 글쓴이(본인:mem_num)만 사용가능 -->
<c:choose>
	<c:when test="${not empty sessionScope.snum }"><!-- 관리자일때 -->
		<a href="qnaUpdateList?qna_num=${dto.qna_num }">수정하기</a>
		<a href="qnaDelete?qna_num=${dto.qna_num }">삭제하기</a>
		<a href="qnaAnswer?qna_num=${dto.qna_num }&qna_ref=${dto.qna_ref}&qna_lev=${dto.qna_lev}&qna_step=${dto.qna_step}">답변하기</a>
	</c:when>
	<c:when test="${sessionScope.mnum == dto.mem_num }"><!-- 글쓴이일 때 -->
		<a href="qnaUpdateList?qna_num=${dto.qna_num }">수정하기</a>
		<a href="qnaDelete?qna_num=${dto.qna_num }">삭제하기</a>
	</c:when>
</c:choose>
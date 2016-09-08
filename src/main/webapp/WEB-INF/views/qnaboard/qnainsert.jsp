<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>QnA글 작성하기</h1>
<br>
<form method="post" action="qnainsert">
	<!-- 부모글에 대한 정보를 hidden으로 서버에 전송 -->
	<input type="hidden" name="qna_num" value="${dto.qna_num }">
	<input type="hidden" name="qna_ref" value="${dto.qna_ref }">
	<input type="hidden" name="qna_lev" value="${dto.qna_lev }">
	<input type="hidden" name="qna_step" value="${dto.qna_step }">
	<c:choose>
		<c:when test="${not empty sessionScope.mnum }"><!-- 회원인경우 -->
			회원번호<input type="hidden" name="mem_num" value="${sessionScope.mnum }"><br>
		</c:when>
		<c:when test="${not empty sessionScope.snum }"><!-- 직원인경우 -->
			직원번호<input type="hidden" name="stf_num" value="${sessionScope.snum }"><br>
		</c:when>
	</c:choose>
	글제목<input type="text" name="qna_title"><br>
	글내용<textarea rows="5" cols="50" name="qna_content"></textarea><br>
	<input type="submit" value="글등록">
	<input type="reset" value="취소">
</form>
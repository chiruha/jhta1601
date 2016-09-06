<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>QnA 글 읽기</h1>
<table border="1" width="700">
	<tr>
		<th>글번호</th>
		<td>${dto.qna_num }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.mem_num }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.qna_date }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${dto.qna_hit }</td>
	</tr>
	<tr>
		<th>글제목</th>
		<td>${dto.qna_title }</td>
	</tr>
	<tr>
		<th colspan="2">글내용</th>
	</tr>
	<tr>
		<td colspan="2">${dto.qna_content }</td>
	</tr>
</table>
<a href="qnaUpdateList?qna_num=${dto.qna_num }">수정하기</a>
<a href="qnaDelete?qna_num=${dto.qna_num }">삭제하기</a>
<a href="qnaAnswer?qna_num=${dto.qna_num }&qna_ref=${dto.qna_ref}&qna_lev=${dto.qna_lev}&qna_step=${dto.qna_step}">답변하기</a>
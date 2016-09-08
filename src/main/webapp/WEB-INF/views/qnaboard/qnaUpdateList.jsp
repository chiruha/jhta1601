<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>QnA 글 읽기</h1>
<form method="post" action="qnaUpdate?qna_num=${dto.qna_num }">
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
		<td><input type="text" value="${dto.qna_title }" name="qna_title"></td>
	</tr>
	<tr>
		<th colspan="2">글내용</th>
	</tr>
	<tr>
		<td colspan="2"><textarea rows="5" cols="50" name="qna_content">${dto.qna_content }</textarea></td>
	</tr>
</table>
<input type="submit" value="저장">
<input type="reset" value="취소"> 
</form>
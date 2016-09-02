<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>글수정하기</h1>
<br>
<br>
<form method="post" action="nocUpdate?nt_num=${dto.nt_num}">
<table border="1" width="700">
	<tr>
		<td width="100">글번호</td>
		<td colspan="2">${dto.nt_num}</td>
		<td rowspan="5" width="150"></td>
	</tr>
	<tr>
		<td width="100">글제목</td>
		<td colspan="2"><input type="text" name="nt_title" value="${dto.nt_title}"></td>
	</tr>
	<tr>
		<td width="100">글내용</td>
		<td colspan="2"><input type="text" name="nt_content" value="${dto.nt_content}"></td>
	</tr>
</table>
<input type="submit" value="저장">
<input type="reset" value="취소">
</form>

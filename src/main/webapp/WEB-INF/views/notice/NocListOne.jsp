<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>글정보보기</h1>
<br>
<br>
<table border="1" width="700">
	<tr>
		<td width="100">글번호</td>
		<td colspan="2">${dto.nt_num}</td>
	</tr>
	<tr>
		<td width="100">작성관리자</td>
		<td colspan="2">${dto.stf_name}</td>
	</tr>
	<tr>
		<td width="100">글제목</td>
		<td colspan="2">${dto.nt_title}</td>
	</tr>
	<tr>
		<td width="100">글내용</td>
		<td colspan="2">${dto.nt_content}</td>
	</tr>
	<tr>
		<td width="100">작성일</td>
		<td colspan="2">${dto.nt_date}</td>
	</tr>
	<tr>
		<td width="100">조회수</td>
		<td colspan="2">${dto.nt_hit}</td>
	</tr>
	
</table>
<a href="nocUpdate?nt_num=${dto.nt_num }">글정보수정</a>
<a href="nocDelete?nt_num=${dto.nt_num }">글정보삭제</a>
<a href="noclist">글목록</a>


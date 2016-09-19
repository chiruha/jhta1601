<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>글정보보기</h1>
<br>
<br>
<table border="1" width="700">
	<tr>
		<td width="100">글번호</td>
		<td colspan="2">${dto.fb_num}</td>
	</tr>
	<tr>
		<td width="100">작성자</td>
		<td colspan="2">${dto.mem_name}</td>
	</tr>
	<tr>
		<td width="100">글제목</td>
		<td colspan="2">${dto.fb_title}</td>
	</tr>
	<tr>
		<td width="100">글내용</td>
		<td colspan="2">${dto.fb_content}</td>
	</tr>
	<tr>
		<td width="100">작성일</td>
		<td colspan="2">${dto.fb_date}</td>
	</tr>
	<tr>
		<td width="100">조회수</td>
		<td colspan="2">${dto.fb_hit}</td>
	</tr>
	

</table>
<a href="fbinsert?fb_num=${dto.fb_num }&fb_ref=${dto.fb_ref}&fb_lev=${dto.fb_lev}&fb_step=${dto.fb_step}">답글</a>
<a href="fbupdate?fb_num=${dto.fb_num }">글정보수정</a>
<a href="fbdelete?fb_num=${dto.fb_num }">글정보삭제</a>
<a href="fblist">글목록</a>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>회원상세정보보기</h1>
<br>
<br>
<table border="1" width="700">
	<tr>
		<td width="100">회원번호</td>
		<td colspan="2">${dto.mem_num}</td>
		<td rowspan="5" width="150"><img src="/fitness/resources/img/Member/${dto.mem_picture }" width="150" height="100"></td>
	</tr>
	<tr>
		<td width="100">이름</td>
		<td colspan="2">${dto.mem_name}</td>
	</tr>
	<tr>
		<td width="100">성별</td>
		<td colspan="2">${dto.mem_gen}</td>
	</tr>
	<tr>
		<td width="100">나이</td>
		<td colspan="2">${dto.mem_age}</td>
	</tr>
	<tr>
		<td width="100">생일</td>
		<td colspan="2">${dto.mem_birth}</td>
	</tr>
	<tr>
		<td width="100">이메일</td>
		<td colspan="3">${dto.mem_email}</td>
	</tr>
	<tr>
		<td width="100">전화1</td>
		<td colspan="3">${dto.mem_phone}</td>
	</tr>
	<tr>
		<td width="100">주소</td>
		<td colspan="3">${dto.mem_addr}</td>
	</tr>
	<tr>
		<td width="100">가입일</td>
		<td colspan="3">${dto.regdate}</td>
	</tr>
	<tr>
		<td width="100">등록지점</td>
		<td colspan="3">${dto.ct_code}</td>
	</tr>
</table>
<a href="memUpdateList?mem_num=${dto.mem_num }">회원정보수정</a>
<a href="memDelete?mem_num=${dto.mem_num }">회원정보삭제</a>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>회원상세정보보기</h1>
<br>
<br>
<form method="post" action="memUpdate?mem_num=${dto.mem_num}" enctype="multipart/form-data">
<table border="1" width="700">
	<tr>
		<td width="100">회원번호1</td>
		<td colspan="2">${dto.mem_num}</td>
		<td rowspan="5" width="150"><img src="/fitness/resources/img/Member/${dto.mem_picture }" width="150" height="100">
			사진변경<input type="file" name="mem_picture">
		</td>
	</tr>
	<tr>
		<td width="100">이름</td>
		<td colspan="2"><input type="text" name="mem_name" value="${dto.mem_name}"></td>
	</tr>
	<tr>
		<td width="100">성별</td>
		<td colspan="2"><input type="text" name="mem_gen" value="${dto.mem_gen}"></td>
	</tr>
	<tr>
		<td width="100">나이</td>
		<td colspan="2"><input type="text" name="mem_age" value="${dto.mem_age}"></td>
	</tr>
	<tr>
		<td width="100">생일(6자리 - 예, 880101)</td>
		<td colspan="2"><input type="text" name="mem_birth" value="${dto.mem_birth}"></td>
	</tr>
	<tr>
		<td width="100">이메일</td>
		<td colspan="3"><input type="text" name="mem_email" value="${dto.mem_email}"></td>
	</tr>
	<tr>
		<td width="100">전화</td>
		<td colspan="3"><input type="text" name="mem_phone" value="${dto.mem_phone}"></td>
	</tr>
	<tr>
		<td width="100">주소</td>
		<td colspan="3"><input type="text" name="mem_addr" value="${dto.mem_addr}"></td>
	</tr>
	<tr>
		<td width="100">가입일</td>
		<td colspan="3">${dto.regdate}</td>
	</tr>
	<tr>
		<td width="100">등록지점</td>
		<td colspan="3"><input type="text" name="ct_code" value="${dto.ct_code}"></td>
	</tr>
</table>
<input type="submit" value="저장">
<input type="reset" value="취소">
</form>

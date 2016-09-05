<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>여러과목 수강정보 상세보기</h1>
수강등록번호 :${dto1.rg_num }
<h3>단과과목</h3>
<table border="1" width="700">
	<tr>
		<th>회원번호</th>
		<td>${dto1.mem_num }</td>
	</tr>
	<tr>
		<th>프로그램이름</th>
		<td>${dto1.pro_name }</td>
	</tr>
	<tr>
		<th>등록개월수</th>
		<td>${dto1.pro_signmonth }</td>
	</tr>
	<tr>
		<th>시작일</th>
		<td>${dto1.pro_regdate }</td>
	</tr>
	<tr>
		<th>만료일</th>
		<td>${dto1.pro_expiration }</td>
	</tr>
</table>
<br>
<br>
<h3>PT과목</h3>
<table border="1" width="700">
	<tr>
		<th>회원번호</th>
		<td>${dto2.mem_num }</td>
	</tr>
	<tr>
		<th>프로그램이름</th>
		<td>${dto2.pt_name }</td>
	</tr>
	<tr>
		<th>등록잔여횟수</th>
		<td>${dto2.ptr_count }</td>
	</tr>
	<tr>
		<th>등록개월수</th>
		<td>${dto2.pt_signmonth }</td>
	</tr>
	<tr>
		<th>시작일</th>
		<td>${dto2.ptr_initdate }</td>
	</tr>
	<tr>
		<th>만료일</th>
		<td>${dto2.pt_expiration }</td>
	</tr>
</table>
<br>

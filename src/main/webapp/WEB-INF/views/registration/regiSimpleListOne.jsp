<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">단과과목 수강정보 상세보기</h3>
	<h6 class="text-left">등록번호 : ${dto1.rg_num }</h6>
<br>

<div class="row">
	<div class="col-md-12">
<table border="1"  class="table th">
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
</div>
</div>

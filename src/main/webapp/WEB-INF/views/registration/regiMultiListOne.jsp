<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Multi Registration List</h3>
<h6 class="text-left">수강등록번호 : ${dto1.rg_num }</h6>
<div class="row">
<h4>단과과목</h4>
</div>
<div class="row">
<div class="col-sm-12">
<table border="1" class="table">
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
</div>
</div>
<br>
<div class="row">
<h4 >PT 과목</h4>
</div>
<div class="row">
<div class="col-sm-12">
<table border="1" class="table">
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
</div>
</div>
</div>
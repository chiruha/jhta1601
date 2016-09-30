<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">PT과목 수강정보 상세보기</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span><a href="regiSelect">목록보기</a></h5>
<div class="row">

수강등록번호 :${dto1.rg_num }
<table border="1"  class="table th">
	<tr>
		<th>회원번호</th>
		<td>${dto1.mem_num }</td>
	</tr>
	<tr>
		<th>프로그램이름</th>
		<td>${dto1.pt_name }</td>
	</tr>
	<tr>
		<th>등록잔여횟수</th>
		<td>${dto1.ptr_count }</td>
	</tr>
	<tr>
		<th>등록개월수</th>
		<td>${dto1.pt_signmonth }</td>
	</tr>
	<tr>
		<th>시작일</th>
		<td>${dto1.ptr_initdate }</td>
	</tr>
	<tr>
		<th>만료일</th>
		<td>${dto1.pt_expiration }</td>
	</tr>
</table>
</div>
</div>
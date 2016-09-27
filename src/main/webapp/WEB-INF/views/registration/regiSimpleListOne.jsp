<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">단과과목 수강정보 상세보기</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span> <a href="<c:url value='/regiSelect?mnum=${mnum}'/>"> 전체보기</a></h5>
<div class="row">
<br>
등록번호 : ${dto1.rg_num }
<br>
<table border="1" class="table th" width="700">
=======
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">단과과목 수강정보 상세보기</h3>
	<h6 class="text-left">등록번호 : ${dto1.rg_num }</h6>
<br>

<div class="row">
	<div class="col-md-12">
<table border="1"  class="table th">
>>>>>>> c2090a443fd0bee8e327ec4ec8981eba2fa28a61
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
<<<<<<< HEAD
</div>
</div>

=======
<br>
</div>
</div>
</div>
>>>>>>> c2090a443fd0bee8e327ec4ec8981eba2fa28a61

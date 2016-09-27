<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="contact" class="container">
	<h3 class="text-center">복합과목 수강정보 상세보기</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span> <a href="<c:url value='/regiSelect?mnum=${mnum}'/>"> 전체보기</a></h5>
<div class="row">

수강등록번호 :${dto1.rg_num }
<table border="1"  class="table th" width="700">
	<tr>
		<th>회원번호</th>
		<td>${dto1.mem_num }</td>
	</tr>
	<tr>
		<th colspan="2"><span class="glyphicon glyphicon-file"></span> 단과과목</th>
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
	<tr>
		<th colspan="2"><span class="glyphicon glyphicon-file"></span> PT과목</th>
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
</div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Notice</h3>
	<h5 class="text-right"><a href="<c:url value='/noclist'/>">전체보기</a></h5>
	<div class="row">
<div class="col-md-12">
<table border="1"class="table">
	<tr>
		<td >글번호</td>
		<td >${dto.nt_num}</td>
	</tr>
	<tr>
		<td >작성관리자</td>
		<td>${dto.stf_name}</td>
	</tr>
	<tr>
		<td >글제목</td>
		<td >${dto.nt_title}</td>
	</tr>
	<tr>
		<td >글내용</td>
		<td >${dto.nt_content}</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td >${dto.nt_date}</td>
	</tr>
	<tr>
		<td >조회수</td>
		<td >${dto.nt_hit}</td>
	</tr>
	
</table>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
	<a href="nocDelete?nt_num=${dto.nt_num }">
	<button class="btn pull-right" id="ok" type="submit">
	<span class="glyphicon glyphicon-remove"></span> Delete </button></a>	
	</div>
		<div class="col-md-3">
		<a href="nocUpdate?nt_num=${dto.nt_num }">
	<button class="btn pull-left" id="cancle" type="reset">
	<span class="glyphicon glyphicon-ok"></span>  Update </button></a>
	</div>
	
	</div>


</div>
</div>


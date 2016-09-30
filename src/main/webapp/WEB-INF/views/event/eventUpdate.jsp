<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="contact" class="container">
	<h3 class="text-center">Event Update</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span> <a href="eventSelectAll"> 전체보기</a></h5>
	<div class="row">
	<div class="col-md-12">
	<span class="glyphicon glyphicon-pencil"></span> Write
<form method="post" action="eventUpdate?ev_num=${listone.ev_num}" enctype="multipart/form-data">
<table border="1" class="table th" >
	<tr>
		<td>글번호: ${listone.ev_num }</td>
		<td>작성일: ${listone.ev_date }</td>
		<td colspan="2"><a href="eventDelete?ev_num=${listone.ev_num}">글삭제</a></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td colspan="3">
			<input type="text" disabled="disabled" class="form-control" value="${listone.stf_num }">
			<input type="hidden" name="stf_num" value="${listone.stf_num }">
		</td>
	</tr>
	<tr>
		<th>글 제목</th>
		<td colspan="3">
			<input type="text" class="form-control" name="ev_title" value="${listone.ev_title }">
		</td>
	</tr>
	<tr>
		<td colspan="4"><img src="/fitness/resources/img/Event/${listone.ev_picture }" width="500" height="500">
	</tr>
	<tr>
		<th>이벤트내용</th>
		<td colspan="3">
			<textarea rows="15" class="form-control" cols="50" name="ev_content" value="${listone.ev_content }"></textarea>
		</td>
	</tr>
	<tr>
		<th>이벤트이미지 변경</th>
		<td colspan="3">
		<input type="file" class="form-control" name="ev_picture">
		</td>
	</tr>
</table>
	<div class="row">
		<div class="col-md-6">
			<button class="btn pull-right" type="submit">
			<span class="glyphicon glyphicon-ok"></span>  Save </button>
		</div>
		<div class="col-md-6">
			<button class="btn pull-left"type="reset">
			<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
		</div>
	</div>
</form>
</div>
</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="contact" class="container">
	<h3 class="text-center">Event Write</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span> <a href="qnaselectAll"> 전체보기</a></h5>
	<div class="row">
	<div class="col-md-12">
	<span class="glyphicon glyphicon-pencil"></span> Write
<form method="post" action="eventInsert" enctype="multipart/form-data">
<table border="1" class="table th" >
	<tr>
		<th>
			작성자
		</th>
		<td>
			<c:choose>
				<c:when test="${not empty sessionScope.snum }"><!-- 직원인경우 -->
					<input type="hidden" name="stf_num" value="${sessionScope.snum }"><input type="text" disabled="disabled" value="${sessionScope.snum }">
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<th>글 제목</th>
		<td>
	<input type="text" class="form-control" name="ev_title">
		</td>
	</tr>
	<tr>
		<th>이벤트내용</th>
		<td>
			<textarea rows="15" class="form-control" cols="50" name="ev_content"></textarea>
		</td>
	</tr>
	<tr>
		<th>이벤트이미지</th>
		<td><input type="file" class="form-control" name="ev_picture"></td>
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
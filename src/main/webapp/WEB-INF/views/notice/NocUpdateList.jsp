<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Notice Update</h3><br>
<form method="post" action="nocUpdate?nt_num=${dto.nt_num}">
<div class="row">
<div class="col-md-2"></div>
	<div class="col-md-8">
<table border="1" class="table">
	<tr>
		<td >글번호</td>
		<td >${dto.nt_num}</td>
	</tr>
	<tr>
		<td>글제목</td>
		<td  ><input type="text" name="nt_title" value="${dto.nt_title}" class="input-sm text-center"></td>
	</tr>
	<tr>
		<td >글내용</td>
		<td >
		<textarea class="form-control" rows="5" name="nt_content">${dto.nt_content}</textarea>
		</td>
	</tr>
</table><br><br>
</div>
</div>

<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
	<button class="btn pull-right" id="ok" type="submit">
	<span class="glyphicon glyphicon-ok"></span> Ok </button>
	</div>
		<div class="col-md-3">
	<button class="btn pull-left" id="cancle" type="reset">
	<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
	</div>
	
	</div>
</form>
</div>
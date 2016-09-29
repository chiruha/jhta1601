<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
<form method="post" action="nocinsert">
	<h3 class="text-center">Notice Insert</h3>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-4">
			<input type="hidden" name="stf_num" value="${sessionScope.snum }">
			<br><label>직원이름 : ${memnum }</label><br>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<label>공지제목</label>
	<input type="text" name="nt_title" placeholder="Write a Title"  class="input-sm"><br>
	</div>
	</div>
	<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<label>공지내용</label>
	</div>
	</div>
	<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<textarea rows="5" cols="50" placeholder="Write Contents"  name="nt_content" class="form-control"></textarea><br>
	</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
	<button class="btn pull-right" id="btn" type="submit">
	<span class="glyphicon glyphicon-ok"></span> Ok </button>
	</div>
		<div class="col-md-3">
	<button class="btn pull-left" id="btn" type="reset">
	<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
	</div>
</div>
</form>
</div>
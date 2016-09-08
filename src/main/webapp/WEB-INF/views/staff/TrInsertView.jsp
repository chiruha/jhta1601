<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Department Insert</h3>
<form action="trinsert" method="post" >
<div class="row">
<div class="col-md-3">
	<img src="/fitness/resources/img/Staff/${sdto.stf_picture }"><br>
</div>
	<div class="col-md-6">
		<input type="hidden"   name="stf_num" value="${sdto.stf_num}">
		<label>직원번호 ${sdto.stf_num}</label><br>
		<input type="hidden"  name="stf_name" value="${sdto.stf_name}">
		<label>직원이름 ${sdto.stf_name}</label><br>

<br><textarea rows="5" cols="20" placeholder="강사 경력" name="tr_career" class="form-control"></textarea><br>
<br><textarea rows="5" cols="20" placeholder="강사 소개"  name="tr_intro" class="form-control"></textarea><br>

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



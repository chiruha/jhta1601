<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Trainer Update</h3>
<form action="trupdate" method="post" >
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
		<input type="hidden"   name="stf_num" value="${sdto.stf_num}">
		<br><label>직원번호</label> &nbsp; <label> ${sdto.stf_num}</label><br>
		<input type="hidden"   name="tr_num" value="${dto.tr_num}">
		<label>강사번호 </label> &nbsp; <label>${sdto.stf_num}</label><br>
		
	
	</div>
		<div class="col-md-3">
	<img src="/fitness/resources/img/Staff/${sdto.stf_picture }" width="100px;" height="100px;"><br>
</div>
<div class="col-md-3"></div>
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
	<input type="hidden"  name="stf_name" value="${sdto.stf_name}">
		<label>직원이름 </label> &nbsp; <label>${sdto.stf_name}</label><br>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">

	<div id="inputSpan"><label>강사경력 </label> &nbsp; 
		<input type="text"  name="tr_career"  value="${dto.tr_career}" class="input-sm" size=3/>
		<span class="badge">년</span>
	</div>
	</div>
</div>

<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<label>강사소개</label><br>
<textarea class="form-control" rows="5" name="tr_intro" >${dto.tr_intro}</textarea><br> 
<br>
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

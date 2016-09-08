<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Department Insert</h3>
<form action="deptinsert" method="post" >
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">

	<input type="text" name="dept_name"size="15" class="form-control"  placeholder="부서명을 입력하세요" ><br>
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



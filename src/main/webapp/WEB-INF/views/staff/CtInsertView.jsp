<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Center Insert</h3>
<form action="ctinsert" method="post" >
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">

	<input type="text" name="ct_name"size="10" class="form-control"  placeholder="Center Name" ><br>
	<input type="text" name="ct_tel"size="10" class="form-control"  placeholder="Center Telephone" ><br>
	<input type="text" name="ct_addr"size="10" class="form-control"  placeholder="Center Address" ><br>
	<input type="text" name="ct_intro"size="10" class="form-control"  placeholder="Center Introduction" ><br>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
	<button class="btn pull-right"  type="submit">
	<span class="glyphicon glyphicon-ok"></span> Ok </button>
	</div>
		<div class="col-md-3">
	<button class="btn pull-left"  type="reset">
	<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
	
	
	</div>
	</div>
</form>


</div>


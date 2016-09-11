<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".addmsg").css({"color":"red","fontSize":11});
		$(".required").focusin(function() {
			$(this).next().html("필수입력 사항입니다!!");
		});
		$(".required").focusout(function() {
			$(this).next().html("");
		});
	});
</script>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Staff Insert</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>

	<div class="row">
		<div class="col-md-2"></div>

		<div class="col-md-8">
			<form action="stfinsert" method="post" enctype="multipart/form-data">

				<p >
					<span class="glyphicon glyphicon-edit"></span> Please write your profile
				</p>
			<div class="row">
				<div class="col-sm-3 form-group">
				<span class="glyphicon glyphicon-user"> Position</span>
				</div>
				<div class="col-sm-3 form-group">
						<select name="pos_code" class="form-group-sm select">
							<c:forEach var="plist" items="${poslist}">
								<option value="${plist.pos_code }">${plist.pos_name}</option>
							</c:forEach>
						</select> 
						</div>
						<div class="col-sm-3 form-group">
						<span class="glyphicon glyphicon-home"> Center</span>
						</div>
						<div class="col-sm-3 form-group">
						<select name="ct_code" class="form-group-sm select">
							<c:forEach var="clist" items="${ctlist}">
								<option value="${clist.ct_code }">${clist.ct_name}</option>
							</c:forEach>
						</select><br>
					</div><br>
					</div>
				<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Name" type="text"
							required name="stf_name" class="required"> 
							<span class="addmsg"></span>
					</div>
					</div>
					<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Phone" type="tel"
							required name="stf_phone" class="required"> 
							<span class="addmsg"></span>
					</div>
				</div>
				<br>
				
				
	
					
						<div class="col-sm-6 form-group">
						<span class="glyphicon glyphicon-picture">
						<label for="file" class=".navbar-form-label"> picture</label>
						</span>
						</div>
						<div class="col-sm-6 form-group">
					<input type="file" name="picture" ><br>
					</div>
					<br>
					
					
			<div class="row">
				<div class="col-md-12 form-group">
					<button class="btn pull-right" type="submit">
						<span class="glyphicon glyphicon-ok"> Enroll </span>
					</button>
					
				</div>
			</div>
			</form>
		</div>
	</div>
	<br>
</div>
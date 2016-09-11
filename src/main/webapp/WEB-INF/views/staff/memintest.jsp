<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Member Insert</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
<form method="post" action="meminsert" enctype="multipart/form-data">
	<p >
		<span class="glyphicon glyphicon-edit"></span> Please write your profile
	</p>
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
							required name="mem_name" class="required"> 
					</div>
					</div>
					<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Phone" type="text"
							required name="mem_phone" class="required"> 
					</div>
					</div>
						<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Address" type="text"
							required name="mem_addr" class="required"> 
					</div>
					</div>
						<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Age" type="text"
							required name="mem_age" class="required"> 
					</div>
					</div>
					<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Email" type="text"
							required name="mem_email" class="required"> 
					</div>
					</div>
						<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Gender" type="text"
							required name="mem_gen" class="required"> 
					</div>
					</div>
						<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Birth" type="text"
							required name="mem_birth" class="required"> 
					</div>
					</div>
			

<div class="col-sm-6 form-group">
						<span class="glyphicon glyphicon-picture">
						<label for="file" class=".navbar-form-label"> picture</label>
						</span>
						</div>
						<div class="col-sm-6 form-group">
					<input type="file" name="mem_picture" ><br>
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

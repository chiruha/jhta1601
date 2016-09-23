<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Position Insert</h3>

	<div class="row">
		<div class="col-md-3"></div>

		<div class="col-md-6">
			<form action="posinsert" method="post" >

			<div class="row">
						<div class="col-sm-3 form-group"></div>
						<div class="col-sm-3 form-group">
						<span class="glyphicon glyphicon-home"> Dept</span>
						</div>
						<div class="col-sm-3 form-group">
						 <select name="dept_code" class="select form-control">
						 	<c:forEach var="dlist"  items="${deptlist}">
									<option value="${dlist.dept_code }">${dlist.dept_name}</option>	
							</c:forEach>	
						</select>
					</div>
					</div>
				<div class="row">
				<div class="col-sm-3 form-group"></div>
					<div class="col-sm-6 form-group">
						<input class="form-control" placeholder="Position Code" type="text"
							required name="pos_code" class="required"> 
							<span class="addmsg"></span>
					</div>
					</div>
					<div class="row">
					<div class="col-sm-3 form-group"></div>
					<div class="col-sm-6 form-group">
						<input class="form-control" placeholder="Position Name" type="tel"
							required name="pos_name" class="required"> 
							<span class="addmsg"></span>
					</div>
				</div>
				<br>
		<div class="row">
			<div class="col-sm-3 form-group"></div>
				<div class="col-sm-3 form-group">
				<button class="btn pull-left" id="btn" type="submit">
				<span class="glyphicon glyphicon-ok"></span> Ok </button>
				</div>
					<div class="col-sm-3 form-group">
				<button class="btn pull-right" id="btn" type="reset">
				<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
				</div>
		</div>
			</form>
		</div>
	</div>
	<br>
</div>

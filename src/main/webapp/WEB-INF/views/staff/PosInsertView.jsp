<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Container (Contact Section) -->
			<form action="posinsert" method="post" >
<div id="contact" class="container">
	<h3 class="text-center">Position Insert</h3>
<br>
<div class="row">

						<div class="col-sm-3"></div>
						<div class="col-sm-3">
						<span class="glyphicon glyphicon-home"> Dept</span>
						</div>
						<div class="col-sm-3">
						 <select name="dept_code" class="select form-control">
						 	<c:forEach var="dlist"  items="${deptlist}">
									<option value="${dlist.dept_code }">${dlist.dept_name}</option>	
							</c:forEach>	
						</select>
					</div>
					</div><br>
				<div class="row">
				<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<input class="form-control" placeholder="Position Code" type="text"
							required name="pos_code" class="required"> 
							<span class="addmsg"></span>
					</div>
					</div><br>
					<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<input class="form-control" placeholder="Position Name" type="tel"
							required name="pos_name" class="required"> 
							<span class="addmsg"></span>
					</div>
				</div>
				<br>
		<div class="row">
			<div class="col-sm-3"></div>
				<div class="col-sm-3">
				<button class="btn pull-left" id="btn" type="submit">
				<span class="glyphicon glyphicon-ok"></span> Ok </button>
				</div>
					<div class="col-sm-3">
				<button class="btn pull-right" id="btn" type="reset">
				<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
				</div>
		</div>
		</div>
	</div>
	<br>
			</form>

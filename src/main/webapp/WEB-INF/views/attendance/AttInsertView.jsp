<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Attendance </h3>
<form action="attinsert" method="post" >

  <c:choose>
	<c:when test="${not empty sessionScope.mnum}">
		<input type="hidden" name="mnum" value="${sessionScope.mnum}">
	</c:when>
	<c:when test="${not empty sessionScope.snum}">
		<input type="hidden" name="snum" value="${sessionScope.snum}">
	</c:when>
		</c:choose>
      
<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-3">
			<span class="glyphicon glyphicon-home"> Center </span><br>
	<select name="ct_code" class="select input-sm">
			<c:forEach var="clist" items="${ctlist}">
					<option value="${clist.ct_code }">${clist.ct_name}</option>
			</c:forEach>
	</select>
	</div>
	<div class="col-sm-3">
	<button class="btn pull-right" id="btn" type="submit">
				<span class="glyphicon glyphicon-search"></span>  Check </button><br>
	</div>
</div>
</form>


</div>

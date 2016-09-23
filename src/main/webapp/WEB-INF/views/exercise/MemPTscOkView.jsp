<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">PT Confrim</h3>

<div class="row">
	<div class="col-md-12">
<table border="1" class="table" >
    <thead>
        <tr>
        	<th>PT강사이름</th>
			<th>PT시작일</th>
			<th>PT시간</th>
			<th>횟수</th>
			<th>승인</th>	       
        </tr>
    </thead>
    <tbody>     	
       	 <c:forEach var="dto" items="${list }" varStatus="status">
       	 <tr>       	 
       	 	<td><c:out value="${dto.stf_name }"/></td>
			<td><c:out value="${dto.ptr_initdate }"/></td>
			<td><c:out value="${dto.ptr_time }"/></td>
			<td><c:out value="${dto.ptr_count }"/></td>
			<td><c:out value="${dto.ptr_ok }"/></td>
       	</tr>			 	
		  </c:forEach>
    </tbody>
</table>	<br>
 </div>
 </div>
 <div class="row">
	<div class="col-md-12"><br>
	</div>
	</div>
</div>
	
	
	
	
	
	
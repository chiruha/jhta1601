<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#ptr_okm").on("change",function(event){
		alert($(this).val());
		
	});    
       
});
</script>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h4 class="text-center">PT승인대기</h4>
	<div class="row">
	<div class="col-md-12">
<table border="1" class="table">   
    <thead>
        <tr>
        	<th>회원이름</th>
			<th>PT시작일</th>
			<th>PT시간</th>
			<th>횟수</th>
			<th>승인</th>	       
        </tr>
    </thead>
    <tbody>    	        
        <c:forEach var="dto" items="${list }" varStatus="status">
        	<c:choose>         	 
					<c:when test="${dto.ptr_ok=='승인대기' }">					
         	 <tr>
         	 	<td><c:out value="${dto.mem_name }"/></td>
				<td><c:out value="${dto.ptr_initdate }"/></td>
				<td><c:out value="${dto.ptr_time }"/></td>
				<td><c:out value="${dto.ptr_count }"/></td>
				<td>
				<form name="pokm" action="PTokmResult" method="post">
				<input type="hidden" name="ptr_num" value="<c:out value="${dto.ptr_num}"/>">		
					<select name="okm" id="ptr_okm">
						<option>선택해주세요</option>
						<option value="승인">승인</option>
						<option value="승인취소">승인취소</option>
					</select>
				 <input type="submit" value="보내기">
				</form>				
				</td> 
           	</tr>
			</c:when>				
			</c:choose>              
        </c:forEach>
    </tbody>
</table>	
 </div>
 </div>
<br>

	<h4 class="text-center">PT승인완료</h4>
	<div class="row">
	<div class="col-md-12">
<table border="1" class="table">   
   
    <thead>
        <tr>
        	<th>회원이름</th>
			<th>PT시작일</th>
			<th>PT시간</th>
			<th>횟수</th>
			<th>승인</th>	       
        </tr>
    </thead>
    <tbody>        
        <c:forEach var="dto" items="${list }" varStatus="status">
        <c:choose>         	 
			<c:when test="${dto.ptr_ok=='승인' }">         	 
         	 <tr>
         	 	<td><c:out value="${dto.mem_name }"/></td>
				<td><c:out value="${dto.ptr_initdate }"/></td>
				<td><c:out value="${dto.ptr_time }"/></td>
				<td><c:out value="${dto.ptr_count }"/></td>
				<td><c:out value="${dto.ptr_ok }"/></td>				    
           	</tr>
           </c:when>				
		   </c:choose>
        </c:forEach>
    </tbody>
</table>	
<br>
</div></div>

	<h4 class="text-center">PT승인취소</h4>
	<div class="row">
	<div class="col-md-12">
<table border="1" class="table">   
    <thead>
        <tr>
        	<th>회원이름</th>
			<th>PT시작일</th>
			<th>PT시간</th>
			<th>횟수</th>
			<th>승인</th>	       
        </tr>
    </thead>
    <tbody>        
        <c:forEach var="dto" items="${list }" varStatus="status">
        <c:choose>         	 
			<c:when test="${dto.ptr_ok=='승인취소' }">         	 
         	 <tr>
         	 	<td><c:out value="${dto.mem_name }"/></td>
				<td><c:out value="${dto.ptr_initdate }"/></td>
				<td><c:out value="${dto.ptr_time }"/></td>
				<td><c:out value="${dto.ptr_count }"/></td>
				<td><c:out value="${dto.ptr_ok }"/></td>	   
           	</tr>
          </c:when>				
		  </c:choose>
        </c:forEach>
    </tbody>
</table>	
 </div></div></div>





	
	
	

	
	
	
	
	
	
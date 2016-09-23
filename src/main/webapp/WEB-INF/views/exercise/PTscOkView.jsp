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


<h1>PT승인대기</h1>
<table border="1" style="width:700px">
    <caption><a href="<c:url value='/'/>">게시판</a></caption>
    <colgroup>
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />
        <col width='20%' />       
    </colgroup>
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
 
<br>
<br>

<h1>PT승인완료</h1>
<table border="1" style="width:600px">
    <caption><a href="<c:url value='/'/>">게시판</a></caption>
    <colgroup>
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />       
    </colgroup>
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
<br>


<h1>PT승인취소</h1>
<table border="1" style="width:600px">
    <caption><a href="<c:url value='/'/>">게시판</a></caption>
    <colgroup>
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />
        <col width='10%' />       
    </colgroup>
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
 
<br>
<br>




	
	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	
	
	

	
	
	
	
	
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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
<h1>PT확인</h1>
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
	
	
	

	
	
	
	
	
	
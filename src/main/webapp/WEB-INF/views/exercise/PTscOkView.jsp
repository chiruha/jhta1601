<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<br>
<br>
<h1>PT승인대기</h1>
	<table border="1" width="800">
		<tr>
			<th>회원이름</th>
			<th>PT시작일</th>
			<th>PT시간</th>
			<th>횟수</th>
			<th>승인</th>			
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.mem_name }</td>
				<td>${dto.ptr_initdate }</td>
				<td>${dto.ptr_time }</td>
				<td>${dto.ptr_count }</td>
				<td>
				<c:choose>
					<c:when test="${dto.ptr_ok=='승인대기' }">
					<select>
						<option>선택해주세요</option>
						<option value="승인">승인</option>
						<option value="승인취소">승인취소</option>
					</select>
					</c:when>
				</c:choose>
				</td>				
			</tr>
		</c:forEach>
	</table>
 
<br>
<br>
<h1>PT승인완료</h1>
	<table border="1" width="800">
		<tr>
			<th>회원이름</th>
			<th>PT시작일</th>
			<th>PT시간</th>
			<th>횟수</th>
			<th>승인</th>			
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.mem_name }</td>
				<td>${dto.ptr_initdate }</td>
				<td>${dto.ptr_time }</td>
				<td>${dto.ptr_count }</td>
				<td>
				<c:choose>					
					<c:when test="${dto.ptr_ok=='승인' }">
					${dto.ptr_ok }
					</c:when>					
				</c:choose>
				</td>				
			</tr>
		</c:forEach>
	</table>	

<br>
<br>
<h1>PT승인취소</h1>	
	<table border="1" width="800">
		<tr>
			<th>회원이름</th>
			<th>PT시작일</th>
			<th>PT시간</th>
			<th>횟수</th>
			<th>승인</th>			
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.mem_name }</td>
				<td>${dto.ptr_initdate }</td>
				<td>${dto.ptr_time }</td>
				<td>${dto.ptr_count }</td>
				<td>
				<c:choose>					
					<c:when test="${dto.ptr_ok=='승인취소' }">
					${dto.ptr_ok }
					</c:when>					
				</c:choose>
				</td>				
			</tr>
		</c:forEach>
	</table>	
	
	
	
	
	
	

	
	
	
	
	
	
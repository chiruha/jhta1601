<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <h1>회원상세정보보기</h1>
<br>
<br>
<h1>전체회원목록</h1>
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
				<td>${dto.ptr_ok }</td>					
			</tr>
		</c:forEach>
	</table>
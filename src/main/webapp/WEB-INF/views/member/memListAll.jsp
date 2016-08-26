<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>전체회원보기</h1>
<br>
<div><!-- 회원검색하기 : 회원검색 후 -> 프로그램등록(registration) -->
	<form action="memSearchList">
회원검색 : 
	<select name="memSearch">
		<option value="mem_num">회원번호</option>
		<option value="mem_name">회원이름</option>
		<option value="mem_phone">회원전화</option>
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="회원검색">
	</form>
</div>
<table border="1" width="1000">
	<tr>
		<th>회원번호1</th>
		<th>이름</th>
		<th>전화</th>
		<th>가입일</th>
		<th>등록지점</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.mem_num }</td>
		<td><a href="listOne?mem_num=${dto.mem_num}">${dto.mem_name }</a></td>
		<td>${dto.mem_phone }</td>
		<td>${dto.regdate }</td>
		<td>${dto.ct_code }</td>
	</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="memselectAll?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="memselectAll?pageNum=${i }"><span style="color:#555">[${i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- registration 전체목록보기(완료) -->
<!-- 검색은 과목별로 볼 수 있도록!!(할 일) -->
<h1>회원 수강등록정보보기</h1>
<table border="1" width="500">
	<tr>
		<th>등록번호</th>
		<th>회원번호</th>
		<th>등록유형</th>
		<th>프로그램등록비</th>
		<th>락카비</th>
		<th>운동복비</th>
	</tr>
	<c:forEach var="dto" items="${listAll}">
	<tr>
		<td>${dto.rg_num}</td>
		<td>${dto.mem_num }</td>
		<td>
		<c:choose>
			<c:when test="${dto.rg_type == '단과과목'}">
				<a href="regiSimpleListOne?mem_num=${dto.mem_num }&rg_num=${dto.rg_num}">${dto.rg_type}</a>
			</c:when>
			<c:when test="${dto.rg_type == 'PT'}">
				<a href="regiPTListOne?mem_num=${dto.mem_num }&rg_num=${dto.rg_num}">${dto.rg_type}</a>
			</c:when>
			<c:when test="${dto.rg_type == '여러과목'}">
				<a href="regiMultiListOne?mem_num=${dto.mem_num }&rg_num=${dto.rg_num}">${dto.rg_type}</a>
			</c:when>
		</c:choose>
		</td>
		<td>${dto.rg_price }</td>
		<td>${dto.locker_price }</td>
		<td>${dto.wear_price }</td>
	</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징처리 -->
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<a href="regiSelect?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="regiSelect?pageNum=${i }"><span style="color:red">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
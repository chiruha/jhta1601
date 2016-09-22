<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- registration 전체목록보기(완료) -->
<!-- 검색은 과목별로 볼 수 있도록!!(할 일) -->
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">수강등록정보</h3>
<h5 class="text-right"><a href="<c:url value='/regiSelect'/>">전체보기</a></h5>
<div class="row">
	<div class="col-md-12">
	<table  class="table th" >
	<tr>
		<th>등록번호</th>
		<th>회원번호</th>
		<th>회원이름</th>
		<th>등록유형</th>
		<th>프로그램 등록비</th>
		<th>락카비</th>
		<th>운동복비</th>
		<th>수정하기</th>
		<th>삭제하기</th>
	</tr>
	<c:forEach var="dto" items="${listAll}">
	<tr>
		<td>${dto.rg_num}</td>
		<td>${dto.mem_num }</td>
		<td>${dto.mem_name }</td>
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
		<td>
			<a href="regiUpdate?mem_num=${dto.mem_num }&rg_num=${dto.rg_num}">수정하기</a>
		</td>
		<td>
			<a href="regiDelete?rg_num=${dto.rg_num}&rg_type=${dto.rg_type}">삭제하기</a>
		</td>
	</tr>
	</c:forEach>
</table>
<br>
</div>
</div>


<!-- 페이징처리 -->
	<div class="row">
		<div class="text-center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<a href="regiSelect?pageNum=${i }"><span style="color:blue"> ${i } </span></a>
			</c:when>
			<c:otherwise>
				<a href="regiSelect?pageNum=${i }"><span style="color:red"> ${i } </span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</div>
</div>



</div>
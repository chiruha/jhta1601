<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Member List</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span><a href="<c:url value='/memselectAll'/>"> 전체보기</a></h5>
	<div class="row">
	<div class="col-md-12">
	

<table border="1" class="table th" >
	<tr>
		<th>회원번호</th>
		<th>회원이름</th>
		<th>전화전호</th>
		<th>가입일자</th>
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
</div>
	
<!-- 회원검색하기 : 회원검색 후 -> 프로그램등록(registration) -->

<form action="memSearchList">
<div class="row">
		<div class="col-sm-6">
<span class="glyphicon glyphicon-search"> </span> 회원검색
			<select class="select input-sm" name="memSearch">
		<option value="mem_num">회원번호</option>
		<option value="mem_name">회원이름</option>
		<option value="mem_phone">회원전화</option>
	</select>
	<input type="text" placeholder=" 검색어를 입력하세요" class="input-sm"  name="keyword" id="keyword" value="${keyword }">
</div>
	<div class="col-sm-6">
				<button class="btn pull-right " id="btn" type="submit">
				<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
</div><br>
	</form>

	<div class="row">
		<div class="text-center">
<!-- 페이징 |이전| -->
<c:choose>
	<c:when test="${pu.startPageNum>5 }">
		<a href="memselectAll?pageNum=${pu.startPageNum -1 }"> prev </a>
	</c:when>
	<c:otherwise>
		prev
	</c:otherwise>
</c:choose>
<!-- 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="memselectAll?pageNum=${i }"><span style="color:blue">${i }</span></a>
		</c:when>
		<c:otherwise>
			<a href="memselectAll?pageNum=${i }"><span style="color:#555">${i }</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<!-- 페이징 |다음| -->
<c:choose>
	<c:when test="${pu.endPageNum<pu.totalPageCount }">
		<a href="memselectAll?pageNum=${pu.endPageNum +1 }"> next </a>
	</c:when>
	<c:otherwise>
		next
	</c:otherwise>
</c:choose>
	</div>
		</div>
	</div>
</div>

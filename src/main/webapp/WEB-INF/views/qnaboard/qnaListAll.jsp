<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">QnA List</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span> <a href="<c:url value='/qnaselectAll'/>">전체보기</a></h5>
	<div class="row">
	<div class="col-md-12">
<c:choose>
	<c:when test="${not empty sessionScope.mnum }">
		
<span class="glyphicon glyphicon-pencil"></span> <a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
	<c:when test="${not empty sessionScope.snum }">
		
<span class="glyphicon glyphicon-pencil"></span> <a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
</c:choose>
	

<table border="1" class="table th" >
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>글쓴이</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="dto" items="${qnalist }">
	<tr>
		<td>${dto.qna_num }</td>
		<td><h5 class='text-left'>
			<c:if test="${dto.qna_lev>0 }">
				<c:forEach var="i" begin="1" end="${dto.qna_lev }">
					&nbsp;&nbsp;
				</c:forEach>
				&nbsp;&nbsp&nbsp;&nbsp<span class='glyphicon glyphicon-arrow-right'></span>&nbsp;&nbsp;
			</c:if>
			<a href="qnaListOne?qna_num=${dto.qna_num}">${dto.qna_title }</a>
			</h5>
		</td>
		<c:choose>
			<c:when test="${dto.mem_num<1 }">
				<td>admin</td>
			</c:when>
			<c:otherwise>
				<td>${dto.mem_num }</td>
			</c:otherwise>
		</c:choose>
		<td>${dto.qna_hit }</td>
		<td>${dto.qna_date }</td>
	</tr>
	</c:forEach>
</table>
</div>


<form method="post" action="qnaSearch">
<div class="row">
		<div class="col-sm-6">
		<span class="glyphicon glyphicon-search"> </span> 검색하기
	<select name="field" class="select input-sm" >
		<option value="mem_num">글쓴이</option>
		<option value="qna_title">글제목</option>
		<option value="qna_content">글내용</option>
	</select>
		<input type="text" placeholder=" 검색어를 입력하세요" class="input-sm"  name="keyword" id="keyword" value="${keyword }">
</div>
		<div class="col-sm-6">
				<button class="btn pull-right " id="btn" type="submit">
				<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
</div><br>
	</form>

<c:choose>
	<c:when test="${not empty sessionScope.mnum }">
		
<span class="glyphicon glyphicon-pencil"></span> <a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
	<c:when test="${not empty sessionScope.snum }">
		
<span class="glyphicon glyphicon-pencil"></span> <a href="<c:url value='/qnainsert'/>">글쓰기</a>
	</c:when>
</c:choose>


<div class="row">
		<div class="text-center">
<!-- 페이징 |이전| -->
<c:choose>
	<c:when test="${pu.startPageNum>5 }">
		<a href="memselectAll?pageNum=${pu.startPageNum -1 }">|이전|</a>
	</c:when>
	<c:otherwise>
		이전
	</c:otherwise>
</c:choose>
<!-- 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="qnaselectAll?pageNum=${i }"><span style="color:blue">${i }</span></a>
		</c:when>
		<c:otherwise>
			<a href="qnaselectAll?pageNum=${i }"><span style="color:#555">${i }</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<!-- 페이징 |다음| -->
<c:choose>
	<c:when test="${pu.endPageNum<pu.totalPageCount }">
		<a href="qnaselectAll?pageNum=${pu.endPageNum +1 }">|다음|</a>
	</c:when>
	<c:otherwise>
		다음
	</c:otherwise>
</c:choose>
	</div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
		$(".pasing").click(function(event) {
			event.preventDefault();
			$("#pageNum").val($(this).attr("href"));
			document.listform.submit();
		});
</script>




<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Trainer List</h3>
	<h5 class="text-right"><a href="<c:url value='/trlist'/>">전체보기</a></h5>
<div class="row">
	<div class="col-md-12">
	
<table border="1" class="table th" >
	<tr>
		<th>직원번호</th>
		<th>강사번호</th>
		<th>강사소개</th>
		<th>강사경력</th>
	</tr>
	<c:forEach var="dto" items="${trlist }">
	<tr>
		<td>${dto.stf_num }</td>
		<td><a href="trdetail?tr_num=${dto.tr_num}">${dto.tr_num }</a></td>
		<td>${dto.tr_career }</td>
		<td>${dto.tr_intro }</td>
	</tr>
	</c:forEach>
</table>
	
	
	</div>


</div>

							
	<form action="trlist" method="post" name="listform">
	<input type="hidden" id="pageNum" name="pageNum">

	<div class="row">
		<div class="col-sm-2">
		
			<select class="select input-sm">
				<option>이름</option>
				<option>경력</option>
				<option>지점</option>
				
			</select>
		</div>
		<div class="col-sm-6">
				<input type="text" placeholder="검색 조건을 선택하세요" class="form-control" size="10" name="keyword" id="keyword" value="${keyword }">
				<span id="sp"></span>
							
		</div>
		<div class="col-sm-4">
				<button class="btn pull-right " id="btn" type="submit">
				<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>

	</div>
					

<br>
</form>
	<div class="row">

		<div class="text-center">
		
<form action="trlist" method="post" name="listform">
<!-- 페이징처리 -->
<c:choose>
	<c:when test="${pu.startPageNum>5 }">
		<a href="${pu.startPageNum-1}" class="pasing">prev&nbsp;</a>
	</c:when>
	<c:otherwise>
		prev&nbsp;
	</c:otherwise>
</c:choose>

<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="${i }" class="pasing">
			<span style="color:blue">${i }</span></a>
		</c:when>
		<c:otherwise>
			<a href="${i }" class="pasing">
			<span style="color:#555">${i }</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
	
	<c:choose>
	<c:when test="${pu.endPageNum<pu.totalPageCount}">
		<a href="${pu.endPageNum+1 }" class="pasing"> &nbsp;next</a>
	</c:when>
	<c:otherwise>
		&nbsp;next
	</c:otherwise>
</c:choose>
</form>
			</div>
		</div>

</div>
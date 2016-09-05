<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<script type="text/javascript">
<!--

//-->





		$(".pasing").click(function(event) {
			event.preventDefault();
			$("#pageNum").val($(this).attr("href"));
			document.listform.submit();
		});
	

</script>


<table border="1" >
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
<form action="trlist" method="post" name="listform">


</form>



<!-- 페이징처리 -->
<c:choose>
	<c:when test="${pu.startPageNum>5 }">
		<a href="${pu.startPageNum-1}" class="pasing">이전</a>
	</c:when>
	<c:otherwise>
		이전
	</c:otherwise>
</c:choose>





<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="${i }" class="pasing">
			<span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="${i }" class="pasing">
			<span style="color:#555">[${i }]</span></a>
		</c:otherwise>
	</c:choose>
	
</c:forEach>
	
	<c:choose>
	<c:when test="${pu.endPageNum<pu.totalPageCount}">
		<a href="${pu.endPageNum+1 }" class="pasing">다음</a>
	</c:when>
	<c:otherwise>
		다음
	</c:otherwise>
</c:choose>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function() {
		//alert("start");
		//alert("writer체크박스상태:"+$("input:checkbox[name=writer]").prop("checked")+", title체크박스상태:"+ $("input:checkbox[name=title]").prop("checked"));
		$("#btn").click(function(event) {
			event.preventDefault();
				$("#sp").empty();
			if($("#keyword").val()=='' && $("input:checkbox[name=writer]").prop("checked")==false  && $("input:checkbox[name=title]").prop("checked")==false ){
				$("#sp").append("검색어를 입력하세요!!").css({
					"color":"red",
					"font-size":"12px"
				});
			}else{
				document.listform.submit();
			}
		});
		
		$(".pasing").click(function(event) {
			event.preventDefault();
			//alert($(this).attr("href"));
			$("#pageNum").val($(this).attr("href"));
			document.listform.submit();
		});
	
		
	});
</script>
<h1><a href="<c:url value='/noclist'/>">공지사항목록</a></h1>
<table border="1" >
	<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>			
			<th>작성일</th>
			<th>조회수</th>
	</tr>
	<c:forEach var="dto" items="${nlist }">
			<tr>
				<td><c:out value="${dto.nt_num }"/></td>
				<td><a href="noclistOne?nt_num=${dto.nt_num}">${dto.nt_title }</a></td>
				<td><c:out value="${dto.stf_name }"/></td>
				<td><c:out value="${dto.nt_date }"/></td>				
				<td><c:out value="${dto.nt_hit }"/></td>
			</tr>
		</c:forEach>
</table>


<form action="noclist" method="post" name="listform">
	<input type="checkbox" name="writer"  value="wt" <c:if test="${writer ne null }">checked="checked"</c:if>>작성자
	<input type="checkbox" name="title"  value="tl" <c:if test="${title ne null }">checked="checked"</c:if>>제목
	<span id="cspan"></span><span id="pspan"></span>
	<input type="hidden" id="pageNum" name="pageNum">
<input type="text" size="16" name="keyword" id="keyword" value="${keyword }">
<input type="submit" id="btn" value="검색" ><br>
<span id="sp"></span>
</form>
<br>
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
	
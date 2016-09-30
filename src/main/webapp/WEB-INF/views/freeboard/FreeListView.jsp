<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
 $(document).ready(function() {
		$("#btn").click(function(event) {
			event.preventDefault();
				$("#sp").empty();
			if($("#keyword").val()=='' && $("input:checkbox[name=writer]").prop("checked")==false  && $("input:checkbox[name=title]").prop("checked")==false ){
				$("#sp").append("검색어를 입력하세요!!").css({
					"color":"#0080ff",
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
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Free Board</h3>
	<h5 class="text-right"><a href="<c:url value='/fblist'/>">전체보기</a></h5>
<div class="row">
	<div class="col-md-12">
	<table  class="table th" >
	<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>			
			<th>작성일</th>
			<th>조회수</th>
	</tr>
	<c:forEach var="dto" items="${fblist }">
			<tr>
				<td>${dto.fb_num }</td>
				<td>
				<c:if test="${dto.fb_lev>0 }">
					<c:forEach var="i" begin="1" end="${dto.fb_lev }">
					 	&nbsp;&nbsp;
					</c:forEach>
					[re]		
				</c:if>
				<a href="fbdetail?fb_num=${dto.fb_num}">${dto.fb_title }</a>
				</td>
				<td>${dto.mem_name }</td>
				<td>${dto.fb_date }</td>				
				<td>${dto.fb_hit }</td>
			</tr>
	</c:forEach>
</table>

	</div>
</div>

<form action="fblist" method="post" name="listform">
	<input type="hidden" id="pageNum" name="pageNum">
	<div class="row">
	<div class="col-sm-12">
	<input type="checkbox" name="writer"  value="wt" <c:if test="${writer ne null }">checked="checked"</c:if>>작성자
	<input type="checkbox" name="title"  value="tl" <c:if test="${title ne null }">checked="checked"</c:if>>제목
	</div>		
	</div>
<div class="row">
		<div class="col-sm-8">
				<input type="text" placeholder="검색 조건을 선택하세요" class="form-control" size="15" name="keyword" id="keyword" value="${keyword }">
				<span id="sp"></span>
			
			</div>
			<div class="col-sm-4">
				<button class="btn pull-right" id="btn" type="submit">
				<span class="glyphicon glyphicon-search"></span>  Search </button><br>
			</div>

			</div>



<br>
</form>
<div class="row">
		<div class="text-center">
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
		</div>
	</div>



</div>
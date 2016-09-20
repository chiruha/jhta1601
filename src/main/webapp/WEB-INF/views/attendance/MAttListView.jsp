<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
	$(document).ready(function() {
		var type="${sessionScope.mtype}";
		if(type!=""&&type!=null){
		//alert("type: ${sessionScope.mtype}")
			$("#mselbox").val("${sessionScope.mtype}").attr("selected","selected")		
		}
		$("#btn").click(function(event) {
			//alert($("#selbox option:selected").val())
			event.preventDefault();
				$("#sp").empty();
			if($("#matt_keyword").val()=='' ){
				$("#sp").append("검색어를 입력하세요!!").css({
					"color":"#0080ff",
					"font-size":"13px"
				});
			}else{
				document.listform.submit();
			}
		});
		
		$(".pasing").click(function(event) {
			event.preventDefault();
			$("#pageNum").val($(this).attr("href"));
			document.listform.submit();
		});
	
		
	});
	
</script>



<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Member Attendance List </h3>
	<h5 class="text-right"><a href="<c:url value='mlistAll'/>">전체보기</a></h5>
<div class="row">
	<div class="col-md-12">
	<table  class="table th" >
	<tr>
		<th>회원번호</th>
		<th>회원이름</th>
		<th>전화번호</th>
		<th>등록지점</th>
		<th>출석지점</th>
		<th>출석일시</th>
		<th>귀가일시</th>
	</tr>
	<c:forEach var="dto" items="${mattlist }">
	<tr>
		<td>${dto.mem_num }</td>
		<td><a href="listOne?mem_num=${dto.mem_num}">${dto.mem_name }</a></td>
		<td>${dto.mem_phone }</td>
		<td>${dto.reg_name }</td>
		<td>${dto.ct_name }</td>
		<td>${dto.in_date }</td>
		<td>
			<c:choose>
				<c:when test="${dto.out_date ne null }">${dto.out_date}</c:when>
				<c:otherwise><a href="mattupdate?matt_num=${dto.matt_num}">귀가하기</a></c:otherwise>
			</c:choose>
		</td>
	</tr>
	</c:forEach>
</table>
	</div>
</div>
							
	<form action="mlistAll" method="post" name="listform">
		<input type="hidden" id="pageNum" name="pageNum">
	<div class="row">
		<div class="col-sm-2">
			<select name="mtype" class="select input-sm" id="mselbox">
					<option value="ct_name">출석지점</option>
					<option value="mem_name">회원이름</option>
					<option value="mem_phone">회원전화</option>
					<option value="in_date">출석일시</option>
					<option value="out_date">귀가일시</option>
			</select>
		</div>

			<div class="col-sm-6">
				<input type="text" placeholder="검색 조건을 선택하세요" class="form-control" size="15"
				 name="matt_keyword" id="matt_keyword" <c:if test="${matt_keyword ne null}">value="${matt_keyword }"</c:if>>
				<span id="sp"></span>
			</div>
			<div class="col-sm-4">
				<button class="btn pull-right" id="btn" type="submit">
				<span class="glyphicon glyphicon-search"></span>  search </button><br>
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
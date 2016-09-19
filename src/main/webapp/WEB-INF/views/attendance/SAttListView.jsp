<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
	$(document).ready(function() {
		
		$("#btn").click(function(event) {
			event.preventDefault();
				$("#sp").empty();
				//alert($("#chk1").prop("checked")+", "+ $("#chk2").prop("checked"));   // 지점, 직급 선택 여부 판단
				//alert( $("input:checkbox:checked").length);  // 체크된 개수 구하기
			if($("#keyword").val()=='' && $("#chk1").prop("checked")==false  && $("#chk2").prop("checked")==false ){
				$("#sp").append("검색어를 입력하세요!!").css({
					"color":"#0080ff",
					"font-size":"13px"
				});
			}else if($("#keyword").val()!='' && $("input:checkbox:checked").length<1 ){
				$("#sp").append("검색 조건을 선택하세요!!").css({
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
	<h3 class="text-center">Staff Attendance List 수정중</h3>
	<h5 class="text-right"><a href="<c:url value='slistAll'/>">전체보기</a></h5>
<div class="row">
	<div class="col-md-12">
	<table  class="table th" >
	<tr>
		<th>직원번호</th>
		<th>직원이름</th>
		<th>전화번호</th>
		<th>등록지점</th>
		<th>출근지점</th>
		<th>출근일시</th>
		<th>퇴근일시</th>
	</tr>
	<c:forEach var="dto" items="${sattlist }">
	<tr>
		<td>${dto.stf_num }</td>
		<td><a href="stfdetail?stf_num=${dto.stf_num}">${dto.stf_name }</a></td>
		<td>${dto.stf_phone }</td>
		<td>${dto.reg_name }</td>
		<td>${dto.ct_name }</td>
		<td>${dto.in_date }</td>
		<td>
			<c:choose>
				<c:when test="${dto.out_date ne null }">${dto.out_date}</c:when>
				<c:otherwise><a href="sattupdate?satt_num=${dto.satt_num}">퇴근하기</a></c:otherwise>
			</c:choose>
		</td>
	</tr>
	</c:forEach>
</table>
	</div>
</div>
							
	<form action="slistAll" method="post" name="listform">
		<input type="hidden" id="pageNum" name="pageNum">

	<div class="row">
		<div class="col-sm-12">
				<input type="checkbox" name="stf_name"   value="name" <c:if test="${stf_name ne null }">checked="checked"</c:if>>이름
				<input type="checkbox" name="stf_phone"   value="tel" <c:if test="${stf_phone ne null }">checked="checked"</c:if>>전화

			<select name="ct_code">
				<option selected="selected" class="select input-sm">지점선택</option>
				<c:forEach var="ctdto" items="${ctlist }">
					<option value="${ctdto.ct_code }">${ctdto.ct_name }</option>
				</c:forEach>
			</select>
				
		</div>		
	</div>
	<div class="row">
			<div class="col-sm-8">
				<input type="text" placeholder="검색 조건을 선택하세요" class="form-control" size="15" name="keyword" id="keyword" value="${keyword }">
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
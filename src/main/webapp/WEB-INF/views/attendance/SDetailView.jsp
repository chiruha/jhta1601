<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
	$(document).ready(function() {
		var type="${sessionScope.dtype}";
		if(type!=""&&type!=null){
		//alert("type: ${sessionScope.stype}")
			$("#dselbox").val("${sessionScope.dtype}").attr("selected","selected")		
		}
		$("#btn").click(function(event) {
			//alert($("#selbox option:selected").val())
			event.preventDefault();
				$("#sp").empty();
			if($("#datt_keyword").val()=='' ){
				$("#sp").append("검색어를 입력하세요!!").css({
					"color":"#0080ff",
					"font-size":"13px"
				});
			}else if($("#dselbox option:selected").val()=="stf_num"){
				//alert("dsel :"+$("#dselbox option:selected").val())
				//alert("검색 : "+$("#datt_keyword").val())
				$("#stf_num").val($("#datt_keyword").val())
				document.listform.submit();
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
	<h3 class="text-center">Staff Attendance Detail </h3>
	<h5 class="text-right"><a href="sdetail?stf_num=${dstf_num}">전체보기</a></h5>
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
		<th>근무시간</th>
	</tr>
	<c:forEach var="dto" items="${dattlist }">
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
		<td>${dto.work_time }</td>
	</tr>
	</c:forEach>
</table>
	</div>
</div>
							
	<form action="sdetail" method="post" name="listform">
	<input type="hidden" id="stf_num" name="stf_num" value="${dstf_num}">
		<input type="hidden" id="pageNum" name="pageNum">
	<div class="row">
		<div class="col-sm-2">
			<select name="type" class="select input-sm" id="dselbox">
					<option value="stf_num">직원번호</option>
					<option value="stf_name">직원이름</option>
					<option value="stf_phone">직원전화</option>
					<option value="ct_name">출근지점</option>
					<option value="in_date">출근일시</option>
					<option value="out_date">퇴근일시</option>
			</select>
		</div>

			<div class="col-sm-6">
				<input type="text" placeholder="검색 조건을 선택하세요" class="form-control" size="15"
				 name="datt_keyword" id="datt_keyword" <c:if test="${satt_keyword ne null}">value="${satt_keyword }"</c:if>>
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
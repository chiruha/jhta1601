<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0-rc.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.11.3.js"></script>
  <script src="//code.jquery.com/ui/1.12.0-rc.1/jquery-ui.js"></script>


 <script type="text/javascript">
	$(document).ready(function() {
		var type="${ptype}";
		//alert("${dtype}")
		if(type!=""&&type!=null){
		//alert("type: ${sessionScope.stype}")
			$("#pselbox").val("${ptype}").attr("selected","selected")		
		}
		$("#btn").click(function(event) {
			//alert($("#selbox option:selected").val())
			event.preventDefault();
				$("#sp").empty();
			if($("#pkeyword").val()=='' ){
				$("#sp").append("검색어를 입력하세요!!").css({
					"color":"#0080ff",
					"font-size":"13px"
				});
			}else if($("#pselbox option:selected").val()=="stf_num"){
				//alert("dsel :"+$("#dselbox option:selected").val())
				//alert("검색 : "+$("#datt_keyword").val())
				$("#stf_num").val($("#pkeyword").val())
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

		$("#datepicker1").on("change",function(e) {
			document.listform.submit();
		});
	
		 $( "#datepicker1" ).datepicker({
			    dateFormat: 'yy/mm/dd'
			  });
		 
			 
		 });
</script>



<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<form action="paylist" method="post" name="listform">
	<h3 class="text-center">Payment List </h3>
<div class="row">
	<div class="col-sm-8">
	<h5 class="text-left"> <label>검색 시작일</label>
	<input type="text" id="datepicker1" size="10" name="start_date" placeholder="날짜를 선택하세요(3개월 단위)" class="input-sm"
		<c:if test="${start_date ne null}">value="${start_date }"</c:if>> </h5>
	</div>
	<div class="col-sm-4">
	<h5 class="text-right"><a href="paylist?stf_num=${pstf_num}">전체보기</a></h5>
	</div>
</div>
<div class="row">
	<div class="col-sm-12">
	<table  class="table th" >
	<tr>
		<th>직원번호</th>
		<th>직원이름</th>
		<th>전화번호</th>
		<th>지급금액</th>
		<th>지급일시</th>
		<th>총근무시간</th>
	</tr>
	<c:forEach var="dto" items="${paylist }">
	<tr>
		<td>${dto.stf_num }</td>
		<td>${dto.stf_name }</td>
		<td>${dto.stf_phone }</td>
		<td>${dto.pay_tot }</td>
		<td>${dto.pay_date }</td>
		<td>${dto.time_sum }</td>
		
	</tr>
	</c:forEach>
</table>
	</div>
</div>
							
	<input type="hidden" id="stf_num" name="stf_num" value="${pstf_num}">
		<input type="hidden" id="pageNum" name="pageNum">
	<div class="row">
		<div class="col-sm-2">
			<select name="ptype" class="select input-sm" id="pselbox">
					<option value="stf_num">직원번호</option>
					<option value="stf_name">직원이름</option>
					<option value="stf_phone">직원전화</option>
			</select>
		</div>

			<div class="col-sm-6">
				<input type="text" placeholder="검색 조건을 선택하세요" class="form-control" size="15"
				 name="pkeyword" id="pkeyword" <c:if test="${pkeyword ne null}">value="${pkeyword }"</c:if>>
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
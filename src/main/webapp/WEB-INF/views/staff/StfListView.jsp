<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
		$("input:checkbox").on("click", function() {
			//alert($(this).val());
			if($(this).val()=="ct" && $(this).prop("checked")){
				ctload();
			}else if($(this).val()=="ct" && $(this).prop("checked")==false ){
				$("#cspan").empty();
			}else if($(this).val()=="pos" && $(this).prop("checked")){
				posload();
			}else if($(this).val()=="pos" && $(this).prop("checked")==false ){
				$("#pspan").empty();
			}
		});
		
		function ctload(){
			$.ajax({
				url:"/fitness/ctlist",
				dataType : "xml",
				success : function(data) {
					//alert(data);
					var select1=document.createElement("select");
					select1.name="ct_code";
					select1.classList.add('dropdown-select');
					$(data).find("center").each(function() {
						var option1=document.createElement("option");
						option1.value=$(this).find("ctcode").text();
						option1.text=$(this).find("ctcode").text()+":"+$(this).find("ctname").text();
						select1.appendChild(option1);
					});
					$("#cspan").empty();
					$(select1).appendTo("#cspan");
				}
			});
		}
		function posload() {
			$.ajax({
				url:"/fitness/poslist",
				dataType : "xml",
				success : function(data) {
					//alert(data);
					var select=document.createElement("select");
					select.name="pos_code";
					select.classList.add('dropdown-select');
					$(data).find("position").each(function() {
						var option=document.createElement("option");
						option.value=$(this).find("poscode").text();
						option.text=$(this).find("poscode").text()+":"+$(this).find("posname").text();
						select.appendChild(option);
					});
					$("#pspan").empty();
					$(select).appendTo("#pspan");
				}
			});
		}
		
		
		$("#btn").click(function(event) {
			event.preventDefault();
				$("#sp").empty();
				//alert($("#chk1").prop("checked")+", "+ $("#chk2").prop("checked"));
			if($("#keyword").val()=='' && $("#chk1").prop("checked")==false  && $("#chk2").prop("checked")==false ){
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
			$("#pageNum").val($(this).attr("href"));
			document.listform.submit();
		});
	
		
	});
	
</script>
<h1><a href="<c:url value='/stflist'/>">직원목록</a></h1>

<table border="1" >
	<tr>
		<th>직원번호</th>
		<th>직원이름</th>
		<th>전화번호</th>
		<th>직급코드</th>
		<th>지점코드</th>
		<th>가입일</th>
	</tr>
	<c:forEach var="dto" items="${stflist }">
	<tr>
		<td>${dto.stf_num }</td>
		<td><a href="stfdetail?stf_num=${dto.stf_num}">${dto.stf_name }</a></td>
		<td>${dto.stf_phone }</td>
		<td>${dto.pos_code }</td>
		<td>${dto.ct_code }</td>
		<td>${dto.stf_date }</td>
	</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="stflist?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="stflist?pageNum=${i }"><span style="color:#555">[${i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
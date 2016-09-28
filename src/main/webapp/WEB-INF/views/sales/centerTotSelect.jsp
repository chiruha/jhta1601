<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0-rc.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.11.3.js"></script>
  <script src="//code.jquery.com/ui/1.12.0-rc.1/jquery-ui.js"></script>

<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharttable.org/master/jquery.highchartTable-min.js"></script>

<script type="text/javascript">
var searchMonth="";
function ajaxSearchTotInfo(searchMonth){
	//alert("TotInfo 가져오자!!");
	$.ajax({
		url:"/fitness/ctsSelect/xml",
		data:"searchMonth="+searchMonth,
		success:function(data){
			//alert("데이타 가져오자!!!");
			var div=document.getElementById("totList");
			//alert("div: "+div);
			div.innerHTML="";
			var html="";
			var html2="";
			html +=
				"<div class='col-md-12'>"+
				"<table id='aa' name='inFrm' class='table th highchart' width='1000'   data-graph-container-before='1' data-graph-type='column'>"+
				"<tr>"+
		 			"<td>지점번호</td>"+
		 			"<td>총 수입금액</th>"+
		 			"<td>총 환불금액</th>"+
		 			"<td>계산기준일</td>"+
			 	"</tr>";
			$(data).find("tot").each(function(){
				//alert("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
				var len=$(this).find("getCts_num").length;
				//alert("length: "+len);
				for(var i=0;i<len;i++){
					var getCts_num=$(this).find("getCts_nums").text();
					var getCt_code=$(this).find("getCt_code").text();
					var getCts_income=$(this).find("getCts_income").text();
					var getCts_refund=$(this).find("getCts_refund").text();
					var getCts_totsales=$(this).find("getCts_totsales").text();
					var getCts_date=$(this).find("getCts_date").text();
					html +=
						"<tr>"+
							"<td>"+getCt_code+"</td>"+
							"<td>"+getCts_income+"</td>"+
							"<td>"+getCts_refund+"</td>"+
							"<td>"+getCts_date+"</td>"+
						"</tr>";
						
					var html1 =
						"<tr>"+
							"<td>"+getCt_code+"</td>"+
							"<td>"+getCts_totsales+"</td>"+
						"</tr>";
					$("#aa").append(html1);
					console.log(html1);
					
				}
			});
			html += "</table>";
			html += "</div>";
			 $("table.highchart").highchartTable();
			
			var totInfo=document.createElement("div");
	     	totInfo.innerHTML = html;
			div.appendChild(totInfo);
		}
	});
}
<%--
function selectChart(getCt_code,getCts_totsales,getCts_date){
	var len2=getCt_code.length;
	//alert("len2: "+len2);
}
--%>
$(document).ready(function(){
	//alert("ajax실행!!");
	$("#searchMonth").datepicker({//월month 검색
		dateFormat: 'yy/mm/dd'
	});
	$("#searchTotInfo").click(function(){
		searchMonth=$("#searchMonth").val();
		ajaxSearchTotInfo(searchMonth);
	});
	
});
</script>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">지점별 총 매출 정보</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>
	<div class="row">

		<div class="col-md-2"></div>
	</div>
<!-- 1. 월별 검색기능 : 날짜선택 -->

<div class="col-md-12">
	<!-- 지점검색하기!!! -->
	<div class="row">
		<div class="col-sm-6">
			<input type="text" placeholder="날짜를 선택하세요(한달)" class="input-sm" size="20" name="searchMonth" id="searchMonth"
		<c:if test="${ddate ne null}">value="${ddate }"</c:if>>
		</div>
		
		<div class="col-sm-6">
			<button class="btn pull-right " id="searchTotInfo" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
<br>
<!-- 검색내역, List로 뽑아오기 -->
<div id="totList"></div>
<br>
<div class='col-md-12'>
<table  id="aa" width="1000" class="table th highchart" data-graph-container-before="1" data-graph-type="column">
	<caption><span class="glyphicon glyphicon-usd"></span>  지점별 한 달 총 매출</caption>
	
		<thead>
	    	<tr>
				<th>지점코드</th>
				<th>총 매출</th>
			</tr>
		</thead>
		<tbody >
			
	  	</tbody>
	 
</table>
</div>

</div>
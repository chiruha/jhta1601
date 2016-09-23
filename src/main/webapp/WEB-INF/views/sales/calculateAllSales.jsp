<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0-rc.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.11.3.js"></script>
  <script src="//code.jquery.com/ui/1.12.0-rc.1/jquery-ui.js"></script>
<script type="text/javascript">    
////----------------------------------------|income|----------------------------------------////
var centerList="";
var searchMonth="";
function ajaxSearchCenter(centerList,searchMonth){
	alert("잘되나?");
	$.ajax({
		url:"/fitness/centerIncomeSelect/xml",
		data:"centerList="+centerList+"&searchMonth="+searchMonth,
		success:function(data){
			alert("데이타 가져오자");
			var div=document.getElementById("CenterIncomeList");
			alert("div: "+div);
			div.innerHTML="";
			var html="";
			html+=
			"<div class='col-md-12'>"+
			"<table name='inFrm' class='table th' width='1000'>"+
			"<tr>"+
				"<td rowspan='2'>수입번호</td>"+
	 			"<td rowspan='2'>지점번호</td>"+
	 			"<td colspan='4'>한 달 가격</th>"+
	 			"<td rowspan='2'>계산시작일</td>"+
	 		"</tr>"+
	 		"<tr>"+
	 			"<td>프로그램가격</td>"+
				"<td>락카가격</td>"+
				"<td>운동복가격</td>"+
				"<td>총 매출액</td>"+
		 	"</tr>";
			var ctcode1;
			$(data).find("result").each(function(){
				alert("ctctctct");
				var len=$(this).find("getIncome_num").length;
				alert("length: "+len);
				for(var i=0;i<len;i++){
					var income_num=$(this).find("getIncome_num").text();
					var ct_code=$(this).find("getCt_code").text();
					var tot_rg=$(this).find("getTot_rg").text();
					var tot_locker=$(this).find("getTot_locker").text();
					var tot_wear=$(this).find("getTot_wear").text();
					var tot_income=$(this).find("getTot_income").text();
					var income_startdate=$(this).find("getIncome_startdate").text();
					html+="<tr>"+
								"<td>"+income_num+"</td>"+
								"<td>"+ct_code+"</td>"+
								"<td>"+tot_rg+"</td>"+
								"<td>"+tot_locker+"</td>"+
								"<td>"+tot_wear+"</td>"+
								"<td>"+tot_income+"</td>"+
								"<td>"+income_startdate+"</td>"+
						"</tr>";
					alert("tot_rg: "+tot_rg);
				}
			});
			html += "</table>";
			html += "</div>";
			//alert("html:"+html);
			//$("#ctcode1").attr("value",ctcode1);
			var incomeInfo=document.createElement("div");
			//alert("salesInfo: "+salesInfo);
			incomeInfo.innerHTML=html;
			div.appendChild(incomeInfo);
			
			//$(data).find("sum").each(function(){
			//	alert("가격계산???????????");
			//	$("#searchMonth1").empty();
			//	$("#totProgram").empty();
			//	$("#totLocker").empty();
				//$("#totWear").empty();
				//$("#tot_income").empty();
				
				//var searchMonth1=$(this).find("searchMonth").text();
				//var totProgram=$(this).find("totProgram").text();
				//var totLocker=$(this).find("totLocker").text();
				//var totWear=$(this).find("totWear").text();
				//var tot_income=Number(totProgram)+Number(totLocker)+Number(totWear);
				//alert("totProgram: "+totProgram);
				//alert("총합계산 : "+tot_income)
			//	$("#searchMonth1").attr("value",searchMonth1);
			//	$("#totProgram").attr("value",totProgram);
			//	$("#totLocker").attr("value",totLocker);
			//	$("#totWear").attr("value",totWear);
			//	$("#tot_income").attr("value",tot_income);
			//});
		}		
	});
}
////----------------------------------------|refund|----------------------------------------////
var centerList1="";
var searchMonth1="";
function ajaxSearchRefund(centerList1,searchMonth1){
	alert("환불잘되나?");
	$.ajax({
		url:"/fitness/centerRefundSelect/xml",
		data:"centerList1="+centerList1+"&searchMonth1="+searchMonth1,
		success:function(data){
			alert("데이타 가져오자");
			var div=document.getElementById("CenterRefundList");
			alert("div: "+div);
			div.innerHTML="";
			var html="";
			html+=
			"<div class='col-md-12'>"+
			"<table name='inFrm' class='table th' width='1000'>"+
			"<tr>"+
				"<td>환불번호</td>"+
	 			"<td>지점번호</td>"+
	 			"<td>회원</th>"+
	 			"<td>환불금액</td>"+
	 			"<td>계산시작일</td>"+
		 	"</tr>";
			var ctcode1;
			$(data).find("result").each(function(){
				alert("ctctctct");
				var len=$(this).find("getIncome_num").length;
				alert("length: "+len);
				for(var i=0;i<len;i++){
					var income_num=$(this).find("getIncome_num").text();
					var ct_code=$(this).find("getCt_code").text();
					var tot_rg=$(this).find("getTot_rg").text();
					var tot_locker=$(this).find("getTot_locker").text();
					var tot_wear=$(this).find("getTot_wear").text();
					html+="<tr>"+
								"<td>"+income_num+"</td>"+
								"<td>"+ct_code+"</td>"+
								"<td>"+tot_rg+"</td>"+
								"<td>"+tot_locker+"</td>"+
								"<td>"+tot_wear+"</td>"+
						"</tr>";
					alert("tot_rg: "+tot_rg);
				}
			});
			html += "</table>";
			html += "</div>";
			//alert("html:"+html);
			//$("#ctcode1").attr("value",ctcode1);
			var incomeInfo=document.createElement("div");
			//alert("salesInfo: "+salesInfo);
			incomeInfo.innerHTML=html;
			div.appendChild(incomeInfo);
			
			//$(data).find("sum").each(function(){
			//	alert("가격계산???????????");
			//	$("#searchMonth1").empty();
			//	$("#totProgram").empty();
			//	$("#totLocker").empty();
				//$("#totWear").empty();
				//$("#tot_income").empty();
				
				//var searchMonth1=$(this).find("searchMonth").text();
				//var totProgram=$(this).find("totProgram").text();
				//var totLocker=$(this).find("totLocker").text();
				//var totWear=$(this).find("totWear").text();
				//var tot_income=Number(totProgram)+Number(totLocker)+Number(totWear);
				//alert("totProgram: "+totProgram);
				//alert("총합계산 : "+tot_income)
			//	$("#searchMonth1").attr("value",searchMonth1);
			//	$("#totProgram").attr("value",totProgram);
			//	$("#totLocker").attr("value",totLocker);
			//	$("#totWear").attr("value",totWear);
			//	$("#tot_income").attr("value",tot_income);
			//});
		}		
	});
}
$(document).ready(function(){
	alert("welcome!!");
//--------------------|income|--------------------//
	//지점목록centerList를 selectBox에 뿌리기
	$.ajax({
		url:"/fitness/salesCenterList/xml",
		success:function(data){
			$(data).find("ct").each(function(){
				var ct_code=$(this).find("ctcode").text();
				var ctname=$(this).find("ctname").text();
				$("#centerList").append("<option value='"+ct_code+"'>"+ctname+"</ctname>");
			});
		}
	});
	$("#searchMonth").datepicker({//월month 검색
		dateFormat: 'yy/mm/dd'
	});
	$("#searchCenter").click(function(){
		centerList=$("#centerList").val();
		searchMonth=$("#searchMonth").val();
		ajaxSearchCenter(centerList,searchMonth);//센터검색/month검색 ajax호출하기
	});
//--------------------|refund|--------------------//
	$.ajax({
		url:"/fitness/salesCenterList/xml",
		success:function(data){
			$(data).find("ct").each(function(){
				var ct_code=$(this).find("ctcode").text();
				var ctname=$(this).find("ctname").text();
				$("#centerList1").append("<option value='"+ct_code+"'>"+ctname+"</ctname>");
			});
		}
	});
	$("#searchMonth1").datepicker({//월month 검색
		dateFormat: 'yy/mm/dd'
	});
	$("#searchRefund").click(function(){
		centerList1=$("#centerList1").val();
		searchMonth1=$("#searchMonth1").val();
		ajaxSearchRefund(centerList1,searchMonth1);//센터검색/month검색 ajax호출하기
	});
});

</script>
<!-- 
	지점별 총 매출 계산 = Income-Refund
	1. 지점/날짜 검색해서 div에 뿌린다.
	2. 지점별 Income정보를 받아온다(Ajax)
	3. 지점별 Refund정보를 받아온다(Ajax)
	4. 1과 2에서 받아온 정보를 뿌린다.
	5. 총 매출 구해서 -> CenterTotalSales 테이블에 insert한다.
	create table centertotalsales(
		cts_num number(5) primary key,
		ct_num number(5),
		cts_totsales number
	);
	create sequence cts_num.seq;
 -->
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">지점별 총 매출 계산하기 Income-Refund</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>
	<div class="row">

		<div class="col-md-2"></div>
	</div>
<!-- 1. Income 검색기능 : select 박스 2개 : 지점선택,날짜선택 -->
<div class="col-md-12">
	<!-- 지점검색하기!!! -->
	<div class="row">
		<div class="col-sm-4"> 
			<p >
			<span class="glyphicon glyphicon-plus"></span> Income
			</p>
		</div>
		<div class="col-sm-3"> 
			<select class="select input-sm" id="centerList">
				<option value="default">--center--</option>
			</select>
		</div>
		<div class="col-sm-3">
			<input type="text" placeholder="날짜를 선택하세요(한달)" class="input-sm" size="20" name="searchMonth" id="searchMonth"
		<c:if test="${ddate ne null}">value="${ddate }"</c:if>>
		</div>
		
		<div class="col-sm-2">
			<button class="btn pull-right " id="searchCenter" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
<!-- 1. Income 내용을 div에 뿌린다. -->
<div id="CenterIncomeList"></div>
<!-- 1. Refund 검색기능 : select 박스 2개 : 지점선택,날짜선택 -->
<div class="col-md-12">
	<!-- 지점검색하기!!! -->
	<div class="row">
		<div class="col-sm-4"> 
			<p >
			<span class="glyphicon glyphicon-minus"></span> Refund
			</p>
		</div>
		<div class="col-sm-3"> 
			<select class="select input-sm" id="centerList1">
				<option value="default">--center--</option>
			</select>
		</div>
		<div class="col-sm-3">
			<input type="text" placeholder="날짜를 선택하세요(한달)" class="input-sm" size="20" name="searchMonth1" id="searchMonth1"
		<c:if test="${ddate ne null}">value="${ddate }"</c:if>>
		</div>
		
		<div class="col-sm-2">
			<button class="btn pull-right " id="searchRefund" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
<!-- 1. Refund 내용을 div에 뿌린다. -->
<div id="CenterRefundList"></div>
<!-- 페이징 맨 나중에...-->
<form name="frm" method="post" action="totalSalesInsert" onsubmit="return validator();">
<!-- 환불 총합 구하기 -->

<!-- 한달 총 매출 = 수입 - 환불 -->
</form>	
</div>
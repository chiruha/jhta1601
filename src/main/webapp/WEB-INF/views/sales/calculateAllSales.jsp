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
	 			"<td rowspan='2'>선택</td>"+
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
								"<td><input type='radio' onclick='selectIncome("+ct_code+",\""+income_startdate+"\",\""+tot_income+"\")'></td>"+
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
function selectIncome(ct_code,income_startdate,tot_income){
	alert("계산시작일: "+income_startdate);
	alert("수입 지점코드: "+ct_code);
	alert("지점 한달 총 수입 : "+tot_income);
	$("#ct_num").val(ct_code);
	$("#cts_income").val(tot_income);
	$("#cts_date").val(income_startdate);
	$("#ct_num1").val(ct_code);
	$("#cts_income1").val(tot_income);
	$("#cts_date1").val(income_startdate);

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
			var div2=document.getElementById("CenterRefundList");
			alert("div2: "+div2);
			div2.innerHTML="";
			var html2="";
			html2 +=
			"<div class='col-md-12'>"+
			"<table name='inFrm' class='table th' width='1000'>"+
			"<tr>"+
				"<td>환불번호</td>"+
	 			"<td>지점번호</td>"+
	 			"<td>회원번호</th>"+
	 			"<td>등록유형</th>"+
	 			"<td>환불금액</td>"+
	 			"<td>환불날짜</td>"+
	 			"<td>선택</td>"+
		 	"</tr>";
			var ctcode1;
			$(data).find("result").each(function(){
				alert("22222222222222222");
				var len=$(this).find("getCt_code").length;
				alert("length: "+len);
				for(var i=0;i<len;i++){
					var refund_num=$(this).find("getRefund_num").text();
					var mem_num=$(this).find("getMem_num").text();
					var refund_date=$(this).find("getRefund_date").text();
					var ct_code=$(this).find("getCt_code").text();
					var rg_type=$(this).find("getRg_type").text();
					var refund_price=$(this).find("getRefund_price").text();
					html2 +="<tr>"+
								"<td>"+refund_num+"</td>"+
								"<td>"+ct_code+"</td>"+
								"<td>"+mem_num+"</td>"+
								"<td>"+rg_type+"</td>"+
								"<td>"+refund_price+"</td>"+
								"<td>"+refund_date+"</td>"+
								"<td><input type='checkbox' onclick='selectRefund("+ct_code+","+len+",\""+Number(refund_price)+"\")'></td>"+
						"</tr>";
					alert("ct_code22222: "+ct_code);
				}
			});
			html2 += "</table>";
			html2 += "</div>";
			//alert("html:"+html);
			//$("#ctcode1").attr("value",ctcode1);
			var refundInfo=document.createElement("div2");
			//alert("salesInfo: "+salesInfo);
			refundInfo.innerHTML=html2;
			div2.appendChild(refundInfo);
			
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
var totRefund=0;
function selectRefund(ct_code,len,refund_price){
	alert("환불 ctcode : "+ct_code);
	alert("환불 행의 갯수 : "+len);
	alert("환불 가격 : "+refund_price);
	totRefund += parseInt(refund_price);
	alert("총 환불액 : "+totRefund);
	$("#cts_refund").val(totRefund);
	$("#cts_refund1").val(totRefund);
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
//--------------------| 수입-지출 |--------------------//	
	$("#btn").click(function(){
		var income=$("#cts_income").val();
		var refund=$("#cts_refund").val();
		var cts_totsales=Number(income)-Number(refund);
		
		$("#cts_totsales").val(cts_totsales);
		$("#cts_totsales1").val(cts_totsales);
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
		cts_income number,
		cts_refund number,
		cts_totsales number,
		cts_date date
	);
	create sequence ctsnum_seq;
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
	<!-- 환불지점검색하기!!! -->
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

<!-- 월매출 총합 구하기 -->
<form name="frm" method="post" action="totalSalesInsert" onsubmit="return validator();">
<!-- 회원번호를 select해서 input="text"에 집어넣기!! -->
<div class="col-md-12">
	<p >
		<span class="glyphicon glyphicon-pencil"></span> Calculate Total Sales = Income - Refund
	</p>
<table class="table th" width="1000">
	<tr>
		<th>계산기준일</th>
		<td colspan="2">
			<div class="col-sm-12 form-group"> 
				<input type="text" class="form-control" disabled="disabled" id="cts_date"><input type="hidden" name="cts_date" id="cts_date1">
			</div>
		</td>
	</tr>
	<tr>
		<th>지점번호</th>
		<td colspan="2">
			<div class="col-sm-12 form-group"> 
				<input type="text" class="form-control" disabled="disabled" id="ct_num"><input type="hidden" name="ct_code" id="ct_num1">
			</div>
		</td>
	</tr>
	<tr>
		<th>월 수입</th>
		<td colspan="2">
			<div class="col-sm-12 form-group"> 
				<input type="text" class="form-control" disabled="disabled" id="cts_income"><input type="hidden" name="cts_income" id="cts_income1">
			</div>
		</td>
	</tr>
	<tr>
		<th>월 환불액</th>
		<td colspan="2">
			<div class="col-sm-12 form-group"> 
				<input type="text" class="form-control" disabled="disabled" id="cts_refund"><input type="hidden" name="cts_refund" id="cts_refund1">
			</div>
		</td>
	</tr>
	<tr>
		<th>총 월매출</th>
		<td>
			<div class="col-sm-6">
				<button class="btn-default btn-xs" id="btn" type="button">
				<span class="glyphicon glyphicon-usd"></span>  Calculate </button>
			</div>
		
			<div class="col-sm-6 form-group"> 
				<input type="text" class="form-control" disabled="disabled" id="cts_totsales"><input type="hidden" name="cts_totsales" id="cts_totsales1">
			</div>
		</td>
	</tr>
</table>

	<div class="row">
		<div class="col-md-6">
			<button class="btn pull-right" type="submit">
			<span class="glyphicon glyphicon-ok"></span>  지점별 총 월매출 등록 </button>
		</div>
		<div class="col-md-6">
			<button class="btn pull-left"type="reset">
			<span class="glyphicon glyphicon-remove"></span>  취소 </button>
		</div>
	</div>
	
</div>

</form>	
</div>
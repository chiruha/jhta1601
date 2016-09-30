<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0-rc.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.11.3.js"></script>
  <script src="//code.jquery.com/ui/1.12.0-rc.1/jquery-ui.js"></script>
<script type="text/javascript">

var centerList="";
var searchMonth="";
function ajaxSearchCenter(centerList,searchMonth){
	//alert("잘되나?");
	$.ajax({
		url:"/fitness/salesSelect/xml",
		data:"centerList="+centerList+"&searchMonth="+searchMonth,
		success:function(data){
			//alert("데이타 가져오자");
			var div=document.getElementById("salesSelectAll");
			//alert("div: "+div);
			div.innerHTML="";
			var html="";
			html+=
			"<div class='col-md-12'>"+
			"<table name='inFrm' class='table th' width='1000'>"+
			"<tr>"+
				"<th>지점번호</th>"+
	 			"<th>회원번호</th>"+
				"<th>등록번호</th>"+
				"<th>등록유형</th>"+
				"<th>프로그램가격</th>"+
				"<th>락카가격</th>"+
				"<th>운동복가격</th>"+
				"<th>결제일</th>"+
			"</tr>";
			var ctcode1;
			$(data).find("result").each(function(){
				var len=$(this).find("mem_num").length;
				$("#ctcode").empty();
				ctcode1=$(this).find("ct_code").first().text();
			//	alert(ctcode+"ctctctct");
				for(var i=0;i<len;i++){
					var mem_num=$(this).find("mem_num").text();
					var ct_code=$(this).find("ct_code").text();
					var rg_num=$(this).find("rg_num").text();
					var rg_price=$(this).find("rg_price").text();
					var locker_price=$(this).find("locker_price").text();
					var wear_price=$(this).find("wear_price").text();
					var rg_type=$(this).find("rg_type").text();
					var signdate=$(this).find("signdate").text();
					//alert("ct_code"+ct_code);
					//alert("rg_price: "+rg_price);
					//alert("signdate : "+signdate);
					html+="<tr>"+
							"<td>"+ct_code+"</td>"+
							"<td>"+mem_num+"</td>"+
							"<td>"+rg_num+"</td>"+
							"<td>"+rg_type+"</td>"+
							"<td>"+rg_price+"</td>"+
							"<td>"+locker_price+"</td>"+
							"<td>"+wear_price+"</td>"+
							"<td>"+signdate+"</td>"+
						"</tr>";
					$("#searchMonth1").attr("value",signdate);
				}
			});
			html += "</table>";
			html += "</div>";
			//alert("html:"+html);
			$("#ctcode1").attr("value",ctcode1);
			var salesInfo=document.createElement("div");
			//alert("salesInfo: "+salesInfo);
			salesInfo.innerHTML=html;
			div.appendChild(salesInfo);
			
			$(data).find("sum").each(function(){
				//alert("가격계산???????????");
				$("#searchMonth1").empty();
				$("#totProgram").empty();
				$("#totLocker").empty();
				$("#totWear").empty();
				$("#tot_income").empty();
				
				var searchMonth1=$(this).find("searchMonth").text();
				var totProgram=$(this).find("totProgram").text();
				var totLocker=$(this).find("totLocker").text();
				var totWear=$(this).find("totWear").text();
				var tot_income=Number(totProgram)+Number(totLocker)+Number(totWear);
				//alert("totProgram: "+totProgram);
				//alert("총합계산 : "+tot_income)
				//
				$("#totProgram").attr("value",totProgram);
				$("#totLocker").attr("value",totLocker);
				$("#totWear").attr("value",totWear);
				$("#tot_income").attr("value",tot_income);
			});
		}		
	});
}

$(document).ready(function(){
	//alert("welcome!!");
	//지점목록centerList를 selectBox에 뿌리기
	$.ajax({
		url:"/fitness/salesCenterList/xml",
		success:function(data){
			//alert("ctlist ajax 작동되나?");
			$(data).find("ct").each(function(){
				var ct_code=$(this).find("ctcode").text();
				var ctname=$(this).find("ctname").text();
				//alert("ctname: "+ctname);
				$("#centerList").append("<option value='"+ct_code+"'>"+ctname+"</ctname>");
			});
		}
	});
	$("#searchMonth").datepicker({//월month 검색
		dateFormat: 'yy/mm/dd'
	});
	$("#searchCenter").click(function(){
		//alert("검색클릭!!");
		centerList=$("#centerList").val();
		searchMonth=$("#searchMonth").val();
		//alert("centerList: "+centerList);
		//alert("searchMonth: "+searchMonth);
		ajaxSearchCenter(centerList,searchMonth);//센터검색/month검색 ajax호출하기
	});

});
</script>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">지점별 총 수입 구하기</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>
	<div class="row">

		<div class="col-md-2"></div>
<!-- 
	1. 매출목록을 Ajax로 뽑아온다.
	2. 검색기능을 추가해서 년도, 월, 지점을 선택한다.
	3. 해당내용이 <div>에 뿌려진다.
	4. 뿌려진 내용을 모두 더한다.(함수로)
	5. name속성을 이용하여 post방식으로 보내서 income테이블에 집어넣는다.
 -->
<!-- 2. 검색기능 : select 박스 2개 : 지점선택,날짜선택 -->
<div class="col-md-12">
	<!-- 지점검색하기!!! -->
	<div class="row">
		<div class="col-sm-4"> 
			<p >
			<span class="glyphicon glyphicon-search"></span> Search for center & date
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
<!-- 1. div에 뿌린다. -->
<div id="salesSelectAll"></div>
<!-- 페이징 맨 나중에...-->


<!-- 5.insert하기 -->
<form name="frm" method="post" action="centerIncomeInsert" onsubmit="return validator();">

<div class="col-md-12">
	<p >
		<span class="glyphicon glyphicon-pencil"></span> Total Price
	</p>
<table class="table th" width="1000">
	<tr>
		<th>계산 시작일</th>
		<td><input type="text" id="searchMonth1" name="income_startdate"></td>
	</tr>
	<tr>
		<th>프로그램가격</th>
		<td><input type="text" id="totProgram" name="tot_rg"></td>
	</tr>
	<tr>
		<th>락카가격</th>
		<td><input type="text" id="totLocker" name="tot_locker"></td>
	</tr>
	<tr>
		<th>운동복</th>
		<td><input type="text" id="totWear" name="tot_wear"></td>
	</tr>
	<tr>
		<th>지점 한달 총 매출액</th>
		<td><input type="text" id="tot_income" name="tot_income"></td>
	</tr>
</table>
<div class="row">
		<div class="col-md-6">
			<button class="btn pull-right" type="submit">
			<span class="glyphicon glyphicon-ok"></span> 매출저장 </button>
		</div>
		<div class="col-md-6">
			<button class="btn pull-left"type="reset">
			<span class="glyphicon glyphicon-remove"></span> 취소 </button>
		</div>
	</div>
<input type="hidden" value="" id="ctcode1" name="ct_code">
</div>
</form>		
</div>
</div>
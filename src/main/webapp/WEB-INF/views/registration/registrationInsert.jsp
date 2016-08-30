<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		alert("Ajax실행");
		$("#simple_subject").click(function(){
			alert("단과과목 클릭!!");
<<<<<<< HEAD
			$("#programPrice").empty();
			$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#PTProgramName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#proName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("ptName").empty();//안에 있는 내용(모든자식요소들)지우기
=======
			$("#programName").empty();
>>>>>>> b12cc747e9afc982c8fd1c0d4141b0461071480c
			$("#programName").append("<option value='default'>---프로그램선택---</option>");
			$("#PTProgramName").append("<option value='default'>---프로그램선택---</option>");
			$("#proName").append("<option value='default'>---단과선택---</option>");
			$("#ptName").append("<option value='default'>---PT선택---</option>");
			$.ajax({
				url:"/fitness/list/xml",
				success:function(data){
					//alert("잘되나?" +data);
					$(data).find("pro").each(function(){
						var pro_num=$(this).find("pro_num").text();
						alert("pro_num?" +pro_num);
						var pro_code=$(this).find("pro_code").text();
						var pro_name=$(this).find("pro_name").text();
						var pro_price=$(this).find("pro_price").text();
						//$("#PName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");
						$("#programName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");						
					});
				}
			});
		});
		$("#pt_subject").click(function(){
			alert("pt과목 클릭!!");
<<<<<<< HEAD
			$("#programPrice").empty();
			$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#PTProgramName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#proName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#ptName").empty();//안에 있는 내용(모든자식요소들)지우기
=======
			$("#programName").empty();
>>>>>>> b12cc747e9afc982c8fd1c0d4141b0461071480c
			$("#programName").append("<option value='default'>---프로그램선택---</option>");
			$("#PTProgramName").append("<option value='default'>---프로그램선택---</option>");
			$("#proName").append("<option value='default'>---단과선택---</option>");
			$("#ptName").append("<option value='default'>---PT선택---</option>");
			$.ajax({
				url:"/fitness/ptlist/xml",
				success:function(data){
					//alert("pt되나??"+data);
					$(data).find("pt").each(function(){
						var pt_num=$(this).find("pt_num").text();
						alert("pt_num?"+pt_num);
						var pt_code=$(this).find("pt_code").text();
						var pt_month=$(this).find("pt_month").text();
						var pt_cnt=$(this).find("pt_cnt").text();
						var pt_price=$(this).find("pt_price").text();
						$("#PTProgramName").append("<option value'"+pt_month+"'>"+pt_month+"</option>");
						
					});
				}
			});
		});
<<<<<<< HEAD
		
		$("#multiple_subject").click(function(){
			alert("여러과목 클릭!!");
			$("#programPrice").empty();
			$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#PTProgramName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#proName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#ptName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#programName").append("<option value='default'>---프로그램선택---</option>");
			$("#PTProgramName").append("<option value='default'>---프로그램선택---</option>");
			$("#proName").append("<option value='default'>---단과선택---</option>");
			$("#ptName").append("<option value='default'>---PT선택---</option>");
			$.ajax({
				url:"/fitness/list/xml",
				success:function(data){
					//alert("잘되나?" +data);
					$(data).find("pro").each(function(){
						var pro_num=$(this).find("pro_num").text();
						//alert("pro_num?" +pro_num);
						var pro_code=$(this).find("pro_code").text();
						var pro_name=$(this).find("pro_name").text();
						var pro_subname=$(this).find("pro_subname").text();
						var pro_price=$(this).find("pro_price").text();
						$("#proName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");						
					});
				}
			});
			$.ajax({
				url:"/fitness/ptlist/xml",
				success:function(data){
					//alert("pt되나??"+data);
					$(data).find("pt").each(function(){
						var pt_num=$(this).find("pt_num").text();
						//alert("pt_num?"+pt_num);
						var pt_code=$(this).find("pt_code").text();
						var pt_month=$(this).find("pt_month").text();
						var pt_cnt=$(this).find("pt_cnt").text();
						var pt_price=$(this).find("pt_price").text();
						//$("#PTName").append("<option value'"+pt_month+"'>"+pt_month+"</option>");
						$("#ptName").append("<option value'"+pt_month+"'>"+pt_month+"</option>");
						
					});
				}
			});
		});
		
		$("#btn").click(function(){
			alert("버튼클릭!!!");
			var num1=$("#simplePrice").val();//단과과목 값 얻어오기
			var num2=$("#ptSelectPrice").val();//PT과목 값 얻어오기
			var saleNum1=Number(num1)*0.9;//단과과목 10%할인 값 구하기
			var resultSum=Number(saleNum1)+Number(num2);
			//var sum=parseInt(num1)+parseInt(num2);
			alert("num1: "+num1+", num2: "+num2+", sum: "+resultSum);
			$("#rg_price").val(resultSum);
			
		});
		
=======
>>>>>>> b12cc747e9afc982c8fd1c0d4141b0461071480c
	});
	// 단과과목 가격을  id="programPrice"에 집어넣기 
	function priceChange(pro_name){
		alert(".."+pro_name);
		$("#programPrice").empty();
		alert("과목선택하면 가격떠야함");
		$.ajax({
			url:"/fitness/proprice/xml?pro_name="+pro_name,
			success:function(data){
				$(data).find("proprice").each(function(){
					var pro_num=$(this).find("pro_num").text();
					var pro_code=$(this).find("pro_code").text();
					var pro_name=$(this).find("pro_name").text();
					var pro_price=$(this).find("pro_price").text();
					alert("num: "+pro_num+" code: "+pro_code+" name: "+pro_name+" price: "+pro_price);
					$("#rg_price").val(pro_price);						
				});
			}
		});
	}
	function ptPriceChange(pt_month){
		alert("..ptPrice: "+pt_month);
		$("#programPrice").empty();
		$.ajax({
			url:"/fitness/ptprice/xml?pt_month="+pt_month,
			success:function(data){
				$(data).find("ptprice").each(function(){
					alert("pt는 어디까지 되나??"+pt_month);
					var pt_num=$(this).find("pt_num").text();
					var pt_code=$(this).find("pt_code").text();
					var pt_month=$(this).find("pt_month").text();
					var pt_price=$(this).find("pt_price").text();
					var pt_cnt=$(this).find("pt_cnt").text();
					alert("pt_price"+pt_price);
					alert("num: "+pt_num+" code: "+pt_code+" month: "+pt_month+" price: "+pt_price);
					$("#rg_price").val(pt_price);
				});
			}
		});
	}
	//복합과목
	function simpleSelect(pro_name){//단과과목선택 시
		alert(".."+pro_name);
		$("#programPrice").empty();
		alert("과목선택하면 가격떠야함");
		$.ajax({
			url:"/fitness/proprice/xml",
			data:"pro_name="+pro_name,
			success:function(data){
				$(data).find("proprice").each(function(){
					var pro_num=$(this).find("pro_num").text();
					var pro_code=$(this).find("pro_code").text();
					var pro_name=$(this).find("pro_name").text();
					var pro_price=$(this).find("pro_price").text();
					alert("num: "+pro_num+" code: "+pro_code+" name: "+pro_name+" price: "+pro_price);
					$("#simplePrice").val(pro_price);						
				});
			}
		});
	}
	function ptSelect(pt_month){//pt과목 선택 시
		alert("..ptPrice: "+pt_month);
		$("#programPrice").empty();
		$.ajax({
			url:"/fitness/ptprice/xml?pt_month="+pt_month,
			success:function(data){
				$(data).find("ptprice").each(function(){
					alert("pt는 어디까지 되나??"+pt_month);
					var pt_num=$(this).find("pt_num").text();
					var pt_code=$(this).find("pt_code").text();
					var pt_month=$(this).find("pt_month").text();
					var pt_price=$(this).find("pt_price").text();
					var pt_cnt=$(this).find("pt_cnt").text();
					alert("pt_price"+pt_price);
					alert("num: "+pt_num+" code: "+pt_code+" month: "+pt_month+" price: "+pt_price);
					$("#ptSelectPrice").val(pt_price);
				});
			}
		});
	}


</script>
<body>
<!-- 
	[ 회원 프로그램 등록 페이지 ]
	회원번호를 검색해서 그 번호에 프로그램정보 등록
	1. 회원번호 검색기능
	2. 검색해서 뽑아온 회원번호를 registration 테이블에 insert한다.
	3. radio버튼으로 프로그램 대분류에서 선택하고
	4. 프로그램 select box : 프로그램 선택
	5. 해당 프로그램이 input type="text"에 자동입력
	
 -->
<h1>회원 수강등록(프로그램등록)하기!!</h1>
<div>
<!-- 회원번호 검색 -->
회원번호: <input type="text" name="keyword">
		<input type="submit" name="검색">
<!-- 회원번호 list로 뿌려주기 -> 회원번호 선택하면 아래의 input type="text"에 회원번호 자동입력 -->
</div>
<br><br>
<form method="post" action="registrationInsert">
<br><br>
<!-- 회원번호를 select해서 input="text"에 집어넣기!! -->

회원번호 mem_num<br>
	<input type="text" disabled="disabled" name="mem_num" value="${searchMem.mem_num }">
	<input type="hidden" name="mem_num" value="${searchMem.mem_num }">

<br><br>

등록유형 rg_type<br>
	<input type="radio" value="단과과목" name="rg_type" id="simple_subject">단과과목
	<input type="radio" value="PT" name="rg_type" id="pt_subject">PT
	<input type="radio" value="여러과목" name="rg_type" id="multiple_subject">복합과목

<br><br>

<<<<<<< HEAD
<!-- //////////등록유형(rg_type)에 따라 선택된 프로그램이 다름/////////// -->
단과과목 프로그램 선택<br>
<select id="programName" onchange="priceChange(this.value)">
	<option value="default">---프로그램선택---</option>
</select>
<br><br>
pt프로그램 선택<br>
<select id="PTProgramName" onchange="ptPriceChange(this.value)">
=======
<!-- //////////등록유형에 따라 선택된 프로그램이 다름/////////// -->
프로그램 선택<br>
<select id="programName">
>>>>>>> b12cc747e9afc982c8fd1c0d4141b0461071480c
	<option value="default">---프로그램선택---</option>
</select>
<!-- 
단과과목 프로그램이름<br>
	<select id="PName" onchange="programPriceChange()">
		<option value="default">---프로그램선택---</option>
	</select>
	프로그램가격 : <input type="text" name="pro_price">

<br><br>
<<<<<<< HEAD
=======

pt등록유형<br>
	<select id="PTName" onchange="ptPriceChange()">
		<option value="default">---등록유형선택---</option>
	</select>
	<br>
	프로그램가격 : <input type="text" name="pt_price">
 -->
<br><br>

여러과목등록<br>
	프로그램가격 : <input type="text" name="multiple_price">
>>>>>>> b12cc747e9afc982c8fd1c0d4141b0461071480c

여러과목 프로그램 선택<br>
<select id="proName" onchange="simpleSelect(this.value)">
	<option value="default">---프로그램선택---</option>
</select>
<select id="ptName" onchange="ptSelect(this.value)">
	<option value="default">---프로그램선택---</option>
</select>
<br>
단과선택 가격 : <input type="text" name="simplePrice" id="simplePrice">
+ PT선택 가격 : <input type="text" name="ptSelectPrice" id="ptSelectPrice">
(단과과목 10% 할인) : <input type="button" value="가격계산" id="btn">
<br><br>
총 프로그램가격 : <input type="text" name="rg_price" id="rg_price">
<div id="pp"></div>

<!-- ///////////////////// -->
<br><br>

락카 신청 여부 Locker_price<br><!-- 컬럼명 변경하기 -->
	<input type="radio" value="신청" name="locker" id="locYes" checked="checked">신청
	<input type="radio" value="신청안함" name="locker" id="locNo">신청안함

<br><br>

운동복 신청 여부 wear_price<br><!-- 컬럼명 변경하기 -->
	<input type="radio" value="신청" name="wear" id="wearYes" checked="checked">신청
	<input type="radio" value="신청안함" name="wear" id="wearNo">신청안함
<br><br>
총등록가격 rg_price<br><!-- 프로그램가격+락카여부or운동복여부 -->
	<input type="button" value="총 등록가격 계산" name="sum_price" onclick="signTotPrice()">
	<input type="text" name="rg_price" id="rg_price">

<br>

</form>
</body>
</html>
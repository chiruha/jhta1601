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
			$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#programName").append("<option value='default'>---프로그램선택---</option>");
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
						//$("#PName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");
						$("#programName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");						
					});
				}
			});
		});
		$("#pt_subject").click(function(){
			alert("pt과목 클릭!!");
			$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
			$("#programName").append("<option value='default'>---프로그램선택---</option>");
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
						$("#programName").append("<option value'"+pt_month+"'>"+pt_month+"</option>");
						
					});
				}
			});
		});
		<%-- 여러과목 등록!!
		$("#multiple_subject").click(function(){
			
		});
		--%>
	});

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

<!-- //////////등록유형(rg_type)에 따라 선택된 프로그램이 다름/////////// -->
프로그램 선택<br>
<select id="programName">
	<option value="default">---프로그램선택---</option>
</select>

<br><br>
프로그램가격 : <input type="text" name="programPrice" id="programPrice">


<!-- ///////////////////// -->
<br><br>

락카 신청 여부 Locker_price<br><!-- 컬럼명 변경하기 -->
	<input type="radio" value="신청" name="locker" id="locYes" checked="checked">신청
	<input type="radio" value="신청안함" name="locker" id="locNo">신청안함
락카가격 : <input type="text" name="" id="">
<br><br>

운동복 신청 여부 wear_price<br><!-- 컬럼명 변경하기 -->
	<input type="radio" value="신청" name="wear" id="wearYes" checked="checked">신청
	<input type="radio" value="신청안함" name="wear" id="wearNo">신청안함
운동복가격 : <input type="text" name="" id="">

<br><br>

총등록가격 rg_price<br><!-- 프로그램가격+락카여부or운동복여부 -->
	<input type="button" value="총 등록가격 계산" name="sum_price" onclick="signTotPrice()">
	<input type="text" name="rg_price" id="rg_price">

<br>

</form>
</body>
</html>
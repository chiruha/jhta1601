<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		alert("Ajax실행");
			//alert("단과과목 클릭!!");
			$.ajax({
				url:"/fitness/list/xml",
				success:function(data){
					alert("잘되나?" +data);
					$(data).find("pro").each(function(){
						var pro_num=$(this).find("pro_num").text();
						alert("pro_num?" +pro_num);
						var pro_code=$(this).find("pro_code").text();
						var pro_name=$(this).find("pro_name").text();
						var pro_subname=$(this).find("pro_subname").text();
						var pro_price=$(this).find("pro_price").text();
						$("#PName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");
					
					});
				}
			});
	});

</script>
<body>
<!-- 
	[ 회원 프로그램 등록 페이지 ]
	회원번호를 검색해서 그 번호에 프로그램정보 등록
	1. 회원번호 검색기능
	2. 검색해서 뽑아온 번호를 registration 테이블에 insert한다.
	3. 첫번째 select box : 프로그램 선택
	4. 두번째 select box : 프로그램에 따라 개월수가 달라지게 나타남(Ajax로 구현)
	5. 프로그램 단과선택/중복선택 : 다른 테이블...
 -->
<h1>회원 수강등록(프로그램등록)하기!!</h1>
<div>
<form method="post" action="registrationMemNum">
회원번호: <input type="text" name="keyword">
		<input type="submit" name="검색">
</form>
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
	<input type="radio" value="단과과목" name="rg_type" id="simple_subject" checked="checked">단과과목
	<input type="radio" value="PT" name="rg_type" id="pt_subject">PT
	<input type="radio" value="여러과목" name="rg_type" id="multiple_subject">복합과목

<br><br>

<!-- //////////등록유형에 따라 선택된 프로그램이 다름/////////// -->

단과과목 프로그램이름<br>
	<select id="PName" onchange="priceChange()">
		<option value="default">---프로그램선택---</option>
	</select>
	프로그램가격 : <input type="text" name="pro_price">

<br><br>

pt등록유형<br>
	<select id="PTName">
		<option value="default">---등록유형선택---</option>
	</select>
	<br>
	프로그램가격 : <input type="text" name="pt_price">

<br><br>

여러과목등록<br>
	프로그램가격 : <input type="text" name="multiple_price">


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
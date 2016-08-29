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
	$(document).ready(function (){
		alert("Ajax실행");
		$.ajax({
			url:"/list/xml",
			success:function(data){
				alert("잘되나?");
				$(data).find("proname").each(function(){
					var pro_num=$(this).find("pro_num").text();
					var pro_code=$(this).find("pro_code").text();
					var pro_name=$(this).find("pro_name").text();
					var pro_subname=$(this).find("pro_subname").text();
					var pro_price=$(this).find("pro_price").text();
					$("#Pname").append(pro_name);
					
					function priceChange(){
						
					}
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
<br>
<form method="post" action="registrationInsert">
<br>
<!-- 회원번호를 select해서 input="text"에 집어넣기!! -->
회원번호<input type="text" disabled="disabled" name="mem_num" value="${searchMem.mem_num }">
	<input type="hidden" name="mem_num" value="${searchMem.mem_num }">
<br>
프로그램이름<select id="PName" onchange="priceChange()">
			<option value="default">---프로그램선택---</option>
		</select>
<br>	
등록개월수<select id="PSubName" name="pro_subname">
		<option value="default">---등록개월수선택---</option>
	</select>

등록가격<input type="text" name="rg_price" onclick="signPrice()">
<br>
락카 신청 여부<input type="radio" value="신청" name="locker_yes">신청
	<input type="radio" value="신청안함" name="locker_no">신청안함
<br>
운동복 신청 여부<input type="radio" value="신청" name="wear_yes">신청
	<input type="radio" value="신청안함" name="wear_no">신청안함

</form>
</body>
</html>
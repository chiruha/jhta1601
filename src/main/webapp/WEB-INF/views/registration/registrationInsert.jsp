<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	[ 회원 프로그램 등록 페이지 ]
	회원번호를 검색해서 그 번호에 프로그램정보 등록
	1. 회원번호 검색기능
	2. 검색해서 뽑아온 번호를 registration 테이블에 insert한다.
 -->
<h1>회원 수강등록(프로그램등록)하기!!</h1>
<div>
<form method="post" action="registrationMemNum">
회원번호: <input type="text" name="keyword">
		<input type="submit" name="검색">
</form>
</div>
<form method="post" action="registrationInsert">
회원번호<input type="text" disabled="disabled" name="mem_num" value="${searchMem.mem_num }">
	<input type="hidden" name="mem_num" value="${searchMem.mem_num }">
등록종류<select name="rg_type">
		<option value="A1">헬스 1개월</option>
		<option value="A2">헬스 3개월</option>
		<option value="A3">헬스 6개월</option>
		<option value="A4">헬스 12개월</option>
		<option value="B1">GX 1개월</option>
		<option value="B2">GX 3개월/option>
		<option value="B3">GX 6개월</option>
		<option value="B4">GX 12개월</option>
		<option value="C1">헬스+GX 1개월</option>
		<option value="C2"></option>
		<option value="C3"></option>
		<option value="C4"></option>
		<option value="D1"></option>
		<option value="D2"></option>
		<option value="D3"></option>
		<option value="D4"></option>
		<option value="D5"></option>
		<option value="D6"></option>
		<option value="E1"></option>
		<option value="E2"></option>
		<option value="E3"></option>
	</select>
</form>
</body>
</html>
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
아이디 : 회원번호(mem_num)
비밀번호 : 전화번호(mem_phone)
 -->
<h1>로그인하기</h1>
<form method="post" action="login">
아이디<input type="text" name="mem_num">
비밀번호<input type="password" name="mem_phone">
<input type="submit" value="로그인">
<input type="reset" value="취소">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
	<h1>공지사항</h1>
	<form action="nocinsert" method="post">
		스태프<input type="text" name="stf_num"><br>
		글제목<input type="text" name="nt_title"><br>
		글내용<input type="text" name="nt_content"><br>
		<input type="submit" value="공지사항추가">
	</form>
	
	<%-- 권한이 없습니다 제이쿼리하는거 보면된다 ajax써서 --%>  
</body>
</html>
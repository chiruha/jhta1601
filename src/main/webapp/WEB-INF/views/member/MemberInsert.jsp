<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원기본정보 등록하기</h1>
<form method="post" action="meminsert" enctype="multipart/form-data">
	
	회원이름<input type="text" name="mem_name"><br>
	전화번호<input type="text" name="mem_phone"><br>
	회원주소<input type="text" name="mem_addr"><br>
	회원나이<input type="text" name="mem_age"><br>
	이메일<input type="text" name="mem_email"><br>
	회원성별<input type="text" name="mem_gen"><br>
	회원생일<input type="text" name="mem_birth"><br>
	회원사진<input type="file" name="mem_picture"><br>
	지점코드<input type="text" name="ct_code"><br>
	<input type="submit" value="저장하기"><br>
</form>
</body>
</html>
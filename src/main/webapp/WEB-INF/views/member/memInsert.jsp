<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>회원기본정보 등록하기1</h1>
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
	<input type="reset" value="취소">
</form>

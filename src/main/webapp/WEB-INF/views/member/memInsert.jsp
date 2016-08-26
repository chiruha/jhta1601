<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	지점선택 <select name="ct_code">
	<c:forEach var="clist"  items="${ctlist}">
		<option value="${clist.ct_code }">${clist.ct_name}</option>	
	</c:forEach>	
</select><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">
</form>

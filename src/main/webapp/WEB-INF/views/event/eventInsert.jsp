<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>이벤트등록하기</h1>
<form method="post" action="eventInsert" enctype="multipart/form-data">
	이벤트작성자<input type="text" name="stf_num"><br>
	이벤트제목<input type="text" name="ev_title"><br>
	이벤트내용<textarea rows="5" cols="50" name="ev_content"></textarea><br>
	이벤트이미지<input type="file" name="ev_picture"><br>
	<input type="submit" value="이벤트등록">
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>이벤트등록하기</h1>
<form method="post" action="eventInsert" enctype="multipart/form-data">
<c:choose>
	<c:when test="${not empty sessionScope.snum }"><!-- 직원인경우 -->
	이벤트작성자<input type="text" name="stf_num" value="${sessionScope.snum }"><br>
	</c:when>
</c:choose>
	이벤트제목<input type="text" name="ev_title"><br>
	이벤트내용<textarea rows="5" cols="50" name="ev_content"></textarea><br>
	이벤트이미지<input type="file" name="ev_picture"><br>
	<input type="submit" value="이벤트등록">
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- Container (Contact Section) -->
<div id="contact" class="container">
<form method="post" action="fbinsert">
	<h3 class="text-center">Freeboard Insert</h3>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-4">
	<%-- <input type="hidden" name="mem_num" value="${sessionScope.mnum }">
			<br><label>작성자이름 : ${memnum }</label><br> --%>
	<!-- 부모글에 대한 정보를 hidden으로 서버에 전송 -->
	<input type="hidden" name="fb_num" value="${dto.fb_num }">
	<input type="hidden" name="fb_ref" value="${dto.fb_ref }">
	<input type="hidden" name="fb_lev" value="${dto.fb_lev }">
	<input type="hidden" name="fb_step" value="${dto.fb_step }">
	<c:choose>
		<c:when test="${not empty sessionScope.mnum }"><!-- 회원인경우 -->
		<input type="hidden" name="mem_num" value="${sessionScope.mnum }">
			<br><label>회원번호 ${sessionScope.mnum  }</label><br>
		</c:when>
		<c:when test="${not empty sessionScope.snum }"><!-- 직원인경우 -->
			<input type="hidden" name="mem_num" value="${sessionScope.snum }">
			<br><label>작성자이름 : ${memnum }</label><br>
		</c:when>
	</c:choose>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<label>글&nbsp;&nbsp;제목:</label>
	<input type="text" name="fb_title" placeholder="Write a Title"  class="input-sm"><br>
	</div>
	</div>
	<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<label>글&nbsp;&nbsp;내용:</label>
	</div>
	</div>
	<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<textarea rows="5" cols="50" placeholder="Write Contents"  name="fb_content" class="form-control"></textarea><br>
	</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
	<button class="btn pull-right" id="btn" type="submit">
	<span class="glyphicon glyphicon-ok"></span> Ok </button>
	</div>
		<div class="col-md-3">
	<button class="btn pull-left" id="btn" type="reset">
	<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
	</div>
</div>
</form>
</div>
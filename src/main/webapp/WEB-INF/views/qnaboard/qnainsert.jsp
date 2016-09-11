<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
<form method="post" action="qnainsert">
	<h3 class="text-center">QnA Insert</h3>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-4">
	<!-- 부모글에 대한 정보를 hidden으로 서버에 전송 -->
	<input type="hidden" name="qna_num" value="${dto.qna_num }">
	<input type="hidden" name="qna_ref" value="${dto.qna_ref }">
	<input type="hidden" name="qna_lev" value="${dto.qna_lev }">
	<input type="hidden" name="qna_step" value="${dto.qna_step }">
	<c:choose>
		<c:when test="${not empty sessionScope.mnum }"><!-- 회원인경우 -->
		<input type="hidden" name="mem_num" value="${sessionScope.mnum }">
			<br><label>회원번호 ${sessionScope.mnum }</label><br>
		</c:when>
		<c:when test="${not empty sessionScope.snum }"><!-- 직원인경우 -->
			<input type="hidden" name="stf_num" value="${sessionScope.snum }">
			<br><label>직원번호 ${sessionScope.snum }</label><br>
		</c:when>
	</c:choose>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<label>글제목</label>
	<input type="text" name="qna_title" placeholder="Write a Title"  class="input-sm"><br>
	</div>
	</div>
	<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<label>글내용</label>
	</div>
	</div>
	<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-6">
	<textarea rows="5" cols="50" placeholder="Write your Questions"  name="qna_content" class="form-control"></textarea><br>
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
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
</div>
</div>
<table border="1" class="table th" >
	<tr>
		<c:choose>
			<c:when test="${not empty sessionScope.mnum }"><!-- 회원인경우 -->
			<th>회원번호</th>
			<td>
				<input type="hidden" name="mem_num" value="${sessionScope.mnum }">
				${sessionScope.mnum }
			</td>
			</c:when>
			<c:when test="${not empty sessionScope.snum }"><!-- 직원인경우 -->
			<th>직원번호</th>
			<td>
				<input type="hidden" name="stf_num" value="${sessionScope.snum }">
				${sessionScope.snum }
			</td>
			</c:when>
		</c:choose>
	</tr>
	<tr>
		<th>글제목</th>
		<td><input type="text" class="form-control" value="${dto.qna_title }" name="qna_title"></td>
	</tr>
	<tr>
		<th colspan="2">글내용</th>
	</tr>
	<tr>
		<td colspan="2"><textarea rows="15" cols="50" class="form-control" name="qna_content">${dto.qna_content }</textarea></td>
	</tr>
</table>
	<div class="row">
		<div class="col-md-6">
			<button class="btn pull-right" type="submit">
			<span class="glyphicon glyphicon-ok"></span>  Save </button>
		</div>
		<div class="col-md-6">
			<button class="btn pull-left"type="reset">
			<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
		</div>
	</div>
</form>
</div>
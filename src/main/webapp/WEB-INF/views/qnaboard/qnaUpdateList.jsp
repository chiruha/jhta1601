<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="contact" class="container">
	<h3 class="text-center">QnA Update</h3>
	<h5 class="text-right"><span class="glyphicon glyphicon-align-justify"></span> <a href="qnaselectAll"> 전체보기</a></h5>
	<div class="row">
	<div class="col-md-12">
	<span class="glyphicon glyphicon-pencil"></span> Write
<form method="post" action="qnaUpdate?qna_num=${dto.qna_num }">
<table border="1" class="table th" >
	<tr>
		<th>글번호</th>
		<td>${dto.qna_num }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.mem_num }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.qna_date }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${dto.qna_hit }</td>
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
</div>
</div>
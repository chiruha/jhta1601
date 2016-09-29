<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
<h3 class="text-center">Member Update</h3>
<form method="post" action="memUpdate?mem_num=${dto.mem_num}" enctype="multipart/form-data">
<div class="row">
<div class="col-md-12">
<table border="1" class="table th" >
	<tr>
		<td width="100">회원번호</td>
		<td colspan="2">${dto.mem_num}</td>
		<td rowspan="5" width="150">사진변경<br>
		<img src="/fitness/resources/img/Member/${dto.mem_picture }"  height="150">
			<input type="file" name="mem_picture">
		</td>
	</tr>
	<tr>
		<td width="100">이름</td>
		<td colspan="2"><input type="text" name="mem_name"class="input-sm" value="${dto.mem_name}"></td>
	</tr>
	<tr>
		<td width="100">성별</td>
		<td colspan="2"><input type="text" name="mem_gen"class="input-sm" value="${dto.mem_gen}"></td>
	</tr>
	<tr>
		<td width="100">나이</td>
		<td colspan="2"><input type="text" name="mem_age" class="input-sm"value="${dto.mem_age}"></td>
	</tr>
	<tr>
		<td width="100">생일<br>(6자리 - 예, 880101)</td>
		<td colspan="2"><input type="text" name="mem_birth" class="input-sm"value="${dto.mem_birth}"></td>
	</tr>
	<tr>
		<td width="100">이메일</td>
		<td colspan="3"><input type="text" name="mem_email"class="input-sm" value="${dto.mem_email}"></td>
	</tr>
	<tr>
		<td width="100">전화</td>
		<td colspan="3"><input type="text" name="mem_phone"class="input-sm" value="${dto.mem_phone}"></td>
	</tr>
	<tr>
		<td width="100">주소</td>
		<td colspan="3"><input type="text" name="mem_addr"class="input-sm" value="${dto.mem_addr}"></td>
	</tr>
	<tr>
		<td width="100">가입일</td>
		<td colspan="3">${dto.regdate}</td>
	</tr>
	<tr>
		<td width="100">등록지점</td>
		<td colspan="3"><input type="text" name="ct_code"class="input-sm" value="${dto.ct_code}"></td>
	</tr>


</table>
</div>
</div>
<div class="row">
<div class="col-sm-6">
<button class="btn pull-left" type="submit">
<span class="glyphicon glyphicon-ok" ></span>  Update </button>
</div>
<div class="col-sm-6">
<button class="btn pull-right" type="reset">
<span class="glyphicon glyphicon-remove" ></span>  Cancle </button>
</div>
	</div>
	</form>
</div>

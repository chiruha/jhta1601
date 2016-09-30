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
		<td width="200">회원번호</td>
		<td colspan="2">${dto.mem_num}</td>
		<td rowspan="5" width="150">사진변경<br>
		<img src="/fitness/resources/img/Member/${dto.mem_picture }"  height="150">
			<input type="file" name="mem_picture">
		</td>
	</tr>
	<tr>
		<td width="100">이름</td>
		<td colspan="2">
			<input type="text" name="mem_name" class="form-control" disabled="disabled" value="${dto.mem_name}">
			<input type="hidden" name="mem_name"  value="${dto.mem_name}">	
		</td>
	</tr>
	<tr>
		<td width="100">성별</td>
		<td colspan="2"><input type="text" name="mem_gen"  class="form-control" value="${dto.mem_gen}">
		
		</td>
	</tr>
	<tr>
		<td width="100">나이</td>
		<td colspan="2"><input type="text" name="mem_age"  class="form-control" value="${dto.mem_age}">
		
		</td>
	</tr>
	<tr>
		<td width="100">생일</td>
		<td colspan="2"><input type="text" name="mem_birth"  class="form-control" value="${dto.mem_birth}">
		
		</td>
	</tr>
	<tr>
		<td width="100">이메일</td>
		<td colspan="3"><input type="text" name="mem_email"  class="form-control" value="${dto.mem_email}">
		
		</td>
	</tr>
	<tr>
		<td width="100">전화</td>
		<td colspan="3"><input type="text" name="mem_phone"  class="form-control" value="${dto.mem_phone}">
		
		</td>
	</tr>
	<tr>
		<td width="100">주소</td>
		<td colspan="3"><input type="text" name="mem_addr"  class="form-control" value="${dto.mem_addr}">
		
		</td>
	</tr>
	<tr>
		<td width="100">가입일</td>
		<td colspan="3">${dto.regdate}</td>
	</tr>
	<tr>
		<td width="100">등록지점</td>
		<td colspan="3"><input type="text" name="ct_code"  class="form-control" value="${dto.ct_code}">
		
		</td>
	</tr>


</table>
</div>
</div>
<div class="row">
<<<<<<< HEAD
<div class="col-md-12">
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
=======
<div class="col-sm-6">
<button class="btn pull-left" type="submit">
<span class="glyphicon glyphicon-ok" ></span>  Update </button>
</div>
<div class="col-sm-6">
<button class="btn pull-right" type="reset">
<span class="glyphicon glyphicon-remove" ></span>  Cancle </button>
>>>>>>> de98b345ec8707bede78dc3a1d74e9122b55c671
</div>
	</div>
	</form>
</div>

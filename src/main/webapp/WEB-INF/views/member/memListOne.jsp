<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function () {
		$("button").click(function(event) {
			event.preventDefault();
			var id=event.target.getAttribute('id');
			//alert($(this).attr('id')); // id 찍어보기 
			//alert("id : "+id);
			var form=document.detailform;
			form.action=id;
			form.submit();
		});
});
</script>




<!-- Container (Contact Section) -->
<div id="contact" class="container">
<h3 class="text-center">Member Detail</h3>
<form method="post" name="detailform" enctype="multipart/form-data">
<div class="row">
<div class="col-md-12">
<table border="1" class="table th" >
	
	<tr>
		<td width="100">회원번호</td>
		<td colspan="2">${dto.mem_num}</td>
		<td rowspan="5" width="150"><img src="/fitness/resources/img/Member/${dto.mem_picture }" height="150"></td>
	</tr>
	<tr>
		<td width="100">이름</td>
		<td colspan="2">${dto.mem_name}</td>
	</tr>
	<tr>
		<td width="100">성별</td>
		<td colspan="2">${dto.mem_gen}</td>
	</tr>
	<tr>
		<td width="100">나이</td>
		<td colspan="2">${dto.mem_age}</td>
	</tr>
	<tr>
		<td width="100">생일</td>
		<td colspan="2">${dto.mem_birth}</td>
	</tr>
	<tr>
		<td width="100">이메일</td>
		<td colspan="3">${dto.mem_email}</td>
	</tr>
	<tr>
		<td width="100">전화</td>
		<td colspan="3">${dto.mem_phone}</td>
	</tr>
	<tr>
		<td width="100">주소</td>
		<td colspan="3">${dto.mem_addr}</td>
	</tr>
	<tr>
		<td width="100">가입일</td>
		<td colspan="3">${dto.regdate}</td>
	</tr>
	<tr>
		<td width="100">등록지점</td>
		<td colspan="3">${dto.ct_code}</td>
	</tr>




</table>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
		<div class="col-md-3">

	<button class="btn pull-left"  id="memUpdateList?mem_num=${dto.mem_num}">
	<span class="glyphicon glyphicon-ok" ></span>  Update </button>
	</div>
		<div class="col-md-3">
	<button class="btn pull-right" id="memDelete?mem_num=${dto.mem_num}" >
	<span class="glyphicon glyphicon-remove" ></span> Delete </button>
	</div>
	</div>



	</form>
</div>

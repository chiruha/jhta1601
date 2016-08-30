<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$("input").prop("disabled",true).css("background-color","white");  // input 비활성화하기
		$("option").attr("disabled",true);
		$("#update").click(function() {
			$("input").prop("disabled",false).css("background-color","#ffffe6");
			$.ajax({
				url:""
			})
			$(".code").remove();
		});
	
	});

</script>
<fieldset>
<legend>직원상세보기</legend>

<table border="2">
<tr>
	<td>직원번호<span> ${dto.stf_num }</span></td>
	<td rowspan="2"><img src="/fitness/resources/img/Staff/${dto.stf_picture }"></td>
</tr>
<tr>
	<td>직급 <input type="text" class="code"	name="pos_code" value="${pdto.pos_name }">	</td>
	
</tr>
<tr>
	<td>이름   <input type="text"	name="pos_code" value="${dto.stf_name }">  </td>
	<td>전화 	 <input type="text"	name="pos_code" value="${dto.stf_phone }"></td>
</tr>
<tr>
	<td>등록일 <input type="text"	name="pos_code" value="${dto.stf_date }">	</td>
	<td>지점 	 <input type="text" class="code" name="pos_code" value="${cdto.ct_name }"></td>
</tr>

</table>
<button id="update">수정</button>

</fieldset>
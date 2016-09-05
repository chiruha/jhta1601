<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function () {
		$("input").prop("disabled",true).css("background-color","white");  // input 비활성화하기
		$("option").attr("disabled",true);
	
		
		$("button").click(function(event) {
			event.preventDefault();
			var id=event.target.getAttribute('id');
			//alert($(this).attr('id')); // id 찍어보기 
			//alert("id : "+id);
			if(id=='/fitness/trdelete/?tr_num=${dto.tr_num }'){
				$(location).attr('href',id);
				alert("loc : "+$(location).attr('href'));
			}else if(id=='/fitness/trpage/?num=${dto.stf_num }'){
				$(location).attr('href',id);
				alert("loc : "+$(location).attr('href'));
			}
		
			
		});
		
		
	});

</script>
<fieldset>
<legend>직원상세보기</legend>
<form method="post" name="detailform" >
<table border="2">
<tr>
	<td>직원번호<span id="num"> ${dto.stf_num }</span>
	<input type="hidden" name="stf_num" value="${dto.stf_num }">
	</td>
</tr>
<tr>
	<td>강사번호<span id="num"> ${dto.tr_num }</span>
	<input type="hidden" name="tr_num" value="${dto.tr_num }">
	</td>
</tr>
<tr>
	<td>강사경력 <input type="text"	name="tr_career" value="${dto.tr_career }">	</td>
</tr>
<tr>
	<td>강사소개 	<input type="text" name="tr_intro"   value="${dto.tr_intro }"></td>
</tr>

</table>
</form>
<button id="/fitness/trdelete/?tr_num=${dto.tr_num }">삭제</button>
<button id="/fitness/trpage/?num=${dto.stf_num }">수정</button>

</fieldset>
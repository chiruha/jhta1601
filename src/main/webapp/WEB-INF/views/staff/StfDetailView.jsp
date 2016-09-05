<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function () {
		$("input").prop("disabled",true).css("background-color","white");  // input 비활성화하기
		$("option").attr("disabled",true);
		$("#update").click(function() {
			//alert($("#update").attr('id'));
			if($("#update").attr('id')=="update"){
				$("input").prop("disabled",false).css("background-color","#ffffe6");  // 수정할 항목 활성화
				$("#pic").prop("type","file");  // 파일버튼 보이기
				$.ajax({
					url:"/fitness/poslist",
					dataType : "xml",
					success : function(data) {
						//alert(data);
						var select=document.createElement("select");
						select.name="pos_code";
						$(data).find("position").each(function() {
							var option=document.createElement("option");
							option.value=$(this).find("poscode").text();
							option.text=$(this).find("posname").text();
							select.appendChild(option);
						});
						$("#pos").append(select);
						$("#pcode").remove();
						$("#update").html("수정완료");
						$("#update").attr("id","stfupdate");
					}
				});
				$.ajax({
					url:"/fitness/ctlist",
					dataType : "xml",
					success : function(data) {
						//alert(data);
						var select1=document.createElement("select");
						select1.name="ct_code";
						$(data).find("center").each(function() {
							var option1=document.createElement("option");
							option1.value=$(this).find("ctcode").text();
							option1.text=$(this).find("ctname").text();
							select1.appendChild(option1);
						});
						$("#ct").append(select1);
						$("#ccode").remove();
					}
				});
			}
		});
		
		$("button").click(function(event) {
			event.preventDefault();
			var id=event.target.getAttribute('id');
			//alert($(this).attr('id')); // id 찍어보기 
			alert("id : "+id);
			var form=document.detailform;
			form.action=id;
			if(id=='stfupdate'){
				form.submit();
			}else if(id=='stfdelete'){
				form.submit();
			}else if(id=='/fitness/trpage/?num=${dto.stf_num }'){
				$(location).attr('href',id);
				alert("loc : "+$(location).attr('href'));
			}
		
			
		});
		
		
	});

</script>
<fieldset>
<legend>직원상세보기</legend>
<form method="post" name="detailform" enctype="multipart/form-data">
<table border="2">
<tr>
	<td>직원번호<span id="num"> ${dto.stf_num }</span>
	<input type="hidden" name="stf_num" value="${dto.stf_num }">
	</td>
	<td rowspan="2">
		<img src="/fitness/resources/img/Staff/${dto.stf_picture }" name="stf_picture" >
		<input type="hidden" name="picture" id="pic">
	</td>
</tr>
<tr>
	<td id="pos">직급 <input type="text"  id="pcode"	value="${pdto.pos_name }">	 </td>
	
</tr>
<tr>
	<td>이름   <input type="text" name="stf_name" value="${dto.stf_name }">  </td>
	<td>전화 	 <input type="text"  name="stf_phone" value="${dto.stf_phone }"></td>
</tr>
<tr>
	<td>등록일 <input type="text"	name="stf_date" value="${dto.stf_date }">	</td>
	<td id="ct">지점 	 <input type="text"  id="ccode"   value="${cdto.ct_name }"></td>
</tr>

</table>
</form>
<button id="update">수정</button>
<button id="stfdelete">삭제</button>
<button id="/fitness/trpage/?num=${dto.stf_num }">강사등록/수정</button>

</fieldset>
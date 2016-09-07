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
						$(select).addClass('select input-sm');
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
						$(select1).addClass('select input-sm');
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
			//alert("id : "+id);
			var form=document.detailform;
			form.action=id;
			if(id=='stfupdate'){
				form.submit();
			}else if(id=='stfdelete'){
				form.submit();
			}else if(id=='/fitness/trpage/?num=${dto.stf_num }'){
				$(location).attr('href',id);
				//alert("loc : "+$(location).attr('href'));
			}
		
			
		});
		
		
	});

</script>


<!-- Container (Contact Section) -->
<div id="contact" class="container">
<h3 class="text-center">Staff Detail</h3>
<form method="post" name="detailform" enctype="multipart/form-data">
<div class="row">
<div class="col-md-12">
<table border="1" class="table th" >
	<tr>
	<td><label >번호</label> <input type="text"  class="input-sm"  value=" ${dto.stf_num }">
	<input type="hidden" name="stf_num" value="${dto.stf_num }">
	</td>
	<td rowspan="2">
		<img src="/fitness/resources/img/Staff/${dto.stf_picture }" name="stf_picture" height="150px;">
		<input type="hidden" name="picture" id="pic">
	</td>
</tr>
<tr>
	<td id="pos"><label class="control-label">직급</label> <input type="text"  id="pcode" class="input-sm"	value="${pdto.pos_name }">	 </td>
	
</tr>
<tr>
	<td><label >이름 </label> <input type="text" name="stf_name" class="input-sm"  value="${dto.stf_name }">  </td>
	<td><label >전화 </label> <input type="text"  name="stf_phone" class="input-sm" value="${dto.stf_phone }"></td>
</tr>
<tr>
	<td><label >등록일</label> <input type="text"	name="stf_date" class="input-sm" value="${dto.stf_date }">	</td>
	<td id="ct"><label >지점 </label> <input type="text"  id="ccode" class="input-sm"  value="${cdto.ct_name }"></td>
</tr>
</table>
</div>
</div>
<div class="row">
<div class="col-md-12">
<button id="update" class="btn">수정</button>
<button id="stfdelete" class="btn">삭제</button>
 <button id="/fitness/trpage/?num=${dto.stf_num }" class="btn">강사등록ㆍ수정</button>

</div>
	</div>
	</form>
</div>
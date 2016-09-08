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
			alert("id : "+id);
			if(id=='/fitness/trdelete/?tr_num=${dto.tr_num }'){
				$(location).attr('href',id);
				//alert("loc : "+$(location).attr('href'));
			}else if(id=='/fitness/trpage/?num=${dto.stf_num }'){
				$(location).attr('href',id);
				//alert("loc : "+$(location).attr('href'));
			}
		
			
		});
		
		
	});

</script>


<!-- Container (Contact Section) -->
<div id="contact" class="container">
<h3 class="text-center">Trainer Detail</h3>
<form method="post" name="detailform" >
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
		<input type="hidden"   name="stf_num" value="${sdto.stf_num}">
		<br><label>직원번호</label> &nbsp; <label> ${sdto.stf_num}</label><br>
		<input type="hidden"   name="tr_num" value="${dto.tr_num}">
		<label>강사번호 </label> &nbsp; <label>${sdto.stf_num}</label><br>
		
	
	</div>
		<div class="col-md-3">
	<img src="/fitness/resources/img/Staff/${sdto.stf_picture }" width="100px;" height="100px;"><br>
</div>
<div class="col-md-3"></div>
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-3">
	<input type="hidden"  name="stf_name" value="${sdto.stf_name}">
		<label>직원이름 </label> &nbsp; <label>${sdto.stf_name}</label>
		</div>
<div class="col-md-3">
		<label>경력 </label> &nbsp; <label>${dto.tr_career} 년</label>
		<br>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-3">
		<label>직급 </label> &nbsp; <label>${pdto.pos_name}</label>
	</div>
<div class="col-md-3">
		<label>지점 </label> &nbsp; <label>${cdto.ct_name}</label>
	</div>
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
	<label>전화 </label> &nbsp; <label>${sdto.stf_phone}</label>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<label>강사소개</label><br>
<textarea class="form-control" rows="5" readonly="readonly">${dto.tr_intro}</textarea><br> 
<br>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
	<button class="btn pull-right" id="/fitness/trpage/?num=${dto.stf_num }" type="submit">
	<span class="glyphicon glyphicon-ok"></span> Update </button>
	</div>
		<div class="col-md-3">
	<button class="btn pull-left" id="/fitness/trdelete/?tr_num=${dto.tr_num }" type="reset">
	<span class="glyphicon glyphicon-remove"></span>  Delete </button>
	
	
	</div>
	</div>

</form>
</div>

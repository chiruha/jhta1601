<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
	$(document).ready(function() {
		$("#pkeyword").on("keyup", function() {
			//alert("pageNum="+$("#pageNum").val()+", pkeyword="+$("#pkeyword").val()+", ptype=" +$("#ptype option:selected").val())
			$('#mytab  tbody').empty();
			$.ajax({
				url:"/fitness/xmlslist",
				dataType:"xml",
				data:"pageNum="+$("#pageNum").val()+"&pkeyword="+$("#pkeyword").val()+"&ptype="+$("#ptype option:selected").val(),
				success: function(data) {
					$(data).find("paging").each(function(){
						var getPageNum=$(this).find("getPageNum").text();
						var getTotalRowCount=$(this).find("getTotalRowCount").text();
						var getRowBlockCount=$(this).find("getRowBlockCount").text();
						var getPageBlockCount=$(this).find("getPageBlockCount").text();
						var getStartPageNum=$(this).find("getStartPageNum").text();
						var getEndPageNum=$(this).find("getEndPageNum").text();
						var getTotalPageCount=$(this).find("getTotalPageCount").text();
					});
				
					$(data).find("staff").each(function(r) {
						var html="";
						//alert("r:"+r);
						if(r==0){
							html="<tr><th>직원번호</th><th>직원이름</th><th>전화번호</th><th>직급</th><th>선택</th></tr>";
						}
						html += "<tr><td>"+$(this).find("stf_num").text()+"</td>"
						+"<td>"+$(this).find("stf_name").text()+"</td>"
						+"<td>"+$(this).find("stf_phone").text()+"</td>"
						+"<td>"+$(this).find("pos_name").text()+"</td>"
						+"<td><input type='radio' class='input-radio' name='chk' value='"+$(this).find("stf_num").text()+"'></td></tr>";
						
						$('#mytab > tbody:last').append(html);
					});
					
					}
		});
		$("button").on("click", function() {
			alert("check")
		});
	
	
	
	
	
		});
	});
	</script>
<!-- Container (Contact Section) -->
<form action="payinsert" method="post"  name="payform">
<div id="contact" class="container">
	<h3 class="text-center">Insert Pay</h3>
	<input type="hidden" id="pageNum" name="pageNum">
	
<div class="row">
<div class="col-md-4"></div>
	<div class="col-md-4">
		<select name="ptype" class="select input-sm" id="ptype">
					<option value="stf_num">직원번호</option>
					<option value="stf_name">직원이름</option>
					<option value="stf_phone">직원전화</option>
			</select>
	<input type="text" name="ct_name"size="15" class="input-sm" id="pkeyword" placeholder="Search Staff " ><br>
</div>
</div>

<div class="row">
<div class="col-md-12">
<br>
<table class="table" id="mytab">
<tbody></tbody>
</table>
</div>
</div>








    </div>
<div class="container">
<div class="row">
<div class="col-md-12"><br>
<table class="table" id="mytab">
	<tr>
		<th>직원번호</th>
		<td></td>
	</tr>
	<tr>
		<th>직원이름</th>
		<td></td>
	</tr>
	<tr>
		<th>근무시간</th>
		<td></td>
	</tr>
	<tr>
		<th>직급</th>
		<td></td>
	</tr>
	<tr>
		<th></th>
		<td></td>
	</tr>
</table>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
	<div class="col-md-3">
	<button class="btn pull-right" id="ok" type="submit">
	<span class="glyphicon glyphicon-ok"></span> Ok </button>
	</div>
		<div class="col-md-3">
	<button class="btn pull-left" id="cancle" type="reset">
	<span class="glyphicon glyphicon-remove"></span>  Cancle </button>
	</div>
	
	</div>
	</div>
</form>
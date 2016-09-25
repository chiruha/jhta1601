<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0-rc.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.11.3.js"></script>
  <script src="//code.jquery.com/ui/1.12.0-rc.1/jquery-ui.js"></script>
     
 <script type="text/javascript">
	$(document).ready(function() {
		$("#datepicker").hide();
		
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
						+"<td><input type='radio' class='input-radio' name='rd' value='"+$(this).find("stf_num").text()+"'></td></tr>";
						
						$('#mytab > tbody:last').append(html);
					});
					
					}
			});
		});
		
		$("#mytab").on("click",".input-radio", function(e) {
			//alert("mytab click"+$(".input-radio:checked").val());
			$("#num").val($(".input-radio:checked").val());
			$("#datepicker").show();
		});
		$("#datepicker").on("change",function(e) {
			//alert("stf_num="+$("#num").val()+"&start_date="+$("#datepicker").val())
			$('#cultab  tbody').empty();
			$.ajax({
				url:"/fitness/xmlpay",
				dataType:"xml",
				data:"stf_num="+$("#num").val()+"&start_date="+$("#datepicker").val(),
				success: function(data) {
					$("#emsg").empty();
					$("#emsg").append("${emsg }").css({
						"color":"#0080ff",
						"font-size":"11px"
					});
					$(data).find("cul").each(function(r) {
						$("#emsg").empty();
						var html="";
						html="<tr><th>직원번호</th><td>"	+$(this).find("stf_num").text()
									+"<input type='hidden' class='input-sm' name='stf_num' value='"+$(this).find("stf_num").text()+"' ></td></tr>"
									+"<tr><th>직원이름</th><td>"+$(this).find("stf_name").text()
									+"<input type='hidden' class='input-sm' name='stf_name' value='"+$(this).find("stf_name").text()+"' ></td></tr>"
									+"<tr><th>직원번호</th><td>"+$(this).find("stf_phone").text()
									+"<input type='hidden' class='input-sm' name='stf_phone' value='"+$(this).find("stf_phone").text()+"' ></td></tr>"
									+"<tr><th>소속직급</th><td>"+$(this).find("pos_name").text()
									+"<input type='hidden' class='input-sm' name='pos_code' value='"+$(this).find("pos_name").text()+"' ></td></tr>"
									+"<tr><th>근무시간</th><td>"+$(this).find("wsum").text()
									+"<input type='hidden' class='input-sm' name='time_sum' value='"+$(this).find("wsum").text()+"' ></td></tr>"
									+"<tr><th>기본급</th><td>"+$(this).find("rpay").text()
									+"<tr><th>시급</th><td>"+$(this).find("tpay").text()
									+"<tr><th>월급합계</th><td>"+$(this).find("pay_tot").text()
									+"<input type='hidden' class='input-sm' name='pay_tot' value='"+$(this).find("pay_tot").text()+"' ></td></tr>"
						$('#cultab > tbody:last').append(html);
					});
				}
			
			
			});
		
		});
		 $("#datepicker").datepicker({
			    dateFormat: 'yy/mm/dd'
			  });
	    
		
	});


	</script>
<!-- Container (Contact Section) -->
<form action="payinsert" method="post"  name="payform">
<div id="contact" class="container">
	<h3 class="text-center">Insert Pay</h3>
	<input type="hidden" id="pageNum" name="pageNum">
	<input type="hidden" id="num">
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
  
<div class="row">
<div class="col-md-5">
<input type='text' id='datepicker' size='15' name='start_date' placeholder='근무시작일 선택' class='input-sm'>
<span id="emsg"></span>
</div>
</div>
<div class="row">
<div class="col-md-12"><br>
<table class="table"  id="cultab">
	<tbody></tbody>
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
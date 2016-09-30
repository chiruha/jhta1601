<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	#dlg{font-size: 12px;}
    #ptime{width:100px; }
</style>
<link rel="stylesheet" type="text/css" href="/fitness/resources/css/jquery-ui.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<%--
<link rel="stylesheet" href="/fitness/resources/css/jquery.timepicker.css">
 --%>
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="/fitness/resources/js/jquery-ui.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<%--
<script type="text/javascript" src="/fitness/resources/jquery/jquery.timepicker.js"></script>
--%>
<script type="text/javascript">
	$(function function_name(argument) {
		$("#open_btn").click(function function_name(argument) {
			$("#dlg").dialog("open"); //다이얼로그 열기
	
		
		});
		$("#dlg").dialog({
			autoOpen:false,
			buttons:{
				저장:function function_name(argument) {				
					var ptr_initdate=$("#pdate").val();
					var ptr_time=$("#time").val();
					var ct_code=$("#ct_code").val();
					var tr_num=$("#st_code").val();						
					$("#dlg").dialog("close");
					$.ajax({
							url:"/fitness/ptrinsert",
							dataType:"json",
							type:"post",
							data:"ptr_initdate="+ptr_initdate+"&ptr_time="+ptr_time+"&ct_code="+ct_code+"&tr_num="+tr_num,							
							success:function function_name(data) {	
								console.log("..."+data);
								if(data.ptr_num!=0 && data != 9999 && data != 9990){
								var str =									
								"<div class='row'><div class='col-sm-3'></div>"+
								"<div class='col-sm-3'><label>트레이너 : "+ data.tr_num+"</label></div>" +
								"<div class='col-sm-3'><label>등록번호 : " + data.rg_num + "</label></div>" +
								"</div><div class='row'><div class='col-sm-3'></div>"+
								"<div class='col-sm-6'><label>회원시작일 : " + data.ptr_initdate + "</label></div>" +
								 "</div><div class='row'><div class='col-sm-3'></div>"+
								 "<div class='col-sm-3'><label>회원시간 : " +  data.ptr_time + "</label></div>" +
								 "<div class='col-sm-3'><label>PT횟수 : " + data.ptr_count + "</label></div>" +
								 "</div><div class='row'><div class='col-sm-3'></div>"+
								 "<div class='col-sm-3'><label>지점코드 : " + data.ct_code + "</label></div>" +
								 "<div class='col-sm-3'><label>회원승인 : " + data.ptr_ok	+ "</label></div>";
							
								//alert(str); 
								 $("#result").html(str);	
								}else if(data==9999){
									$("#contact").remove();
									$("#result").html("<h3 class='text-center'>PT 미등록 회원입니다<br> 고객센터에 문의해주시기 바랍니다</h3>");
								}else if(data==9990){
									$("#contact").remove();
									$("#result").html("<h3 class='text-center'>이미 PT 신청하셨습니다.</h3>");
								}
								
								 
							}			  				
							
					});
					
				},
				닫기:function function_name(argument) {
					$("#dlg").dialog("close");//다이얼로그 닫기
				}
			}
		});		
		$("#pdate").datepicker({
			dateFormat:'yy/mm/dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년'			
		
		});	
		
			
	});
</script>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<div  id="open_btn"><h2 class="text-center">PT Schedule</h2>
	<h5 class="text-center">( c l i c k )</h5> </div>
	
	<div id="box">
		<div id="dlg" title="PT Schedule" >			
			<label for="pdate"> PT시작일 </label>
			<input type="text" id="pdate" size="10" class="input-sm"><br><br>
			<label for="ptime"> PT  시간 </label>
			<select name="time" id="time" class="select input-sm">
			<option value="06:00">시간선택</option>
			<option value="06:00">06:00</option>
			<option value="07:00">07:00</option>
			<option value="08:00">08:00</option>
			<option value="09:00">09:00</option>	
			<option value="10:00">10:00</option>
			<option value="11:00">11:00</option>
			<option value="12:00">12:00</option>
			<option value="13:00">13:00</option>
			<option value="14:00">14:00</option>
			<option value="15:00">15:00</option>
			<option value="16:00">16:00</option>
			<option value="17:00">17:00</option>
			<option value="18:00">18:00</option>
			<option value="19:00">19:00</option>
			<option value="20:00">20:00</option>
			<option value="21:00">21:00</option>
			<option value="22:00">22:00</option>		
			</select>
			<br><br>
			<label for="ct_code"> Center </label> <select name="ct_code" id="ct_code" class="select input-sm">
					<c:forEach var="clist"  items="${ctlist}">
						<option value="${clist.ct_code }">${clist.ct_name}</option>	
					</c:forEach>	
					</select><br><br>
			<label for="st_code"> Trainer </label> <select name="st_code" id="st_code" class="select input-sm">
					<c:forEach var="slist"  items="${stlist}">
						<option value="${slist.tr_num }">${slist.stf_name}</option>	
					</c:forEach>	
					</select><br><br>	
					
		</div>
	</div>


	

</div>
<div id="result"></div>



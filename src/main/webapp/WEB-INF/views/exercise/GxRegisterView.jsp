<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">
	body{font-size: 0.8em;}
	h1{text-align: center;}
		
    #ptime{width:100px}
</style>
<link rel="stylesheet" type="text/css" href="/fitness/resources/css/jquery-ui.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/fitness/resources/css/jquery.timepicker.css">
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="/fitness/resources/js/jquery-ui.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="/fitness/resources/jquery/jquery.timepicker.js"></script>
<script type="text/javascript">
	$(function function_name(argument) {
		$("#open_btn").click(function function_name(argument) {
			$("#dlg").dialog("open"); //다이얼로그 열기
		});
		$("#dlg").dialog({
			autoOpen:false,
			buttons:{
				저장:function function_name(argument) {
				/*	var ptdate=$("#pdate").val();
					var ptime=$("#time").val();
					var ptcount=$("#pcount").val();
					$("#ptdate").val(ptdate);
					$("#ptime").val(ptime);
					$("#ptcount").val(ptcount);					
					$("#dlg").dialog("close");		
					
				$("#form").submit(function(){
						
				});			*/		
					var ptr_initdate=$("#pdate").val();
					var ptr_time=$("#time").val();
					var ptr_count=$("#pcount").val();
					$("#dlg").dialog("close");
					$.ajax({
							url:"/fitness/ptrinsert",
							dataType:"json",
							type:"post",
							data:"ptr_initdate="+ptr_initdate+"&ptr_time="+ptr_time+"&ptr_count="+ptr_count,
							success:function function_name(data) {
								$("#result").html(data);
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

	<h1 id="open_btn">PT일정(click)</h1>
	
	<div id="box">
		<div id="dlg" title="PT일정">			
			<label for="pdate">PT시작일</label><br>
			<input type="text" id="pdate" ><br><br>
			<label for="ptime">PT시간</label><br>
			<select name="time" id="time">
			<option value="06:00">시간선택해주세요</option>
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
			<label for="pcount">PT횟수</label>
			<input type="text" id="pcount" >			
		</div>
	</div>
<div id=result></div>
	

	








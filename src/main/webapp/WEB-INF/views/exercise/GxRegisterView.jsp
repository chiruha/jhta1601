<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	body{font-size: 0.8em;}
	h1{text-align: center;}
	.ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-draggable ui-resizable{width: 300px}
	#dlg{width: 400px}
    
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(function function_name(argument) {
		$("#open_btn").click(function function_name(argument) {
			$("#dlg").dialog("open"); //다이얼로그 열기
		});
		$("#dlg").dialog({
			width: 350,
			autoOpen:false,
			buttons:{
				저장:function function_name(argument) {					
					var ptr_initdate=$("#pdate").val();
					var ptr_time=$("#time").val();
					var ptr_count=$("#pcount").val();
					$("#dlg").dialog("close");
					$.ajax({
							url:"/fitness/ptrinsert?",
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
		
		
	});
</script>

	<h1 id="open_btn">GX일정(click)</h1>
	
	<div id="box">
		<div id="dlg" title="PT일정">			
			<label for="pdate">PT시작일</label><br>
			<input type="text" id="pdate" ><br><br>
			<label for="ptime">PT시간</label><br>
			<select name="time" id="time">
			<option value="time">운동 시간선택해주세요</option>
			<option value="09:00~09:50">09:00~09:50</option>
			<option value="10:00~10:50">10:00~10:50</option>
			<option value="11:00~11:50">11:00~11:50</option>
			<option value="19:00~19:50">19:00~19:50</option>	
			<option value="20:00~20:50">20:00~20:50</option>
			<option value="21:00~21:50">21:00~21:50</option>					
			</select>
		 	<table border="1">
		 		<tr>
		 			<th>지점</th>
		 			<th>GX선택</th>
		 			<th>요일</th>
		 			<th>운동추가</th>
		 			
		 		</tr>
		 		<tr>
		 			<td>
		 				<select name="ct_code" id="ct_code">
						<c:forEach var="clist"  items="${ctlist}">
							<option value="${clist.ct_code }">${clist.ct_name}</option>	
						</c:forEach>	
					</select>	
		 			</td>
		 			<td>
		 				<select name="time" id="time">		 					
		 					<option value="에어로빅">에어로빅</option>
		 					<option value="ABT">ABT</option>
		 					<option value="요가">요가</option>
		 					<option value="스텝">스텝</option>
		 					<option value="바디펌프">바디펌프</option>
		 					<option value="필라테스">필라테스</option>
		 				</select>
		 			</td>
		 			<td>
		 				<select name="time" id="time">
		 					<option value="월수금">월수금</option>
		 					<option value="화목">화목</option>		 					
		 				</select>
		 			</td>
		 			
		 		</tr>
		 	</table>	
					
		</div>
	</div>

	

	








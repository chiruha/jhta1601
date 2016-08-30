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

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(function function_name(argument) {
		$("#open_btn").click(function function_name(argument) {
			$("#dlg").dialog("open"); //다이얼로그 열기
		});
		$("#dlg").dialog({
			width: 900,
			autoOpen:false,
			buttons:{
				저장:function function_name(argument) {	
					var params=$("#selectAll").serialize(); 
					alert(params);							
					$.ajax({
							url:"/fitness/gxinsert",
							dataType:"json",
							type:"post",
							data:params,
							success:function function_name(data) {
								alert(왜안와);
								alert(data.gx_num);
								var str = "회원등록:" + data.gx_num +"<br>" +
								  "지점코드:"+ data.ct_code +"<br>" +
								  "gx운동:" + data.gx_exercise + "<br>" +
								  "요일:" + data.gx_day + "<br>" +
						          "회원시간:" +  data.gx_time + "<br>" +
						          "PT회원 정보:" + data.rg_num + "<br>" +
						          "수정은 개인정보 회원란에서 해주쉬면됩니다.";
								 alert(str); 
								 $("#result").html(str);
							}
					
					});
					
				},
				닫기:function function_name(argument) {
					$("#dlg").dialog("close");//다이얼로그 닫기
				}
			}
		});						
		
	});
	
	 $(document).on("click","button[name=addGX]",function(){         
	        var addGXText =  '<tr name="trChoice">'+            
	            '   <td class="tdpoChoice">'+
	            '   <select name="ct_code" id="ct_code">'+
	            '       <c:forEach var="clist"  items="${ctlist}">'+
	            '       <option value="${clist.ct_code }">${clist.ct_name}</option>'+   
	            '       </c:forEach>'+  
	            '   </select>'+
	            '   </td>'+
	            '   <td class="tdgxChoice">'+
	            '       <select class="gx_exercise" name="gx_exercise">'+
	            '           <option value="에어로빅">에어로빅</option>'+
	            '           <option value="ABT">ABT</option>'+
	            '           <option value="요가">요가</option>'+
	            '           <option value="스텝">스텝</option>'+
	            '           <option value="바디펌프">바디펌프</option>'+
	            '           <option value="필라테스">필라테스</option>'+
	            '       </select>'+
	            '   </td>'+
	            '   <td class="tddayChoice">'+            
	            '       <select class="gx_day" name="gx_day">'+
	            '           <option value="월수금">월수금</option>'+
	            '           <option value="화목">화목</option>'+
	            '       </select>'+
	            '   </td>'+
	            '   <td class="tdgxTime">'+
	            '       <select class="gx_time" name="gx_time">'+
	            '           <option value="09:00~09:50">09:00~09:50</option>'+
	            '           <option value="10:00~10:50">10:00~10:50</option>'+
	            '           <option value="11:00~11:50">11:00~11:50</option>'+
	            '           <option value="19:00~19:50">19:00~19:50</option>'+
	            '           <option value="20:00~20:5">20:00~20:50</option>'+
	            '           <option value="21:00~21:50">21:00~21:50</option>'+
	            '       </select>'+
	            '   </td>'+            
	            '   <td class="tdCancel">'+
	            '       <button class="cancel" name="cancel">취소</button>'+
	            '   </td>'+            
	            '</tr>';
	             
	        var trHtml = $( "tr[name=trChoice]:last" ); //last를 사용하여 trChoice라는 명을 가진 마지막 테그 호출
	         
	        trHtml.after(addGXText); //마지막 trStaff명 뒤에 붙인다.
	         
	    });
	     
	    //삭제 버튼
	    $(document).on("click","button[name=cancel]",function(){         
	        var trHtml = $(this).parent().parent();         
	        trHtml.remove(); //tr 테그 삭제         
	    });
	
</script>

	<h1 id="open_btn">GX일정(click)</h1>
	
	<div id="box">
		
		<div id="dlg" title="PT일정">		
		<form id="selectAll">
			<table border="1" style="width:800px">
        <tbody>            
           <tr>                
                <td ><strong>지점</strong></td>
                <td ><strong>GX선택</strong></td>
                <td ><strong>GXDAY</strong></td>
                <td ><strong>GXTime</strong></td>
                <td style="width:80px" ><button name="addGX">GX추가</button></td>                
            </tr>
            <tr name="trChoice">               
                <td >
                    <select name="ct_code" id="ct_code">
                        <c:forEach var="clist"  items="${ctlist}">
                            <option value="${clist.ct_code }">${clist.ct_name}</option> 
                        </c:forEach>    
                    </select>
                </td>
                <td >
                    <select name="gx_exercise">
                        <option value="에어로빅">에어로빅</option>
                        <option value="ABT">ABT</option>
                        <option value="요가">요가</option>
                        <option value="스텝">스텝</option>
                        <option value="바디펌프">바디펌프</option>
                        <option value="필라테스">필라테스</option>
                    </select>
                </td>
                <td >                    
                    <select name="gx_day">
                        <option value="월수금">월수금</option>
                        <option value="화목">화목</option>
                    </select>
                </td>
                <td >
                    <select name="gx_time">
                        <option value="09:00~09:50">09:00~09:50</option>
                        <option value="10:00~10:50">10:00~10:50</option>
                        <option value="11:00~11:50">11:00~11:50</option>
                        <option value="19:00~19:50">19:00~19:50</option>
                        <option value="20:00~20:50">20:00~20:50</option>
                        <option value="21:00~21:50">21:00~21:50</option>                        
                    </select>
                </td>
                <td ></td>
            </tr>         
        </tbody>
    </table>
    </form>	
		</div>
		
	</div>

<div id="result"></div>
<div >
	<a href="<c:url value='/'/>">Header Page (홈으로 이동)</a> 
</div>	

	








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#ct_name").on("change",function(event){		
		location.href="gxRegisterView?ct_name="+$(this).val();
		
		
	});    
       
});
</script>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Group Exercise Schedule</h3><br>
	<div class="row">
	<div class="col-md-12">
	<form name="form" action="gxMent" method="post">	
	<table border="1"  class="table th">
  
    <colgroup>
        <col width='12.5%' />
        <col width='12.5%' />
        <col width='12.5%' />
        <col width='12.5%' />
        <col width='12.5%' />
        <col width='12.5%' />    
        <col width='12.5%' />    
        <col width='12.5%' />           
    </colgroup>
    <thead>
        <tr>
        	<th>시간/요일</th>
			<th>월요일</th>
			<th>화요일</th>
			<th>수요일</th>
			<th>목요일</th>
			<th>금요일</th>
			<th>토요일</th>
			<th>일요일</th>	       
        </tr>
    </thead>
    <tbody> 
    		<tr>
    			<td colspan="8">
    				<form id="ct_name2" action="gxRegisterView">   				
    				
    		 		<select name="ct_name select input-sm" id="ct_name">
					<c:forEach var="clist"  items="${ctlist}">						
						<option value="${clist.ct_name }" ${clist.ct_name eq ct_name ? "selected":""  }>${clist.ct_name}</option>						
					</c:forEach>	
					</select>
					</form>					
				</td>
    		</tr>
    		<tr><td colspan="8">오전시간표    			
    		   	
	       <tr>	
	       		<td>09:00<br>~<br>09:50</td>	       		
	       		<td><c:out value="${gxlist.mon09 }"/></td> 
	       		<td><c:out value="${gxlist.tue09 }"/></td>
	       		<td><c:out value="${gxlist.wed09 }"/></td>	       			
	       		<td><c:out value="${gxlist.thu09 }"/></td>
	       		<td><c:out value="${gxlist.fri09 }"/></td>
	       		<td><c:out value="${gxlist.sat09 }"/></td>
				<td><c:out value="${gxlist.sun09 }"/></td>	       					
	       </tr>	      
	       <tr>
	       		<td>10:00<br>~<br>10:50</td>
	       		<td><c:out value="${gxlist.mon10 }"/></td> 
	       		<td><c:out value="${gxlist.tue10 }"/></td>
	       		<td><c:out value="${gxlist.wed10 }"/></td>	       			
	       		<td><c:out value="${gxlist.thu10 }"/></td>
	       		<td><c:out value="${gxlist.fri10 }"/></td>
	       		<td><c:out value="${gxlist.sat10 }"/></td>
				<td><c:out value="${gxlist.sun10 }"/></td>
	       </tr>	       	
	       <tr>
	       		<td>11:00<br>~<br>11:50</td>
	       		<td><c:out value="${gxlist.mon11 }"/></td> 
	       		<td><c:out value="${gxlist.tue11 }"/></td>
	       		<td><c:out value="${gxlist.wed11 }"/></td>	       			
	       		<td><c:out value="${gxlist.thu11 }"/></td>
	       		<td><c:out value="${gxlist.fri11 }"/></td>
	       		<td><c:out value="${gxlist.sat11 }"/></td>
				<td><c:out value="${gxlist.sun11 }"/></td>
	       			      		
	       </tr>
	       <tr><td colspan="8">오후시간표</td></tr>
	       <tr>
	       		<td>18:00<br>~<br>18:50</td>
	       		<td><c:out value="${gxlist.mon18 }"/></td> 
	       		<td><c:out value="${gxlist.tue18 }"/></td>
	       		<td><c:out value="${gxlist.wed18 }"/></td>	       			
	       		<td><c:out value="${gxlist.thu18 }"/></td>
	       		<td><c:out value="${gxlist.fri18 }"/></td>
	       		<td><c:out value="${gxlist.sat18 }"/></td>
				<td><c:out value="${gxlist.sun18 }"/></td>
	       			      		
	       </tr>
	       <tr>
	       		<td>19:00<br>~<br>19:50</td>
	       		<td><c:out value="${gxlist.mon19 }"/></td> 
	       		<td><c:out value="${gxlist.tue19 }"/></td>
	       		<td><c:out value="${gxlist.wed19 }"/></td>	       			
	       		<td><c:out value="${gxlist.thu19 }"/></td>
	       		<td><c:out value="${gxlist.fri19 }"/></td>
	       		<td><c:out value="${gxlist.sat19 }"/></td>
				<td><c:out value="${gxlist.sun19 }"/></td>
	       			    		
	       </tr>
	       <tr>
	       		<td>20:00<br>~<br>20:50</td>
	       		<td><c:out value="${gxlist.mon20 }"/></td> 
	       		<td><c:out value="${gxlist.tue20 }"/></td>
	       		<td><c:out value="${gxlist.wed20 }"/></td>	       			
	       		<td><c:out value="${gxlist.thu20 }"/></td>
	       		<td><c:out value="${gxlist.fri20 }"/></td>
	       		<td><c:out value="${gxlist.sat20 }"/></td>
				<td><c:out value="${gxlist.sun20 }"/></td>	        		
	       </tr>
    </tbody>
	</table>
	
		 
 	</form>
</div>
</div>
</div>


 
 
 	

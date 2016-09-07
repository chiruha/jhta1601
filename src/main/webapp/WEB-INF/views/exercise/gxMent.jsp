<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h1>gx스케줄러</h1>
	<form name="form" action="gxinsert" method="post">
	<input type="hidden"  name="time9" value="09:00~09:50" />
	<input type="hidden"  name="time10" value="10:00~09:50" />
	<input type="hidden"  name="time11" value="11:00~09:50"/>
	<input type="hidden"  name="time18" value="18:00~09:50"/>
	<input type="hidden"  name="time19" value="19:00~19:50"/>
	<input type="hidden"  name="time20" value="20:00~20:50"/>
	<table border="1" style="width:600px">
    <caption><a href="<c:url value='/?test=goboot'/>">게시판</a></caption>
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
    		<tr><td colspan="8">오전시간표</td></tr>   	
	       <tr>	
	       		<td>09:00<br>~<br>09:50</td>
	       		<td>
	       		<select name="mom09" id="mom09" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                </select>
                 </td> 
	       		<td>
	       			<select name="tue9" id="tue9" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
                </td>
	       		<td>
	       			<select name="wed9" id="wed9" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="thu9" id="thu9" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="fri9" id="fri9" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sat9" id="sat9" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sun9" id="sun9" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>       		
	       </tr>	      
	       <tr>
	       		<td>10:00<br>~<br>10:50</td>
	       		<td>
	       			<select name="mon10" id="mon10" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="tue10" id="tue10" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="wed10" id="wed10" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="thu10" id="thu10" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="fri10" id="fri10" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sat10" id="sat10" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sun10" id="sun10" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>       		
	       </tr>	       	
	       <tr>
	       		<td>11:00<br>~<br>11:50</td>
	       		<td>
	       			<select name="mon11" id="mon11" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select> 
	       		<td>
	       			<select name="tue11" id="tue11" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select> 
	       		<td>
	       			<select name="wed11" id="wed11" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select> 
	       		<td>
	       			<select name="thu11" id="thu11" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select> 
	       		<td>
	       			<select name="fri11" id="fri11" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sat11" id="sat11" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select> 
	       		<td>
	       			<select name="sun11" id="sun11" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>       		
	       </tr>
	       <tr><td colspan="8">오후시간표</td></tr>
	       <tr>
	       		<td>18:00<br>~<br>18:50</td>
	       		<td>
	       			<select name="mon18" id="mon18" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="tue18" id="tue18" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="wed18" id="wed18" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="thu18" id="thu18" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="fri18" id="fri18" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sat18" id="sat18" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sun18" id="sun18" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>       		
	       </tr>
	       <tr>
	       		<td>19:00<br>~<br>19:50</td>
	       		<td>
	       			<select name="mon19" id="mon19" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="tue19" id="tue19" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="wed19" id="wed19" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="thu19" id="thu19" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="fri19" id="fri19" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sat19" id="sat19" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sun19" id="sun19" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>       		
	       </tr>
	       <tr>
	       		<td>20:00<br>~<br>20:50</td>
	       		<td>
	       			<select name="mon20" id="mon20" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="tue20" id="tue20" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="wed20" id="wed20" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select> 
	       		<td>
	       			<select name="thu20" id="thu20" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="fri20" id="fri20" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       			<select name="sat20" id="sat20" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                	</select>
	       		<td>
	       		<select name="sun20" id="sun20" >
                      <c:forEach var="gxlist"  items="${gxlist}">
                          <option value="${gxlist.gx_code }">${gxlist.gx_name}</option> 
                      </c:forEach>    
                </select>        		
	       </tr>
    </tbody>
	</table>
		 <a href="#" onclick="gxinsert.submit()">저장</a>	
 	</form>
<br>
<br>

 
 
 
 
 
 
 
 
 
 
 
 
 
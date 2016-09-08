<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<table border="1" style="width:600px">
	    <caption><a href="<c:url value='/?test=goboot'/>">게시판</a></caption>
	    <colgroup>
	        <col width='12.5%' />	       
	    </colgroup>
	    <thead>
	        <tr>
	        	<th>시간/요일</th>			
	        </tr>
	    </thead>
		    <tbody> 
		    		<tr>
		    			<td colspan="8">오전시간표 </td>		   		 	
	        			<c:out value="${gxlist.ct_name}"/> <c:out value="${gxlist.mon09}"/> 
					</tr> 
			</tbody>
		</table>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<fieldset>
<legend>직원상세보기</legend>
<table border="2">
<tr>
	<td>직원번호 ${dto.stf_num }</td>
	<td rowspan="2"><img src="/fitness/resources/img/Staff/${dto.stf_picture }"></td>
</tr>
<tr>
	<td>직급 	${dto.pos_code }</td>
	
</tr>
<tr>
	<td>이름    ${dto.stf_name }</td>
	<td>전화 	${dto.stf_phone }</td>
</tr>
<tr>
	<td>등록일	${dto.stf_date }</td>
	<td>지점 	${dto.ct_code }</td>
</tr>

</table>


</fieldset>
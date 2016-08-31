<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>직원목록</h1>
<table border="1" >
	<tr>
		<th>직원번호</th>
		<th>직원이름</th>
		<th>전화번호</th>
		<th>직급코드</th>
		<th>지점코드</th>
		<th>가입일</th>
	</tr>
	<c:forEach var="dto" items="${stflist }">
	<tr>
		<td>${dto.stf_num }</td>
		<td><a href="stfdetail?stf_num=${dto.stf_num}">${dto.stf_name }</a></td>
		<td>${dto.stf_phone }</td>
		<td>${dto.pos_code }</td>
		<td>${dto.ct_code }</td>
		<td>${dto.stf_date }</td>
	</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="stflist?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="stflist?pageNum=${i }"><span style="color:#555">[${i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
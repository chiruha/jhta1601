<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0-rc.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.11.3.js"></script>
  <script src="//code.jquery.com/ui/1.12.0-rc.1/jquery-ui.js"></script>
<script type="text/javascript">     
$(document).ready(function(){
	alert("ajax실행!!");
	$("#search").datepicker({//월month 검색
		dateFormat: 'yy/mm/dd'
	});
});
</script>   
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">지점별 총 매출 정보</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>$("#searchMonth").datepicker({//월month 검색
		dateFormat: 'yy/mm/dd'
	});
	<div class="row">

		<div class="col-md-2"></div>
	</div>
<!-- 1. 월별 검색기능 : 날짜선택 -->
<form action="ctsSelect" method="post">
<div class="col-md-12">
	<!-- 환불지점검색하기!!! -->
	<div class="row">
		<div class="col-sm-3">
			<input type="text" placeholder="날짜를 선택하세요(한달)" class="input-sm" size="20" name="searchMonth" id="searchMonth"
		<c:if test="${ddate ne null}">value="${ddate }"</c:if>>
		</div>
		
		<div class="col-sm-2">
			<button class="btn pull-right " id="search" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
</form>	
<!-- 검색내역, List로 뽑아오기 -->
<div class="row">
	<div class="col-md-12">
		<table class="table th">
			<tr>
				<th>지점번호</th>
				<th>월 수입</th>
				<th>월 환불</th>
				<th>총 매출액</th>
			</tr>
			<c:forEach var="dto" items="${aaa }">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
</div>
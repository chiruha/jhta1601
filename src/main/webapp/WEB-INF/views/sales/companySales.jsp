<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	회사 총 매출 계산 = cetertotalsales모두더한 값 - 월급
	1. 날짜 검색해서 cetertotalsales를 list로 div에 뿌린다.
		(cetertotalsales모두더한 값정보를 받아온다(Ajax))
	2. 월급정보를 받아온다(Ajax) - div에 list로 뿌린다.
	4. 1-2의 값을 구한다=회사 총매출
	5. 총 매출 구해서 -> CenterTotalSales 테이블에 insert한다.
	create table companysales(
		comsales_num number(5) primary key,
		center_sales number,
		staff_payment number,
		com_totsales number,
		sales_date date
	);
	create sequence companysales.seq;
 -->
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">지점별 총 매출 계산하기 Income-Refund</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>
	<div class="row">

		<div class="col-md-2"></div>
	</div>
<!-- 1. Income 검색기능 : select 박스 2개 : 지점선택,날짜선택 -->
<div class="col-md-12">
	<!-- 지점검색하기!!! -->
	<div class="row">
		<div class="col-sm-4"> 
			<p >
			<span class="glyphicon glyphicon-plus"></span> Income
			</p>
		</div>
		<div class="col-sm-3"> 
			<select class="select input-sm" id="centerList">
				<option value="default">--center--</option>
			</select>
		</div>
		<div class="col-sm-3">
			<input type="text" placeholder="날짜를 선택하세요(한달)" class="input-sm" size="20" name="searchMonth" id="searchMonth"
		<c:if test="${ddate ne null}">value="${ddate }"</c:if>>
		</div>
		
		<div class="col-sm-2">
			<button class="btn pull-right " id="searchCenter" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
<!-- 1. Income 내용을 div에 뿌린다. -->
<div id="CenterIncomeList"></div>
<!-- 1. Refund 검색기능 : select 박스 2개 : 지점선택,날짜선택 -->
<div class="col-md-12">
	<!-- 지점검색하기!!! -->
	<div class="row">
		<div class="col-sm-4"> 
			<p >
			<span class="glyphicon glyphicon-minus"></span> Refund
			</p>
		</div>
		<div class="col-sm-3"> 
			<select class="select input-sm" id="centerList1">
				<option value="default">--center--</option>
			</select>
		</div>
		<div class="col-sm-3">
			<input type="text" placeholder="날짜를 선택하세요(한달)" class="input-sm" size="20" name="searchMonth1" id="searchMonth1"
		<c:if test="${ddate ne null}">value="${ddate }"</c:if>>
		</div>
		
		<div class="col-sm-2">
			<button class="btn pull-right " id="searchRefund" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
<!-- 1. Refund 내용을 div에 뿌린다. -->
<div id="CenterRefundList"></div>
<!-- 페이징 맨 나중에...-->
<form name="frm" method="post" action="totalSalesInsert" onsubmit="return validator();">
<!-- 환불 총합 구하기 -->

<!-- 한달 총 매출 = 수입 - 환불 -->
</form>	
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function ajaxSeachCenter(mem_num){
	//alert("센터뽑기 도착??"+mem_num);
	$.ajax({
		url:"/fitness/regiRefundCenter/xml",
		data:"mem_num="+mem_num,
		success:function(data){
			$(data).find("ct").each(function(){
			var ct_code=$(this).find("ct_code").text();
			//alert("ct_Code: "+ct_code);
			$("#ct_code").attr("value",ct_code)
			$("#ct_code1").attr("value",ct_code)
			$("#mem_num").attr("value",mem_num);
			$("#mem_num1").attr("value",mem_num);
			});
		}
	});
}
function ajaxSearchRegiRefundMem(pageNum,keyword,memSearch){
	$.ajax({
		url:"/fitness/regiRefundList/xml",
		data:"pageNum="+pageNum+"&keyword="+keyword+"&memSearch="+memSearch,
		success:function(data){
			var div=document.getElementById("memRegiSeachInfo");
			var div2=document.getElementById("regiPaging");
			div.innerHTML="";
			div2.innerHTML="";
			var html="";
			var html2="";
			//회원 등록정보 받아오기
			html+="<div class='col-md-12'>"+
			"<table name='inFrm' class='table th' width='700'>"+
			"<tr>"+
				"<th>등록번호</th>"+
	 			"<th>회원회원번호</th>"+
				"<th>등록유형</th>"+
				"<th>프로그램가격</th>"+
				"<th>락카가격</th>"+
				"<th>운동복가격</th>"+
				"<th>등록일</th>"+
			"</tr>";
			$(data).find("regi").each(function(){
				var len=$(this).find("rg_num").length;
				for(var i=0;i<len;i++){
					var rg_num=$(this).find("rg_num").text();
					var mem_num=$(this).find("mem_num").text();
					var rg_type=$(this).find("rg_type").text();
					var rg_price=$(this).find("rg_price").text();
					var locker_price=$(this).find("locker_price").text();
					var wear_price=$(this).find("wear_price").text();
					var signdate=$(this).find("signdate").text();
					//var ct_code=$(this).find("ct_code").text();
					//alert("ct_code : "+ct_code);
				html += "<tr>"+
							"<td>"+rg_num+"</td>"+
							"<td>"+mem_num+"</td>"+
							"<td>"+rg_type+"</td>"+
							"<td>"+rg_price+"</td>"+
							"<td>"+locker_price+"</td>"+
							"<td>"+wear_price+"</td>"+
							"<td>"+signdate+"</td>"+
							"<td><input type='radio' name='aaa' id='btnSelectProgram' onclick='selectMember("+mem_num+","+rg_num+",\""+rg_type+"\")'></td>"+
						"</tr>";
				}
			});
			html += "</table>";
			html += "</div>";
			//html += "</div>";
			var infoMem=document.createElement("div");
			infoMem.innerHTML=html;
			div.appendChild(infoMem);
			
			//페이징 받아오기
			$(data).find("paging").each(function(){
				var getPageNum=$(this).find("getPageNum").text();
				var getTotalRowCount=$(this).find("getTotalRowCount").text();
				var getRowBlockCount=$(this).find("getRowBlockCount").text();
				var getPageBlockCount=$(this).find("getPageBlockCount").text();
				var getStartPageNum=$(this).find("getStartPageNum").text();
				var getEndPageNum=$(this).find("getEndPageNum").text();
				var getTotalPageCount=$(this).find("getTotalPageCount").text();
				var html2="";
				html2+="<div id='contact' class='container'>";
				html2+="<div class='col-md-12'>";
				html2+="<div class='row'>";
				html2+="<div class='col-sm-4'>";
				if(Number(getStartPageNum)>5){//이전
					html2+="<a href='javascript:ajaxSearchRegiRefundMem("+(Number(getStartPageNum)-1)+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'>prev&nbsp;</a>";
				}else{
					html2+="prev&nbsp;";
				}
				html2+="</div>";
				html2+="<div class='col-sm-4'>";
				for(var i=Number(getStartPageNum);i<=Number(getEndPageNum);i++){//페이징
					if(i==getPageNum){
						html2+="<a href='javascript:ajaxSearchRegiRefundMem("+i+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'><span style='color:blue'>&nbsp;"+i+"&nbsp;</span></a>";
					}else{
						html2+="<a href='javascript:ajaxSearchRegiRefundMem("+i+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'><span style='#555'>&nbsp;"+i+"&nbsp;</span></a>";
					}
				}
				html2+="</div>";
				html2+="<div class='col-sm-4'>";
				//alert("ㅠㅠㅠㅠ/:"+getEndPageNum+","+getTotalPageCount);
				if(Number(getEndPageNum)<Number(getTotalPageCount)){//다음
					//alert("다음?");
					html2+="<a href='javascript:ajaxSearchRegiRefundMem("+(Number(getEndPageNum)+1)+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'>next&nbsp;</a>";
				}else{
					html2+="next&nbsp;";
				}
				html2+="</div>";
				html2+="</div>";
				html2+="</div>";
				html2+="<br>";
				var page=document.createElement("div2");
				page.innerHTML=html2;
				div2.appendChild(page);
			});
		}
	});
}
function selectMember(mem_num,rg_num,rg_type){
	//alert("환불할 회원 선택!! - selectMember: ");
	$("#rg_num").val(rg_num);
	$("#rg_type").val(rg_type);
	$("#rg_num1").val(rg_num);
	$("#rg_type1").val(rg_type);
	ajaxSeachCenter(mem_num);
	if(rg_type=='단과과목'){
		//alert("단과");
		ajaxTypeSimple(rg_num);
	}else if(rg_type=='PT'){
		//alert("PT되나??????");
		ajaxTypePt(rg_num);
	}else if(rg_type=='여러과목'){
		ajaxTypeMulti(rg_num);
	}
}
function ajaxTypeSimple(rg_num){//단과과목 환불할 경우
	//alert("단과과목 ajax로 받아와보자!!!");
	$.ajax({
		url:"/fitness/simpleSelect/xml",
		data:"rg_num="+rg_num,
		success:function(data){
			var div3=document.getElementById("simpleCourse");	
			div3.innerHTML="";
			var html3="";
			$(data).find("simple").each(function(){
				var simple_oneday=$(this).find("simple_oneday").text();
				var rg_num=$(this).find("rg_num").text();
				var mem_num=$(this).find("mem_num").text();
				var pro_name=$(this).find("pro_name").text();
				var pro_code=$(this).find("pro_code").text();
				var pro_signmonth=$(this).find("pro_signmonth").text();
				var pro_regdate=$(this).find("pro_regdate").text();
				var pro_expiration=$(this).find("pro_expiration").text();
				var pro_price=$(this).find("pro_price").text();
				var simple_remnant=$(this).find("simple_remnant").text()
				//alert("단과 data 받아왔나??::simple_remnant:"+simple_remnant);
				//alert("prosignmonth"+pro_signmonth);
				html3 += "<div class='col-md-12'>"+
				"<table name='inFrm' class='table th' width='700'>"+
				"<tr>"+
					"<th>등록번호</th>"+
		 			"<th>회원번호</th>"+
					"<th>단과과목</th>"+
					"<th>단과코드</th>"+
					"<th>단과가격</th>"+
					"<th>등록개월수</th>"+
					"<th>운동시작일</th>"+
					"<th>운동만료일</th>"+
					"<th>단과 총 수업일</th>"+
					"<th>단과 총 잔여일</th>"+
					"<th>선택</th>"+
				"</tr>"+
				"<tr>"+
				"<td>"+rg_num+"</td>"+
				"<td>"+mem_num+"</td>"+
				"<td>"+pro_name+"</td>"+
				"<td>"+pro_code+"</td>"+
				"<td>"+pro_price+"</td>"+
				"<td>"+pro_signmonth+"</td>"+
				"<td>"+pro_regdate+"</td>"+
				"<td>"+pro_expiration+"</td>"+
				"<td>"+simple_oneday+"</td>"+
				"<td>"+simple_remnant+"</td>"+
				"<td><input type='radio' onclick='simpleInfo("+rg_num+",\""+mem_num+"\",\""+simple_remnant+"\",\""+simple_oneday+"\",\""+pro_name+"\",\""+pro_code+"\",\""+pro_price+"\",\""+pro_signmonth+"\",\""+pro_regdate+"\",\""+pro_expiration+"\")'></td>"+
			"</tr>";
			});
			html3 += "</table>";
			html3 += "</div>";
			//html += "</div>";
			var infoSimple=document.createElement("div3");
			//alert("infoSimple"+infoSimple);
			infoSimple.innerHTML=html3;
			div3.appendChild(infoSimple);
		}
	});
}
///ptSelect/xml
function ajaxTypePt(rg_num){//pt환불할 경우
	//alert("pt ajax로 받아와보자!!!");
	$.ajax({
		url:"/fitness/ptSelect/xml",
		data:"rg_num="+rg_num,
		success:function(data){
			var div4=document.getElementById("ptCourse");	
			div4.innerHTML="";
			var html4="";
			$(data).find("pt").each(function(){
				alert("ㅋㅋㅋㅋㅋㅋㅋ되나??");
				var pt_oneday=$(this).find("pt_oneday").text();
				var pt_remnant=$(this).find("pt_remnant").text();
				var rg_num=$(this).find("rg_num").text();
				var mem_num=$(this).find("mem_num").text();
				var pt_code=$(this).find("getPt_code").text();
				var pt_name=$(this).find("getPt_name").text();
				var ptr_count=$(this).find("getPtr_count").text();
				var pt_signmonth=$(this).find("getPt_signmonth").text();
				var ptr_initdate=$(this).find("getPtr_initdate").text();
				var pt_expiration=$(this).find("getPt_expiration").text();
				var pt_price=$(this).find("pt_price").text();
				//alert("pt info 받아왔나??::pt_oneday:"+pt_oneday);
				//alert("pt_signmonth: "+pt_signmonth);
				html4 += "<div class='col-md-12'>"+
				"<table name='inFrm' class='table th' width='700'>"+
				"<tr>"+
					"<th>등록번호</th>"+
		 			"<th>회원번호</th>"+
					"<th>PT코드</th>"+
					"<th>PT과목</th>"+
					"<th>PT가격</th>"+
					"<th>PT횟수</th>"+
					"<th>등록개월수</th>"+
					"<th>운동시작일</th>"+
					"<th>운동만료일</th>"+
					"<th>PT 총 수업일</th>"+
					"<th>PT 총 잔여일</th>"+
					"<th>선택</th>"+
				"</tr>"+
				"<tr>"+
				"<td>"+rg_num+"</td>"+
				"<td>"+mem_num+"</td>"+
				"<td>"+pt_code+"</td>"+
				"<td>"+pt_name+"</td>"+
				"<td>"+pt_price+"</td>"+
				"<td>"+ptr_count+"</td>"+
				"<td>"+pt_signmonth+"</td>"+
				"<td>"+ptr_initdate+"</td>"+
				"<td>"+pt_expiration+"</td>"+
				"<td>"+pt_oneday+"</td>"+
				"<td>"+pt_remnant+"</td>"+
				"<td><input type='radio' onclick='ptInfo("+rg_num+",\""+mem_num+"\",\""+pt_remnant+"\",\""+pt_oneday+"\",\""+pt_price+"\",\""+pt_code+"\",\""+pt_name+"\","+ptr_count+",\""+pt_signmonth+"\",\""+ptr_initdate+"\",\""+pt_expiration+"\")'></td>"+
			"</tr>";
			});
			html4 += "</table>";
			html4 += "</div>";
			//html += "</div>";
			var infoPt=document.createElement("div4");
			//alert("infoPt"+infoPt);
			infoPt.innerHTML=html4;
			div4.appendChild(infoPt);
		}
	});
}
function ajaxTypeMulti(rg_num){//여러과목 선택한 경우
	$.ajax({
		url:"/fitness/multiSelect/xml",
		data:"rg_num="+rg_num,
		success:function(data){
			var div5=document.getElementById("multiCourse");
			div5.innerHTML="";
			var html5="";
			//////pt정보, 단과 정보 모두 받아오기
			//alert("111111111111111111여러과목 되나??");
			html5 += "<div class='col-md-12'>"+
			"<table name='inFrm' class='table th' width='700'>"+
			"<tr>"+
				"<th>등록번호</th>"+
	 			"<th>회원번호</th>"+
	 			"<th>단과과목</th>"+
	 			"<th>단과코드</th>"+
	 			"<th>단과가격</th>"+
	 			"<th>등록개월수</th>"+
	 			"<th>단과운동시작일</th>"+
	 			"<th>단과운동만료일</th>"+
	 			"<th>단과총수업일</th>"+
	 			"<th>단과잔여일</th>"+
				"<th>PT과목</th>"+
				"<th>PT코드</th>"+
				"<th>PT가격</th>"+
				"<th>PT횟수</th>"+
				"<th>등록개월수</th>"+
				"<th>PT운동시작일</th>"+
				"<th>PT운동만료일</th>"+
				"<th>PT총수업일</th>"+
				"<th>PT잔여일</th>"+
				"<th>선택</th>"+
			"</tr>";
			$(data).find("multi").each(function(){
				//alert("여러과목 되나??");
				var simple_remnant=$(this).find("simple_remnant").text();
				var pt_remnant=$(this).find("pt_remnant").text();
				var simple_oneday=$(this).find("simple_oneday").text();
				var pt_oneday=$(this).find("pt_oneday").text();
				var rg_num=$(this).find("rg_num").first().text();
				var mem_num=$(this).find("mem_num").first().text();
				var pro_name=$(this).find("pro_name").text();
				var pro_code=$(this).find("pro_code").text();
				var pro_signmonth=$(this).find("pro_signmonth").text();
				var pro_regdate=$(this).find("pro_regdate").text();
				var pro_expiration=$(this).find("pro_expiration").text();
				var pt_code=$(this).find("getPt_code").text();
				var pt_name=$(this).find("getPt_name").text();
				var ptr_count=$(this).find("getPtr_count").text();
				var pt_signmonth=$(this).find("getPt_signmonth").text();
				var ptr_initdate=$(this).find("getPtr_initdate").text();
				var pt_expiration=$(this).find("getPt_expiration").text();
				var pt_price=$(this).find("pt_price").text();
				var pro_price=$(this).find("pro_price").text();
				//alert("rg_num"+rg_num);
				//alert("pro_signmonth 받아왔나??::pt_expiration:"+pro_signmonth);
				//alert("pt_signmonth: "+pt_signmonth);
				html5 +=
				"<tr>"+
				"<td>"+rg_num+"</td>"+
				"<td>"+mem_num+"</td>"+
				"<td>"+pro_name+"</td>"+
				"<td>"+pro_code+"</td>"+
				"<td>"+pro_price+"</td>"+
				"<td>"+pro_signmonth+"</td>"+
				"<td>"+pro_regdate+"</td>"+
				"<td>"+pro_expiration+"</td>"+
				"<td>"+simple_oneday+"</td>"+
				"<td>"+simple_remnant+"</td>"+
				"<td>"+pt_code+"</td>"+
				"<td>"+pt_name+"</td>"+
				"<td>"+pt_price+"</td>"+
				"<td>"+ptr_count+"</td>"+
				"<td>"+pt_signmonth+"</td>"+
				"<td>"+ptr_initdate+"</td>"+
				"<td>"+pt_expiration+"</td>"+
				"<td>"+pt_oneday+"</td>"+
				"<td>"+pt_remnant+"</td>"+
				"<td><input type='radio' onclick='multiInfo("+rg_num+",\""+mem_num+"\",\""+simple_remnant+"\",\""+pt_remnant+"\",\""+simple_oneday+"\",\""+pt_oneday+"\",\""+pro_price+"\",\""+pt_price+"\",\""+pro_name+"\",\""+pro_code+"\",\""+pro_signmonth+"\",\""+pro_regdate+"\",\""+pro_expiration+"\",\""+pt_code+"\",\""+pt_name+"\","+ptr_count+",\""+pt_signmonth+"\",\""+ptr_initdate+"\",\""+pt_expiration+"\")'></td>"+
			"</tr>";
			});
			html5 += "</table>";
			html5 += "</div>";
			//html += "</div>";
			var infoMulti=document.createElement("div5");
			//alert("infoMulti"+infoMulti);
			infoMulti.innerHTML=html5;
			div5.appendChild(infoMulti);
		}
	});
}
function simpleInfo(rg_num,mem_num,simple_remnant,simple_oneday,pro_name,pro_code,pro_price,pro_signmonth,pro_regdate,pro_expiration){
	//$("#simple_oneday").val(simple_oneday);
	$("#pro_name").val(pro_name);
	$("#pro_code").val(pro_code);
	$("#pro_price").val(pro_price);
	$("#pro_signmonth").val(pro_signmonth);
	$("#pro_regdate").val(pro_regdate);
	$("#pro_expiration").val(pro_expiration);
	alert("단과 총 잔여일 수 넘어왔나??: "+simple_remnant);
	//계산을 하자. 계산한 가격을 총 환불금액에 붙여준다.
	//하루치 수업료 = 총프로그램가격 / 등록일수(총수업일수)
	var onedayMoney=Number(pro_price)/Number(simple_oneday);
	//환불액 = (운동만료일 - 오늘날짜:잔여일) * 하루치수업료 * 0.9
	var simpleRefund=Number(simple_remnant)*Number(onedayMoney)*0.9;
	var simpleRefundPrice=Math.floor(simpleRefund);
	//alert("단과 환불금액 : "+simpleRefundPrice);
	$("#tot_price").attr("value",simpleRefundPrice);
	$("#tot_price1").attr("value",simpleRefundPrice);
}
function ptInfo(rg_num,mem_num,pt_remnant,pt_oneday,pt_price,pt_code,pt_name,ptr_count,pt_signmonth,ptr_initdate,pt_expiration){
	$("#pt_price").val(pt_price);
	$("#pt_code").val(pt_code);
	$("#pt_name").val(pt_name);
	$("#ptr_count").val(ptr_count);
	$("#pt_signmonth").val(pt_signmonth);
	$("#ptr_initdate").val(ptr_initdate);
	$("#pt_expiration").val(pt_expiration);
	//alert("PT 총잔여일 넘어왔나??: "+pt_remnant);
	//하루치 수업료 = 총프로그램가격 / (총PT횟수)
	var onedayMoney=Number(pt_price)/Number(pt_oneday);
	//환불액 = (운동만료일 - 오늘날짜:잔여일) * 하루치수업료 * 0.9
	var ptRefund=Number(pt_remnant)*Number(onedayMoney)*0.9;
	var ptRefundPrice=Math.floor(ptRefund);
	//alert("PT 환불금액 : "+ptRefundPrice);
	$("#tot_price").attr("value",ptRefundPrice);
	$("#tot_price1").attr("value",ptRefundPrice);
}
function multiInfo(rg_num,mem_num,simple_remnant,pt_remnant,simple_oneday,pt_oneday,pro_price,pt_price,pro_name,pro_code,pro_signmonth,pro_regdate,pro_expiration,pt_code,pt_name,ptr_count,pt_signmonth,ptr_initdate,pt_expiration){
	//alert("멀티로 왔나??:simple_oneday:"+simple_oneday);
	//alert("멀티로 왔나??:pt_oneday:"+pt_oneday);
	//alert("멀티로 왔나??:simple_remnant:"+simple_remnant);
	//alert("멀티로 왔나??:pt_remnant:"+pt_remnant);
	$("#pro_price").val(pro_price);
	$("#pt_price").val(pt_price);
	$("#pro_name").val(pro_name);
	$("#pro_code").val(pro_code);
	$("#pro_signmonth").val(pro_signmonth);
	$("#pro_regdate").val(pro_regdate);
	$("#pro_expiration").val(pro_expiration);
	$("#pt_code").val(pt_code);
	$("#pt_name").val(pt_name);
	$("#ptr_count").val(ptr_count);
	$("#pt_signmonth").val(pt_signmonth);
	$("#ptr_initdate").val(ptr_initdate);
	$("#pt_expiration").val(pt_expiration);
	//계산을 하자. 계산한 가격을 총 환불금액에 붙여준다.
	//여러과목인 경우, 단과는 10%할인된 금액으로 판매했으므로, 10%할인된 프로그램가격으로 구한다.
	//하루치 수업료 = 총프로그램가격 / 등록일수(총수업일수)
	var discountPrice=Number(pro_price)*0.9;
	var onedaySimpleMoney=Number(discountPrice)/Number(simple_oneday);
	var onedayPtMoney=Number(pt_price)/Number(pt_oneday);
	//alert("단과하루치수업료: "+onedaySimpleMoney);
	//alert("PT하루치수업료: "+onedayPtMoney);
	//환불액 = (운동만료일 - 오늘날짜:잔여일) * 하루치수업료 * 0.9
	var simpleRefund=Number(simple_remnant)*Number(onedaySimpleMoney)*0.9;
	var ptRefund=Number(pt_remnant)*Number(onedayPtMoney)*0.9;
	//alert("ptRefund: "+ptRefund);
	var simpleRefundPrice=Math.floor(simpleRefund);
	var ptRefundPrice=Math.floor(ptRefund);
	var multiTotal=Number(simpleRefundPrice)+(ptRefundPrice);
	//alert("단과과목 환불금액 : "+simpleRefundPrice);
	//alert("PT과목 환불금액 : "+ptRefundPrice);
	//alert("여러과목 환불금액 : "+multiTotal);
	$("#tot_price").attr("value",multiTotal);
	$("#tot_price1").attr("value",multiTotal);
}
$(document).ready(function(){
	//alert("ajax실행!!");
	$("#searchMember").click(function(){
		//alert("회원검색클릭!!");
		keyword=$("#keyword").val();
		memSearch=$("#memSearch").val();
		//alert("keyword: "+keyword);
		//alert("memSearch: "+memSearch);
		ajaxSearchRegiRefundMem(1,keyword,memSearch);
	});
	$("#btn").click(function(){
		//alert("버튼클릭");
	});
});

</script>
   <!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">회원 환불 계산하기</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>
	<div class="row">

		<div class="col-md-2"></div>
<!-- 
	1. 회원 등록 목록(table:registration)을 Ajax로 뽑아온다. 해당내용을 <div>에 뿌린다.
	2. 등록유형을 선택(단과,PT,복합)을 선택하면 파라미터로 rg_type이 넘어가서 ajax를 통해서
		- programprice/prosign/properiod
		- ptprice/ptsign/ptperiod
		테이블에서 정보를 뽑아온 후, div에 뿌린다.
	3. 뿌려진 내용을 계산한다.(함수로)
	4. name속성을 이용하여 post방식으로 보내서 refund테이블에 집어넣는다.
 -->
<!-- 2. 검색기능 : 회원번호/이름/전화 -->
<div class="col-md-12">
	<!-- 회원정보검색하기!!! -->
	<div class="row">
		<div class="col-sm-6"> 
			<p >
			<span class="glyphicon glyphicon-search"></span> Search for Member's Registration Information
			</p>
		</div>
		<div class="col-sm-2"> 
			<select class="select input-sm" id="memSearch">
				<option value="default">--검색조건--</option>
				<option value="mem_num">회원번호</option>
				<option value="mem_name">이름</option>
				<option value="mem_phone">전화</option>
			</select>
		</div>
		<div class="col-sm-2">
			<input type="text" class="input-sm" size="10" name="keyword" id="keyword">
		</div>
		<div class="col-sm-2">
			<button class="btn pull-right " id="searchMember" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
<!-- 1. 검색정보 div에 뿌린다.(table: registration) -->
<div id="memRegiSeachInfo"></div>
<div id="regiPaging"></div>
<!-- 2. 등록유형을 선택(단과,PT,복합)을 선택하면 파라미터로 rg_type이 넘어가서  ajax를 통해서 정보를 뽑아온 후, div에 뿌린다. -->
<div id="simpleCourse"></div>
<div id="ptCourse"></div>
<div id="multiCourse"></div>
<br>
<!-- 5.insert하기 -->
<form name="frm" method="post" action="RefundSeongjinInsert" onsubmit="return validator();">

<div class="col-md-12">
	<p >
		<span class="glyphicon glyphicon-pencil"></span> Total Price
	</p>


<span class="glyphicon glyphicon-file"></span> 환불할 회원정보
<input type="text" placeholder="회원번호" class="form-control" disabled="disabled" id="mem_num"><input type="hidden" id="mem_num1" name="mem_num">
<input type="text" placeholder="등록번호" class="form-control" disabled="disabled" id="rg_num"><input type="hidden"id="rg_num1" name="rg_num">
<input type="text" placeholder="등록유형" class="form-control" disabled="disabled" id="rg_type"><input type="hidden" id="rg_type1" name="rg_type">
<input type="text" placeholder="총 환불 금액" class="form-control" disabled="disabled" id="tot_price"><input type="hidden" name="refund_price" id="tot_price1">
<input type="text" placeholder="지점코드" class="form-control" disabled="disabled" id="ct_code"><input type="hidden" name="ct_code" id="ct_code1">
<br>
<div class="row">
		<div class="col-md-6">
			<button class="btn pull-right" type="submit">
			<span class="glyphicon glyphicon-ok"></span>  환불신청 </button>
		</div>
		<div class="col-md-6">
			<button class="btn pull-left"type="reset">
			<span class="glyphicon glyphicon-remove"></span>  취소 </button>
		</div>
	</div>
</div>
</form>
<!-- 단과선택한 경우 -->
<div id="emptySimple">
<input type="hidden" placeholder="단과코드" class="input-sm" size="10" id="pro_code">
<input type="hidden" placeholder="단과과목명" class="input-sm" size="10" id="pro_name">
<input type="hidden" placeholder="단과가격" class="input-sm" size="10" id="pro_price">
<input type="hidden" placeholder="등록개월수" class="input-sm" size="10" id="pro_signmonth">
<input type="hidden" placeholder="운동시작일" class="input-sm" size="10" id="pro_regdate">
<input type="hidden" placeholder="운동만료일" class="input-sm" size="10" id="pro_expiration">
</div>
<!-- pt선택한 경우 -->
<div id="emptyPt">
<input type="hidden" placeholder="PT코드" class="input-sm" size="10" id="pt_code">
<input type="hidden" placeholder="PT과목명" class="input-sm" size="10" id="pt_name">
<input type="hidden" placeholder="PT가격" class="input-sm" size="10" id="pt_price">
<input type="hidden" placeholder="PT횟수" class="input-sm" size="10" id="ptr_count">
<input type="hidden" placeholder="PT등록일" class="input-sm" size="10" id="pt_signmonth">
<input type="hidden" placeholder="PT시작" class="input-sm" size="10" id="ptr_initdate">
<input type="hidden" placeholder="PT만료일" class="input-sm" size="10" id="pt_expiration">
</div>	
</div>
</div>

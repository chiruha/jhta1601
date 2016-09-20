<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
 --%>
<script type="text/javascript">
function memList(mem_num){
	$("#attachMemNum").val(mem_num);
	$("#attachMemNum1").val(mem_num);
}
var keyword="";
var memSearch="";
function ajaxSearchMem(pageNum,memSearch,keyword){
	//alert("검색버튼 클릭!!!!");
	$.ajax({
		url:"/fitness/memlist/xml",
		data:"pageNum="+pageNum+"&keyword=" + keyword+"&memSearch=" + memSearch,
		success:function(data){
			var div=document.getElementById("memInformation");
			var div2=document.getElementById("answerPaging");
			div.innerHTML="";
			div2.innerHTML="";
			//alert("어디까지왔나?"+data);
			$(data).find("paging").each(function(){//페이징처리
				var getPageNum=$(this).find("getPageNum").text();
				var getTotalRowCount=$(this).find("getTotalRowCount").text();
				var getRowBlockCount=$(this).find("getRowBlockCount").text();
				var getPageBlockCount=$(this).find("getPageBlockCount").text();
				var getStartPageNum=$(this).find("getStartPageNum").text();
				var getEndPageNum=$(this).find("getEndPageNum").text();
				var getTotalPageCount=$(this).find("getTotalPageCount").text();
				var html2="";
				for(var i=getStartPageNum;i<=getEndPageNum;i++){
					if(i==getPageNum){
						html2="<a href='javascript:ajaxSearchMem("+i+",\""+memSearch+"\",\""+keyword+"\")'><span style='color:blue'>["+i+"]</span></a>";
					}else{
						html2="<a href='javascript:ajaxSearchMem("+i+",\""+memSearch+"\",\""+keyword+"\")'><span style='#555'>["+i+"]</span></a>";
					}
					var page=document.createElement("div2");
					page.innerHTML=html2;
					div2.appendChild(page);
				}				
			});
			$(data).find("mem").each(function(){//회원정보 받아오기
				var html="";
				var len=$(this).find("mem_num").length;
				var html="<table class='table-bordered' width='300'>"+
				"<tr>"+
					"<th>회원번호</th>"+
		 			"<th>회원이름</th>"+
					"<th>전화번호</th>"+
					"<th>선택</th>"+
				"</tr>";
				for(var i=0;i<len;i++){
					var mem_num=$(this).find("mem_num").text();
					var mem_name=$(this).find("mem_name").text();
					var mem_phone=$(this).find("mem_phone").text();	
				html += "<tr>"+
							"<td><input type='text' name='mem_num' value='"+mem_num+"' id='mem_num'></td>"+
							"<td><input type='text' name='mem_name' value='"+mem_name+"' id='mem_name'></td>"+
							"<td><input type='text' name='mem_phone' value='"+mem_phone+"' id='mem_phone'></td>"+
							"<td><input type='button' value='선택' id='btnSelectMemNum' onclick='memList("+mem_num+")'></td>"+
						"</tr>";
				}
				html += "</table>";
				var infoMem=document.createElement("div");
				infoMem.innerHTML=html;
				div.appendChild(infoMem);
			});
		}
	});
}
$(document).ready(function(){
	//alert("Ajax실행");
	$("#searchMem").click(function(){
		memSearch=$("#memSearch").val();
		keyword=$("#keyword").val();
		//alert("keyword: "+keyword);
		//alert("memSearch: "+memSearch);
		ajaxSearchMem(1,memSearch,keyword);//회원검색 ajax호출하기
	});
	$("#btnSelectMemNum").click(function(){
		var searchNum=$("#mem_num").val();
		//alert("mem_num"+searchNum);
		$("#attachMemNum").val(searchNum);
	});
	$("#simple_subject").click(function(){//단과과목 클릭!!
		//alert("단과과목 클릭!!");
		$("#rg_price").val(0);
		$("#rg_price1").val(0);
		$("#programPrice").empty();
		$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#PTProgramName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#proName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("ptName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#programName").empty();

		$("#programName").append("<option value='default'>---프로그램선택---</option>");
		$("#PTProgramName").append("<option value='default'>---프로그램선택---</option>");
		$("#proName").append("<option value='default'>---단과선택---</option>");
		$("#ptName").append("<option value='default'>---PT선택---</option>");
		$.ajax({
			url:"/fitness/list/xml",
			success:function(data){
				$(data).find("pro").each(function(){
					var pro_num=$(this).find("pro_num").text();
					var pro_code=$(this).find("pro_code").text();
					var pro_name=$(this).find("pro_name").text();
					var pro_signmonth=$(this).find("pro_signmonth").text();
					var pro_price=$(this).find("pro_price").text();
					$("#programName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");						
				});
			}
		});
		simpleClick();//라디오버튼 단과과목 선택 시 함수 호출
	});
	function simpleClick(){
		proSum.style.display="none";//여러과목 총합계산 숨기기
		PTProgramName.style.display="none";//pt selectBox 숨기기
		proName.style.display="none";//여러과목 선택시 단과과목 selectBox 숨기기
		ptName.style.display="none";//여러과목 선택시 pt과목 selectBox 숨기
		programName.style.display="block";//단과과목 selectBox 보이기
	}
	$("#pt_subject").click(function(){//PT과목 클릭!!
		//alert("PT과목 클릭!!");
		$("#rg_price").val(0);
		$("#rg_price1").val(0);
		$("#programPrice").empty();
		$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#PTProgramName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#proName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#ptName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#programName").empty();

		$("#programName").append("<option value='default'>---프로그램선택---</option>");
		$("#PTProgramName").append("<option value='default'>---프로그램선택---</option>");
		$("#proName").append("<option value='default'>---단과선택---</option>");
		$("#ptName").append("<option value='default'>---PT선택---</option>");
		$.ajax({
			url:"/fitness/ptlist/xml",
			success:function(data){
				$(data).find("pt").each(function(){
					var pt_num=$(this).find("pt_num").text();
					var pt_code=$(this).find("pt_code").text();
					var pt_name=$(this).find("pt_name").text();
					var ptr_count=$(this).find("ptr_count").text();
					var pt_signmonth=$(this).find("pt_signmonth").text();
					var pt_price=$(this).find("pt_price").text();
					$("#PTProgramName").append("<option value'"+pt_name+"'>"+pt_name+"</option>");
				});
			}
		});
		ptClick();//라디오버튼 pt과목 선택 시 함수 호출
	});
	function ptClick(){
		proSum.style.display="none";//여러과목 총합계산 숨기기
		programName.style.display="none";//단과과목 selectBox 숨기기
		proName.style.display="none";//여러과목 선택시 단과과목 selectBox 숨기기
		ptName.style.display="none";//여러과목 선택시 pt과목 selectBox 숨기기
		PTProgramName.style.display="block";//PT선택 시 selectBox 보이기
	}
	$("#multiple_subject").click(function(){//여러과목 클릭!!
		//alert("여러과목 클릭!!");
		$("#rg_price").val(0);
		$("#rg_price1").val(0);
		$("#programPrice").empty();
		$("#programName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#PTProgramName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#proName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#ptName").empty();//안에 있는 내용(모든자식요소들)지우기
		$("#programName").append("<option value='default'>---프로그램선택---</option>");
		$("#PTProgramName").append("<option value='default'>---프로그램선택---</option>");
		$("#proName").append("<option value='default'>---단과선택---</option>");
		$("#ptName").append("<option value='default'>---PT선택---</option>");
		$.ajax({
			url:"/fitness/list/xml",
			success:function(data){
				//alert("잘되나?" +data);
				$(data).find("pro").each(function(){
					var pro_num=$(this).find("pro_num").text();
					var pro_code=$(this).find("pro_code").text();
					var pro_name=$(this).find("pro_name").text();
					var pro_subname=$(this).find("pro_subname").text();
					var pro_price=$(this).find("pro_price").text();
					var pro_signmonth=$(this).find("pro_signmonth").text();
					$("#proName").append("<option value='"+ pro_name+"'>"+ pro_name +"</option>");						
				});
			}
		});
		$.ajax({
			url:"/fitness/ptlist/xml",
			success:function(data){
				$(data).find("pt").each(function(){
					var pt_num=$(this).find("pt_num").text();
					var pt_code=$(this).find("pt_code").text();
					var pt_name=$(this).find("pt_name").text();
					var ptr_count=$(this).find("ptr_count").text();
					var pt_price=$(this).find("pt_price").text();
					var pt_signmonth=$(this).find("pt_signmonth").text();
					$("#ptName").append("<option value'"+pt_name+"'>"+pt_name+"</option>");
				});
			}
		});
		multiClick();//라디오버튼 여러과목 선택 시 관련없는 input box사라지는 함수 호출
	});
	function multiClick(){
		programName.style.display="none";//단과과목 selectBox 숨기기
		PTProgramName.style.display="none";//pt selectBox 숨기기
		proName.style.display="block";//여러과목 selectBox 보이기
		ptName.style.display="block";//여러과목 selectBox 보이기
		proSum.style.display="block";//여러과목 총합계산 보이기
	}
	$("#btn").click(function(){
		var num1=$("#simplePrice").val();//단과과목 값 얻어오기
		var num2=$("#ptSelectPrice").val();//PT과목 값 얻어오기
		var saleNum1=Number(num1)*0.9;//단과과목 10%할인 값 구하기
		var resultSum=Number(saleNum1)+Number(num2);
		$("#rg_price").val(resultSum);
		$("#rg_price1").val(resultSum);
	});
	$("#locYes").click(function(){
		var price=10000;
		$("#locker_price").val(price);	
	});
	$("#locNo").click(function(){
		var price=0;
		$("#locker_price").val(price);
	});
	$("#wearYes").click(function(){
		var price=10000;
		$("#wear_price").val(price);
	});
	$("#wearNo").click(function(){
		var price=0;
		$("#wear_price").val(price);
	});
	$("#signTotPrice").click(function(){
		var programPrice=$("#rg_price").val();
		var programPrice=$("#rg_price1").val();
		var locPrice=$("#locker_price").val();
		var wearPrice=$("#wear_price").val();
		var totPrice=Number(programPrice)+Number(locPrice)+Number(wearPrice);
		$("#totSignPrice").val(totPrice);
		$("#totSignPrice1").val(totPrice);
	});
});
	// 단과과목 가격을  id="programPrice"에 집어넣기 
	function priceChange(pro_name){
		//alert(".."+pro_name);
		$("#programPrice").empty();
		//alert("과목선택하면 가격떠야함");
		$.ajax({
			url:"/fitness/proprice/xml?pro_name="+pro_name,
			success:function(data){
				$(data).find("proprice").each(function(){
					var pro_num=$(this).find("pro_num").text();
					var pro_code=$(this).find("pro_code").text();
					var pro_name=$(this).find("pro_name").text();
					var pro_signmonth=$(this).find("pro_signmonth").text();
					var pro_price=$(this).find("pro_price").text();
					//alert("num: "+pro_num+" code: "+pro_code+" name: "+pro_name+" price: "+pro_price);
					$("#rg_price").val(pro_price);	
					$("#rg_price1").val(pro_price);	
					$("#pro_code").val(pro_code);
					$("#pt_code").val(null);
					$("#ptr_count").val(0);
					$("#pro_signmonth").val(pro_signmonth);
					$("#pt_signmonth").val(0);
					$("#pro_name").val(pro_name);
					$("#pt_name").val(null);
				});
			}
		});
	}
	function ptPriceChange(pt_name){
		//alert("..ptPrice: "+pt_name);
		$("#programPrice").empty();
		$.ajax({
			url:"/fitness/ptprice/xml?pt_name="+pt_name,
			success:function(data){
				$(data).find("ptprice").each(function(){
					//alert("pt는 어디까지 되나??"+pt_name);
					var pt_num=$(this).find("pt_num").text();
					var pt_code=$(this).find("pt_code").text();
					var pt_name=$(this).find("pt_name").text();
					var pt_price=$(this).find("pt_price").text();
					var pt_signmonth=$(this).find("pt_signmonth").text();
					var ptr_count=$(this).find("ptr_count").text();
					$("#rg_price").val(pt_price);
					$("#rg_price1").val(pt_price);
					$("#pt_code").val(pt_code);
					$("#ptr_count").val(ptr_count);
					$("#pro_code").val(null);
					$("#pt_signmonth").val(pt_signmonth);
					$("#pro_signmonth").val(0);
					$("#pt_name").val(pt_name);
					$("#pro_name").val(null);
				});
			}
		});
	}
	//복합과목
	function simpleSelect(pro_name){//단과과목선택 시
		//alert(".."+pro_name);
		$("#programPrice").empty();
		//alert("과목선택하면 가격떠야함");
		$.ajax({
			url:"/fitness/proprice/xml",
			data:"pro_name="+pro_name,
			success:function(data){
				$(data).find("proprice").each(function(){
					var pro_num=$(this).find("pro_num").text();
					var pro_code=$(this).find("pro_code").text();
					var pro_name=$(this).find("pro_name").text();
					var pro_signmonth=$(this).find("pro_signmonth").text();
					var pro_price=$(this).find("pro_price").text();
					$("#simplePrice").val(pro_price);		
					$("#pro_code").val(pro_code);
					$("#pro_signmonth").val(pro_signmonth);
					$("#pro_name").val(pro_name);
				});
			}
		});
	}
	function ptSelect(pt_name){//pt과목 선택 시
		$("#programPrice").empty();
		$.ajax({
			url:"/fitness/ptprice/xml?pt_name="+pt_name,
			success:function(data){
				$(data).find("ptprice").each(function(){
					//alert("pt는 어디까지 되나??"+pt_name);
					var pt_num=$(this).find("pt_num").text();
					var pt_code=$(this).find("pt_code").text();
					var pt_name=$(this).find("pt_name").text();
					var pt_price=$(this).find("pt_price").text();
					var pt_signmonth=$(this).find("pt_signmonth").text();
					var ptr_count=$(this).find("ptr_count").text();
					$("#ptSelectPrice").val(pt_price);
					$("#pt_code").val(pt_code);
					$("#ptr_count").val(ptr_count);
					$("#pt_signmonth").val(pt_signmonth);
					$("#pt_name").val(pt_name);
				});
			}
		});
	}
////////////--유효성검사--////////////
	function validator(){
		alert("유효성검사!!");
		var mem_num=document.frm.mem_num;
		alert("mem_num"+mem_num);
		if(mem_num.value.length<=0){
			alert("등록할 회원번호를 입력하세요.");
			return false;
		}
		var rg_type=document.frm.rg_type;
		var cnt=0;
		for(var t=0;t<rg_type.length;t++){
			if(rg_type[t].checked==true){
				cnt++;
			}
		}
		if(cnt==0){
			alert("등록유형을 선택해주세요.");
			return false;
		}
		var rg_price=document.frm.rg_price;
		alert("rg_price"+rg_price);
		if(rg_price.value.length<2){
			alert("프로그램을 선택하세요.");
			return false;
		}
		var locker_price=document.frm.locker_price;
		if(locker_price.value.length<=0){
			alert("락카 신청여부를 확인해주세요.");
			return false;
		}
		var wear_price=document.frm.wear_price;
		if(wear_price.value.length<=0){
			alert("운동복 신청여부를 확인해주세요.");
			return false;
		}
		var totPrice=document.frm.totPrice;
		if(totPrice.value.length<1){
			alert("총 등록금액을 확인해주세요.");
			return false;
		}
		return true;//submit하기
	}
</script>
<h1>회원 수강등록(프로그램등록)하기!!</h1>
<!-- 회원 검색하기!!! -->
회원검색 : 
<select id="memSearch">
	<option value="mem_num">회원번호</option>
	<option value="mem_name">이름</option>
	<option value="mem_phone">전화</option>
</select>
<input type="text" name="keyword" id="keyword">
<input type="button" value="회원검색" id="searchMem">

<!-- 검색된 정보 뿌려주기는 여기에다가 안된다고 함...위에다가 써서 div에 뿌려줘야함... -->
<div id="memInformation"></div>		
<!-- 페이징도 마찬가지로 위에다가 써서 div에 뿌려주기 -> 회원번호 선택하면 아래의 input type="text"에 회원번호 자동입력 -->
<div id="answerPaging"></div>

<form name="frm" method="post" action="regiInsert1" onsubmit="return validator();">
<!-- 회원번호를 select해서 input="text"에 집어넣기!! -->
<table class="table-bordered" width="1000">
	<tr>
		<th>회원번호</th>
		<td colspan="2"><input type="text" disabled="disabled" id="attachMemNum"><input type="hidden" name="mem_num" id="attachMemNum1"></td>
	</tr>
	<tr>
		<th>등록유형</th>
		<td colspan="2">
			<input type="radio" value="단과과목" name="rg_type" id="simple_subject">단과과목
			<input type="radio" value="PT" name="rg_type" id="pt_subject">PT
			<input type="radio" value="여러과목" name="rg_type" id="multiple_subject">복합과목
		</td>
	</tr>
	<tr>
		<th>프로그램선택</th>
		<td colspan="2">
			<!-- 단과과목 프로그램 선택 -->
			<select id="programName" onchange="priceChange(this.value)" style="display: none">
				<option value="default">---프로그램선택---</option>
			</select>
			<!-- pt프로그램 선택 -->
			<select id="PTProgramName" onchange="ptPriceChange(this.value)" style="display: none">
				<option value="default">---프로그램선택---</option>
			</select>
			<!-- 여러과목 프로그램 선택 -->
			<select id="proName" onchange="simpleSelect(this.value)" style="display: none">
				<option value="default">---단과선택---</option>
			</select>
			<select id="ptName" onchange="ptSelect(this.value)" style="display: none">
				<option value="default">---PT선택---</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>프로그램가격</th>
		<td colspan="2">
			<div id="proSum" style="display: none">
				단과 가격 : <input type="text" disabled="disabled" id="simplePrice"><input type="hidden" id="simplePrice">
				
				+ PT 가격 : <input type="text" disabled="disabled" id="ptSelectPrice"><input type="hidden" id="ptSelectPrice">
				<br>
				= <input type="button" value="가격계산" id="btn">(단과과목 10% 할인)
			</div>
			<!-- 총 프로그램가격rg_price -->
			<input type="text" disabled="disabled" id="rg_price"><input type="text" name="rg_price" id="rg_price1">
		</td>
	</tr>
	<tr>
		<th>락카</th>
		<td>
			<input type="radio" value="신청" id="locYes">신청
			<input type="radio" value="신청안함" id="locNo">신청안함
		</td>
		<td>
			가격 : <input type="text" name="locker_price" id="locker_price">
		</td>
	</tr>
	<tr>
		<th>운동복</th>
		<td>
			<input type="radio" value="신청" id="wearYes">신청
			<input type="radio" value="신청안함" id="wearNo">신청안함
		</td>
		<td>
			가격 : <input type="text" name="wear_price" id="wear_price">
		</td>
	</tr>
	<tr>
		<th>총 등록금액</th>
		<td colspan="2">
			<input type="button" value="총 등록가격 계산" id="signTotPrice">
			<input type="text" disabled="disabled" id="totSignPrice"><input type="text"  name="totPrice" id="totSignPrice1">
		</td>
	</tr>
</table>
<!-- //////////프로그램을 선택하면 아래에 등록개월수가 input됨///////////style="display: none" -->
<input type="hidden" name="pro_signmonth" id="pro_signmonth">
<input type="hidden" name="pt_signmonth" id="pt_signmonth">
<!-- //////////등록한 프로그램코드 및 pt횟수 받아와서 보내주기/////////// -->
<input type="hidden" name="pro_name" id="pro_name">
<input type="hidden" name="pt_name" id="pt_name">
<input type="hidden" name="pro_code" id="pro_code">
<input type="hidden" name="pt_code" id="pt_code">
<input type="hidden" name="ptr_count" id="ptr_count">

<input type="submit" value="프로그램신청">
<input type="reset" value="취소">
</form>
<style>
	table th td {boder=1px solid black;}
</style>
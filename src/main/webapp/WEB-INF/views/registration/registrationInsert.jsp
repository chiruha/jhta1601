<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
 --%>
<script type="text/javascript">
function memList(mem_num){//체크박스를 라디오버튼처럼 동작하기
	$("#attachMemNum").val(mem_num);
	$("#attachMemNum1").val(mem_num);
}

var keyword="";
var memSearch="";
function ajaxSearchMem(pageNum,memSearch,keyword){
	//alert("검색버튼 클릭!!!!");
	//alert("memSearch: "+memSearch);
	//alert("pageNum: "+pageNum);	
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
				//alert("getPageNum:"+getPageNum);
				//alert("getTotalRowCount:"+getTotalRowCount);
				//alert("getRowBlockCount:"+getRowBlockCount);
				//alert("getPageBlockCount:"+getPageBlockCount);
				//alert("getStartPageNum:"+getStartPageNum);
				//alert("getTotalPageCount : "+getTotalPageCount);
				//alert("getEndPageNum : "+getEndPageNum);
				var html2="";
				html2+="<div id='contact' class='container'>";
				html2+="<div class='col-md-12'>";
				html2+="<div class='row'>";
				html2+="<div class='col-sm-4'>";
				if(Number(getStartPageNum)>5){//이전
					alert("1getStartPageNum: "+getStartPageNum);
					alert("1getEndPageNum: "+getEndPageNum);
					alert("1getTotalPageCount: "+getTotalPageCount);
					html2+="<a href='javascript:ajaxSearchMem("+(Number(getStartPageNum)-1)+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'>prev&nbsp;</a>";
				}else{
					html2+="prev&nbsp;";
				}
				html2+="</div>";
				html2+="<div class='col-sm-4'>";
				for(var i=Number(getStartPageNum);i<=Number(getEndPageNum);i++){//페이징
					if(i==getPageNum){
						html2+="<a href='javascript:ajaxSearchMem("+i+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'><span style='color:blue'>&nbsp;"+i+"&nbsp;</span></a>";
					}else{
						html2+="<a href='javascript:ajaxSearchMem("+i+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'><span style='#555'>&nbsp;"+i+"&nbsp;</span></a>";
					}
				}
				html2+="</div>";
				html2+="<div class='col-sm-4'>";
				//alert("ㅠㅠㅠㅠ/:"+getEndPageNum+","+getTotalPageCount);
				if(Number(getEndPageNum)<Number(getTotalPageCount)){//다음
					//alert("다음?");
					html2+="<a href='javascript:ajaxSearchMem("+(Number(getEndPageNum)+1)+",\""+memSearch+"\",\""+keyword+"\")' class='pasing'>next&nbsp;</a>";
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
			var html="";
			//html+="<div id='contact' class='container'>";
			html+="<div class='col-md-12'>"+
			"<table name='inFrm' class='table th' width='700'>"+
			"<tr>"+
				"<th>회원번호</th>"+
	 			"<th>회원이름</th>"+
				"<th>전화번호</th>"+
				"<th>선택</th>"+
			"</tr>";
			$(data).find("mem").each(function(){//회원정보 받아오기
				//var html="";
				var len=$(this).find("mem_num").length;
				for(var i=0;i<len;i++){
					var mem_num=$(this).find("mem_num").text();
					var mem_name=$(this).find("mem_name").text();
					var mem_phone=$(this).find("mem_phone").text();	
				html += "<tr>"+
							"<td>"+mem_num+"</td>"+
							"<td>"+mem_name+"</td>"+
							"<td>"+mem_phone+"</td>"+
							"<td><input type='radio' name='aaa' id='btnSelectMemNum' onclick='memList("+mem_num+")'></td>"+
						"</tr>";
				}
			});
			html += "</table>";
			html += "</div>";
			//html += "</div>";
			var infoMem=document.createElement("div");
			infoMem.innerHTML=html;
			div.appendChild(infoMem);
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
		$("#locker_price1").val(price);
	});
	$("#locNo").click(function(){
		var price=0;
		$("#locker_price").val(price);
		$("#locker_price1").val(price);
	});
	$("#wearYes").click(function(){
		var price=10000;
		$("#wear_price").val(price);
		$("#wear_price1").val(price);
	});
	$("#wearNo").click(function(){
		var price=0;
		$("#wear_price").val(price);
		$("#wear_price1").val(price);
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
		//alert("유효성검사!!");
		var mem_num=document.frm.mem_num;
		//alert("mem_num : "+mem_num);
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
		var rg_price=document.frm.rg_price[0];
		//alert("rg_price: "+rg_price);
		if(rg_price.value.length<2){
			alert("프로그램을 선택하세요.");
			return false;
		}
		var locker_price=document.frm.locker_price[0];
		if(locker_price.value.length<=0){
			alert("락카 신청여부를 확인해주세요.");
			return false;
		}
		var wear_price=document.frm.wear_price[0];
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
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Register for Subjects</h3>
	<p class="text-center">
		<em>Start Exercise With Us!!</em><br>
	</p>
	<div class="row">

		<div class="col-md-2"></div>
		


<div class="col-md-12">
	<!-- 회원 검색하기!!! -->
	<div class="row">
		<div class="col-sm-3"> 
			<p >
			<span class="glyphicon glyphicon-search"> </span> Search for member
			</p>
		</div>
		<div class="col-sm-3"> 
			<select class="select input-sm" id="memSearch">
				<option value="default">--검색조건--</option>
				<option value="mem_num">회원번호</option>
				<option value="mem_name">이름</option>
				<option value="mem_phone">전화</option>
			</select>
		</div>
		<div class="col-sm-3">
			<input type="text" class="input-sm" size="10" name="keyword" id="keyword">
		</div>
		<div class="col-sm-3">
			<button class="btn pull-right " id="searchMem" type="submit">
			<span class="glyphicon glyphicon-search"></span>  search </button><br>
		</div>
	</div>
</div>
<!-- 검색된 정보 뿌려주기는 여기에다가 안된다고 함...위에다가 써서 div에 뿌려줘야함... -->
<div id="memInformation"></div>		
<!-- 페이징도 마찬가지로 위에다가 써서 div에 뿌려주기 -> 회원번호 선택하면 아래의 input type="text"에 회원번호 자동입력 -->
<div id="answerPaging"></div>
<br>
<form name="frm" method="post" action="regiInsert1" onsubmit="return validator();">
<!-- 회원번호를 select해서 input="text"에 집어넣기!! -->
<div class="col-md-12">
	<p >
		<span class="glyphicon glyphicon-pencil"></span> New member sign-up page
	</p>
<table class="table th" width="1000">
	<tr>
		<th>회원번호</th>
		<td colspan="2">
			<div class="col-sm-5 form-group"> 
				<input type="text" class="form-control" disabled="disabled" id="attachMemNum"><input type="hidden" name="mem_num" id="attachMemNum1">
			</div>
		</td>
	</tr>
	<tr>
		<th>등록유형</th>
		<td colspan="2">
		<label class="radio-inline">
			<input type="radio" value="단과과목" name="rg_type" id="simple_subject">단과과목
		</label>
		<label class="radio-inline">
			<input type="radio" value="PT" name="rg_type" id="pt_subject">PT
		</label>
		<label class="radio-inline">
			<input type="radio" value="여러과목" name="rg_type" id="multiple_subject">복합과목
		</label>
		</td>
	</tr>
	<tr>
		<th>프로그램선택</th>
		<td colspan="2">
			<!-- 단과과목 프로그램 선택 -->
			<div class="col-sm"> 
			<select class="select input-sm" id="programName" onchange="priceChange(this.value)" style="display: none">
				<option value="default">---프로그램선택---</option>
			</select>
			</div>
			<!-- pt프로그램 선택 -->
			<div class="col-sm"> 
			<select class="select input-sm" id="PTProgramName" onchange="ptPriceChange(this.value)" style="display: none">
				<option value="default">---프로그램선택---</option>
			</select>
			</div>
			<!-- 여러과목 프로그램 선택 -->
			<div class="col-sm-3 form-group"> 
			<select class="select input-sm" id="proName" onchange="simpleSelect(this.value)" style="display: none">
				<option value="default">---단과선택---</option>
			</select>
			</div>
			<div class="col-sm-3 form-group"> 
			<select class="select input-sm" id="ptName" onchange="ptSelect(this.value)" style="display: none">
				<option value="default">---PT선택---</option>
			</select>
			</div>
		</td>
	</tr>
	<tr>
		<th>프로그램가격</th>
		<td colspan="2">
			<div id="proSum" style="display: none">
				<div class="row">
					<div class="col-sm-3 form-group">
						<input type="text" class="form-control" placeholder="단과가격" disabled="disabled" id="simplePrice"><input type="hidden" id="simplePrice" class="required">
					</div>
					<div class="col-sm-1 form-group">
						<span class="glyphicon glyphicon-plus">  </span>
					</div>
					<div class="col-sm-3 form-group">
						<input type="text" class="form-control" placeholder="PT 가격" disabled="disabled" id="ptSelectPrice"><input type="hidden" id="ptSelectPrice" class="required">
 					</div>
					<div class="col-sm-5">
						<button class="btn-default btn-xs" id="btn" type="button">
						<span class="glyphicon glyphicon-usd"></span>  Calculate(단과 10%할인) </button>
					</div>
				</div>
			</div>
			<!-- 총 프로그램가격rg_price -->
			<div class="row">
			<div class="col-sm-12 form-group">
					<input type="text" placeholder="Total Program Price" class="form-control" disabled="disabled" id="rg_price"><input type="hidden" name="rg_price" id="rg_price1">
			</div>
			</div>
		</td>
	</tr>
	<tr>
		<th>락카</th>
		<td>
		<div class="col-sm-6 form-group">
		<label class="radio-inline">
			<input type="radio" value="신청" name="locker" id="locYes">신청
		</label>
		</div>
		<div class="col-sm-6 form-group">
		<label class="radio-inline">
			<input type="radio" value="신청안함" name="locker" id="locNo">신청안함
		</label>
		</div>
		</td>
		<td>
			<input type="text" class="form-control" placeholder="Locker Price" disabled="disabled" id="locker_price"><input type="hidden" name="locker_price" id="locker_price1">
		</td>
	</tr>
	<tr>
		<th>운동복</th>
		<td>
		<div class="col-sm-6 form-group">
		<label class="radio-inline">
			<input type="radio" value="신청" name="wear" id="wearYes">신청
		</label>
		</div>
		<div class="col-sm-6 form-group">
		<label class="radio-inline">
			<input type="radio" value="신청안함" name="wear" id="wearNo">신청안함
		</label>
		</div>
		</td>
		<td>
			<input type="text" class="form-control" placeholder="SportsWear Price" disabled="disabled" id="wear_price"><input type="hidden" name="wear_price" id="wear_price1">
		</td>
	</tr>
	<tr>
		<th>총 등록금액</th>
		<td>
				<button class="btn-default btn-xs" id="signTotPrice" type="button">
				<span class="glyphicon glyphicon-usd"></span> Calculate </button>
		</td>
		<td>
				<input type="text" class="form-control" placeholder="Sign Price" disabled="disabled" id="totSignPrice"><input type="hidden"  name="totPrice" id="totSignPrice1">
		</td>
	</tr>
</table>

	<div class="row">
		<div class="col-md-6">
			<button class="btn pull-right" type="submit">
			<span class="glyphicon glyphicon-ok"></span>  수강등록 </button>
		</div>
		<div class="col-md-6">
			<button class="btn pull-left"type="reset">
			<span class="glyphicon glyphicon-remove"></span>  취소 </button>
		</div>
	</div>
</div>
<!-- //////////프로그램을 선택하면 아래에 등록개월수가 input됨///////////style="display: none" -->
<input type="hidden" name="pro_signmonth" id="pro_signmonth">
<input type="hidden" name="pt_signmonth" id="pt_signmonth">
<!-- //////////등록한 프로그램코드 및 pt횟수 받아와서 보내주기/////////// -->
<input type="hidden" name="pro_name" id="pro_name">
<input type="hidden" name="pt_name" id="pt_name">
<input type="hidden" name="pro_code" id="pro_code">
<input type="hidden" name="pt_code" id="pt_code">
<input type="hidden" name="ptr_count" id="ptr_count">
</form>
</div>
</div>
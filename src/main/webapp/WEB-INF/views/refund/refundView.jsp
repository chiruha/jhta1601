<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   
<script type="text/javascript">
/*
//id로 접근하여 가져오기
var name_by_id = $('#test_id').attr('name');
var class_by_id = $('#test_id').attr('class');
 
//class로 접근하여 가져오기
var name_by_class = $('.test_class').attr('name');
var id_by_class = $('.test_class').attr('id ');
 
//name으로 접근하여 가져오기
var id_by_name = $('[name="test_name"]').attr('id');
var class_by_name = $('[name="test_name"]').attr('class');
*/
function memList(mem_num){	
	$("#attachMemNum").val(mem_num);
	
	$(".pasing").click(function(event) {
		//alert($(this).attr("href"));
		event.preventDefault();
		$("#pageNum").val($(this).attr("href"));
		nameSearch();
	});
}
	///// ------------------------번호찾아오기--------------------------------------------------
	$(function function_name(argument) {
		$(".nameSearch").click(function nameSearch() {
			var refundname = $("[name='refundname']").val();
			
			if(refundname == "" || refundname == null || refundname == undefined) {
				alert("이름을 입력하세요.");
				$("[name='refundname']").focus();
				return false;
			}			
			alert(refundname);
			$.ajax({
				url:"/fitness/refundDay",
				dataType:"json",
				type:"post",
				/* data:"refundname="+refundname, */
				data: {
					refundname : refundname
				},
				success:function function_name(data) {
				
					$("#resultNameSearch tbody tr").remove();
					$("#resultTableday tbody tr").remove();	
					$("#resultTable tbody tr").remove();					
					var html = "";
					if(data.length == 0) {						
						$("#memberNum").remove();
						html = "<tr><td colspan=\"4\" style=\"text-align:center;\">검색된 자료가 없습니다.</td></tr>";
						
					} else {
					for(var i=0; i<data.arr.length;i++){
						 html += "<tr>";
						 html += "<td>"+data.arr[i].mem_num+"</td>";            
						 html += "<td>"+data.arr[i].mem_name+"</td>";
						 html += "<td>"+data.arr[i].mem_phone+"</td>";
						 html += "<td>"+data.arr[i].ct_name+"</td>";	
						 html += "<td><input type='button' value='선택' id='btnSelectMemNum' onclick='memList("+data.arr[i].mem_num+")'></td>";
						 html += "</tr>";				 
						}
						
					 	html += "<tr><td>"+
					 	"<c:choose>	<c:when test='${pu.startPageNum>5 }'>"+
					 	"<a href='${pu.startPageNum-1}' class='pasing'>prev&nbsp;</a></c:when><c:otherwise>"+
						"prev&nbsp;	</c:otherwise></c:choose>"+
						"<c:forEach var='i' begin='"+data.page.startPageNum-1+"' end='${pu.endPageNum }'>"+
							"<c:choose><c:when test='${i==pu.pageNum }'>"+
									"<a href='${i }' class='pasing'>"+
									"<span style='color:blue'>${i }</span></a>"+
								"</c:when><c:otherwise><a href='${i }' class='pasing'>"+
									"<span style='color:#555'>${i }</span></a>"+
								"</c:otherwise>	</c:choose></c:forEach>"+						
							"<c:choose><c:when test='${pu.endPageNum<pu.totalPageCount}'>"+
								"<a href='${pu.endPageNum+1 }' class='pasing'> &nbsp;next</a>"+
							"</c:when><c:otherwise>	&nbsp;next</c:otherwise></c:choose></div>"
							+"</td></tr>";	 	
					 	
					 	
						$("#memberNum").css("display", "");
					
					}
						$("#resultNameSearch tbody").append(html);	
						$("#resultNameSearch").css("display", "");					
				}				
			});			
		});
		
		$("#btnSelectMemNum").click(function(){
			var searchNum=$("#mem_num").val();
			//alert("mem_num"+searchNum);
			$("#attachMemNum").val(searchNum);
		});		
		
		// -----------------------------------tot금액찾아오기--------------------------------------------------
		$(".mem_tot").click(function name() {
			var mem_num = $("[name='mem_num']").val();
		//	alert(mem_num);
			$.ajax({
				url:"/fitness/totregimoney",
				dataType:"json",
				type:"post",
				data:{
					mem_num : mem_num
				}, 
				success:function function_name(data) {
				//	alert(data);
					$("#resultTable tbody tr").remove();
					var html = "";
					var rg_price = 0;
					var locker_price = 0;
					var wear_price = 0;
					if(data.length == 0) {						
						html = "<tr><td colspan=\"7\" style=\"text-align:center;\">검색된 자료가 없습니다.</td></tr>";						
					} else {
						for(var i=0; i<data.length;i++){
							html += "<tr>";
							html += "<td><span class='rg_num'>" + data[i].rg_num + "</span></td>";            
							html += "<td>" + data[i].mem_num + "</td>";
							html += "<td><span class='rg_type'>" + data[i].rg_type + "</td>";
							html += "<td>" + data[i].rg_price + "</td>";
							html += "<td>" + data[i].locker_price + "</td>";
							html += "<td>" + data[i].wear_price + "</td>";
							//html += "<td><input type=\"checkbox\" value='\"+data[i].rg_price + data[i].locker_price + data[i].wear_price\"' id='checktot' onclick='memCale(" + (data[i].rg_price + data[i].locker_price + data[i].wear_price) + ")'></td>";
							html += "<td><input type=\"checkbox\" name='ck' value=" + (data[i].rg_price + data[i].locker_price + data[i].wear_price) + " id='checktot' onclick='memCale()'></td>";
							html += "</tr>";							
						}
					}
					$("#resultTable tbody").append(html);
					$("#resultTable").css("display", "");
				}				
			});			
		});
		// -----------------------------------totday찾아오기--------------------------------------------------
				
			$(".mem_tot").click(function name() {
				var mem_num = $("[name='mem_num']").val();
				alert(mem_num);
				$.ajax({
					url:"/fitness/ptgxoneday",
					dataType:"json",
					type:"post",
					data:{
						mem_num : mem_num
					}, 
					success:function function_name(data) {						
						$("#resultTableday tbody tr").remove();						
						alert(data);
						var html="";
						for(var i=0; i<data.length;i++){
							html += "<tr>";							         
							html += "<td>" + data[i].mem_num + "</td>";
							html += "<td>" + data[i].ptday + "</td>";
							html += "<td>" + data[i].gxday + "</td>";
							html += "<td>" + data[i].spsday + "</td>";
							html += "<td>" + data[i].sgxday + "</td>";							
							html += "</tr>";							
						}
						$("#resultTableday tbody").append(html);
						$("#resultTableday").css("display", "");
					}				
				});			
			});
			
			$(".refundmove").click(function name() {
				var mem_num = $("[name='mem_num']").val();
				var refund_price = $("[name='totpaymove']").val();				
				var ct_code = $("[name='ct_code']").val();					
				
				var tr=$("[name='ck']:checked").parent().parent();
				var rg_num=tr.find(".rg_num").text();
				var rg_type=tr.find(".rg_type").text();
				alert("rg_num+rg_type:"+rg_num+rg_type);
				
				var param = {};
				param.mem_num = mem_num;
				param.refund_price = refund_price;
				param.ct_code = ct_code;		
				param.rg_num = rg_num;
				param.rg_type = rg_type;				
				
				$.ajax({
					url:"/fitness/ptgxmove1",
					dataType:"json",
					type:"post",
					data: param, 
					success:function function_name(data) {
						alert(data)						
						$("#resultrefund tbody tr").remove();
						alert(data);
						var html="";
						for(var i=0; i<data.length;i++){
							html += "<tr>";							         
							html += "<td>" + data[i].refund_num + "</td>";
							html += "<td>" + data[i].mem_num + "</td>";
							html += "<td>" + data[i].refund_date + "</td>";
							html += "<td>" + data[i].rg_num + "</td>";
							html += "<td>" + data[i].ct_code + "</td>";
							html += "<td>" + data[i].rg_type + "</td>";
							html += "<td>" + data[i].refund_price + "</td>";
							html += "</tr>";				
						}
						$("#resultrefund tbody").append(html);
						$("#resultrefund").css("display", "");
					}				
				});	
				
				
				
			});
			
			$(".refundmove2").click(function name() {						
				$.ajax({
					url:"/fitness/ptgxmove2",
					dataType:"json",
					type:"post",					 
					success:function function_name(data) {
						alert(data)						
						$("#resultrefund2 tbody tr").remove();
						alert(data);
						var html="";
						for(var i=0; i<data.length;i++){
							html += "<tr>";							         
							html += "<td>" + data[i].refund_num + "</td>";
							html += "<td>" + data[i].mem_num + "</td>";
							html += "<td>" + data[i].refund_date + "</td>";
							html += "<td>" + data[i].rg_num + "</td>";
							html += "<td>" + data[i].ct_code + "</td>";
							html += "<td>" + data[i].rg_type + "</td>";
							html += "<td>" + data[i].refund_price + "</td>";
							html += "</tr>";							
						}
						$("#resultrefund2 tbody").append(html);
						$("#resultrefund2").css("display", "");
					}				
				});			
			}); 
					
	//-----------------------------------계산------------------------------------------------------------------------------------
		$(".ilday").click(function name() {
			 var hab=Number($(".rg_price").val()) / Number($(".totday").val());
			 var hab2  = Math.ceil(hab); 
			 $(".dayca").val(hab2);
		});
		$(".remoney").click(function name() {
			 var hab=Number($(".todaymoney").val()) * Number($(".dayca").val()) * 0.9;			
			 var hab2  = Math.ceil(hab); 
			 $(".repay").val(hab2);
		});
		
	});
	function memCale(price){
		 var valueArr = new Array();
		 var list = $("input[id=\"checktot\"]");
		 for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		 }
		 //선택된 체크박스의 값을 콘솔에 출력
		 var str = 0;		 
		 for(var i in valueArr){
		           str += Number(valueArr[i]);
		    }		 
		 alert(str);
		$(".rg_price").val(str);
		$(".rg_price").css("display", "");
		
		 var str2 = null;		 
		 for(var i in valueArr){
		           str2 += Number(valueArr[i]);
		    }		 
		 alert(str2);
		
	}

</script>



<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Refund List</h3>
<!-- <form name="form" action="refundlist" method="post" onsubmit="javascript:return false;"> -->
<div class="form-group has-success has-feedback">
<div class="input-group">
    <span class="input-group-addon">@</span>
    <input type="text" class="form-control" id="inputGroupSuccess1"  placeholder="검색 조건을 선택하세요"
    aria-describedby="inputGroupSuccess1Status">
  </div>
  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
  <span id="inputGroupSuccess1Status" class="sr-only">(success)</span>
</div>
	이름검색 :　<input type="text" id="refundname" name="refundname" >
	<input type="button" value="조회" class="nameSearch">
<!-- </form> -->
<br>

<div id="resultName"></div>	
	<table id="resultNameSearch" style='width:600px; border:1px solid black; display: none;' >
			<caption><a href='/fitness'>홈</a></caption>
			<colgroup>
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />
		    	</colgroup>
		    	<thead>
	        <tr>
		        <th>번호</th> 
		        <th>이름</th>
		        <th>전화번호</th>						        
		        <th>지점</th>
		        <th>선택</th>						                    
	        </tr>
	   		</thead>
	   		<tbody>	 
	    	</tbody>	    	
	</table>



		
		
	
	

<br><br>
<!-- 회원번호를 select해서 input="text"에 집어넣기!! -->
<div id="memberNum" style="display: none;">
	회원번호 <input type="text" name="mem_num" id="attachMemNum">
	<input type="button" value="환불검색" class="mem_tot">
</div>

<br>
<div id="resultTot"></div>	
	<table id="resultTable" style='width:700px; border:1px solid black; display:none;' >
		<caption><a href='/fitness'>홈</a></caption>
			<colgroup>
		        <col width='10%' />
		        <col width='10%' />
		        <col width='10%' />
		        <col width='10%' />
		        <col width='10%' />
		        <col width='10%' />
		        <col width='10%' />
		    	</colgroup>
		    <thead>
	        <tr>
		        <th>등록번호</th> 
		        <th>회원번호</th>
		        <th>등록과목</th>						        
		        <th>등록가격</th>
		        <th>사물함</th>
		        <th>유니폼</th>
		        <th>선택</th>
	        </tr>
		   	</thead>
		   	<tbody>
		    </tbody>
	</table>								
<br>

<br>
<div class="rg_price" style="display: none;">
총등록금액
<input type="text" class="rg_price" style="display: none;">
</div>

<table id="resultTableday" style='width:700px; border:1px solid black; display:none;' >
		<caption><a href='/fitness'>홈</a></caption>
			<colgroup>
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />		        
		    	</colgroup>
		    <thead>
	        <tr>
		        <th>등록번호</th> 
		        <th>PT등록일수</th>
		        <th>단과등록일수</th>						        
		        <th>PT남은등록일수</th>
		        <th>단과남은등록일수</th>		        
	        </tr>
		   	</thead>
		   	<tbody>
		    </tbody>
	</table>
<br>
<br>
<div class="rg_price" style="display: none;">
	총등록금액:<input type="text" placeholder="총등록금액" class="rg_price"> <br>
    등록일수:<input type="text" placeholder="등록일수" class="totday"> <br>
	하루치 수업료:<input type="text" placeholder="하루치 수업료" class="dayca">
    <input type="button" value="계산" class="ilday"><br>
 	현재까지:<input type="text" placeholder="운동만료일-오늘날짜" class="todaymoney"> <br>
 	하루치 수업료:<input type="text" placeholder="하루치수업료" class="dayca"> <br>
 	환불액:<input type="text" placeholder="하루치 수업료" class="repay">
    <input type="button" value="환불액" class="remoney"><br>
 </div>  
 	         
 <div class="rg_price" style="display: none;">	         
  총환불액:<input type="text" class="totpaymove" name="totpaymove">   
  지점선택   <select name="ct_code" id="ct_code">
			  <c:forEach var="clist"  items="${ctlist}">
				<option value="${clist.ct_code }">${clist.ct_name}</option>	
			  </c:forEach>
			</select>  
  
  			
  <input type="button" class="refundmove" value="전송"> 
</div>  

 
<table id="resultrefund" style='width:700px; border:1px solid black; display:none;' >
		<caption><a href='/fitness'>홈</a></caption>
			<colgroup>
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />
		        <col width='20%' />		        
		    	</colgroup>
		    <thead>
	        <tr>
		        <th>등록번호</th> 
		        <th>등록번호</th>
		        <th>환불날짜</th>						        
		        <th>PT환불액</th>
		        <th>GX환불액</th>		        		        
	        </tr>
		   	</thead>
		   	<tbody>
		    </tbody>
</table>

<table id="resultrefund2" style='width:700px; border:1px solid black; display:none;' >
		<caption><a href='/fitness'>홈</a></caption>
			<colgroup>
		        <col width='17%' />
		        <col width='17%' />
		        <col width='17%' />
		        <col width='17%' />
		        <col width='17%' />
		        <col width='16%' />			        
		    	</colgroup>
		    <thead>
	        <tr>
		        <th>등록번호</th> 
		        <th>과목종류</th>
		        <th>환불날짜</th>						        
		        <th>PT환불액</th>
		        <th>GX환불액</th>
		        <th>지점</th>		        
	        </tr>
		   	</thead>
		   	<tbody>
		    </tbody>
	</table>

   
    
<a href="#" class="refundmove2">환불내역 보기</a>
</div>













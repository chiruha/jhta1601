<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>이벤트 내용 보기</h1>
<a href="<c:url value='/eventInsert'/>">글쓰기</a>
<table border="1" width="1000">
	<tr>
		<td>글번호: ${selectNew.ev_num }</td>
		<td>작성일: ${selectNew.ev_date }</td>
		<td><a href="eventUpdateList?ev_num=${selectNew.ev_num}">글수정</a></td>
		<td><a href="eventDelete?ev_num=${selectNew.ev_num}">글삭제</a></td>
	</tr>
	<tr>
		<td colspan="4">${selectNew.ev_title }</td>
	</tr>
	<tr>
		<td colspan="4"><img src="/fitness/resources/img/Event/${selectNew.ev_picture }" width="500" height="500"></td>
	</tr>
	<tr>
		<td colspan="4">${selectNew.ev_content }</td>
	</tr>
</table>
<br>
<!-- /////////////// 댓글 쓰기 /////////////// -->
<h1>댓글쓰기</h1>

<form method="post" action="EventCommentsInsert">
	<%--  부모글에 대한 정보를 hidden으로 서버에 전송--%>
	<input type="hidden" name="comm_num" value="${commList.comm_num }">
	<input type="hidden" name="ev_num" value="${selectNew.ev_num }">
	<input type="hidden" name="comm_ref" value="${commList.comm_ref }">
	<input type="hidden" name="comm_lev" value="${commList.comm_lev }">
	<input type="hidden" name="comm_step" value="${commList.comm_step }">
	
<table border="1" width="1000">	
<tr>
	<td>
		작성자<input type="text" name="mem_num">
		<input type="submit" value="댓글등록">
		<input type="reset" value="취소">
	</td>
</tr>
<tr>
	<td>
		글내용<textarea rows="2" cols="80" name="comments"></textarea>
	</td>
</tr>
</table>
</form>
<br>
<!-- /////////////// 댓글 전체목록보기 /////////////// -->

<script type="text/javascript">
function resetUpdate(comm_numa){//수정하기 취소
	alert("수정하기기 취소 : "+comm_numa);
	var comm_numa=document.getElementById(comm_numa);
	comm_numa.style.display="none";
}
function reUpdate(comm_numa){//댓글 수정하기
	alert(comm_numa);
	var comm_numa=document.getElementById(comm_numa);
		comm_numa.style.display="block";	
}

function reset(comm_num){//댓글의 댓글쓰기 취소
	alert("댓글쓰기 취소 : "+comm_num);
	var comm_num=document.getElementById(comm_num);
	comm_num.style.display="none";
}
function reAnswer(comm_num){//댓글의 댓글달기
	alert(comm_num);
	var comm_num=document.getElementById(comm_num);
		comm_num.style.display="block";	
}

function ajaxComm(pageNum){
	$.ajax({
		url:"/fitness/commList/xml",
		data:"pageNum=" + pageNum+"&ev_num=${selectNew.ev_num }",
		success:function(data){
			var div=document.getElementById("answerList");
			var div2=document.getElementById("answerPaging");
			div.innerHTML="";
			div2.innerHTML="";
			//alert("페이징 연결되나?");
			$(data).find("paging").each(function(){//페이징처리
				
				var getPageNum=$(this).find("getPageNum").text();
				var getTotalRowCount=$(this).find("getTotalRowCount").text();
				var getRowBlockCount=$(this).find("getRowBlockCount").text();
				var getPageBlockCount=$(this).find("getPageBlockCount").text();
				var getStartPageNum=$(this).find("getStartPageNum").text();
				var getEndPageNum=$(this).find("getEndPageNum").text();
				var getTotalPageCount=$(this).find("getTotalPageCount").text();
				//alert("getTotalPageCount : "+getTotalPageCount);
				//alert("getStartPageNum : "+getStartPageNum);
				//alert("getEndPageNum : "+getEndPageNum);
				
				
				//alert("div2: "+div2);
				var puList=$(this).find("getTotalPageCount").length;
				//alert("puList: "+puList);
				var html2="";
				for(var i=getStartPageNum;i<=getEndPageNum;i++){
					if(i==getPageNum){
						html2="<a href='javascript:ajaxComm(" + i+")'><span style='color:blue'>["+i+"]</span></a>";
					}else{
					    html2="<a href='javascript:ajaxComm(" + i+")'><span style='#555'>["+ i+ "]</span></a>";
					}
					var comm2=document.createElement("div2");
					//alert("comm2: "+comm2);
					comm2.innerHTML=html2;
					//alert("html2: "+html2);
					div2.appendChild(comm2);
				}
			});
			$(data).find("commListAll").each(function(){//전체 댓글 받아오기				
					
				var commList=$(this).find("comm_num").length;
				for(var i=0;i<commList;i++){
					var comm_num=$(this).find("comm_num").text();
					var ev_num=$(this).find("ev_num").text();
					var mem_num=$(this).find("mem_num").text();
					var comments=$(this).find("comments").text();
					var comm_date=$(this).find("comm_date").text();
					var comm_ref=$(this).find("comm_ref").text();
					var comm_lev=$(this).find("comm_lev").text();
					var comm_step=$(this).find("comm_step").text();
					var comm=document.createElement("div");
					//alert("comm_ref : "+comm_ref);
					//alert("comm_date"+comm_date);
					var html="<table border='1'  width='1000'>"+	
								"<tr>"+
								"<th>";
								if(comm_lev>0){
									for(var i=0;i<comm_lev;i++){
										html+="&nbsp;&nbsp";
									}
									//html=html+"[re]";
									html=html+"<img src='/fitness/resources/img/hs6.png' height='15px'>";
								}
								html+=
									"글쓴이 : "+mem_num+" | "+
									"작성일 : "+comm_date+" | "+
									"<a href='javascript:reAnswer(\""+comm_num+"\")'> 댓글달기 </a>"+" | "+
									"<a href='EventCommentsDelete?comm_num="+comm_num+"'> 삭제하기 </a>"+" | "+
									"<a href='javascript:reUpdate(\""+comm_num+"a\")'> 수정하기 </a>"+" | "+
									"<br>"+
									comments+
									"</th>"+
								"</tr>"+
								"<tr>"+
									"<th>"+
									"<div id='" +comm_num+"a' style='display: none'>"+
									"<a href='javascript:reset(\""+comm_num+"a\")'>수정취소</a>"+
										"<form method='post' action='EventCommentsUpdate'>"+
											"<input type='hidden' name='comm_num' value='"+comm_num+"'>"+
											"<input type='hidden' name='ev_num' value='"+ev_num+"'>"+
											"<input type='hidden' name='comm_ref' value='"+comm_ref+"'>"+
											"<input type='hidden' name='comm_lev' value='"+comm_lev+"'>"+
											"<input type='hidden' name='comm_step' value='"+comm_step+"'>"+"<br>"+
											"작성자<input type='text' disabled='disabled' name='mem_num' value='"+mem_num+"'>"+"<br>"+
											"<textarea rows='2' cols='80' name='comments'>"+comments+"</textarea>"+
											"<input type='submit' value='수정'>"+"<br>"+
										"</form>"+
									"</div>"+
									"</th>"+
								"</tr>"+
								"<tr>"+
									"<th>"+
									"<div id='" +comm_num+"' style='display: none'>"+
									"<a href='javascript:reset(\""+comm_num+"\")'>댓글취소</a>"+
										"<form method='post' action='EventCommentsInsert'>"+
											"<input type='hidden' name='comm_num' value='"+comm_num+"'>"+
											"<input type='hidden' name='ev_num' value='"+ev_num+"'>"+
											"<input type='hidden' name='comm_ref' value='"+comm_ref+"'>"+
											"<input type='hidden' name='comm_lev' value='"+comm_lev+"'>"+
											"<input type='hidden' name='comm_step' value='"+comm_step+"'>"+"<br>"+
											"작성자<input type='text' name='mem_num'>"+"<br>"+
											"<textarea rows='2' cols='80' name='comments'></textarea>"+
											"<input type='submit' value='댓글등록'>"+"<br>"+
										"</form>"+
									"</div>"+
									"</th>"+
							"</tr>"+
							"</table>";
					comm.innerHTML=html;
					div.appendChild(comm);
					
				}
				
			}); 
		}
	});
}
$(document).ready(function(){
	//alert("댓글보기!!");
	$("#answer").click(function(){
		alert("버튼클릭!!!");
		ajaxComm(1);//ajax호출하기!!!
	});	
});

</script>
<br>
<!-- 댓글 전체목록뿌리기 -->
<input type="button" id="answer" value="댓글보기">
<div id="answerList"></div>
<div id="answerPaging"></div>
<br>

<h1>이벤트글 목록</h1>
<table border="1" width="1000">
	<tr>
		<th>이벤트번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.ev_num }</td>
		<td><a href="eventSelectAll2?ev_num=${dto.ev_num}">${dto.ev_title }</a></td>
		<td>${dto.stf_num }</td>
		<td>${dto.ev_date }</td>
	</tr>
	</c:forEach>
</table>
<br>
<!-- 글목록 페이징처리 -->
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a href="eventSelectAll?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
		</c:when>
		<c:otherwise>
			<a href="eventSelectAll?pageNum=${i }"><span style="color:#555">[${i }]</span></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
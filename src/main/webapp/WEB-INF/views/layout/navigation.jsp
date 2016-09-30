<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a  href="<c:url value='/'/>">
		 <img src="resources/img/fitimg/Logo.png" alt="Fitness" height="60">
	</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">

        
      <!-- Introduce  dropdown 메뉴 -->
        <li>   <a class="dropdown-toggle" data-toggle="dropdown" href="#">소개
            <span class="caret"></span></a>
             <ul class="dropdown-menu">
                  <li><a href="<c:url value='/Company'/>">회사소개</a></li>
                  <li><a href="<c:url value='/trlist'/>">강사소개</a></li>
          </ul>
        </li>
        
        <!-- Center 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">지점
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/Jongnosamga'/>">본점</a></li>
                <li><a href="<c:url value='/Apgujeong'/>">압구정점</a><li>
                <li><a href="<c:url value='/Hwajeong'/>">화정점</a><li>
                <li><a href="<c:url value='/Jongno'/>">종로점</a><li>
                <li><a href="<c:url value='/Sinchon'/>">신촌점</a><li>
                <li><a href="<c:url value='/Songpa'/>">송파점</a><li>
          </ul>
        </li>
        
        <!-- Board 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/noclist'/>">공지게시판</a></li>
            <li><a href="<c:url value='/fblist'/>">자유게시판</a></li>
            <li><a href="<c:url value='/qnaselectAll'/>">질문게시판</a></li>
            <li><a href="<c:url value='/eventSelectAll'/>">이벤트게시판</a></li>
          </ul>
        </li>
        
        <!-- 시간표 메뉴 -->
		<li><a href="<c:url value='/gxRegisterView'/>">시간표</a></li>


      
       <c:choose>
			<c:when test="${not empty sessionScope.mnum}">
			
	        	  <!-- Member Mypage dropdown 메뉴 -->
 			<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MyPage
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <li><a href="<c:url value='/attcheck?type=mem&num=${mnum }'/>">출석하기</a></li>
               <li><a href="<c:url value='/ptrinsert'/>">Pt 예약</a></li>
              <li><a href="<c:url value='/MemPTscOkView'/>">Pt 확인</a></li>
              <li><a href="<c:url value='/regiSelect?mnum=${mnum}&gotype=1'/>">수강정보</a></li>
              <c:if test="${not empty mnum}">
             <li><a href="<c:url value='/listOne?mem_num=${mnum}'/>">개인정보</a></li>
          </c:if>
 
          </ul>
			</c:when>
			
			<c:when test="${not empty sessionScope.snum}">
			<!-- Staff Manager dropdown 메뉴 -->
        	<li class="dropdown">
         	 <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리
         	 <span class="caret"></span></a>
        	  <ul class="dropdown-menu">     	   
        		<li><a href="<c:url value='/memselectAll'/>">회원목록</a></li>
                <li><a href="<c:url value='/mlistAll'/>">회원출석표</a></li>
                 <li><a href="<c:url value='/regiInsert'/>">수강등록</a></li>
                <li><a href="<c:url value='/regiSelect'/>">수강목록</a></li>                
                
           
          </ul>		
          <!-- 직원관리 메뉴 -->
          <li class="dropdown">
         	 <a class="dropdown-toggle" data-toggle="dropdown" href="#">직원관리
         	 <span class="caret"></span></a>
        	  <ul class="dropdown-menu">
        	  <li><a href="<c:url value='/attcheck?type=admin&num=${sessionScope.snum }'/>">출근하기</a></li>
				<li><a href="<c:url value='/slistAll'/>">출퇴근표</a></li>
            <li><a href="<c:url value='/stfinsert'/>">직원등록</a></li>
            	<li><a href="<c:url value='/stflist'/>">직원목록</a></li>
				<li><a href="<c:url value='/trlist'/>">강사목록</a></li>
            	<li><a href="<c:url value='/PTscOkView'/>">PT 승인</a></li>
				<li><a href="<c:url value='/gxinsert'/>">시간표등록</a></li>
          </ul>		
            <!-- 재무관리 메뉴 -->
          <li class="dropdown">
         	 <a class="dropdown-toggle" data-toggle="dropdown" href="#">재무관리
         	 <span class="caret"></span></a>
        	  <ul class="dropdown-menu">
                <li><a href="<c:url value='/payinsert'/>">월급지급</a></li>
                 <li><a href="<c:url value='/paylist'/>">월급지급표</a></li>
        	    <li><a href="<c:url value='/SjRefundInsert'/>">환불하기</a></li>
                <li><a href="<c:url value='/ctsSelect'/>">지점별 월매출</a></li>
                <li><a href="<c:url value='/centertotalsalesInsert'/>">지점별 월매출 계산</a></li>
                 <li><a href="<c:url value='/incomeInsert'/>">지점별 월수입 계산</a></li>
          </ul>		
           <!-- 직원관리 메뉴 -->
          <li class="dropdown">
         	 <a class="dropdown-toggle" data-toggle="dropdown" href="#">경영관리
         	 <span class="caret"></span></a>
        	  <ul class="dropdown-menu">
        	    <li><a href="<c:url value='/nocinsert'/>">공지등록</a></li>
               	<li><a href="<c:url value='/posinsert'/>">직급등록</a></li>
                <li><a href="<c:url value='/deptinsert'/>">부서등록 </a></li>
             	<li><a href="<c:url value='/ctinsert'/>">지점등록</a></li>
          </ul>		
          

			</c:when>
		</c:choose>
      
       
      
      
                 <!-- Login Dialog 메뉴 -->
      <c:choose>
			<c:when test="${empty sessionScope.memnum}">
	        	  <li><a href="#login" data-toggle="modal" data-target="#LoginModal">
	        	  <span class="glyphicon glyphicon-log-in"></span>Login</a></li>
			</c:when>
			<c:otherwise>
				<li> <a href="#" >[ ${memnum }님 환영합니다 ]</a></li>	
				 <li><a href="<c:url value='/logout'/>" >
				 <span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
				 
			</c:otherwise>
		</c:choose>

          
		<c:if test="${not empty sessionScope.snum}">
           <!-- sitemap  메뉴 -->
          <li><a href="<c:url value='/?test=goboot'/>">SiteMap</a></li>
		</c:if>

      </ul>
   
   
    </div>
  </div>
</nav>

<!-- Modal -->
  <div class="modal fade" id="LoginModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body">
          <form role="form" method="post" action="/fitness/login">
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-user"></span> Login</label>
              <input type="text" class="form-control"  name="mem_name"  placeholder="Write your name">
            </div>
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-phone"></span> Phone</label>
              <input type="password" class="form-control" id="usrname" name="mem_phone"  placeholder="Write your phone number">
            </div>
              <button type="submit" class="btn btn-block">Login
                <span class="glyphicon glyphicon-ok"></span>
              </button>
              <input type="checkbox" value="관리자로그인" name="adminCheck" onclick="adminMode()">Admin
                <div id="errMsg">${requestScope.errMsg }</div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
          <p>Didn't Member ?<a href="<c:url value='/meminsert'/>" id="logcheck"> Join us!!</a></p>
        </div>
      </div>
    </div>
  </div>



<script type="text/javascript">
$(document).ready(function(){
	
// Login errMsg 유무 판단
	//alert("errMsg: ${requestScope.errMsg }");
	//alert("session: ${sessionScope.memnum }");
	 //  alert("${sessionScope.mnum}");
	
	var msg="${requestScope.errMsg}";
	if(msg!=""&&msg!=null){
		$("#LoginModal").modal();
	//<a href="#login" data-toggle="modal" data-target="#LoginModal">Login</a>
	
  /* 	<!-- Links -->
		<a data-toggle="modal" href="#myModal">Open Modal</a>

		<!-- Other elements -->
		<p data-toggle="modal" data-target="#myModal">Open Modal</p>
  */
	}
});


	var check;
	function adminMode(){
		check=$("input[name$='adminCheck']").is(":checked");
		if(check==true){
			$("#logcheck").attr("href","/fitness/stfinsert");
		}else{
			$("#adminCheck").val(null);
		}
		
	}
	</script>


   
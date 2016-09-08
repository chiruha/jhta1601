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
      <a class="navbar-brand" href="<c:url value='/?test=goboot'/>">Fitness
		
	</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <!-- Home 메뉴 -->
      <%--
        <li><a href="<c:url value='/?test=goboot'/>">HOME</a></li>
       --%>
        
      <!-- Introduce  dropdown 메뉴 -->
        <li>   <a class="dropdown-toggle" data-toggle="dropdown" href="#">Intro
        	 <span class="caret"></span></a>
         	 <ul class="dropdown-menu">
          		  <li> <a href="#">Center</a></li>
          		  <li><a href="#">Company</a></li>
         		   <li><a href="<c:url value='/trlist'/>">Trainer</a></li>
          </ul>
        </li>
        
        <!-- Board 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Board
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/noclist'/>">Notice</a></li>
            <li><a href="#">QnA</a></li>
            <li><a href="#">Event</a></li>
            <li><a href="#">FreeBoard</a></li>
          </ul>
        </li>

        
          <!-- Information  메뉴 -->
        <li><a href="#tour">Infor</a></li>
        
        <!-- 수강  dropdown 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">수강
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/regiInsert'/>">수강등록</a></li>
            <li><a href="<c:url value='/regiSelect'/>">수강조회</a></li>
             <li><a href="<c:url value='/ptrinsert'/>">Pt 예약</a></li>
          </ul>
          
          
          <!-- ~ 메뉴 -->
        <li><a href="#contact">미정</a></li>
        
          <!-- Login Dialog 메뉴 -->
      <c:choose>
			<c:when test="${empty sessionScope.memnum}">
	        	  <li><a href="#login" data-toggle="modal" data-target="#LoginModal">
	        	  <span class="glyphicon glyphicon-log-in"></span>Login</a></li>
			</c:when>
			<c:otherwise>
				<li> <a href="" >[ ${sessionScope.memnum }님 환영합니다 ]</a></li>	
			 <li> <a href="<c:url value='/logout'/>" >
				 <span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
			</c:otherwise>
		</c:choose>
      
      
      
      
      
        <!-- Member Mypage dropdown 메뉴 -->
 		<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MyPage
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
              <li><a href="<c:url value='/MemPTscOkView'/>">Pt 예약확인</a></li>
              <c:if test="${not empty sessionScope.mnum}">
             <li><a href="<c:url value='/listOne?mem_num=${sessionScope.mnum}'/>">개인정보</a></li>
          </c:if>
          </ul>

          
          <!-- Staff Mypage dropdown 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">AdPage
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/stflist'/>">Staff 목록</a></li>
                 <li><a href="<c:url value='/stfinsert'/>">Staff 등록</a></li>
           <li><a href="<c:url value='/memselectAll'/>">Member 목록</a></li>
            <li><a href="<c:url value='/PTscOkView'/>">Pt강사승인</a></li>
               <li><a href="<c:url value='/trlist'/>">Trainer 목록</a></li>
             <li><a href="<c:url value='/ctinsert'/>">Center 등록</a></li>
                <li><a href="<c:url value='/deptinsert'/>">Dept 등록</a></li>
                 <li><a href="<c:url value='/testpage/?test=2'/>">icontest</a></li>
          </ul>
          
           <!-- sitemap  메뉴 -->
        <li><a href="<c:url value='/'/>">SiteMap</a></li>
        
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
              <input type="text" class="form-control" id="usrname" name="mem_phone"  placeholder="Write your phone number">
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
          <p>Didn't Member ?<a href="<c:url value='/meminsert'/>"> Join us!!</a></p>
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
			alert("I am Staff");
			
		}else{
			alert("I am Member");
			$("#adminCheck").val(null);
		}
		
	}
	</script>


   
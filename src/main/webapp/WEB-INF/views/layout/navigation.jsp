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
      <a class="navbar-brand" href="/fitness">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      
      <!-- Home 메뉴 -->
        <li><a href="<c:url value='/?test=goboot'/>">HOME</a></li>
        
      <!-- Introduce  dropdown 메뉴 -->
        <li>   <a class="dropdown-toggle" data-toggle="dropdown" href="#">Introduce
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
        <li><a href="#tour">Information</a></li>
        
        <!-- 수강  dropdown 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">수강
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/regiInsert'/>">수강등록</a></li>
            <li><a href="<c:url value='/regiSelect'/>">수강조회</a></li>
          </ul>
          
          
          <!-- ~ 메뉴 -->
        <li><a href="#contact">미정</a></li>
        
          <!-- Login Dialog 메뉴 -->
          <li><a href="#login" data-toggle="modal" data-target="#LoginModal">Login</a></li>
      
        <!-- Member Mypage dropdown 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MyPage
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Merchandise</a></li>
            <li><a href="#">Extras</a></li>
            <li><a href="#">Media</a></li>
          </ul>
          
          <!-- Staff Mypage dropdown 메뉴 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MyPage
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/stflist'/>">StaffList</a></li>
            <li><a href="<c:url value='/stfinsert'/>">Staff Sign up</a></li>
            <li><a href="#">Media</a></li>
          </ul>
          
           <!-- sitemap  메뉴 -->
        <li><a href="">SiteMap</a></li>
        
          
          <!-- 검색? -->
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
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
          <form role="form">
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-shopping-cart"></span> Login</label>
              <input type="number" class="form-control" id="psw" placeholder="Write your name ">
            </div>
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span>Phone</label>
              <input type="text" class="form-control" id="usrname" placeholder="Write your phone number">
            </div>
              <button type="submit" class="btn btn-block">Login
                <span class="glyphicon glyphicon-ok"></span>
              </button>
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


   
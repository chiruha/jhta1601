<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
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
        <li><a href="/fitness">HOME</a></li>
        
      <!-- Introduce  dropdown 메뉴 -->
        <li>   <a class="dropdown-toggle" data-toggle="dropdown" href="#">Introduce
        	 <span class="caret"></span></a>
         	 <ul class="dropdown-menu">
          		  <li> <a href="#band">Center</a></li>
          		  <li><a href="#">Extras</a></li>
         		   <li><a href="#">Media</a></li>
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


    <script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip();
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>
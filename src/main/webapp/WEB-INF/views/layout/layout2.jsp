<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- tiles 를 사용하 위한 태그 불러오기 -->
    <%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fitness Main</title>
 <!-- Theme Made By www.w3schools.com - No Copyright -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/BootStrap.css'/>">
    <%--
 <script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript" src="/fitness/resources/js/jquery-ui.min.js"></script>
     --%>
       <script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip();
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='/']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();
	//	alert("이건가?"+this.hash);
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
  
  
	
  
  
});
</script>
      
      
      
      
      
      
</head>
<body>
<div id="wrap">

		<!-- 주소가 아닌 주소를 가지고 있는 tiles의 attribute 를 가져온다 -->
		<!-- tiles-def.xml 에 정의된 attribute name  을 사용하여 페이지를 포함한다 -->
		<div id="headDiv">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="contentDiv">
			<tiles:insertAttribute name="content" />
		</div>
		<div id="footDiv">
			<tiles:insertAttribute name="footer" />
		</div>
</div>
</body>
</html>
















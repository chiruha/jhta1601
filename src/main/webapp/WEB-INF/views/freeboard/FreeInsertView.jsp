<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>자유게시판</title>
</head>
<body>
	<h1>자유게시판${param.fb_num}</h1>
	<form action="fbinsert" method="post">

	 <c:choose>
	
	 <c:when test="${not empty param.fb_num}"> 
			<input  name="fb_num" value="${param.fb_num}">
			<input name="fb_ref" value="${param.fb_ref}">
			<input  name="fb_lev" value="${param.fb_lev}">
			<input  name="fb_step" value="${param.fb_step}">
	</c:when>
	</c:choose> 
		
		작성자<input type="text" name="mem_num"><br>
		글제목<input type="text" name="fb_title"><br>
		글내용<input type="text" name="fb_content"><br>
		<input type="submit" value="글등록">
		<input type="reset" value="취소">
	</form>

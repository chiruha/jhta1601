<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- tiles 를 사용하 위한 태그 불러오기 -->
    <%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fitness Homepage</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/BootStrap.css'/>">
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrap">

		<!-- 주소가 아닌 주소를 가지고 있는 tiles의 attribute 를 가져온다 -->
		<!-- tiles-def.xml 에 정의된 attribute name  을 사용하여 페이지를 포함한다 -->
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="content" />
</div>
</body>
</html>
















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="PosInsert">
<h1>직급등록 페이지</h1>
<form action="posinsert" method="post" >
 직급코드 <input type="text" name="pos_code"><br>  <!--  유효성 검사 하기  -->
 직급이름 <input type="text" name="pos_name"><br>
 부서코드 <select name="dept_code">
	<c:forEach var="dlist"  items="${deptlist}">
		<option value="${dlist.dept_code }">${dlist.dept_name}</option>	
	</c:forEach>	
</select><br>
 

<input type="submit" value="등록">
<input type="reset" value="취소">
</form>



</div>
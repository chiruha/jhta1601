<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("form span").css({"color":"red","fontSize":11});
		$(".required").focusin(function() {
			$(this).next().html("필수입력 사항입니다!!");
		});
		$(".required").focusout(function() {
			$(this).next().html("");
		});
	});


</script>

<div id="StfInsert">
<h1>직원등록 페이지</h1>
<form action="stfinsert" method="post" enctype="multipart/form-data">

직원이름 <input type="text" name="stf_name" class="required">&nbsp;<span></span><br>
전화전호 <input type="text" name="stf_phone" class="required">&nbsp;<span></span><br>
직급선택 <select name="pos_code">
	<c:forEach var="plist"  items="${poslist}">
		<option value="${plist.pos_code }">${plist.pos_name}</option>	
	</c:forEach>	
</select><br>
지점선택 <select name="ct_code">
	<c:forEach var="clist"  items="${ctlist}">
		<option value="${clist.ct_code }">${clist.ct_name}</option>	
	</c:forEach>	
</select><br>
사진파일 <input type="file" name="picture"><br>


<input type="submit" value="등록">
<input type="reset" value="취소">
</form>



</div>
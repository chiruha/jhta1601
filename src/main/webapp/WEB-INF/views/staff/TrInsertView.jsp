<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div id="TrInsert">
<h1>강사등록 페이지</h1>
<form action="trinsert" method="post" >
<img src="/fitness/resources/img/Staff/${dto.stf_picture }">
강사번호 <input type="hidden" name="stf_num" value="${dto.stf_num}"><br>
강사이름 <input type="hidden" name="stf_name" value="${dto.stf_name}"><br>
강사경력 <textarea rows="5" cols="5" name="tr_career"></textarea>
강사소개 <textarea rows="5" cols="5" name="tr_intro"></textarea>

<input type="submit" value="등록">
<input type="reset" value="취소">
</form>



</div>
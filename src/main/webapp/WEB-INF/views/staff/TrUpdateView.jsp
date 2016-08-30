<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div id="TrUpdate">
<h1>강사수정 페이지</h1>
<form action="trupdate" method="post" >
<img src="/fitness/resources/img/Staff/${sdto.stf_picture }"><br>
직원번호 <input type="hidden" name="stf_num" value="${sdto.stf_num}">${sdto.stf_num}<br>
강사번호 <input type="hidden" name="tr_num" value="${dto.tr_num}">${dto.tr_num}<br>
강사이름 ${sdto.stf_name}<br>
강사경력 <br><textarea rows="5" cols="20" name="tr_career">${dto.tr_career}</textarea><br>
강사소개 <br><textarea rows="5" cols="20" name="tr_intro">${dto.tr_intro}</textarea><br>

<input type="submit" value="등록">
<input type="reset" value="취소">
</form>



</div>
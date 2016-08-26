<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="CtInsert">
<h1>지점등록 페이지</h1>
<form action="ctinsert" method="post" >
 지점이름 <input type="text" name="ct_name"><br>
 지점전화 <input type="text" name="ct_tel"><br>
 지점주소 <input type="text" name="ct_addr"><br>
 지점소개 <input type="text" name="ct_intro"><br>

<input type="submit" value="등록">
<input type="reset" value="취소">
</form>
</div>
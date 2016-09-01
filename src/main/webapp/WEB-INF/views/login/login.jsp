<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/fitness/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	var check;
	function adminMode(){
		check=$("input[name$='adminCheck']").is(":checked");
		if(check==true){
			alert("I am Staff");
			//var id=$("#id").prop("name");
			//var pwd=$("#pwd").prop("name");
			//alert("id: "+id)
			//$("#id").empty();
			//$("#pwd").empty();
			//var id2=$("#id").prop("name","stf_name");
			//$("#pwd").prop("name","stf_phone");
			//alert("id2: "+id2);
			
		}else{
			alert("I am Member");
			$("#adminCheck").val(null);
//			var id=$("#id").prop("name");
//			var pwd=$("#pwd").prop("name");
//			var mem_name="stf_name";
//			var mem_phone="stf_phone";
//			$("#id").empty();
//			$("#pwd").empty();
//			$("#id").append("name",mem_name);
//			//$("#pwd").append("name",mem_phone);
		}
		
	}
</script>
<!-- 
회원아이디 : 이름(mem_name)
회원비밀번호 : 전화번호(mem_phone)
관리자아이디 : 이름(stf_name)
관리자비밀번호 : 전화번호(stf_phone)
 -->
<h1>로그인하기</h1>

<form method="post" action="login">
아이디<input type="text" name="mem_name" id="id"><br>
비밀번호<input type="password" name="mem_phone" id="pwd"><br>

<input type="checkbox" value="관리자로그인" name="adminCheck" onclick="adminMode()">관리자로그인
<div id="errMsg">${requestScope.errMsg }</div>
<input type="submit" value="로그인">
<input type="reset" value="취소">
</form>

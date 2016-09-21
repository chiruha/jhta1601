<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
////////////--유효성검사--////////////
function validator(){
	alert("유효성검사!!");
	var mem_name=document.frm.mem_name;
	alert("mem_name : "+mem_name);
	if(mem_name.value.length<=0){
		alert("등록할 회원이름을 입력하세요.");
		return false;
	}
	var mem_phone=document.frm.mem_phone;
	if(mem_phone.value.length<=0){
		
	}
	var mem_addr=document.frm.mem_addr;
	
	var mem_age=document.frm.mem_age;
	
	var mem_email=document.frm.mem_email;
	var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if(mem_email.value.length<=0){
    	alert("이메일주소를 입력해 주세요");
    	return false;
    }else if(regEmail.test(mem_email.value)==false){
    	alert("이메일 주소가 유효하지 않습니다.");
    	return false;
    }
	
	return regularExpression.test(email);
	var mem_gen=document.frm.mem_birth;
	
	var mem_picture=document.frm.mem_picture;
}
</script>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<h3 class="text-center">Member Insert</h3>
	<p class="text-center">
		<em>Welcome to our family !!</em>
	</p>
	<div class="row">
<form name="frm" method="post" action="meminsert" enctype="multipart/form-data" onsubmit="return validator();">
		<div class="col-md-2"></div>
		<div class="col-md-8">
	<p >
		<span class="glyphicon glyphicon-edit"></span> Please write your profile
	</p>
	<div class="col-sm-3 form-group">
						<span class="glyphicon glyphicon-home"> Center</span>
						</div>
						<div class="col-sm-3 form-group">
						<select name="ct_code" class="form-group-sm select">
							<c:forEach var="clist" items="${ctlist}">
								<option value="${clist.ct_code }">${clist.ct_name}</option>
							</c:forEach>
						</select><br>
					</div><br>
							
					<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Name" type="text"
							required name="mem_name" class="required"> 
					</div>
					</div>
					<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Phone" type="text"
							required name="mem_phone" class="required">
					</div>
					</div>
						<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Address" type="text"
							required name="mem_addr" class="required"> 
					</div>
					</div>
						<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Age" type="text"
							required name="mem_age" class="required"> 
					</div>
					</div>
					<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" placeholder="Email" type="text"
							required name="mem_email" class="required"> 
					</div>
					</div>
						<div class="row">
					<div class="col-sm-12 form-group">
						<!-- <input class="form-control" placeholder="Gender" type="text"
							required name="mem_gen" class="required"> -->
						 <span class="glyphicon glyphicon-user"> Gender </span>
						 <span class="glyphicon"><input type="radio" value="남" name="mem_gen">남</span>
						 <span class="glyphicon"><input type="radio" value="여" name="mem_gen">여</span>
					</div>
					</div>
					<div class="row">
						<div class="col-sm-12 form-group">
							<span class="glyphicon glyphicon-gift"> Birth </span>
							<input class="input-sm" size="13" placeholder="년도(4자리)" type="text" required name="year">
						
							<select class="select input-sm" name="month">
								<option value="default">월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						
							<select name="day" class="select input-sm">
								<option value="default">일</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
							</select>	
						</div>
					</div>
			

<div class="col-sm-6 form-group">
						<span class="glyphicon glyphicon-picture">
						<label for="file" class=".navbar-form-label"> picture</label>
						</span>
						</div>
						<div class="col-sm-6 form-group">
					<input type="file" name="mem_picture" ><br>
					</div>
					<br>

<div class="row">
				<div class="col-md-12 form-group">
					<button class="btn pull-right" type="submit">
						<span class="glyphicon glyphicon-ok"> Enroll </span>
					</button>
				</div>
			</div>
		</div>
</form>
	</div>
	</div>


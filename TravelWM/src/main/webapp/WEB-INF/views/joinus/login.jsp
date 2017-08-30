<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
  	<title>동행이음 - 설레는 인연을 만나보세요 </title>
  
  	<meta name="viewport" content="width=device-width, initial-scale=1" />
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>	
	<link href="${root}/resource/css/joinus/login.css" rel="stylesheet" />
	
	
</head>

<body>
	<c:if test="${error eq 1}">
		<script>
			alert("아이디 또는 비밀번호를 확인해주세요.");
		</script>
	</c:if>

	<c:if test="${error eq 2}">
		<script>
			alert("이미 등록된 아이디입니다");
		</script>
	</c:if>
<!-- Form Module-->

<div class="login-container">
<div>
	<div class="module form-module">


		<div class="toggle">
			<span>회원가입</span><i class="fa fa-times"></i>
		</div>


		<div class="form">
			<div class="login-logo">
			</div>
			<h2>Login</h2>
			<form action="${root }/j_spring_security_check" name="user-login" method="POST" onsubmit="return validateEmail()">
				<fieldset class="login-form">
					<c:if test="${not empty validate && not validate}">
						<td colspan="2" style="color:red;">아이디 또는 비번이 유효하지 않습니다. </td>
					</c:if>
					<input type="email" aria-label="이메일을 입력하세요." id="login-email" autocomplete="username" placeholder="Username" class="login-input" name="j_username" value="test@naver.com" autofocus />
				</fieldset>
				<fieldset style="position:relative;">
				<input type="password" placeholder="Password" aria-label="비밀번호를 입력하세요." autocomplete="current-password" 
								class="login-input" name="j_password" value="12345"/>
				<button aria-label="login" class="login-button" type="submit">Login</button>
				</fieldset>
			</form>
		</div>


		<div class="form">
			
			<h2>Create an account</h2>
			<form method="POST" name="loginForm"
				onsubmit="return validateForm()">
				<div class="form-group">
					<input type="email" class="form-control" name="email" id="email"
						placeholder="Email"/>
				</div>
				<div class="form-group">
			
				    <input type="password" class="form-control" name="password" id="password" placeholder="Password"/>
				 </div>
				 <div class="form-group">				   
				    <input type="password" class="form-control" name="passwordCheck" id="passwordCheck" placeholder="Confirm Password"/>
				 </div>
				 <div class="form-group">
				    <input type="text" class="form-control" id="name" name="name" placeholder="Name"/>
				 </div>
				 
				 <div class="form-group">
				    <input type="text" class="form-control" id="nicName" name="nicName" placeholder="nickName"/>
				 </div>
				 				 				 
				<div class="form-group" id="sexGroup">
				  	<div class="radio">
						<div class="gender gender-male">
							<input type="radio" name="sex" id="sex" value="0"/>
							<label>남성</label>					
						</div>
						<div class="gender gender-female">
							<input type="radio" name="sex" id="sex" value="1"/>
							<label>여성</label>
						</div>
				 	 </div>
				</div>
				
				<div class="form-group" id="birthday">
						<div class="birthday-label">
						<label for="birthday">생년월일</label>
						</div>
						
						<div class="select_style select_style_year">
						<select id="year" name="year" ></select>
						<div class="select__arrow"></div>
						</div>
						
						<div class="select_style select_style_month">
						<select id="month" name="month"></select>
						<div class="select__arrow"></div>
						</div>
						
						<div class="select_style select_style_day">
						<select id="day" name="day"></select>
						<div class="select__arrow"></div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="phone" id="phone" placeholder="Phone(Option)"/>
					</div>

				
				
				<div class="form-group">
				<button type="submit">Register</button>  
				</div>
			</form>
		</div>


		<div class="cta">
			<a href="">Need any help?</a>
		</div>


	</div>
	<div class="login-footer">
	<a href="/_/_/about/terms-service/" target="_blank" >회사 소개</a>
	<a href="/_/_/about/terms-service/" target="_blank" >서비스 약관</a>
	<a href="/_/_/about/privacy/plain.html" target="_blank">개인정보 보호정책</a>
	<a href="/_/_/about/privacy/plain.html" target="_blank">iPhone 앱</a>
	<a href="/_/_/about/privacy/plain.html" target="_blank">Android 앱</a>
	</div>
</div>
</div>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script>
$("#year").on("mouseover", function () {
	$(".select_style_year").css({"border-color": "#33b5e5"})
});
$("#year").on("mouseleave", function () {
	$(".select_style_year").css({"border-color": "#dcdcdc"})
});

$("#month").on("mouseover", function () {
	$(".select_style_month").css({"border-color": "#33b5e5"})
});
$("#month").on("mouseleave", function () {
	$(".select_style_month").css({"border-color": "#dcdcdc"})
});

$("#day").on("mouseover", function () {
	$(".select_style_day").css({"border-color": "#33b5e5"})
});
$("#day").on("mouseleave", function () {
	$(".select_style_day").css({"border-color": "#dcdcdc"})
});
</script>

<script>
$('.gender-male>label').click(function(){
	$('.gender-male>input').prop('checked', true);

});

$('.gender-female>label').click(function(){
	$('.gender-female>input').prop('checked', true);
});
</script>

<script>
$('.toggle').click(function(){
	  // Switches the Icon
	if($('.toggle>span').is(':visible')) {
		$(".toggle>span").hide();
		$(".toggle>i").show();
	} else {
		$(".toggle>span").show();
		$(".toggle>i").hide();
	}
	  
	  // Switches the forms  
	  $('.form').animate({
	    height: "toggle",
	    'padding-top': 'toggle',
	    'padding-bottom': 'toggle',
	    opacity: "toggle"
	  }, "slow");
	});
</script>

<script>
function validateForm(){ 		
	var pwd = document.forms["loginForm"]["password"].value;
	var pwdCh = document.forms["loginForm"]["passwordCheck"].value;
		var name = document.forms["loginForm"]["name"].value;
		var phone = document.forms["loginForm"]["phone"].value;
	var year = document.forms["loginForm"]["year"].value;
	var month = document.forms["loginForm"]["month"].value;
	var day = document.forms["loginForm"]["day"].value;
	var email = document.forms["loginForm"]["email"].value;
	var sex = document.forms["loginForm"]["sex"].value;
	var nicName = document.forms["loginForm"]["nicName"].value;

	
	if(email==''){
		alert('이메일을 입력해주세요.');
		
		return false;
	}
	
	else if(pwd==''){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	else if(pwdCh==''){
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}

	else if(!(pwd==pwdCh)){
		alert("입력하신 비밀번호가 다릅니다.");
		return false;
	}
	
	else if(name==''){
		alert("이름을 입력해주세요.");
		return false;
	} 
	
	else if(nicName==''){
		alert("닉네임을 입력해주세요.");
		return false;
	} 
	
	
	else if(sex==''){
		alert("성별을 입력해주세요.");
		return false;
	}
	


	else if(phone!=''&& isNaN(phone)){
		alert('핸드폰 번호에 숫자를 입력해주세요.');
		return false;
	}
	 
	else if(year==0||month==0||day==0){
		alert('생일을 입력해주세요.');
		return false;
	}
		
	return true;
}
</script>

<!-- email check -->
<script>
	 function validateEmail(){
  		 var email = document.forms["user-login"]["login-email"].value;
		
		 var request = new window.XMLHttpRequest();
		 var url = "login-member-check?e="+email;
		 request.open("GET",url, true);			
	
		 request.onload = function(){
			 var result = JSON.parse(request.responseText);
			 if(result === null)
			 {
				 alert("등록되지 않은 이메일입니다.");
			 }
			 
		 }
		 
		 request.send();
	 }
</script>

<script>
	window.addEventListener("load",function(){
/* ------------------------생년월일 날짜 추가 자바스크립트----------------------------------- */
		var year = document.querySelector("#year, #year-span");
		var month = document.querySelector("#month");
		var day = document.querySelector("#day");
		var yearStr = "<option value=0 selected>년도</option>";
		var monthStr = "<option value=0 selected>월</option>";
		var dayStr = "<option value=0 selected>일</option>";
		
		for(var i=1960;i<=2017;i++){
			yearStr += "<option value="+i+">"+i+"</option>";
		}
		
		for(var j=1;j<=12;j++){
			monthStr += "<option value="+j+">"+j+"</option>";
		}
		
		for(var k=1;k<=31;k++){
			dayStr += "<option value="+k+">"+k+"</option>";
		}
		
		year.innerHTML = yearStr;
		month.innerHTML = monthStr;
		day.innerHTML = dayStr;
	});	
</script>



</body>
</html>

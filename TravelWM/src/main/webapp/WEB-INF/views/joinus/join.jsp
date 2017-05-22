<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title> 동행이음 with PITAPANY</title>


 	<link href="${root}/resource/css/bootstrap.css" type="text/css" rel="stylesheet" />
 	<link href="${root}/resource/css/bootstrap-theme.css" type="text/css" rel="stylesheet" />

	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="${root }/resource/js/bootstrap.js"></script>


 	<link href="${root}/resource/css/joinus/join.css" type="text/css" rel="stylesheet" />
<script>
	window.addEventListener("load",function(){
/* ------------------------생년월일 날짜 추가 자바스크립트----------------------------------- */
		var year = document.querySelector("#year");
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

<script>
	function validateForm(){ 		
		var pwd = document.forms["loginForm"]["password"].value;
		var pwdCh = document.forms["loginForm"]["passwordCheck"].value;
 		var name = document.forms["loginForm"]["name"].value;
		var phone = document.forms["loginForm"]["name"].value;
		var year = document.forms["loginForm"]["year"].value;
		var month = document.forms["loginForm"]["month"].value;
		var day = document.forms["loginForm"]["day"].value;
		
		if(name==''){
			alert("이름을 입력해주세요.")
			return false;
		} 
		alert(pwd);
		alert(pwdCh);
/* 
		if(pwd!=pwdCh){
			alert('비밀번호가 다릅니다.');
			return false;
		} */
		
/* 		if(isNan(phone)){
			alert('핸드폰 번호에 숫자를 입력해주세요.')
			return false;
		}
		 */
/* 		if(year=='년도'||month=='월'||day=='일'){
			alert('생일을 입력해주세요.')
			return false;
		} */
		
	}

</script>
</head>

<body>

	<div class="bg">
		<div>
		<div class="tool">
			<div class="tool-in">	
				<div class="title">
					<h3><span class="label label-default">가입하고, 동행을 추천받으세요! </span></h3>
					<span style="font-size:10dp;">약간의 정보로 국내외 동행을 구할 수 있습니다.</span>
				</div>
				<form method="GET" name="loginForm" class="form" onsubmit="return validateForm()">
				
					<div class="form-group">
    					<label for="Email">이메일</label>
  						 <input type="email" class="form-control" id="Email" placeholder="Email">
					</div>
					 <div class="form-group">
					    <label for="password">비밀번호</label>
					    <input type="password" class="form-control" id="password" placeholder="Password">
					 </div>
					 <div class="form-group">
					    <label for="passwordCheck">비밀번호 확인</label>
					    <input type="password" class="form-control" id="passwordCheck" placeholder="Password">
					 </div>
					 <div class="form-group">
					    <label for="name">이름</label>
					    <input type="text" class="form-control" id="name" placeholder="Name">
					 </div>
					 				 				 
					<div class="form-group" id="sexGroup">
					  <label for="sex">성별</label>
					  <div class="radio">
						  <label>
						    <input type="radio" name="sex" id="sex" value="0">
							남성
						  </label>					
						  <label>
						    <input type="radio" name="sex" id="sex" value="1">
						    	여성
						  </label>
					  </div>
					</div>

					<div class="form-group" id="birthday">
						<label for="birthday">생년월일</label>
						<div>
						<select id="year" name="year" ></select>
						<select id="month" name="month"></select>
						<select id="day" name="day"></select>
						</div>
					</div>
					<div class="form-group">
						<label for="phone">휴대폰 번호</label>
						<input type="text" class="form-control" id="phone" placeholder="Phone(Option)">
					</div>

					<div class="form-group">
						<input class="btn btn-default" src="../index" value="취소" type="button"/>
						<input class="btn btn-primary" value="가입하기" type="submit"/>
					</div>
		
				</form>
			</div>
		</div>
		</div>
	</div>

</body>
</html>
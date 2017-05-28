<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link type="text/css" rel="stylesheet" href="${root }/resource/css/bootstrap.css"  media="screen,projection"/>
	<title> 동행이음 with PITAPANY</title>
	
	<link href="${root}/resource/css/joinus/style.css" type="text/css" rel="stylesheet" />
	<link href="${root}/resource/css/joinus/login.css" type="text/css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</head>
<body>

	<div class="bg">
		<div>
		<div class="tool">
			<div class="tool-in">	
				<div class="logo-box">
					<img style="background:url('${root}/resource/images/logo.png') no-repeat center;" width=50; height=50/>
				</div>
				
				<div class="intro-box">
					<div class="intro">
					Welcome to 'Travel With Me'
					</div>
					<div class="sub-intro">
					함께 여행할 사람을 찾아요
					</div>
				</div>
				<div data-test-signup="true" class="login-box">
					<div class="login-box-detail">
					<form action="${root }/j_spring_security_check" method="POST">
						<fieldset class="login-form">
							<c:if test="${not empty vaildate && not vaildate}">
								<td colspan="2" style="color:red;">아이디 또는 비번이 유효하지 않습니다. </td>
							</c:if>
							<input type="email" aria-label="이메일을 입력하세요." autocomplete="username" 
								class="login-input" name="j_username" placeholder="이메일" value="" checked="checked"/>
						</fieldset>
						<fieldset style="position:relative;">
							<input type="password" aria-label="비밀번호를 입력하세요." autocomplete="current-password" 
								class="login-input" name="j_password" placeholder="비밀번호를 입력하세요." value="" checked="checked"/>
						</fieldset>
						
						<input aria-label="login" class="login-button" value="로그인" type="submit" />
					</form>
					<p class="or">또는</p>
					<div style="position:relative; background-color: blue;">
						<div style="height:50px;">
							<div class="fb-login-button" 
							data-scope="public_profile,email,user_likes,user_about_me,user_birthday,user_friends" 
							onlogin="checkLoginState">
							</div>
						</div>
					</div>
					
					<div class="help">
						<a href="joinus/join" style="text-decoration: none; ">아이디/비밀번호 찾기</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${root }/joinus/join" style="text-decoration: none;">회원가입</a>
					</div>
					
					<div style="margin-top:15px;">
						<span class="precautions">
						<span data-reactid="34">계정을 만들면 Travel With Me의 <a href="/_/_/about/terms-service/" target="_blank" >서비스 약관
							</a> 및 <a href="/_/_/about/privacy/plain.html" target="_blank">개인정보 보호정책</a>에 동의하는 것으로 간주합니다.
						</span>
						</span>
					</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	


	<%-- <header>
		<a href="../index.html">메인 페이지</a>
		<c:if test="${empty sessionScope.id}">
			<a href="joinus/login">로그인</a>
		</c:if>
		<c:if test="${not empty sessionScope.id}">
			<a href="joinus/logout">${sessionScope.id}님 로그아웃</a>
			<!-- get요청 -->
		</c:if>
		<a href="">회원가입</a> <a href="customer/notice">고객센터</a>
	</header>
	<h1>홈페이지 환영</h1> --%>

</body>
</html>
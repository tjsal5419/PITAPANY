<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel With Me</title>
<!-- 반응형웹 만드는 법 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${root}/resource/css/login.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<!-- <div>
		<div style="bottom:0px;left:0px;right:0px;top:0px;position:fixed;">
		<div style="position:absolute;width:100%;z-index:2;">
	</div> -->
	
	<div class="bg" style="background-image:url('${root}/resource/images/travel_bg.jpg')">
		
		<div class="tool">
			<!-- <div style="display:inline-block;height:100%;width:50%;vertical-align:top;overflow:hidden;
				border-radius:8px 0 0 8px;">
				<div style="background-image:url(https://s.pinimg.com/webapp/style/images/bg_fashion_half-b6d5b171.jpg);
					background-size:cover;background-position:50% 0%;height:100%;width:100%;">
				</div>
			</div> -->
			
			<div class="tool-in">
				<div class="logo-box">
					<svg style="background-image:url('${root}/resource/images/logo.png');" height="50" style="display:block;" viewBox="-3 -3 82 82" width="50" data-reactid="14">
					</svg>
				</div>
				
				<div>
					<div class="intro">
					Welcom to 'Travel With Me'
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
						<a href="" style="text-decoration: none;">아이디/비밀번호 찾기</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="" style="text-decoration: none;">회원가입</a>
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
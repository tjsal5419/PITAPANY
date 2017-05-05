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
</head>
<body>
	<div>
		<div style="bottom:0px;left:0px;right:0px;top:0px;position:fixed;">
		<div style="position:absolute;width:100%;z-index:2;">
	</div>
	
	<div data-test-signup="true" style="background-image:url('${root}/resource/images/travel_bg.jpg'); 
		bottom:0px; left:0px; position:fixed;right:0px;top:0px;min-width:800px;">
		
		<div style="background-color:#f7f4f4;border-radius:8px;height:533px;margin-top:-266px;width:400px;
			left:50%;top:50%;position:absolute;transform:translateX(-50%);">
			<!-- <div style="display:inline-block;height:100%;width:50%;vertical-align:top;overflow:hidden;
				border-radius:8px 0 0 8px;">
				<div style="background-image:url(https://s.pinimg.com/webapp/style/images/bg_fashion_half-b6d5b171.jpg);
					background-size:cover;background-position:50% 0%;height:100%;width:100%;">
				</div>
			</div> -->
			
			<div style="display:inline-block;height:100%;width:100%;vertical-align:top;">
				<div style="margin:30px auto 0;position:relative;height:55px;width:55px;">
				<svg style="background-image:url('${root}/resource/images/logo.png');" height="50" style="display:block;" viewBox="-3 -3 82 82" width="50" data-reactid="14">
				</svg>
				</div>
				
				<div>
					<div style="margin:5px 26px 20px;text-align:center;font-weight:bold; font-size:20px;color:#555;">
					Welcom to 'Travel With Me'
					</div>
					<div style="margin:-10px 26px 30px;text-align:center;font-weight:bold;font-size:14px;color:#b5b5b5;">
					함께 여행할 사람을 찾아요
					</div>
				</div>
				<div data-test-signup="true" style="margin:0 auto;position:relative;text-align:center;">
					<div style="margin:0 auto;width:268px;">
					<form method="POST" novalidate="">
						<fieldset style="position:relative;margin-bottom:7px;">
							<input type="email" aria-label="이메일을 입력하세요." autocomplete="username" 
								class="" name="id" placeholder="이메일" style="background-color:#f0f0f0;border:0px;-webkit-box-shadow:none;
								box-shadow:none;position:relative;-webkit-font-smoothing:antialiased;
								-moz-osx-font-smoothing:grayscale;border-radius:3px;font-weight:bold;padding:10px;
								-webkit-box-sizing:border-box;box-sizing:border-box;width:100%;color:#333;
								font-size:14px;outline:none;" value="" checked="checked"/>
						</fieldset>
						<fieldset style="position:relative;">
							<input type="password" aria-label="비밀번호를 입력하세요." autocomplete="current-password" class="" name="password" 
								placeholder="비밀번호를 입력하세요." style="background-color:#f0f0f0;border:0px;-webkit-box-shadow:none;
								box-shadow:none;position:relative;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;
								border-radius:3px;font-weight:bold;padding:10px;-webkit-box-sizing:border-box;box-sizing:border-box;width:100%;
								color:#333;font-size:14px;outline:none;-webkit-transition:opacity 0.5s linear;transition:opacity 0.5s linear;
								display:flex;opacity:1;align-items:center;justify-content:space-between;height:100%;" value="" checked="checked"/>
						</fieldset>
						
						<button aria-label="계속해서 TravelWM 계정 만들기" class="red SignupButton active" style="border:0px;
							height:36px;display:inline-block;border-radius:4px;-webkit-font-smoothing:antialiased;
							-moz-osx-font-smoothing:grayscale;padding:0 18px;font-size:15px;font-weight:bold;outline:none;
							position:relative;-webkit-box-shadow:none;box-shadow:none;cursor:pointer;margin-top:10px;vertical-align:middle;
							text-align:center;background-color:#bd081c;color:#fff;width:100%;" type="submit">
						
						<div>로그인</div>
						</button>
					</form>
					<p class="" style="margin-bottom:3px;overflow:hidden;text-align:center;color:#555;font-weight:bold;">또는</p>
					<div style="position:relative;" data-reactid="30">
						<div style="height:50px;" data-reactid="31">
							<div class="fb-login-button" 
							data-scope="public_profile,email,user_likes,user_about_me,user_birthday,user_friends" 
							onlogin="checkLoginState">
							</div>
						</div>
					</div>
					
					<div style="margin-top:15px;">
						<span class="" style="-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;font-size:11px;
							font-weight:normal;text-align:center;-webkit-transition:opacity .2s linear;
							transition:opacity .2s linear;color:#aaa;width:224px;">
						<span data-reactid="34">계정을 만들면 Travel With Me의 <a href="/_/_/about/terms-service/" target="_blank" >서비스 약관
							</a> 및 <a href="/_/_/about/privacy/plain.html" target="_blank">개인정보 보호정책</a>에 동의하는 것으로 간주합니다.
						</span>
						</span>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		<button aria-label="" class="lightGrey active" 
			style="border:0px;height:36px;display:inline-block;border-radius:4px;-webkit-font-smoothing:antialiased;
			-moz-osx-font-smoothing:grayscale;padding:0 43px;font-size:15px;font-weight:bold;outline:none;position:absolute;
			-webkit-box-shadow:none;box-shadow:none;cursor:pointer;
			margin-top:10px;vertical-align:middle;text-align:center;background-color:#ebebeb;color:#444;
			right:25px;top:15px;" type="button">
		로그인
		</button>
	</div>
	
	<div style="position:absolute;
		bottom:0px;right:0px;left:0px;animation:scrollFooterWithBgGrid 35s linear;
		-webkit-animation:scrollFooterWithBgGrid 35s linear;-moz-animation:scrollFooterWithBgGrid 35s linear;
		animation-fill-mode:forwards;-webkit-animation-fill-mode:forwards;-moz-animation-fill-mode:forwards;">
	
	<div style="bottom:10px;left:0px;margin-bottom:6px;position:absolute;text-align:center;width:100%;"></div>
	</div>
	</div>
	</div>
    <div class="appendedContainer"></div>
  <div id="tracking-id" style="display:none">b6250f62e041797f32feef8a4b069c3d</div>


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
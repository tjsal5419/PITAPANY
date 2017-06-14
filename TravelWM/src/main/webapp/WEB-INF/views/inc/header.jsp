<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

<%@ include file="userInfo.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${root}/resource/css/inc/header.css" />
<script>
</script>
<head>
	<title> 동행이음 with PITAPANY</title>
</head>

<nav>
    <div class="navbar navbar-default navbar-fixed-top">
    	
    	<div class = "menu-button-mobile"><i class="fa fa-bars"></i></div>
    	<div class="logo"> 로고zz </div>
    	<div class = "search-button-mobile"><i class="fa fa-search"></i></div>
    	
    	
    	
    	
    	<form class="search-bar" action="" method="get" class="form-group">
    		<div class="search-bar-container">
          		<input type="text" class="form-control form-control-header" placeholder="Search">
    	  		<input type="text" class="form-control form-control-header" placeholder="Search">
		  		<input type="button" class="search-button"  alt="Submit">
	    	</div>
	    </form>
        <div class="menu-bar">
	        <ul class="accompany">
	        	<c:if test="${empty pageContext.request.userPrincipal.name }">		
					<li class="except-li"><a href="${root }/joinus/login">로그인</a></li>
					<li class="except-li"><a href="${root }/joinus/join">회원가입</a></li>
				</c:if>	
		
				<security:authorize  access="isAuthenticated()">
					<li>
					<a class="a" href="${root }/j_spring_security_logout">
						${userNicName}님 로그아웃
					</a>
					</li>
				</security:authorize>
				
				<li onclick="location.href='${root}/profile/home';">프로필홈</li>
	        	<li onclick="location.href='${root}/accompany/board';">동행찾기</li>
	        	<li onclick="location.href='${root}/accompany/matching';">동행매칭</li>
	        	<li onclick="location.href='${root}/community/tip';">커뮤니티</li>
	        </ul>
	        <ul class="mypage">
	        	<li><i class="fa fa-envelope message-item"></i></li>
	        	<li><i class="fa fa-bell alarm-item"></i></li>
	        	<li><i class="fa fa-user account-item"></i></li>
	        </ul>
        	<div id="message-content"><p>message</p></div>
        	<div id="alarm-content"><p>alarm</p></div>
        	<div id="account-content"><p>account</p></div>
        </div>
    </div>
    
    <div class='menu-mobile'>
	  <ul>
	    <li onclick="location.href='${root}/accompany/board';">동행찾기</li>
	  </ul>
	  <ul>  
	    <li onclick="location.href='${root}/accompany/matching';">동행매칭</li>
	  </ul>
	  <ul>	
	  	<li onclick="location.href='${root}/community/tip';">커뮤니티</li>
	  </ul>
	</div>
	
	<div class="search-mobile">
		<input type="text" class="form-control form-control-header form-control-mobile" placeholder="Search">
    	<input type="text" class="form-control form-control-header form-control-mobile" placeholder="Search">
		<input type="button" class="search-button search-button-mobile2"  alt="Submit">
	</div>

</nav>
  
<script>
  
$(document).on("click", function(e){
	if($(e.target).is(".message-item")){
		$("#message-content").show();
    }else{
        $("#message-content").hide();
    }
});

$(document).on("click", function(e){
	if($(e.target).is(".alarm-item")){
		$("#alarm-content").show();
    }else{
        $("#alarm-content").hide();
    }
});

$(document).on("click", function(e){
	if($(e.target).is(".account-item")){
		$("#account-content").show();
    }else{
        $("#account-content").hide();
    }
});
  
</script>

<script>


$('.menu-button-mobile').click(function(event){
	
	event.stopPropagation();
    $('.menu-mobile').toggleClass('down');
    $('.search-mobile').removeClass('down');
});


$('.search-button-mobile').click(function(event){
	
	event.stopPropagation();
    $('.search-mobile').toggleClass('down');
    $('.menu-mobile').removeClass('down');
});

$('body').click(function(e){
	
	
	if($(e.target).is(".search-mobile, .search-mobile>input")) {
		
	} else {
		$('.menu-mobile').removeClass('down');
		$('.search-mobile').removeClass('down');
	}
});

</script>




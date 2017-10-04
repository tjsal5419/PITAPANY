<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link href="${root}/resource/css/member/main.css" rel="stylesheet"/>

<main class="main-container">
	

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
	
				<div class="item main-item active"
					style="background-image: url('${root}/resource/images/wallpaper/London.jpg')">
					<div class="carousel-caption">
						<div class="caption-content caption-content-main">
							<h2 class="animated fadeInDown"><span class="highlight">동행의 설레임이 시작되는 곳</span></h2>
							<span class="animated fadeInDown"><span class="highlight">지금 바로 이음 등록하시고 새로운 인연을 만나보세요</span></span>
							<a href="#" class="btn btn-blue btn-effect">이음등록</a>
						</div>
					</div>
					
				</div>
	
				<div class="item"
					style="background-image: url('${root}/resource/images/wallpaper/TreeSky.jpg')">
					<div class="carousel-caption">
						<div class="caption-content caption-content-sub">
							<h2 class="animated fadeInDown"><span class="highlight">여행이란 익숙한 것과의 작별, 낯선 것과의 설레는 만남</span></h2>
							<span class="animated fadeInDown"><span class="highlight">공지영, &lt;수도원기행&gt; 중에서</span></span> 
						</div>
					</div>
				</div>
				
	
				<div class="item"
					style="background-image: url('${root}/resource/images/wallpaper/Ibiza.jpg')">
					<div class="carousel-caption">
						<div class="caption-content caption-content-sub">
							<h2 class="animated fadeInDown"><span class="highlight">만남은 인연이고 관계는 노력이다</span></h2>
							<span class="animated fadeInDown"><span class="highlight">양광모, 비상 중에서</span></span>
						</div>
					</div>
				</div>
			
			<!-- Left and right controls -->
			<nav id="nav-arrows" class="nav-arrows">
			<a class="left carousel-control sl-prev" href="#myCarousel" data-slide="prev"></a>
			<a class="right carousel-control sl-next" href="#myCarousel" data-slide="next"> </a>
			</nav>
	
			</div>
	
	</div>
</main>


<div class="service-container">
	<div class="board-container">
		<div class="board-container-title-wrapper">
			<div class="board-container-title">
				<h2>새이음</h2>
			</div>
			
			<div class="head-line"></div>
		</div>
		
		<div class="board-wrapper">
			
			<c:forEach items="${accomBoardMainList }" var="li">
			<div class="board-card">
			
				<div class="board-content">
					
					<div class="board-detail">
						<div class="board-detail-wrapper">
							<div class="board-profile-pic" style="background-image:url('${root}${li.imgSrc }${li.imgName }')">
							</div>
							<div class="board-accompany-info">
								<div class="info-item item-nickname">${li.writerNicName }</div>
								<div class="info-item item-country-date">
								${li.country }</br>
								<fmt:formatDate value="${li.startDate }" pattern="YY.MM.dd" />
								-
								<fmt:formatDate value="${li.endDate }" pattern="YY.MM.dd" />		
								</div>
							</div>
						</div>
					</div>
					
					<div class="board-title" onclick="window.location.href='${root }/accompany/detail?id=${li.id }'">
						<div class="board-title-detail">
							<span>${li.title }</span>
						</div>
					</div>
					
					<div class="board-info">
						<div class="board-info-wrapper">
							<div class="board-info-item item-gender">
								<span><c:choose>
									<c:when test="${li.writerSex==1 }">
										여성
									</c:when>
									<c:otherwise>
										남성
									</c:otherwise>
								</c:choose>
								</span>
							</div>
							<div class="board-info-item item-age"><span>${li.writerAge}세</span></div>
							<div class="board-info-item item-style"><span>${li.styleType }</span></div>
						</div>
						<div class="board-registration-time">
							<span>등록일</span></br>
							<span><fmt:formatDate value="${li.regDate }" pattern="yyyy-MM-dd" /></span>
						</div>
					</div>		
				</div>
			</div>
			</c:forEach>
			
		</div>
		
		<div class="page-info-container">
			<button type="button" class="more-btn" onclick="window.location.href='${root }/accompany/board'">더 보기</button>
		</div>
	</div>
</div>





<!-- --Transparent Header-------------------------------------------------------------------------------- -->
<script>
$(window).scroll(function () {
    var sc = $(window).scrollTop()
    
    $(".navbar-transition").css("transition-duration", "0.4s");
  
    if (sc > 10){
    		$(".sub-menu-container").addClass("sub-menu-container-main");
    		$(".navbar-top").addClass("navbar-top-main");
	    	$(".navbar").addClass("navbar-main");
	    	$(".logo").addClass("logo-main");
	    	$(".header-input").attr('id', "input-main");
	    	$(".search-button").addClass("search-button-main");
	    	$(".default-fa").attr('id', 'fa-main');
	    	$(".default-font").attr('id', 'font-main');
	    	
	    	$(".fa-bars").attr('id',"bars-main");
	    	$(".fa-search").attr('id',"search-main");
    } else {
   	 	$(".sub-menu-container").removeClass("sub-menu-container-main");
   	 	$(".navbar-top").removeClass("navbar-top-main");
	  	$(".navbar").removeClass('navbar-main');
	    	$(".logo").removeClass("logo-main");
	    	$(".header-input").removeAttr('id', "input-main");
	    	$(".search-button").removeClass("search-button-main");
	    	$(".default-fa").removeAttr('id', 'fa-main');
	    	$(".default-font").removeAttr('id', 'font-main');
	    	
	    	$(".fa-bars").removeAttr('id',"bars-main");
	    	$(".fa-search").removeAttr('id',"search-main");
    }
});
</script>
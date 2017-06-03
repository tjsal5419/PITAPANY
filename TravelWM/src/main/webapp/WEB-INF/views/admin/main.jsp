<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link href="${root}/resource/css/admin/main.css" rel="stylesheet"/>


<script src="${root}/resource/js/main/jquery-1.11.1.min.js"></script>
<script src="${root}/resource/js/main/bootstrap.min.js"></script>
<script src="${root}/resource/js/main/jquery.nav.js"></script>
<script src="${root}/resource/js/main/main.js"></script>
 

<main>
	<section id="home" class="page-slide-container">
		<div id="home-carousel" class="carousel slide page-slider" data-interval="false">
			<ol class="carousel-indicators">
				<li data-target="#home-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#home-carousel" data-slide-to="1"></li>
				<li data-target="#home-carousel" data-slide-to="2"></li>
				<li data-target="#home-carousel" data-slide-to="3"></li>
			</ol>
	
			<div class="carousel-inner">
	
				<div class="item active"
					style="background-image: url('${root}/resource/images/London.jpg')">
					<div class="carousel-caption">
						<div class="caption-content">
                                <h2 class="animated fadeInDown">TRIP THE EUM, BLAH BLAH</h2>
                                <span class="animated fadeInDown">당신과 당신의 동행을 이어주는</span>
                                <a href="#" class="btn btn-blue btn-effect">Join US</a>
						</div>
					</div>
				</div>
	
				<div class="item" style="background-image: url('${root}/resource/images/Austria.jpg')">
					<div class="carousel-caption">
						<div class="caption-content">
                                <h2 class="animated fadeInDown">BLUE Onepage HTML5 Template</h2>
                                <span class="animated fadeInDown">Clean and Professional one page Template</span>
                                <a href="#" class="btn btn-blue btn-effect">Join US</a>
						</div>
					</div>
				</div>
	
				<div class="item" style="background-image: url('${root}/resource/images/Paris.jpg')">
					<div class="carousel-caption">
						<div class="caption-content">
                                <h2 class="animated fadeInDown">BLUE Onepage HTML5 Template</h2>
                                <span class="animated fadeInDown">Clean and Professional one page Template</span>
                                <a href="#" class="btn btn-blue btn-effect">Join US</a>
						</div>
					</div>
				</div>
				
				<div class="item" style="background-image: url('${root}/resource/images/Paris.jpg')">
					<div class="carousel-caption">
						<div class="caption-content">
                                <h2 class="animated fadeInDown">BLUE Onepage HTML5 Template</h2>
                                <span class="animated fadeInDown">Clean and Professional one page Template</span>
                                <a href="#" class="btn btn-blue btn-effect">Join US</a>
						</div>
					</div>
				</div>
			</div>

			<nav id="nav-arrows" class="nav-arrows">
				<a class="sl-prev" href="#home-carousel" data-slide="prev">
					
				</a>
				
				<a class="sl-next" href="#home-carousel" data-slide="next">
									
				</a>
			</nav>
	
		</div>
	</section>
</main>



<div class="service-container">

	<div class="board-container">
		<div class="board-wrapper">
			
			
			<div class="board-card">
				<div class="board-content">
					
					<div class="board-detail">
						<div class="board-detail-wrapper">
							<div class="board-profile-pic">
							</div>
							<div class="board-accompany-info">
								<div class="info-item item-nickname">닉네임</div>
								<div class="info-item item-country">동행국가</div>
								<div class="info-item item-date">동행날짜</div>
							</div>
						</div>
					</div>
					
					<div class="board-title">
						<div class="board-title-detail">
							<span>나랑 함께 동행할 사람 손 gdsgasdfeawdfsadfasfjefie!</span>
						</div>
					</div>
					
					<div class="board-info">
						<div class="board-info-wrapper">
							<div class="board-info-item item-gender">성별</div>
							<div class="board-info-item item-age">나이</div>
							<div class="board-info-item item-style">성향</div>
						</div>
						<div class="board-registration-time">
							<span>등록시간</span>
						</div>
					</div>		
				</div>
			</div>
			
			<div class="board-card">
				<div class="board-content">
					
					<div class="board-detail">
						<div class="board-detail-wrapper">
							<div class="board-profile-pic">
							</div>
							<div class="board-accompany-info">
								<div class="info-item item-nickname">닉네임</div>
								<div class="info-item item-country">동행국가</div>
								<div class="info-item item-date">동행날짜</div>
							</div>
						</div>
					</div>
					
					<div class="board-title">
						<div class="board-title-detail">
							<span>나랑 함께 동행할 사람 손 gdsgasdfeawdfsadfasfjefie!</span>
						</div>
					</div>
					
					<div class="board-info">
						<div class="board-info-wrapper">
							<div class="board-info-item item-gender">성별</div>
							<div class="board-info-item item-age">나이</div>
							<div class="board-info-item item-style">성향</div>
						</div>
						<div class="board-registration-time">
							<span>등록시간</span>
						</div>
					</div>		
				</div>
			</div>
			
			<div class="board-card">
				<div class="board-content">
					
					<div class="board-detail">
						<div class="board-detail-wrapper">
							<div class="board-profile-pic">
							</div>
							<div class="board-accompany-info">
								<div class="info-item item-nickname">닉네임</div>
								<div class="info-item item-country">동행국가</div>
								<div class="info-item item-date">동행날짜</div>
							</div>
						</div>
					</div>
					
					<div class="board-title">
						<div class="board-title-detail">
							<span>나랑 함께 동행할 사람 손 gdsgasdfeawdfsadfasfjefie!</span>
						</div>
					</div>
					
					<div class="board-info">
						<div class="board-info-wrapper">
							<div class="board-info-item item-gender">성별</div>
							<div class="board-info-item item-age">나이</div>
							<div class="board-info-item item-style">성향</div>
						</div>
						<div class="board-registration-time">
							<span>등록시간</span>
						</div>
					</div>		
				</div>
			</div>
			
			<div class="board-card">
				<div class="board-content">
					
					<div class="board-detail">
						<div class="board-detail-wrapper">
							<div class="board-profile-pic">
							</div>
							<div class="board-accompany-info">
								<div class="info-item item-nickname">닉네임</div>
								<div class="info-item item-country">동행국가</div>
								<div class="info-item item-date">동행날짜</div>
							</div>
						</div>
					</div>
					
					<div class="board-title">
						<div class="board-title-detail">
							<span>나랑 함께 동행할 사람 손 gdsgasdfeawdfsadfasfjefie!</span>
						</div>
					</div>
					
					<div class="board-info">
						<div class="board-info-wrapper">
							<div class="board-info-item item-gender">성별</div>
							<div class="board-info-item item-age">나이</div>
							<div class="board-info-item item-style">성향</div>
						</div>
						<div class="board-registration-time">
							<span>등록시간</span>
						</div>
					</div>		
				</div>
			</div>
			
		</div>
		
		<div class="page-info-container">
			<button type="button" class="btn-more">더보기</button>
		</div>
	</div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="/TravelWM/resource/css/accompany/detail.css" type="text/css" />

<main id="main">
<div class="frame">
	<div class="content">
		<div class="head">
			<div class="profile">
				<div class="pic"></div>
				<div class="info">
					<span class="item">맥보이</span><span class="item">베를린(독일)</span><span
						class="item">2017.07.01~2017.07.31</span>
				</div>
			</div>
			<div class="bookmark">
				<a href=""><img
					src="/TravelWM/resource/images/accompany-detail/ic_bookmark_black_24dp_1x.png"></a>
			</div>
		</div>
		<div class="detail-title">
			<span>여행가기 딱 좋은 날입니다.</span>
		</div>
		<div class="text">
			<span>The HTML Certificate documents your knowledge of HTML.
				The CSS Certificate documents your knowledge of advanced CSS. The
				JavaScript Certificate documents your knowledge of JavaScript and
				HTML DOM. The jQuery Certificate documents your knowledge of jQuery.
				The PHP Certificate documents your knowledge of PHP and SQL (MySQL).
				The XML Certificate documents your knowledge of XML, XML DOM and
				XSLT. The Bootstrap Certificate documents your knowledge of the
				Bootstrap framework.</span>
		</div>
		<div class="foot">
			<div class="char">
				<div class="item1"></div>
				<div class="item2"></div>
				<div class="item3"></div>
			</div>
			<div class="chat">
				<a href="">대화하기</a>
			</div>
		</div>
		<div class="reply">
			<div class="left">
				<div class="re">
					<a href="">댓글수</a>
				</div>
				<div class="view">
					<a href="">조회수</a>
				</div>
			</div>
			<div class="right">
				<a href="">등록시간</a>
			</div>
		</div>
	</div>
</div>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
<script>
	function initialize() {
		var mapProp = {
			center : new google.maps.LatLng(52.50056, 13.39889),
			zoom : 5,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<div id="googleMap" class="map-container"></div>
</main>
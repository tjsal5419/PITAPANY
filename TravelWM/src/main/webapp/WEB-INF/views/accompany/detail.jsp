<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${root}/resource/css/accompany/detail.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	window.addEventListener("load", function() {
		var re = document.querySelector("#re");
		var rep = document.querySelector("#rep");
		re.onclick = function() {
			if (rep.style.display != "none") {
				rep.style.display = "none";
			} else if (rep.style.display == "none") {
				rep.style.display = "flex";
			}
		}
	});
</script>
<main id="main">
<div class="frame">
	<div class="content">
		<div class="head">
			<div class="profile">
				<div class="pic"></div>
				<div class="info">
					<span class="item">${accDetail.memberId}</span>
					<span class="item">베를린(독일)</span>
					<span class="item"><fmt:formatDate value="${accDetail.startDate}" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${accDetail.endDate}" pattern="yyyy-MM-dd" /></span>
				</div>
			</div>
			<div class="bookmark">
				<a href=""><img
					src="/TravelWM/resource/images/accompany-detail/ic_bookmark_black_24dp_1x.png"></a>
			</div>
		</div>
		<div class="detail-title">
			<span>${accDetail.title}</span>
		</div>
		<div class="text">
			<span>${accDetail.context}</span>
		</div>
		<div class="foot">
			<div class="char">
				<div class="item1"></div>
				<div class="item2"></div>
				<div class="item3"></div>
			</div>
			<a href="#"><button class="btn btn-info chat">대화하기</button></a>
		</div>
		<div class="reply">
			<div class="left">
				<button id="re" class="btn btn-info">댓글</button>
				<div class="view">
					<span>조회수: ${accDetail.hits}</span>
				</div>
			</div>
			<div class="right">
				<span>등록시간: <fmt:formatDate value="${accDetail.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</div>
		</div>
		<div id="rep" class="rep" style="display: none;">
			<div class="void">
				<div class="re-pic"></div>
				<div class="re-text">
					<textarea></textarea>
				</div>
				<button class="btn btn-info">등록</button>
			</div>
			<div class="re-list">
				<div class="list-void">
					<div class="id-date">
						<div class="re-id"><span>MacJo</span></div>
						<div class="re-date"><span>11-03-02 09:10</span></div>
					</div>
					<div class = "list-content">
						<div class="list-pic"></div>
						<div class="list-text">
							<span>52.50056, 13.39889</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
<script>
	function initialize() {
		var mapProp = {
			center : new google.maps.LatLng(${accDetail.latitude}, ${accDetail.longitude}),
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
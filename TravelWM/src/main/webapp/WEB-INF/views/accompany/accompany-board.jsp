<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link href="${root}/resource/css/accompany/accompany-board.css" rel="stylesheet"/>

	<div id="filter-container">
		<div class="filter-item-container">
			<button type="button" class="btn btn-filter">성별</button>
			<button type="button" class="btn btn-filter">나이</button>
			<button type="button" class="btn btn-filter">성향</button>
			<button type="button" class="btn btn-write">글쓰기</button>
		</div>
	</div>

<main id="main-container">
	
	<div id="board-container">

	</div>
	
</main>

	<div id="map-container">
		<div id="map-wrapper"></div>
		<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
		<script>
			function initialize() {
				var mapPosition = {
								center : new google.maps.LatLng(52.50056, 13.39889),
								zoom : 5,
								mapTypeId : google.maps.MapTypeId.ROADMAP
								};
				var map = new google.maps.Map(document.getElementById("map-wrapper"), mapPosition);}
				
				google.maps.event.addDomListener(window, 'load', initialize);
		</script>
	</div>



<!-- 
<style>
main {
	flex: auto;
	min-height: 0px;
}

table {
	margin-top: 10px;
	width: 60%;
	border-collapse: collapse;
}

th, td {
	border-top: 1px solid;
	border-botton: 1px solid;
	padding: 5px, 10px;
}

#nate a:last-child {
	margin-left: auto;
}

#nav a:nth-child(3) {
	margin-right: auto;
}

#re span:last-child {
	margin-left: auto;
}
</style>
<main id="main">
<h2 class="main-title">디테일</h2>
<div
	style="border: 1px solid; width: 80%; display: flex; flex-direction: column; align-items: center;">
	<div>[profile pic.]</div>
	<table>
		<tbody>
			<tr>
				<th>닉네임</th>
				<td>조사장</td>
			</tr>
			<tr>
				<th>동행장소</th>
				<td>독일</td>
			</tr>
			<tr>
				<th>동행날짜</th>
				<td>2017.07.07 ~ 2017.07.09</td>
			</tr>
		</tbody>
	</table>
	<div id="nav"
		style='display: flex; justify-content: flex-end; width: 50%'>
		<a href=''>목록</a>&nbsp;<a href=''>수정</a>&nbsp;<a href=''>삭제</a>
		<button>이전글</button>
		<button>다음글</button>
	</div>
	<table style="border: none;">
		<tbody>
			<tr>
				<th>제목</th>
				<td>여행가기 딱 좋은 날입니다.</td>
			</tr>
			<tr>
				<td colspan='2'>The HTML Certificate documents your knowledge
					of HTML. The CSS Certificate documents your knowledge of advanced
					CSS. The JavaScript Certificate documents your knowledge of
					JavaScript and HTML DOM. The jQuery Certificate documents your
					knowledge of jQuery. The PHP Certificate documents your knowledge
					of PHP and SQL (MySQL). The XML Certificate documents your
					knowledge of XML, XML DOM and XSLT. The Bootstrap Certificate
					documents your knowledge of the Bootstrap framework.</td>
			</tr>
			<tr>
				<td><a href=''>남자</a>&nbsp;<a href=''>32세</a>&nbsp;<a href=''>맛집스틸</a></td>
				<td><a href=''>대화하기</a></td>
			</tr>
		</tbody>
	</table>

	<div id="re" style="display: flex; width: 60%;">
		<span>댓글수: 0</span> <span>조회수: 10</span> <span>등록시간 07:30</span>
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
	<div id="googleMap" style="width: 500px; height: 380px;"></div>
</div>
</main> -->
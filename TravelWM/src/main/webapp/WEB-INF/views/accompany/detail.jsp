<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<main id="main">
<h2 class="main-title">동행 디테일</h2>
<div style='display: flex;'>
	<div>[profile pic.]</div>
	<table border='1'>
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
</div>
<table border="1">
	<tbody>
		<tr>
			<th>제목</th>
			<td>여행가기 딱 좋은 날입니다.</td>
		</tr>
		<tr>
			<td colspan='2'>내용이 들어갈 자리입니다. 테스트 중입니다.</td>
		</tr>
	</tbody>
</table>
<div>
	<a href=''>목록</a> <a href=''>수정</a> <a href=''>삭제</a>
	<button>이전글</button>
	<button>다음글</button>
</div>

<div style='display: flex;'>
	<a href=''>냄자</a> <a href=''>32세</a> <a href=''>맛집스릴러</a><a href=''>daehwahaja</a>
</div>
<div style='border-top: 2px solid;'>
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
</main>
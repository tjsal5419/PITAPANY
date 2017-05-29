<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link href="${root}/resource/css/profile/home.css" rel="stylesheet"/>

<style>
.box {
	border: 2px solid;
}
</style>  
<div class="img">
	<div class="background">
		<img class="background-pictures" src="${root}/resource/images/signal.jpg" alt="프로필사진">
	</div>
	<div class="center">
		<div class="name">프로필명</div>
	</div>
	<br/>
	<br/>
	<div class="thumblist">
		<img class="prof-img-circle" src="${root}/resource/images/sakura.jpg" alt="프로필사진">
	</div>
	<input id="setting-button" type="button" value="프로필 수정" />
	
	<div>닉네임</div>
	<br />
	<hr />
</div> 

<main id="">
<div class="content-container">
	<h2 class="main-title"></h2>	
		
		<div style='display: flex;'>
			<table border="1">
				<tbody>
					<tr>
						<th>목록전환</th>		
						<th>대화하기(게스트) / 글쓰기(주인)</th>				
						<th>자세히</th>				
					</tr>
				</tbody>
			</table>		
			
		</div>
		
		<br />
		<hr />
			
		<div class="box">
			<br/>
			<div style='display: flex;'>
				<div>프로필 사진(작은거)</div>
				<table border="1">
					<tbody>
						<tr>
							<th>닉네임</th>				
						</tr>
						<tr>
							<th>위치</th>				
						</tr>
						<tr>
							<th>글 등록일</th>				
						</tr>
					</tbody>
				</table>		
			</div>
			
			<div>글 내용
				<br/>
				<tr>
					<td colspan="2"><textarea rows="5" cols="60" name="content"></textarea>
					</td>
				</tr>
			</div>
			
			<div>하트</div>
			<div>댓글</div>
			
			<div>하트수</div>
			<div>댓글수</div>
			<br/>
		</div>	
		
		<br />
		<hr />
		
		<div class="box">
			<br/>
			<div style='display: flex;'>
				<div>프로필 사진(작은거)</div>
				<table border="1">
					<tbody>
						<tr>
							<th>닉네임</th>				
						</tr>
						<tr>
							<th>위치</th>				
						</tr>
						<tr>
							<th>글 등록일</th>				
						</tr>
					</tbody>
				</table>		
			</div>
			
			<div>글 내용
				<br/>
				<tr>
					<td colspan="2"><textarea rows="5" cols="60" name="content"></textarea>
					</td>
				</tr>
			</div>
			
			<div>하트</div>
			<div>댓글</div>
			
			<div>하트수</div>
			<div>댓글수</div>
			<br/>
		</div>	
		
		<br />
		<hr />
		
		<div style='display: flex;'>
			<table border="1">
				<tbody>
					<tr>
						<th>동행평가</th>		
						<th>대화하기(게스트) / 글쓰기(주인)</th>				
						<th>홈으로</th>				
					</tr>
				</tbody>
			</table>		
			
		</div>
		
		<br />
		<hr />
		
		<div class="box">
			<div style='display: flex;'>
				<div>자기정보</div>
				<input id="setting-button" type="button" value="프로필 수정" />
			</div>
		</div>
		
		<div class="box">
				<div>여행현황</div>
				<input id="setting-button" type="button" value="추가 버튼" />
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
			<input id="setting-button" type="button" value="현황 요약 " />
		</div>
	</div>
	
</main>
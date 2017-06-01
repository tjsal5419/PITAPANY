<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link href="${root}/resource/css/profile/home.css" rel="stylesheet"/>
<%-- <link href="${root}/resource/css/bootstrap.css" rel="stylesheet"/> --%>

<div>
	<div class="back-img">
		<div class="background">
			<img class="background-pictures" src="${root}/resource/images/signal.jpg" alt="프로필사진">
		</div>
	</div> 
</div>  
<div class="setting-button"><button type="button" class="btn btn-info">프로필 설정</button></div>
<div class="prof-img">
	<div class="center">
		<div class="name">프로필명</div>
		
		<div class="thumblist">
			<img class="prof-img-circle" src="${root}/resource/images/sakura.jpg" alt="프로필사진">
		</div>
	</div>
	<div class="center">닉네임</div>
</div>			

<main class="home">		

	<div>
		<div class="menu">
			<div>목록전환</div>		
			<div>대화하기(게스트) / 글쓰기(주인)</div>				
			<div>자세히</div>				
		</div>
	</div>
	<div class="content-container">
	<h2 class="main-title"></h2>	
			
		<div class="box">
			<div class="prof-box">
				
				<div style='display: flex;'>
					<div class="prof-thumblist">
						<img class="prof-small-img-circle" src="${root}/resource/images/sana01.jpg" alt="프로필사진">
					</div>
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
					
					<tr>
						<td colspan="2"><textarea rows="5" cols="60" name="content"></textarea>
						</td>
					</tr>
				</div>
				
				<div>하트</div>
				<div>댓글</div>
				
				<div>하트수</div>
				<div>댓글수</div>
				
			</div>
		</div>	
	</div>
		

	<div class="content-container">
	<h2 class="main-title"></h2>	
			
		<div class="box">
			<div class="prof-box">
				
				<div style='display: flex;'>
					<div class="prof-thumblist">
						<img class="prof-small-img-circle" src="${root}/resource/images/sana01.jpg" alt="프로필사진">
					</div>
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
					
					<tr>
						<td colspan="2"><textarea rows="5" cols="60" name="content"></textarea>
						</td>
					</tr>
				</div>
				
				<div>하트</div>
				<div>댓글</div>
				
				<div>하트수</div>
				<div>댓글수</div>
				
			</div>
		</div>	
	</div>
	
	
	<div>
		<div class="menu">
			<div>동행평가</div>		
			<div>대화하기(게스트) / 글쓰기(주인)</div>				
			<div>홈으로</div>				
		</div>
	</div>
		
					
	<div class="content-container">		
				
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
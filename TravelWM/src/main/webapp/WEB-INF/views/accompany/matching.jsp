<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root}/resource/css/accompany/matching.css" rel="stylesheet"/>

<!-- For Age Selector -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- For Matching Card Slider -->
<link rel="stylesheet" type="text/css" href="${root}/resource/css/accompany/matching-slick.css"/>
<link rel="stylesheet" type="text/css" href="${root}/resource/css/accompany/matching-slick-theme.css"/>
<script type="text/javascript" src='${root}/resource/js/matching/slick.js'></script>

 <script>
 	window.addEventListener("load",function(event){
 		var matchedListButton = document.querySelector(".matched-list-button");

 		
 		matchedListButton.onclick=function(){
 			document.getElementById("myDropdown").classList.toggle("show");
 		};

 		
 	});


	 // Close the dropdown menu if the user clicks outside of it
	 window.addEventListener("click",function(event) {
	   if (!event.target.matches('.matched-list-button')) {
	
	     var dropdowns = document.getElementsByClassName("dropdown-content");
	     var i;
	     for (i = 0; i < dropdowns.length; i++) {
	       var openDropdown = dropdowns[i];
	       if (openDropdown.classList.contains('show')) {
	         openDropdown.classList.remove('show');
	       }
	     }
	   }
	 });
 </script>
 
 <script type="text/javascript">
				$(document).on('ready', function() {
					$(".regular").slick({
						dots : false,
						infinite : true,
						adaptiveHeight : true,
						slidesToShow : 1,
						slidesToScroll : 1
					});
				});
			</script>
 
 
<main class="matching-page-container">
<div>
	
<!-- ----------------- 매칭된 동행 창 ------------------------- -->	
	<div class="matched-accompany-section">
		<div class="matched-accompany-form">
		
		
			<div class="matched-accompany-info">
				<div class="matched-accompany-info-container">
					<div class="matched-accompany-title">
						<span>오늘의 이음</span>
					</div>
					
					<div class="matched-list-wrapper">
						<span>매칭 내역</span>
						<div class="dropdown">
							<img class="matched-list-button"
								src="${root }/resource/images/ic_more_vert_white_24dp_1x.png" />
							<div id="myDropdown" class="dropdown-content">
								<c:forEach items="${memberPrevMatchedList }" var="li">
									<c:if test="${memberAccomInfoId ne li.id }">
										<div style="cursor: pointer;" id="prev-matched-list${li.id }">${li.nicName }님
											(${li.place })</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					<%-- <div class="matched-accompany-histroy">
						<a href="${root }/member/acc-setting?scr=accom-list"><span>이음 내역</span></a>
					</div> --%>
				</div>
			</div>
	
	
			<section class="regular slider">
				<div>
					<div class="wrapper">
						<div class="matched-card">
			
							<div class="matched-card-header">
								<img class="circle-img" src="https://goo.gl/DM5s4f" alt="" />
								<div class="matched-nicName">닉네임</div>
							</div>
			
			
							<div class="matched-location">
								<div class="accom-location">이음 장소</div>
								<div class="accom-date">이음 날짜</div>
							</div>
			
			
							<div class="matched-message">
								<a href="" class="btn-matched-message" id="request-chatting">대화하기</a>
							</div>
			
			
							<div class="matched-info clearfix">
								<div class="matched-info-item">
									<div class="item-value accom-age">나이</div>
								</div>
								<div class="matched-info-item">
									<div class="item-value accom-sex">성별</div>
								</div>
								<div class="matched-info-item">
									<div class="item-value accom-style">스타일</div>
								</div>
							</div>
			
						</div>
					</div>
				</div>
			</section>
	
				<%-- 
			<!-- 기존에 매치되었던 동행 목록 불러오기 -->
			<div class="matched-list">
				<div class="matched-list-box">
					
				</div>
				<h3><a href="${root }/member/acc-setting?scr=accom-list">이전 동행 목록</a></h3>
				<div class="dropdown">
				  <img class="matched-list-button" src="${root }/resource/images/ic_more_vert_black_24dp_1x.png"/>
				  <div id="myDropdown" class="dropdown-content">
				  	<c:forEach items="${memberPrevMatchedList }" var="li">
				  		<c:if test="${memberAccomInfoId ne li.id }">
					    	<div style="cursor:pointer;" id="prev-matched-list${li.id }">${li.nicName }님 (${li.place })</div>
					    </c:if>
				  	</c:forEach>
				  </div>
				</div>
			</div>
			
			<!-- 새로 매칭된 동행의 정보 보기 -->
			<div class="matched-profile">
				<div>
					<h2 class="matched-profile-title">오늘 하루 매칭된 동행 </h2>
				</div>
				<div>
					<h2 class="match-count">남은 횟수 : ${matchCount }</h2>
				</div>
				<ul class="matched-profile-img">
					<li><img class="prev-button" src="${root }/resource/images/ic_keyboard_arrow_left_black_24dp_2x.png"/></li>
					<li><img class="circle-img" src="${root }/resource/images/default-user-image.png"/></li>
					<li><img class="next-button" src="${root }/resource/images/ic_keyboard_arrow_right_black_24dp_2x.png"/></li>
				</ul>
				<c:choose>
					<c:when test="${memberPrevMatchedListToday.size()} >0">				
						<div class="matched-nicName">
							닉네임
						</div>
					</c:when>
					<c:otherwise>
						<div class="matched-nicName">
							매칭된 동행이 없습니다.
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!-- 매치된 동행의 정보 보기 -->	
			<div class="matched-info">
				<div class="accom-location">
					동행 장소
				</div>
				
				<div class="accom-date">
					동행 날짜
				</div>
							
				<div class="accom-sex">
					성별
				</div>
				<div class="accom-age">
					나이
				</div>				
				
				<div class="chatting">
					<input  type="button" class="btn btn-info" id="request-chatting" value="대화하기"/>
				</div>
				
			</div> --%>
			
			
		</div>
	</div>
	
	
	
	
	<div class="accompany-option-section">
		<form name="matching-info-form" class="matching-info-form">
			
			
			<div class="accompany-manage">
				<div class="accompany-manage-title">
					<span>나의 이음 플랜</span>
				</div>
				
				<div class="accompany-info-title">
			<!-- 	본인이 등록한 동행 정보가 없는 경우, 본인 동행 정보 등록하는 페이지로 이동하도록 하는 조건문 -->
					<c:choose>
						<c:when test="${size>0 }">
							<div class="manage-page"><a href="${root }/member/acc-setting">이음플래너</a></div>				
						</c:when>
						
						<c:otherwise>
							<div class="manage-page-no-accom-info"><a href="${root }/member/acc-setting">등록된 동행 정보가 없습니다. 동행 정보 등록 후 이용해주세요.</a></div>						
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="accompany-info-list-wrapper">
					<div class="accompany-info-list">
						<c:forEach items="${memAccomInfoList }" var="li">
							<div class="accompany-info-detail">
								<input type="radio" id="${li.id }" name="accompany-info" value=${li.id } required/>
								<label class="label-for-accom-info" for="${li.id }"> 
											${li.country }&nbsp;${li.locality }&nbsp;${li.place }&nbsp;
									    	<fmt:formatDate value="${li.startDate }" pattern="yy.MM.dd" />
											-
											<fmt:formatDate value="${li.endDate }" pattern="yy.MM.dd" />							
								</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
			
			<div class="accompany-option">
				<div class="accompany-option-title">
					<span>선호 이음 정보</span>
				</div>
				<div class="accompany-option-wrapper">
					<div class="sex">
						<div class="select-label"><span>성별</span></div>
						<div class="select-container">
							 <div class="select-box">
								 <input type="radio" id="boy" name="sex" value="0"/>
								 <label for="boy">남성</label>
							 </div>
							 <div class="select-box">
								 <input type="radio" id="girl" name="sex" value="1"/>
								 <label for="girl">여성</label>
							 </div>
							 <div class="select-box">
								 <input type="radio" id="everyone" name="sex" value="2" checked/>
								 <label for="everyone">무관</label>
							 </div>
						</div>
					</div>
			
			<link rel="stylesheet" type="text/css" href="${root}/resource/css/inc/nouislider.css"/>
	<script type="text/javascript" src='${root}/resource/js/inc/nouislider.js'></script>		
	<script type="text/javascript" src='${root}/resource/js/inc/wNumb.js'></script>
				
				<script>
				
				window.addEventListener("load",function(event){
					var ageSlider = document.getElementById('age-content-container');

					noUiSlider.create(ageSlider, {
						start: [25, 35],
						step: 1,
						connect: true,
						format: wNumb({
							decimals: 0
						}),
						range: {
							'min': 15,
							'max': 45
						}
					});
			 	
					
					var ageMarginMin = document.getElementById('age-min'),
					ageMarginMax = document.getElementById('age-max');

					ageSlider.noUiSlider.on('update', function ( values, handle ) {
						if ( handle ) {
							ageMarginMax.innerHTML = values[handle];
						} else {
							ageMarginMin.innerHTML = values[handle];
						}
					});
			 	});
				
				window.addEventListener("load",function(event){
					var distanceSlider = document.getElementById('distance-content-container');

					noUiSlider.create(distanceSlider, {
						start: [10],
						step: 1,
						padding: 5,
						connect: [true, false],
						format: wNumb({
							decimals: 0
						}),
						range: {
							'min': -4,
							'max': 105
						}
					});
			 	
					
					var distanceMargin = document.getElementById('distance-margin');

					distanceSlider.noUiSlider.on('update', function ( values, handle ) {
							distanceMargin.innerHTML = values[handle];
					});
			 	});
				
				
				</script>	
				
				<script>
$( function() {
	$( "#slider-range" ).slider({
		range: true,
		min: 15,
		max: 45,
		values: [ 25, 35 ],
		slide: function( event, ui ) {
			$( "#min-age" ).val(ui.values[ 0 ]);
			$( "#max-age" ).val(ui.values[ 1 ]);
		}
	});
	
	$( "#min-age" ).val( $( "#slider-range" ).slider( "values", 0 ));
	$( "#max-age" ).val( $( "#slider-range" ).slider( "values", 1 ));
});
</script>
					
					<style>
					
					
					.noUi-horizontal .noUi-handle {
						width: 33px;
					    height: 33px;
					    left: -16px;
					    top: -13px;
					    border-radius: 100px;
					}
					
					.noUi-connect{
						background: #33b5e5;
					}
					</style>
					
					<div class="age-container" id="test">
						<div class="select-label"><span>나이</span></div>
						<div class="select-container">
							<div class="age" id="age-content-container">
							</div>
							<div class="age-content-displayer">
							<span id="age-min"></span><span>&nbsp;-&nbsp;</span><span id="age-max"></span>
							</div>
						</div>
						
						<!-- <div class="age" id="age-content-container">
								<div id="age-content-wrapper">
									<p>
										<input type="text" name="age-min" id="min-age" readonly/>
									</p>
									<div id="slider-range"></div>
									<p>
										<input type="text" name="age-max" id="max-age" readonly/>
									</p>
								</div>
						</div> -->
					</div>
					
					<div class="distance-container">
						
							<div class="select-label"><span>거리</span></div>
							<div class="select-container">
							<div class="distance" id="distance-content-container">
							</div>
							<div class="distance-content-displayer">
							<span id="distance-margin"></span><span>&nbsp;km</span>
							</div>
							</div>
						<!-- </div>
							<select name="distance" id="distance-select">
								<option value="default" selected>거리선택</option>
								<option value="default">가까운 거리 순</option>
								<option value="10">10m 이내</option>
								<option value="50">50m 이내</option>
								<option value="100">100m 이내</option>
								<option value="200">200m 이내</option>
								<option value="300">300m 이내</option>
								<option value="500">500m 이내</option>
								<option value="1000">1km 이내</option>
								<option value="2000">2km 이내</option>					
							</select>
						</div>
						<div class="temp">? 선택하신 여행지로부터의 거리를 선택하실 수 있습니다.</div> -->
					
					</div>
					
					<div class="style">
						<div class="select-label"><span>스타일</span></div>
						<select name="style" id="style-select">
							<option value="default" selected>스타일 무관</option>
							<c:forEach items="${styles }" var="i">
								<option value="${i.id }">${i.type }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div>
			
				<input type="button" id="search-button" class="btn btn-info" value="동행찾기"/>
			</div>
		</form>
	</div>
	
	
</div>
</main>

<script>
window.addEventListener("DOMContentLoaded", function(e) {
 */	var request = new window.XMLHttpRequest();
	//request.setRequestHeader('Content-Type', 'application/json'); post의 경우 설정해줌.
	var searchBtn = document.querySelector("#search-button");
	var matchingInfoForm = document.forms['matching-info-form'];
	var prevButton = document.querySelector(".prev-button");
 	var nextButton = document.querySelector(".next-button");
	var profImg = document.querySelector(".circle-img");
	var nicName = document.querySelector(".matched-nicName");
	var location = document.querySelector(".accom-location");
	var date = document.querySelector(".accom-date");
	var hiddenDate = document.querySelector(".hidden-accom-date");
	var endDate = document.querySelector(".end-date");
	var startDate = document.querySelector(".start-date");
	var sex = document.querySelector(".accom-sex");
	var age = document.querySelector(".accom-age");
	var chattingButton = document.querySelector("#request-chatting");
	var profiletitle = document.querySelector(".matched-profile-title");
	
	/* if(${memberAccomInfoId ne'default' })
		profiletitle.innerHTML = "기존에 매칭된 동행"; */

	// 초기 데이터 설정하기
	if(${memberPrevMatchedListToday.size()} ==0 && ${memberAccomInfoId eq 'default'}){
		chattingButton.style.background="gray";
		chattingButton.textContent="대화상대없음";
		chattingButton.style.pointerEvents="none";
	}
	
	if(${memberPrevMatchedListToday.size()} >0){
		// 정보 교체

		location.innerHTML = "${memberPrevMatchedListToday[0].place}";
		
		date.innerHTML = "${memberPrevMatchedListToday[0].startDate}";	
		
		if(${memberPrevMatchedListToday[0].sex eq '0' })
			sex.innerHTML = "남성";
		else		
			sex.innerHTML = "여성";
			
		age.innerHTML = "${memberPrevMatchedListToday[0].age}세";
		
		profImg.src = "${root }${memberPrevMatchedListToday[0].imgSrc}${memberPrevMatchedListToday[0].imgName}";
		nicName.innerHTML = "${memberPrevMatchedListToday[0].nicName}";
		
		date.innerHTML =  '<fmt:formatDate value="${memberPrevMatchedListToday[0].startDate }" pattern="yy.MM.dd" /> - <fmt:formatDate value="${memberPrevMatchedListToday[0].endDate }" pattern="yy.MM.dd" />';
		
		chattingButton.onclick = function(){ window.location.href=''; };
		// 정보 교체 끝
	}
	

	/*  하루 매칭된 횟수 2회 이상일 경우, 카드 추가해주기 */
	if(${memberPrevMatchedListToday.size()>1 })
 	{
			var slideContainer = document.querySelector(".slide-container");
			
			<c:forEach items="${memberPrevMatchedListToday}" var="li" varStatus="status">
				<c:if test="${status.index>0}">
				var matchedCard = document.querySelector(".clone-card");

				var profImg = matchedCard.querySelector(".circle-img");
				var nicName = matchedCard.querySelector(".matched-nicName");
				var location = matchedCard.querySelector(".accom-location");
				var date = matchedCard.querySelector(".accom-date");
				var sex = matchedCard.querySelector(".accom-sex");
				var age = matchedCard.querySelector(".accom-age");
				var chattingButton = matchedCard.querySelector("#request-chatting");
				
				// 정보 교체

				location.innerHTML = "${li.place}";
				
				date.innerHTML = "${li.startDate}";	
				
				if(${li.sex eq '0' })
					sex.innerHTML = "남성";
				else		
					sex.innerHTML = "여성";
					
				age.innerHTML = "${li.age}세";
				
				profImg.src = "${root }${li.imgSrc}${li.imgName}";
				nicName.innerHTML = "${li.nicName}";
				
				date.innerHTML =  '<fmt:formatDate value="${li.startDate }" pattern="yy.MM.dd" /> - <fmt:formatDate value="${li.endDate }" pattern="yy.MM.dd" />';
				
				chattingButton.onclick = function(){ window.location.href=''; };
				// 정보 교체 끝
				
				var clone = matchedCard.cloneNode(true);
		
				clone.classList.remove("hidden");
				slideContainer.appendChild(clone);

				</c:if>

			</c:forEach>
/* 			var currentCount = 0;
			
 			nextButton.style.display = "flex";
 			
			nextButton.onclick=function(){

				currentCount++;
				
				if(currentCount==1 ){
					prevButton.style.display = "flex";
				}
				
				if(currentCount == ${memberPrevMatchedListToday.size()-1 })
				{
					nextButton.style.display = "none";
				}
				
				<c:forEach items="${memberPrevMatchedListToday}" var="li" varStatus="status">
					if(${status.index }==currentCount)
					{
						
						// 정보 교체
						
						location.innerHTML = "${memberPrevMatchedListToday[status.index].place}";
						
						date.innerHTML = "${memberPrevMatchedListToday[status.index].startDate}";	
						
						if(${memberPrevMatchedListToday[status.index].sex eq '0' })
							sex.innerHTML = "남성";
						else		
							sex.innerHTML = "여성";
							
						age.innerHTML = "${memberPrevMatchedListToday[status.index].age}세";
						
						profImg.src = "${root }${memberPrevMatchedListToday[status.index].imgSrc}${memberPrevMatchedListToday[status.index].imgName}";
						nicName.innerHTML = "${memberPrevMatchedListToday[status.index].nicName}";
						date.innerHTML =  '<fmt:formatDate value="${memberPrevMatchedListToday[status.index].startDate }" pattern="yy.MM.dd" /> - <fmt:formatDate value="${memberPrevMatchedListToday[status.index].endDate }" pattern="yy.MM.dd" />';
						
						chattingButton.onclick = function(){ window.location.href=''; };
						// 정보 교체 끝
						
					}
				</c:forEach>
	
				
			};
			
			
			prevButton.onclick=function(){
				
				currentCount--;
				
				if(currentCount==0){
					prevButton.style.display = "none";
				}
					
				if(currentCount === ${memberPrevMatchedListToday.size()-2 }){
					nextButton.style.display = "flex";
				}
				
				<c:forEach items="${memberPrevMatchedListToday}" var="li" varStatus="status">
					if(${status.index }==currentCount)
					{						
						// 정보 교체
						
						location.innerHTML = "${memberPrevMatchedListToday[status.index].place}";
						
						date.innerHTML = "${memberPrevMatchedListToday[status.index].startDate}";	
						
						if(${memberPrevMatchedListToday[status.index].sex eq '0' })
							sex.innerHTML = "남성";
						else		
							sex.innerHTML = "여성";
							
						age.innerHTML = "${memberPrevMatchedListToday[status.index].age}세";
						
						profImg.src = "${root }${memberPrevMatchedListToday[status.index].imgSrc}${memberPrevMatchedListToday[status.index].imgName}";
						nicName.innerHTML = "${memberPrevMatchedListToday[status.index].nicName}";
						date.innerHTML =  '<fmt:formatDate value="${memberPrevMatchedListToday[status.index].startDate }" pattern="yy.MM.dd" /> - <fmt:formatDate value="${memberPrevMatchedListToday[status.index].endDate }" pattern="yy.MM.dd" />';
						
						chattingButton.onclick = function(){ window.location.href=''; };
						// 정보 교체 끝
						
					}
				</c:forEach>
			} */
 	}

});
</script>
<!-- -----------------------동행 매칭하기--------------------------------------- -->
<script>

window.addEventListener("load", function(e) {
	var request = new window.XMLHttpRequest();
	//request.setRequestHeader('Content-Type', 'application/json'); post의 경우 설정해줌.
	var searchBtn = document.querySelector("#search-button");
	var matchingInfoForm = document.forms['matching-info-form'];
	var prevButton = document.querySelector(".prev-button");
 	var nextButton = document.querySelector(".next-button");
	var profImg = document.querySelector(".circle-img");
	var nicName = document.querySelector(".matched-nicName");
	var location = document.querySelector(".accom-location");
	var date = document.querySelector(".accom-date");
	var hiddenDate = document.querySelector(".hidden-accom-date");
	var endDate = document.querySelector(".end-date");
	var startDate = document.querySelector(".start-date");
	var sex = document.querySelector(".accom-sex");
	var age = document.querySelector(".accom-age");
	var chattingButton = document.querySelector("#request-chatting");
	//var profiletitle = document.querySelector(".matched-profile-title");
	
 	//-----------------------동행 찾기 버튼 클릭 시 --------------------------
	searchBtn.onclick = function(){
		/* nextButton.style.display = "none";
		prevButton.style.display = "none"; */
		
		if(${size>0 }){
	 		
			var accomInfoId = matchingInfoForm.elements['accompany-info'].value;
			var sexV = matchingInfoForm.elements['sex'].value;
			var min = matchingInfoForm.elements['age-min'].value;
			var max = matchingInfoForm.elements['age-max'].value;
			var dis = matchingInfoForm.elements['distance'].value;
			var sty = matchingInfoForm.elements['style'].value;

			
			if(accomInfoId.length>0){
				var url = "matching-ajax-data?a=" + accomInfoId + "&sx=" + sexV + "&min=" + min + "&max=" + max + "&dis=" + dis + "&sty=" + sty;
			
				request.open("GET",url, true);			
		
				request.onload = function(){
					var result = JSON.parse(request.responseText);
					
					if(typeof result.error != 'undefined'){
						alert(result.error);
					}
					else{
						chattingButton.style.display="flex";
						profiletitle.innerHTML = "매칭된 동행";
						
						profImg.src = '${root }' + result[0].imgSrc + result[0].imgName;
						nicName.innerHTML =  result[0].nicName;
						location.innerHTML = result[0].place;
						
						age.innerHTML = result[0].age + " 세";
						
						if(result[0].sex == '0')
							sex.innerHTML = "남성";
						
						else
							sex.innerHTML = "여성";
					
						/* --------------------------날 짜 ------------------------ */
						var startDate = new Date(result[0].startDate);
						var endDate = new Date(result[0].endDate);
						var startDateMon = startDate.getMonth() +1;
						var endDateMon = endDate.getMonth() + 1;
						var startDateDay = startDate.getDate();
						var endDateDay = endDate.getDate(); 
						var startDateYear = startDate.getFullYear().toString().substring(2,4);
						var endDateYear = endDate.getFullYear().toString().substring(2,4);
						
						if(startDateMon<10){
							if(startDateDay<10)
								startDate = startDateYear+ ".0"+ startDateMon + ".0" + startDateDay;
							else
								startDate = startDateYear+ ".0"+ startDateMon + "." + startDateDay;
						}
						else{
							if(startDateDay<10)
								startDate = startDateYear+ "."+startDateMon + ".0" + startDateDay;
							else
								startDate = startDateYear+ "."+ startDateMon + "." + startDateDay;
						}	
							
						if(endDateMon<10){
							if(endDateDay<10)
								endDate = endDateYear + ".0"+ endDateMon + ".0" + endDateDay;
							else
								endDate = endDateYear+ ".0"+ endDateMon + "." + endDateDay;
						}
						else{
							if(endDateDay<10)
								endDate = endDateYear + "." + endDateMon + ".0" + endDateDay;
							else
								endDate = endDateYear + endDateMon + "." + endDateDay;
						}
						
						date.innerHTML = startDate+ "-" +endDate;
						/* ----------------------------------------------------- */

						alert("매칭되었습니다.");
 						
 						if(result.length>1){
 							var currentMatchInfo = 0;
 							nextButton.style.display = "flex";
 							
 							nextButton.onclick=function(){
								currentMatchInfo++;
 								// 정보 교체
								location.innerHTML = result[currentMatchInfo].place;
								
								/* --------------------------날 짜 ------------------------ */
								startDate = new Date(result[currentMatchInfo].startDate);
								endDate = new Date(result[currentMatchInfo].endDate);
								startDateMon = startDate.getMonth() +1;
								endDateMon = endDate.getMonth() + 1;
								startDateDay = startDate.getDate();
								endDateDay = endDate.getDate(); 
								startDateYear = startDate.getFullYear().toString().substring(2,4);
								endDateYear = endDate.getFullYear().toString().substring(2,4);
								
								if(startDateMon<10){
									if(startDateDay<10)
										startDate = startDateYear+ ".0"+ startDateMon + ".0" + startDateDay;
									else
										startDate = startDateYear+ ".0"+ startDateMon + "." + startDateDay;
								}
								else{
									if(startDateDay<10)
										startDate = startDateYear+ "."+startDateMon + ".0" + startDateDay;
									else
										startDate = startDateYear+ "."+ startDateMon + "." + startDateDay;
								}	
									
								if(endDateMon<10){
									if(endDateDay<10)
										endDate = endDateYear + ".0"+ endDateMon + ".0" + endDateDay;
									else
										endDate = endDateYear+ ".0"+ endDateMon + "." + endDateDay;
								}
								else{
									if(endDateDay<10)
										endDate = endDateYear + "." + endDateMon + ".0" + endDateDay;
									else
										endDate = endDateYear + endDateMon + "." + endDateDay;
								}
								
								date.innerHTML = startDate+ "-" +endDate;	
								
								/* ----------------------------------------------------- */

 								
								
								if(result[currentMatchInfo].sex === '0')
									sex.innerHTML = "남성";
								else		
									sex.innerHTML = "여성";
									
								age.innerHTML = result[currentMatchInfo].age+"세";
								
								profImg.src = "${root }"+result[currentMatchInfo].imgSrc+result[currentMatchInfo].imgName;
								nicName.innerHTML = result[currentMatchInfo].nicName;
								
								chattingButton.onclick = function(){ window.location.href=''; };
								// 정보 교체 끝
								
								if(currentMatchInfo==1){
									prevButton.style.display = "flex";
								}
								
 	 							if(currentMatchInfo == result.length-1)
 	 							{
 	 								nextButton.style.display = "none";
 	 							}
 	 							
 							};
 							
 							prevButton.onclick=function(){
 								
 								currentMatchInfo--;
 								
								/* --------------------------날 짜 ------------------------ */
								startDate = new Date(result[currentMatchInfo].startDate);
								endDate = new Date(result[currentMatchInfo].endDate);
								startDateMon = startDate.getMonth() +1;
								endDateMon = endDate.getMonth() + 1;
								startDateDay = startDate.getDate();
								endDateDay = endDate.getDate(); 
								startDateYear = startDate.getFullYear().toString().substring(2,4);
								endDateYear = endDate.getFullYear().toString().substring(2,4);
								
								if(startDateMon<10){
									if(startDateDay<10)
										startDate = startDateYear+ ".0"+ startDateMon + ".0" + startDateDay;
									else
										startDate = startDateYear+ ".0"+ startDateMon + "." + startDateDay;
								}
								else{
									if(startDateDay<10)
										startDate = startDateYear+ "."+startDateMon + ".0" + startDateDay;
									else
										startDate = startDateYear+ "."+ startDateMon + "." + startDateDay;
								}	
									
								if(endDateMon<10){
									if(endDateDay<10)
										endDate = endDateYear + ".0"+ endDateMon + ".0" + endDateDay;
									else
										endDate = endDateYear+ ".0"+ endDateMon + "." + endDateDay;
								}
								else{
									if(endDateDay<10)
										endDate = endDateYear + "." + endDateMon + ".0" + endDateDay;
									else
										endDate = endDateYear + endDateMon + "." + endDateDay;
								}
								
								date.innerHTML = startDate+ "-" +endDate;	
								
								/* ----------------------------------------------------- */

								
 								// 정보 교체
								location.innerHTML = result[currentMatchInfo].place;
								
								if(result[currentMatchInfo].sex === '0')
									sex.innerHTML = "남성";
								else		
									sex.innerHTML = "여성";
									
								age.innerHTML = result[currentMatchInfo].age+"세";
								
								profImg.src = "${root }"+result[currentMatchInfo].imgSrc+result[currentMatchInfo].imgName;
								nicName.innerHTML = result[currentMatchInfo].nicName;
								
								chattingButton.onclick = function(){ window.location.href=''; };
								// 정보 교체 끝
								
 								if(currentMatchInfo==0){
									prevButton.style.display = "none";
								}
 								
								if(currentMatchInfo==result.length-2){
									nextButton.style.display = "flex";
								}
								
 							}
 							
 								
 						}
						
					  }
						document.body.removeChild(screen);
				};
				
				request.send();
				
				var screen = document.createElement("div");
				screen.style.width = "100%";
				screen.style.height = "100%";
				screen.style.position = "fixed";
				screen.style.left = "0px";
				screen.style.top = "0px";
				screen.style.background = "#000";
				screen.style.opacity = "0.5";
				screen.style.zIndex = "1000000";
				
				document.body.appendChild(screen);
			
			}
			else{
				alert("동행 정보를 선택해주세요.");
			}
			
		}
		/* --------------등록된 동행 정보가 없는 경우----------------- */ 
		else{
			alert("회원님의 동행 정보 우선 등록 후 매칭 서비스를 이용해주세요.");
			window.location.href="${root }/member/acc-setting";
		}
	}
	
});


</script>


<!-- --------------------------나이------------------------------------ -->
<script>
$( function() {
	$( "#slider-range" ).slider({
		range: true,
		min: 15,
		max: 45,
		values: [ 25, 35 ],
		slide: function( event, ui ) {
			$( "#min-age" ).val(ui.values[ 0 ]);
			$( "#max-age" ).val(ui.values[ 1 ]);
		}
	});
	
	$( "#min-age" ).val( $( "#slider-range" ).slider( "values", 0 ));
	$( "#max-age" ).val( $( "#slider-range" ).slider( "values", 1 ));
});
</script>

<!-- ------------------------이전 동행 목록 불러오기-------------------------------------------------- -->
<script>
	window.addEventListener("load",function(){
		
		<c:if test="${memberPrevSelected ne null}">
			var accomLocation = document.querySelector(".accom-location");
			var accomDate = document.querySelector(".accom-date");
			var accomSex = document.querySelector(".accom-sex");
			var accomAge = document.querySelector(".accom-age");
			var requestChatting = document.querySelector("#request-chatting");
			var profImg = document.querySelector(".circle-img");
			var nicName = document.querySelector(".matched-nicName");
			var chattingButton = document.querySelector("#request-chatting");
			
			if(${memberPrevMatchedListToday.size()} ==0 && ${memberAccomInfoId eq 'default'}){
				chattingButton.style.background="#33b5e5";
				chattingButton.textContent="대화하기";
				chattingButton.style.pointerEvents="auto";
			}
			
			
			accomLocation.innerHTML = "${memberPrevSelected.place}";
			accomDate.innerHTML = '<fmt:formatDate value="${memberPrevSelected.startDate }" pattern="yy.MM.dd" /> - <fmt:formatDate value="${memberPrevSelected.endDate }" pattern="yy.MM.dd" />';	
			
			
			
			if(${memberPrevSelected.sex eq '0' })
				accomSex.innerHTML = "남성";
			else		
				accomSex.innerHTML = "여성";
				
			accomAge.innerHTML = "${memberPrevSelected.age }세";
			
			profImg.src = "${root }${memberPrevSelected.imgSrc }${memberPrevSelected.imgName }";
			nicName.innerHTML = "${memberPrevSelected.nicName }";
			
			chattingButton.onclick = function(){ window.location.href=''; };
			
		</c:if>


		<c:forEach items="${memberPrevMatchedList }" var="li">
			<c:if test="${memberAccomInfoId ne li.id }">
			var prevMatched${li.id } = document.querySelector("#prev-matched-list${li.id }");
			prevMatched${li.id }.onclick = function(){
				window.location.href='${root }/accompany/matching?id=${li.id }';
			};
			</c:if>
		</c:forEach>
	});
</script>
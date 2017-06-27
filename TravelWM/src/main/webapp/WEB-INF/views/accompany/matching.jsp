<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/accompany/matching.css" rel="stylesheet"/>

<!-- For Age Selector -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <script>
 	window.addEventListener("load",function(event){
 		var prevButton = document.querySelector(".prev-button");
 		var nextButton = document.querySelector(".next-button");
 		var matchedListButton = document.querySelector(".matched-list-button");
 		
 		nextButton.onclick = function(){
 			
 		};
 		
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
<main class="container">
	<div class="accompany-option-section Col-lg-7 Col-sm-6">
	<form name="mathing-info-form" class="mathing-info-form">
		<h1 class="hidden"> 동행 선택 옵션 추가 </h1>
		<div class="accompany-manage">
			<div class="accom-info-title">
				<h2>나의 동행 정보</h2>
		<!-- 	본인이 등록한 동행 정보가 없는 경우, 본인 동행 정보 등록하는 페이지로 이동하도록 하는 조건문 -->
				<c:choose>
					<c:when test="${size>0 }">
						<div class="manage-page"><a href="${root }/member/acc-setting">나의 동행 관리</a></div>				
					</c:when>
					
					<c:otherwise>
						<div class="manage-page-no-accom-info"><a href="${root }/member/acc-setting">등록된 동행 정보가 없습니다. 동행 정보 등록 후 이용해주세요.</a></div>						
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<c:forEach items="${memAccomInfoList }" var="li">
					<div>
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
		<div class="accompany-option">
			<div>
				<h2>선호하는 동행 스타일</h2>
			</div>
			<div class="sex">
				<div class="select-label">성별</div>
				<div class="select-container">
					 <div class="select-box">
						 <label for="boy">남</label>
						 <input type="radio" id="boy" name="sex" value="0"/>
					 </div>
					 <div class="select-box">
						 <label for="girl">여</label>
						 <input type="radio" id="girl" name="sex" value="1"/>
					 </div>
					 <div class="select-box">
						 <label for="everyone">아무나</label>
						 <input type="radio" id="everyone" name="sex" value="2" checked/>
					 </div>
				</div>
			</div>
			<div class="age" id="age-content-container">
					<div id="age-content-wrapper">
						<p>
							<input type="text" name="age-min" id="min-age" readonly/>
						</p>
						<div id="slider-range"></div>
						<p>
							<input type="text" name="age-max" id="max-age" readonly/>
						</p>
					</div>
			</div>
			<div class="distance">
				<div class="distance-container">
					<div class="select-label">거리</div>
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
				<div>? 선택하신 여행지로부터의 거리를 선택하실 수 있습니다.</div>
			</div>
			<div class="style">
				<div class="select-label">스타일</div>
				<select name="style" id="style-select">
					<option value="default" selected>스타일 무관</option>
					<c:forEach items="${styles }" var="i">
						<option value="${i.id }">${i.type }</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="button" id="search-button" class="btn btn-info" value="동행찾기"/>
			</div>
		</div>
	</form>
	</div>
	
	
<!-- ----------------- 매칭된 동행 창 ------------------------- -->	
	<div class="matched-accompany-section Col-lg-5 Col-sm-6">
		
		<!-- 기존에 매치되었던 동행 목록 불러오기 -->
		<div class="matched-list">
			<div class="matched-list-box">
				
			</div>
			<h3>이전 동행 목록</h3>
			<div class="dropdown">
			  <img class="matched-list-button" src="${root }/resource/images/ic_more_vert_black_24dp_1x.png"/>
			  <div id="myDropdown" class="dropdown-content">
			  	<c:forEach items="${memberPrevMatchedList }" var="li">
				    <a href="#">${li.place }의 동행 ${li.nicName }님</a>
			  	</c:forEach>
			  </div>
			</div>
		</div>
		
		<!-- 새로 매칭된 동행의 정보 보기 -->
		<div class="matched-profile">
			<div>
				<h2>매칭된 동행</h2>
			</div>
			<ul class="matched-profile-img">
				<li><img class="prev-button" src="${root }/resource/images/ic_keyboard_arrow_left_black_24dp_2x.png"/></li>
				<li><img class="circle-img" src="${root }/resource/images/default-user-image.png"/></li>
				<li><img class="next-button" src="${root }/resource/images/ic_keyboard_arrow_right_black_24dp_2x.png"/></li>
			</ul>
			<div class="matched-nicName">
				닉네임
			</div>
		</div>
		
		<!-- 매치된 동행의 정보 보기 -->	
		<div class="matched-info">
			<div class="accom-location">
				동행 장소
			</div>
			
			<div class="acoom-date">
				동행 날짜
			</div>

			<div class="hidden hidden-accom-date">
<%--  				<fmt:formatDate class="start-date" value="Jun 8, 2017 12:00:00 AM" pattern="yy.MM.dd" />
				-
				<fmt:formatDate class="end-date" value="Jun 8, 2017 12:00:00 AM" pattern="yy.MM.dd" />
 --%>			</div>

						
			<div class="accom-sex">
				성별
			</div>
			<div class="accom-age">
				나이
			</div>				
			<div>
				<button  type="button" class="btn btn-info">대화하기</button>
			</div>
		</div>
	</div>
</main>

<!-- -----------------------동행 매칭하기--------------------------------------- -->
<script>

window.addEventListener("load", function(e) {
	var request = new window.XMLHttpRequest();
	//request.setRequestHeader('Content-Type', 'application/json'); post의 경우 설정해줌.
	var searchBtn = document.querySelector("#search-button");
	var matchingInfoForm = document.forms['mathing-info-form'];
	
	searchBtn.onclick = function(){
		
		var accomInfoId = matchingInfoForm.elements['accompany-info'].value;
		var sexV = matchingInfoForm.elements['sex'].value;
		var min = matchingInfoForm.elements['age-min'].value;
		var max = matchingInfoForm.elements['age-max'].value;
		var dis = matchingInfoForm.elements['distance'].value;
		var sty = matchingInfoForm.elements['style'].value;

		var profImg = document.querySelector(".circle-img");
		var nicName = document.querySelector(".matched-nicName");
		var location = document.querySelector(".accom-location");
		var date = document.querySelector(".acoom-date");
		var hiddenDate = document.querySelector(".hidden-accom-date");
		var endDate = document.querySelector(".end-date");
		var startDate = document.querySelector(".start-date");
		var sex = document.querySelector(".accom-sex");
		var age = document.querySelector(".accom-age");

		if(accomInfoId.length>0){
		
			var url = "matching-ajax-data?a=" + accomInfoId + "&sx=" + sexV + "&min=" + min + "&max=" + max + "&dis=" + dis + "&sty=" + sty;
		
			request.open("GET",url, true);			
	
			request.onload = function(){
				var result = JSON.parse(request.responseText);
				
				if(typeof result.error != 'undefined'){
					alert(result.error);
				}
				else{
					profImg.src = '${root }/' + result[0].imgSrc;
					nicName.innerHTML =  result[0].nicName;
					location.innerHTML = result[0].place;
					
					age.innerHTML = result[0].age + " 세";
					
					if(result[0].sex==='0')
						sex.innerHTML = "남성";
					
					else(result[0].sex === '1')
						sex.innerHTML = "남성";
					
					
					//alert(result[0].startDate);
					//Jun 29, 2017 12:00:00 AM
					alert("매칭되었습니다.");
					
					hiddenDate.style.display = "flex";
					date.style.display = "none";
										
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
<link href="${root}/resource/css/accompany/board.css" rel="stylesheet"/>
<!-- For Age Selector -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<div id="filter-container">
		<div class="filter-item-container">
			<button type="button" class="btn btn-filter" id="btn-gender">성별</button>
			<div id="gender-content">
			<ul>
				<li onclick="window.location.href='${root }/accompany/board?pla=${pla }&sty=${sty }&sx=${0 }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }'">남성</li>
			</ul>
			<ul>
				<li onclick="window.location.href='${root }/accompany/board?pla=${pla }&sty=${sty }&sx=${1 }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }'">여성</li>
			</ul>
			<ul>
				<li onclick="window.location.href='${root }/accompany/board?pla=${pla }&sty=${sty }&sx=3&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }'">성별무관</li>
			</ul>
			</div>

			<button type="button" class="btn btn-filter" id="btn-age">나이</button>
			<div id="age-content">
				<div id="age-content-container">
					<div id="age-content-wrapper">
						<p>
							<input type="text" id="min-age" readonly/>
						</p>
						<div id="slider-range"></div>
						<p>
							<input type="text" id="max-age" readonly/>
						</p>
					</div>
					<button class="age-search" onclick="submitAge();">확인</button>
					<button class="age-search">취소</button>
				</div>
			</div>
			
			<button type="button" class="btn btn-filter" id="btn-style">성향</button>
			<div id="style-content">
			
			<c:forEach items="${styleList }" var="li">
				<ul>
					<li onclick="window.location.href='${root }/accompany/board?pla=${pla }&sty=${li.id }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }'">${li.type }</li>
				</ul>
			</c:forEach>			
			</div>
			
			<!-- ------검색 필터 취소 버튼(모든 동행)-------- -->		
			<c:if test="${min_a ne '0' || max_a ne '100' || sty ne 'default' || sx ne 'default' }">
				<button type="button" class="btn btn-filter" id="btn-see-all" onclick="window.location.href='${root }/accompany/board'" >초기화</button>
			</c:if>
			
			<button type="button" class="btn btn-write" id="btn-write" onclick="window.location.href='${root}/accompany/reg'">글쓰기</button>
		</div>
	</div>
	

<main id="main-container">
	
	<div class="board-container">
	
		<div class="board-wrapper">
		
		<!-- ----------좋아요 기능 (미완성) ------------ -->
						<script>
							window.addEventListener("load", function(e) {
						
								var hearts = document.querySelectorAll(".heart");
								var emheart = document.querySelectorAll(".test1");
								var heart = document.querySelectorAll(".test2");
								
								for (var i=0; i<hearts.length;i++) {
								
								hearts.item(i).addEventListener('click',function(i){
									
									
									if (heart[i].style.display === "none") {
										heart[i].style.display = "block";
										emheart[i].style.display = "none";
									} else if (emheart[i].style.display === "none") {
										heart[i].style.display = "none";
										emheart[i].style.display = "block";
									}
  

    								}.bind(this,i));	
									
									
								
								}
								    
							
								
								
									
								
							});
						</script>
		
		
		<!-- ----------동행 게시글 6개씩 반복하는 구간 ------------ -->
			<c:forEach items="${accompanyBoardList }" var="li">
				<div class="board-card">
					<div class="board-content w3-card-2">
						<div class="board-bookmark">
							<div class="heart hearts">
									<img style="display: block;" id="emheart"
										class="test1 heart-icon cursor"
										src="${root}/resource/images/ic_favorite_border_black_24dp_1x.png" />
									<img style="display: none;" id="heart" class="test2 heart-icon cursor"
										src="${root}/resource/images/ic_favorite_black_24dp_1x.png" />
							</div>
						</div>
						
						
												
						<div class="board-detail">
							<div class="board-detail-wrapper">
								<div class="board-profile-pic" style="background-image: url('${root}${li.imgSrc }${li.imgName }');">
								</div>
								<div class="board-accompany-info">
									<div class="info-item item-nickname">${li.writerNicName }</div>
									<div class="info-item item-country-date">
									${li.country}&nbsp;${li.place}</br>
									<fmt:formatDate value="${li.startDate }" pattern="YY.MM.dd" />
									-
									<fmt:formatDate value="${li.endDate }" pattern="YY.MM.dd" />		
									</div>
								</div>
							</div>
						</div>
						
						<div class="board-title bt${li.id }" onclick="window.location.href='${root }/accompany/detail?id=${li.id }&p=${page }&pla=${pla }&sty=${sty }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }'">
							<div class="board-title-detail">
								<div>${li.title }</div>
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
								<div class="board-info-item item-age"><span>${li.writerAge }</span></div>
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
						<!-- ----------페이지 수 표시하는 부분----------- -->
				<div class="page" class="move-page">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					  	 
						<c:if test="${prev!=1 && page!=0}">
						    <li>
						      <a id="move-page-button-number" href="${root}/accompany/board?pla=${pla }&sty=${sty }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }&p=${prev-5	 }" aria-label="Previous">
							     <span aria-hidden="true">&laquo;</span>
							  </a>
							</li>
						</c:if>
					    
					    <c:forEach begin="${prev }" end="${next }" var="p" >
					    	
					    	<c:choose>
					    	<c:when test="${p== page }">
						    	<li class="active">
						    	<a id="move-page-button" href="${root }/accompany/board?pla=${pla }&sty=${sty }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }&p=${p }">${p }</a>
						    	</li>
					    	</c:when>
					    	
					    	<c:otherwise>
						    	<li>
						    	<a id="move-page-button-number" href="${root }/accompany/board?pla=${pla }&sty=${sty }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }&p=${p }">${p }</a>
						    	</li>
					    	</c:otherwise>
					    	
					    	</c:choose>
					    </c:forEach>
					    
					    <c:if test="${next<pageCount && count!=0}">
						    <li>
						      <a  id="move-page-button-number" href="${root}/accompany/board?pla=${pla }&sty=${sty }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }&p=${next+1 }" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					    
					    <c:if test="${count==0 }">
					    	<div>결과가 없습니다.</div>
					    </c:if>
					    
					  </ul>
					</nav>	
				</div>
		</div>

	</div>
</main>


<div id="map-container">
	<div id="map-wrapper"></div>
</div>


<!-- Navbar-Top Related Javascript -->
<script>
	$(window).scroll(function () {
	    var scAccBoard = $(window).scrollTop()
	    
	    $("#map-container").css("transition-duration", "0.4s");
	    $("#filter-container").css("transition-duration", "0.4s");
	  
	    if (scAccBoard > 3){
	     	$("#map-container").css("margin-top", "60px");
	     	$("#filter-container").css("margin-top", "60px");
	     	
	    } else {
	    		$("#map-container").css("margin-top", "80px");
	    		$("#filter-container").css("margin-top", "80px");
	    }
	});
</script>




<!-- --------show current search filter in the button------- -->
<script>
	window.addEventListener("load",function(){
		var searchGender = document.querySelector("#btn-gender");
		var searchStyle = document.querySelector("#btn-style");
		var searchAge = document.querySelector("#btn-age");
		
		if('${sx }' !== 'default'){
			searchGender.style.background = '#33b5e5';
			searchGender.style.color = '#fff';
			
			if('${sx }' === '0')
				searchGender.innerHTML = '남성';
			else if('${sx }' === '1')
				searchGender.innerHTML = '여성';
			else
				searchGender.innerHTML = '성별 무관';
		}
		
		if('${sty }' !== 'default'){
			searchStyle.style.background = '#33b5e5';
			searchStyle.style.color = '#fff';
			
			<c:forEach items='${styleList }' var="li">
				if('${li.id}' === '${sty }')
					searchStyle.innerHTML = "${li.type }";
			</c:forEach>	
		}
		
		
		if('${min_a }' !== '0' && '${min_a }' !== '100'){
			searchAge.innerHTML = '${min_a }세~${max_a }세';
		}
		
	});
</script>
<!-- ----------지도에 x버튼 없애기------------- -->
<style>
	.gm-style-iw + div {display: none;}
</style>

<!-- -------나이 필터 검색 클릭 시 발생하는 이벤트----------- -->
<script>
	var submitAge = function(){
		var minAge = $( "#slider-range" ).slider( "values", 0 );
		var maxAge = $( "#slider-range" ).slider( "values", 1 );
		
		window.location.href='${root }/accompany/board?sty=${sty }&sx=${sx }&min_a='+minAge+'&max_a='+maxAge+'&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }';
		
	};
</script>

<!-- 	-----------구글 맵 API이용하기--------------- -->


<!--  <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
 -->

<script>
	var map;
	function initialize() {
	
		/* -----------지도 초기 위치 지정하기------------- */
		var lat = parseFloat('${accompanyBoardList.get(0).latitude}');
		var lng = parseFloat('${accompanyBoardList.get(0).longitude}');

		var mapPosition = {
							center: {lat: lat, lng: lng},
							zoom : 13,
							mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById("map-wrapper"), mapPosition);
	
		/* -----------지도에 마커 추가하기------------- */
        
		
		<c:forEach items="${accompanyBoardList }" var="li">
			var marker${li.id } = new google.maps.Marker({
	            // The below line is equivalent to writing:
	            // position: new google.maps.LatLng(-34.397, 150.644)
	            position: {lat: ${li.latitude }, lng: ${li.longitude }},
	            map: map,
	            icon:'${root}/resource/images/marker/marker5.png'
	         });
			
			var initContent = "<div style=\"display:flex; justify-content:center; align-items:center;\">"+
			"<div style=\"align-self:center; background-image: url('${root }${li.imgSrc}${li.imgName }'); border-radius:100px; width:40px; height:40px; background-position: center; background-size: 40px 40px; \"></div>"+		
			"<div onclick='window.location.href=\"${root }/accompany/detail?id=${li.id }\"' style=\"margin-left:10px; cursor:pointer;\">${li.writerNicName }</div></div>";
			
	        /* -----------마커 눌렀을 때 발생하는 이벤트------------- */
       	     var infowindow${li.id } = new google.maps.InfoWindow({
        	    content: initContent,
        	    maxWidth:500,
        	    maxHeight:300,
        	    disableAutoPan: true
         	 });

       	     /* -----------마커 클릭 시, 정보 창 열고 닫아주기-------------- */
       	     var prevInfoWindow${li.id } = false;
       	     
          	google.maps.event.addListener(marker${li.id }, 'click', function() {
          		if(!prevInfoWindow${li.id }){
              		infowindow${li.id }.open(map, marker${li.id });
              		prevInfoWindow${li.id } = true;
          		}
              	else{
              		infowindow${li.id }.close();
              		prevInfoWindow${li.id } = false;
              	}
         	}); 
          	
          	var bt${li.id} = document.querySelector('.bt${li.id}');
          	
          	bt${li.id }.onmouseover = function(){
          		map.setCenter(new google.maps.LatLng(${li.latitude }, ${li.longitude }));
          	}

          	
          	
        </c:forEach>
	}	
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
</script>

<script>
$( function() {
	$( "#slider-range" ).slider({
		range: true,
		min: 15,
		max: 45,
		values: [ 25, 35 ],
		slide: function( event, ui ) {
			$( "#min-age" ).val(ui.values[ 0 ] + " 세");
			$( "#max-age" ).val(ui.values[ 1 ] + " 세");
		}
	});
	
	$( "#min-age" ).val( $( "#slider-range" ).slider( "values", 0 ) + " 세");
	$( "#max-age" ).val( $( "#slider-range" ).slider( "values", 1 ) + " 세");
});
</script>

<script>
	var genderClicked = false;
	var styleClicked = false;
	 
	$(document).on("click", function(e){
		if($(e.target).is("#btn-gender")){
			/* 버튼 다시 클릭 시 닫아주기 */
			if(!genderClicked){
				$("#gender-content").show();
				genderClicked = true;
			}
			else{
				$("#gender-content").hide();
				genderClicked = false;			
			}
	    }else{
	        $("#gender-content").hide();
	        genderClicked = false;
	    }
	});

	$(document).on("click", function(e){
		if($(e.target).is("#btn-age")){
				$("#age-content").show();
			}
	 
	});
	
	$('body').on("click", function(e){
		if($(e.target).is("#age-min, #age-max, #age-content, #age-content p, #age-content label, #age-content div, #age-content input ")) {
			
		} else {
			$("#age-content").hide();
		}
	});
	

	$(document).on("click", function(e){
		if($(e.target).is("#btn-style")){
			
			/* 버튼 다시 클릭 시 닫아주기 */
			if(!styleClicked){
				$("#style-content").show();
				styleClicked = true;
			}
			else{
				$("#style-content").hide();
				styleClicked = false;			
			}
			
			
	    }else{
	        $("#style-content").hide();
	        styleClicked = false;	
	    }
	});
	
	</script>
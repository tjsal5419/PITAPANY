<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
<link href="${root}/resource/css/accompany/accompany-board.css" rel="stylesheet"/>

	<div id="filter-container">
		<div class="filter-item-container">
			<button type="button" class="btn btn-filter" id="btn-gender">성별</button>
			<div id="gender-content">
			<ul>
				<li>남성</li>
			</ul>
			<ul>
				<li>여성</li>
			</ul>
			<ul>
				<li>성별무관</li>
			</ul>
			</div>

			<button type="button" class="btn btn-filter" id="btn-age">나이</button>
			<div id="age-content" data-role="page">
			
				<div data-role="main" class="ui-content">
				    <form method="post" action="/action_page_post.php">
						<div data-role="rangeslider">
						  <input type="range" name="age-min" id="age-min" value="30" min="15" max="80">
						  <input type="range" name="age-max" id="age-max" value="65" min="15" max="80">
						</div>
						<input type="submit" data-inline="true" value="확인">
					</form>
  				</div>
			</div>
			
			<button type="button" class="btn btn-filter" id="btn-style">성향</button>
			<div id="style-content">
			<ul>
				<li>러브어페어</li>
			</ul>
			<ul>
				<li>급만남</li>
			</ul>
			<ul>
				<li>술술</li>
			</ul>
			</div>
			
			<button type="button" class="btn btn-write" id="btn-write" onclick="window.location.href='${root}/accompany/reg'">글쓰기</button>
		</div>
	</div>
	
	<style>
	#gender-content, #age-content, #style-content {
		display: none;
		position: absolute;
		background-color: #f9fdff;
		min-width: 180px;
   		box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
    	top: 60px;
    	margin-left: 10px;
 
    	z-index: 1;
	}
	
	#gender-content{
		margin-left: 10px;
		height: 120px;
	}
	
	#age-content{
		margin-left: 70px;
		padding: 10px;
		min-height: 120px !important;
		width: 320px;
	}
	
	
	#style-content{
		margin-left: 130px;
	}
	
	#gender-content ul, #style-content ul{
		display: table;
		width: 100%;
	}
	
	#gender-content li{
		display: table-cell;
	    cursor: pointer;
	    width: 100%;
	    height: 40px;
	    color: rgba(51, 181, 229, 1);
	    padding-left: 15px;
	    vertical-align: middle;
	}
	
	#gender-content li:hover{
		background: #e8f8ff;
	}
	
	#style-content li{
		display: table-cell;
	    cursor: pointer;
	    width: 100%;
	    height: 40px;
	    color: rgba(51, 181, 229, 1);
	    padding-left: 15px;
	    vertical-align: middle;
	}
	
	#style-content li:hover{
		background: #e8f8ff;
	}
	
	#btn-gender, #btn-age, #btn-style, #btn-write{
		color: #fff;
		border: none;
		outline: none;

		border-radius: 0;
		font-weight: 500;
		letter-spacing: 1px;
		background: #87deff;
	}
	
	#btn-gender:hover, #btn-age:hover, #btn-style:hover, #btn-write:hover{
		background: #009ddb;
	}
	
	.ui-btn-inline{
		color: #fff !important;
	    border: none !important;
	    outline: none !important;
	    border-radius: 0 !important;
	    font-weight: 500 !important;
	    letter-spacing: 1px !important;
	    background: #87deff !important;
	    box-shadow: none !important;
	    text-shadow: none !important;
	    
	    width: 55px;
	    height: 30px;
	    
	    font-size: 12px;
	    font-weight: 100 !important;
	    
	    font-family: 'RobotoDraft', 'Roboto', sans-serif !important;
	}
	
	.ui-content{
		padding: 5px !important;
	}
	
	.ui-content>form{
		display: flex;
		flex-direction: column;
		flex-wrap: wrap;
		justify-content: flex-end;
	}
	
	
	
	</style>
	
	<script>
	  
	$(document).on("click", function(e){
		if($(e.target).is("#btn-gender")){
			$("#gender-content").show();
	    }else{
	        $("#gender-content").hide();
	    }
	});

	$(document).on("click", function(e){
		if($(e.target).is("#btn-age")){
			$("#age-content").show();
	    }
	});
	
	$('body').on("click", function(e){
		if($(e.target).is("#age-min, #age-max, #age-content, .ui-content, .ui-content form, .ui-conent form>div, .ui-conent form>input, .ui-rangeslider-sliders, .ui-slider-track a ")) {
			
		} else {
			$("#age-content").hide();
		}
	});
	

	$(document).on("click", function(e){
		if($(e.target).is("#btn-style")){
			$("#style-content").show();
	    }else{
	        $("#style-content").hide();
	    }
	});
	
	</script>


<main id="main-container">
	
	<div class="board-container">
	
		<div class="board-wrapper">
		
		<!-- ----------동행 게시글 6개씩 반복하는 구간 ------------ -->
			<c:forEach items="${accompanyBoardList }" var="li">
				<div class="board-card">
					<div class="board-content w3-card-2">
						<div class="board-bookmark">
						</div>
						
						<div class="board-detail">
							<div class="board-detail-wrapper">
								<div class="board-profile-pic">
								</div>
								<div class="board-accompany-info">
									<div class="info-item item-nickname">${li.writerNicName }</div>
									<div class="info-item item-country">${li.country }</div>
									<div class="info-item item-date">
										<fmt:formatDate value="${li.startDate }" pattern="yyyy-MM-dd" />
										~
										<fmt:formatDate value="${li.endDate }" pattern="yyyy-MM-dd" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="board-title">
							<div class="board-title-detail">
								<div><a href="${root }/accompany/detail?id=${li.id }">${li.title }</a></div>
							</div>
						</div>
						
						<div class="board-info">
							<div class="board-info-wrapper">
								<div class="board-info-item item-gender">
									<c:choose>
										<c:when test="${li.writerSex==1 }">
											여성
										</c:when>
										<c:otherwise>
											남성
										</c:otherwise>
									</c:choose>
								</div>
								<div class="board-info-item item-age">${li.writerAge }</div>
								<div class="board-info-item item-style">${li.styleType }</div>
							</div>
							<div class="board-registration-time">
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
					  	 
						<c:if test="${page!=1 && page!=0}">
						    <li>
						      <a id="move-page-button-number" href="${root}/accompany/board?p=${page-1 }" aria-label="Previous">
							     <span aria-hidden="true">&laquo;</span>
							  </a>
							</li>
						</c:if>
					    
					    <c:forEach begin="${prev }" end="${next }" var="p" >
					    	
					    	<c:choose>
					    	<c:when test="${p== page }">
						    	<li class="active">
						    	<a id="move-page-button" href="${root }/accompany/board?p=${p }">${p }</a>
						    	</li>
					    	</c:when>
					    	
					    	<c:otherwise>
						    	<li>
						    	<a id="move-page-button-number" href="${root }/accompany/board?p=${p }">${p }</a>
						    	</li>
					    	</c:otherwise>
					    	
					    	</c:choose>
					    </c:forEach>
					    
					    <c:if test="${page!=pageCount && count!=0}">
						    <li>
						      <a  id="move-page-button-number" href="${root}/accompany/board?p=${page+1 }" aria-label="Next">
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

<!-- ----------지도에 x버튼 없애기------------- -->
<style>
	.gm-style-iw + div {display: none;}
</style>

<!-- 	-----------구글 맵 API이용하기--------------- -->


<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>


<script>

	function initialize() {
	
		/* -----------지도 초기 위치 지정하기------------- */
		var lat = parseFloat('${accompanyBoardList.get(0).latitude}');
		var lng = parseFloat('${accompanyBoardList.get(0).longitude}');

		var mapPosition = {
							center: {lat: lat, lng: lng},
							zoom : 13,
							mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map-wrapper"), mapPosition);
	
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
			"<div style=\"background-image: url('${root }/resource/images/Cat.jpg'); border-radius:100px; width:40px; height:40px; background-position: center; background-size: 40px 40px; \"></div>"+		
			"<div onclick='window.location.href=\"${root }/accompany/detail?p=${li.id }\"' style=\"margin-left:10px; cursor:pointer;\">${li.writerNicName }</div></div>";
			
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
          	
          	google.maps.event.addListener(marker${li.id }, 'mouseover', function() {
           	 	
         	});
          	
          	
        </c:forEach>
       
	}	
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link href="${root}/resource/css/accompany/accompany-board.css" rel="stylesheet"/>

	<div id="filter-container">
		<div class="filter-item-container">
			<button type="button" class="btn btn-filter">성별</button>
			<button type="button" class="btn btn-filter">나이</button>
			<button type="button" class="btn btn-filter">성향</button>
			<button type="button" class="btn btn-write" onclick="window.location.href='${root}/accompany/reg'">글쓰기</button>
		</div>
	</div>
	


<main id="main-container">
	
	<div class="board-container">
	
		<div class="board-wrapper">
		
		<!-- ----------동행 게시글 6개씩 반복하는 구간 ------------ -->
			<c:forEach items="${accompanyBoardlist }" var="li">
				<div class="board-card">
					<div class="board-content w3-card-4">
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
								<span>${li.title }</span>
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

<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
<script>
		
	function initialize() {
		var lat = parseFloat('${accompanyBoardlist.get(0).latitude}');
		var lng = parseFloat('${accompanyBoardlist.get(0).longitude}');

		var mapPosition = {
							center: {lat: lat, lng: lng},
							zoom : 13,
							mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map-wrapper"), mapPosition);
	
		/* -----------지도에 마커 추가하기------------- */
        
		
		<c:forEach items="${accompanyBoardlist }" var="li">
			var marker${li.id } = new google.maps.Marker({
	            // The below line is equivalent to writing:
	            // position: new google.maps.LatLng(-34.397, 150.644)
	            position: {lat: ${li.latitude }, lng: ${li.longitude }},
	            map: map
	         });
	        /* -----------마커 눌렀을 때 발생하는 이벤트------------- */
/*      	     var infowindow${li.id } = new google.maps.InfoWindow({
        	    content: '${li.title }'
         	 });

    	     infowindow${li.id }.open(map, marker${li.id });
    	 */     
          	google.maps.event.addListener(marker${li.id }, 'click', function() {
           	 	window.location.href="${root }/accompany/detail?p=${li.id }";
         	}); 
		</c:forEach>
		

           
        
	}
			
	google.maps.event.addDomListener(window, 'load', initialize);
		
</script>
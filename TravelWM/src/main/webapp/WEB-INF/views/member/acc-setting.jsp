<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="/TravelWM/resource/css/member/acc-setting.css" type="text/css" />
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!-- <script>
	window.addEventListener("load", function() {
		var mod = document.querySelector("#mod");
		var modAcc = document.querySelector("#mod-acc");
		var accZone = document.querySelector("#acc-zone");
		
		mod.onclick = function() {
			accZone.style.display = "none";
			modAcc.style.display = "flex";
		}
	});
</script> -->

<main class="main">
	<%@ include file="inc/aside.jsp" %>
	
	<div class="profile-container">
	
		
		<div class="profile-info-container">
			<div class="profile-info-title info-title">
			<span>나의 동행 정보</span>
			</div>
			
			<div class="acc-info-content info-content">
				<div class="acc-info-wrapper">
					<form method="post" class="member-accom-info-form">
						<div class="acc-info-input">
							<div class="address-zone">
								<!-- -------- 구글 지도 검색창 ------ -->
							    <input class="form-control acc-info-enter no-enter autoComplete" id="autocomplete" name="form" placeholder="여행할 주소를 입력하세요!" type="text" required/>
				
							    <input class="hidden" type="text" value="" name="latitude" id="lat"/>			           
							    <input class="hidden" type="text" value="" name="longitude" id="lng"/>  
							    <input class="hidden" type="text" value="" name="place" id="place"/>  
							    <input class="hidden" type="text" value="" name="locality" id="locality"/>  
							    <input class="hidden" type="text" value="" name="country" id="country"/>  
								<input class="hidden" type="text" value="" name="memberAccomBoardId" id="member-accomBoard-id"/>  
							</div>
							
							<div class="calendar-zone">		
								<input type="text" class="form-control acc-info-enter calendar-reg" name="datefilter-reg" value="" placeholder="여행할 날짜를 입력하세요!" required />
		    	  				<input type="text" class="hidden" id="hidden-startDate" name="startDate" value="" placeholder="Search"/>
		    	  				<input type="text" class="hidden" id="hidden-endDate" name="endDate" value="" placeholder="Search" />
		    	  			</div>
		    	  								
							<div class="accom-info-reg-button">
								<input type="submit" class="btn btn-info na" id="info-reg" value="등록"/>
								<input type="button" class="btn btn-info na" id="info-edit" value="수정"/>
								<input type="button" class="btn btn-info na" id="cancel-edit" value="취소"/>
							</div>
						</div>
					</form>
				
					<div class="acc-info-display">
						<div class="acc-info-display-wrapper">
	<!-- --------------------memberAccomInfo 반복 구간------------------------ -->
							<c:forEach var="li" items="${memberAccomLists }">
								<div class="display-item">
									<div>
										<input class="hidden hidden-location" type="text" value="${li.country } ${li.locality } ${li.place }"/>  
										<input class="hidden hidden-date" type="text" value="<fmt:formatDate value="${li.startDate }" pattern="yy.MM.dd" /> - <fmt:formatDate value="${li.endDate }" pattern="yy.MM.dd" />"/>  									
										<input class="hidden hidden-id" type="text" value="${li.id }"/>
	
										${li.country }&nbsp;${li.locality }&nbsp;${li.place }&nbsp;
								    	<fmt:formatDate value="${li.startDate }" pattern="yy.MM.dd" />
										-
										<fmt:formatDate value="${li.endDate }" pattern="yy.MM.dd" />
									</div>
									<div class="edit-delete">
										<button id="mod" value="${li.id }" class="btn btn-info na edit-button">수정</button>
										<button value="${li.id }" class="btn btn-info na delete-button" onclick="window.location.href='${root }/member/acc-info-delete?id=${li.id }'">삭제</button>
									</div>
								</div>
							</c:forEach>
	<!-- ------------------------------------------------------------------ -->						
						</div>
					</div>
			</div>

			</div>
			
			
			<div class="chat-info-container">
				<div class="account-info-title info-title">
				<span>이음 대화 목록</span>
				</div>
				<div class="account-info-content info-content">
					<div>
						<button type="button" class="btn-add" id="btn-add" onclick="add()">추가</button>
						<button type="button" class="btn-del" id="btn-del" onclick="del()">삭제</button>
					</div>
				</div>
			</div>
			
			
			<div class="match-info-container">
				<div class="password-info-title info-title">
				<span>이음 매칭 목록</span>
				</div>
				<div class="password-info-content info-content">
					<div>
						<button type="button" class="btn-add" id="btn-add" onclick="add()">추가</button>
						<button type="button" class="btn-del" id="btn-del" onclick="del()">삭제</button>
					</div>
				</div>
			</div>
			
			
		</div>
	
	
		<div class="fake">
		</div>
		
		
	</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
</div>
</main>


<!-- --------------동행 정보 수정용 자바 스크립트--------------------------------- -->
<script>
	window.addEventListener("load",function(){
		var editButton = document.getElementsByClassName("edit-button");
		var regButton = document.querySelector("#info-reg");
		var editPostButton = document.querySelector("#info-edit");
		var cancelEditButton = document.querySelector("#cancel-edit");
		
		var hiddenLocation = document.querySelectorAll(".hidden-location");
		var hiddenDate = document.querySelectorAll(".hidden-date");
		
		var locationForm = document.querySelector(".autoComplete");
		var dateForm = document.querySelector(".calendar-reg");
		var memberAccomBoardId = document.querySelector("#member-accomBoard-id");
		
		// 각 member accom board 의 수정버튼에 onclick 리스너 추가하기
		for(var i=0;i<editButton.length;i++){
			 editButton[i].onclick = function editFunc(event){
			        event.preventDefault();
			        var hiddenLocByTarget = event.target.parentNode.parentNode.querySelector(".hidden-location").value;
			        var hiddenDateByTarget = event.target.parentNode.parentNode.querySelector(".hidden-date").value;
					var hiddenIdByTarget = event.target.parentNode.parentNode.querySelector(".hidden-id").value;

			        locationForm.value = hiddenLocByTarget;
					dateForm.value = hiddenDateByTarget;
					memberAccomBoardId.value = hiddenIdByTarget;

					editPostButton.style.display = "flex";
					regButton.style.display = "none";
					cancelEditButton.style.display = "flex";
			};
		}

		// 수정 완료 버튼 클릭 시 
		editPostButton.onclick= function(){
			regButton.onsubmit = "return false;";
	 		var latCheck = document.querySelector("#lat");
	 		var dateCheck = document.querySelector("#hidden-endDate");

	 		if(latCheck.value.length >0 || dateCheck.value.length >0){
		    	var form = document.querySelector(".member-accom-info-form");			
		    	form.setAttribute("action", "${root }/member/acc-info-edit");
		    	form.submit();
			}
	 		else{
	 			return false;
	 		}
		}
		
		// 수정하다 취소 버튼 눌렀을 때
		cancelEditButton.onclick = function(){

			locationForm.value='';
			dateForm.value='';
			editPostButton.style.display = "none";
			regButton.style.display = "flex";
			cancelEditButton.style.display = "none";
		}
		
		locationForm.onclick = function(){
			locationForm.value='';
		}

	});
	
</script>    	  			
								
<!-- -------------------------------------------------------- -->

<!-- ------------------Calendar------------------------ -->
    	  			<script>
						$('.calendar-reg').on("mousedown", function(){
							
						
							$('.daterangepicker').css({'position':'absolute'});
							$('.daterangepicker').css({'top':'270px'});
						});
						
						$('body').on("click", function(e){
							
							if($(e.target).is(".form-control-header, .calendar-reg, .daterangepicker, .dropdown-menu, .dropdown-menu div, .dropdown-menu th, .dropdown-menu td")) {		
							} else {
								$('.daterangepicker').css({'position':'fixed'});
								$('.daterangepicker').css({'top':'-500px'});
							}
						});
					</script>
					
					
					<script>
						$(function() {
						  
							$('input[name="datefilter-reg"]').daterangepicker({
						      autoUpdateInput: false,
						      locale: {
						          cancelLabel: 'Clear'
						      }
						  });
							
						  $('input[name="datefilter-reg"]').on('apply.daterangepicker', function(ev, picker) {
						      $(this).val(picker.startDate.format('YY.MM.DD') + ' - ' + picker.endDate.format('YY.MM.DD'));
						      $('input[name="endDate"]').val(picker.endDate.format('YYYY-MM-DD'));
						      $('input[name="startDate"]').val(picker.startDate.format('YYYY-MM-DD'));
						  });
						
						  $('input[name="datefilter-reg"]').on('cancel.daterangepicker', function(ev, picker) {
						      $(this).val('');
						  });
						
						});
					</script>

<!-- ------------google map API------------------- -->

<script>
        var placeSearch, autocomplete,mobAutocomplete1;
        var location;
        var componentForm = {
        	        street_number: 'short_name',
        	        route: 'long_name',
        	        locality: 'long_name',
        	        administrative_area_level_1: 'short_name',
        	        country: 'long_name',
        	        postal_code: 'short_name'
        };
          
        var componentForm1 = {
    	        street_number: 'short_name',
    	        route: 'long_name',
    	        locality: 'long_name',
    	        administrative_area_level_1: 'short_name',
    	        country: 'long_name',
    	        postal_code: 'short_name'
  		  };
      
		var acInputs =  document.querySelectorAll("#autocomplete");
 		var mbAutoInput = document.querySelector("#mobile-autocomplete");
		var autocomplete = [];
		
 		function initAutocomplete() {
	     // Create the autocomplete object, restricting the search to geographical
	     // location types.

	    	for(var i=0; i < acInputs.length ; i++){   
		    	autocomplete[i] = new google.maps.places.Autocomplete(
		    		 acInputs[i],
			         {types: ['geocode']}
			     );
		    	autocomplete[i].addListener('place_changed', eval('getLocation'+i)); 
		     }
	     
	    	mobAutocomplete1 =  new google.maps.places.Autocomplete(
	    			mbAutoInput,
			         {types: ['geocode']}
			);
	    	
	        mobAutocomplete1.addListener('place_changed', getLocationMob);
	     
	  	 }
 		
 		
 		function getLocation0(){
 		          	  var place = autocomplete[0].getPlace();
 		  	          var latitude = place.geometry.location.lat();
 		  	          var longitude = place.geometry.location.lng();
 		  	          var placeName = place.name;
 		  	/*         	  var fotmattedAdress = place.formatted_address;
 		  	 */        	  
 		  	    	               	  
 		  	        	  alert("위도"+latitude);
 		  	        	  alert("경도"+longitude);
 		  	        	  alert(placeName);
 		  	
 		  	        	  
 		  	         	  var lng = document.querySelector("#lng1");
 		  	        	  var lat = document.querySelector("#lat1");
 		  	        	  var placeForm = document.querySelector("#place1");
 		  	        	  var localityText = document.querySelector("#locality1");
 		  	        	  var countryText = document.querySelector("#country1");
 		  				  var locality = '';
 		  				  var country = '';   	  
 		  		          
 		  	              for (var i = 0; i < place.address_components.length; i++) {
 		  	                  var addressType = place.address_components[i].types[0];
 		  	                  
 		  	                  if (addressType=='country') {
 		  	                    country = place.address_components[i][componentForm[addressType]];
 		  	                   
 		  	                   // alert(country);
 		  	                  }
 		  	                  
 		  	                  else if(addressType == 'locality'){
 		  	                	  locality = place.address_components[i][componentForm[addressType]];
 		  	                	  
 		  	                	 //	 alert(locality);
 		  	                  }
 		  	             
 		  	              }
 		  	              
 		  	           lat.value=latitude;
 		  	           lng.value=longitude;
 		  	           placeForm.value=placeName;
 		  	           localityText.value = locality;
 		  	           countryText.value = country;
 		  	           
 		  	        document.querySelector("#mobile-autocomplete").value = document.querySelector("#autocomplete").value;
 		  	            	  
 		  		          alert(country);
 		  		          alert(locality);
 		
 		}

 		function getLocation1(){
         	  var place = autocomplete[1].getPlace();
 	          var latitude = place.geometry.location.lat();
 	          var longitude = place.geometry.location.lng();
 	          var placeName = place.name;
 	/*         	  var fotmattedAdress = place.formatted_address;
 	 */        	  
 	    	/*                	  
 	        	  alert("위도"+latitude);
 	        	  alert("경도"+longitude);
 	        	  alert(placeName);
 	 */
 	        	  
 	         	  var lng = document.querySelector("#lng");
 	        	  var lat = document.querySelector("#lat");
 	        	  var placeForm = document.querySelector("#place");
 	        	  var localityText = document.querySelector("#locality");
 	        	  var countryText = document.querySelector("#country");
 				  var locality = '';
 				  var country = '';   	  
 		          
 	              for (var i = 0; i < place.address_components.length; i++) {
 	                  var addressType = place.address_components[i].types[0];
 	                  
 	                  if (addressType=='country') {
 	                    country = place.address_components[i][componentForm[addressType]];
 	                   
 	                   // alert(country);
 	                  }
 	                  
 	                  else if(addressType == 'locality'){
 	                	  locality = place.address_components[i][componentForm[addressType]];
 	                	  
 	                	 //	 alert(locality);
 	                  }
 	             
 	              }
	  	                  
           
			      lat.value=latitude;
			      lng.value=longitude;
			      placeForm.value=placeName;
			      localityText.value = locality;
			      countryText.value = country;
			        
 		          /* alert(country);
 		          alert(locality);
 		           */
 		         alert(country+'의'+placeName+'이 선택되었습니다.');

		}
 		
		function getLocation2(){
       	  var place = autocomplete[2].getPlace();
	          var latitude = place.geometry.location.lat();
	          var longitude = place.geometry.location.lng();
	          var placeName = place.name;
	/*         	  var fotmattedAdress = place.formatted_address;
	 */        	  
	    	/*                	  
	        	  alert("위도"+latitude);
	        	  alert("경도"+longitude);
	        	  alert(placeName);
	 */
	        	  
	         	  var lng = document.querySelector("#lng");
	        	  var lat = document.querySelector("#lat");
	        	  var placeForm = document.querySelector("#place");
	        	  var localityText = document.querySelector("#locality");
	        	  var countryText = document.querySelector("#country");
				  var locality = '';
				  var country = '';      	  
		          
	              for (var i = 0; i < place.address_components.length; i++) {
	                  var addressType = place.address_components[i].types[0];
	                  
	                  if (addressType=='country') {
	                    country = place.address_components[i][componentForm[addressType]];
	                   
	                   // alert(country);
	                  }
	                  
	                  else if(addressType == 'locality'){
	                	  locality = place.address_components[i][componentForm[addressType]];
	                	  
	                	 //	 alert(locality);
	                  }
	             

	      		}
			    alert(country+'의'+placeName+'이 선택되었습니다.');
			    
		}
	       		
		
		 function getLocationMob(){
          	  var place1 = mobAutocomplete1.getPlace();
              var latitude = place1.geometry.location.lat();
          	  var longitude = place1.geometry.location.lng();
              var placeName = place1.name;
              var fotmattedAdress = place1.formatted_address;
            	  
              var auto = document.querySelector("#autocomplete").value;

             var lng = document.querySelector("#lng1");
          	  var lat = document.querySelector("#lat1");
          	  var placeForm = document.querySelector("#place1");
          	  var localityText = document.querySelector("#locality1");
          	  var countryText = document.querySelector("#country1");
        		  var locality = '';
        		  var country = '';
        		  
        		  alert(placeName);
        		  alert(latitude);
                 
                for (var i = 0; i < place1.address_components.length; i++) {
                    var addressType1 = place1.address_components[i].types[0];
                    
                    if (addressType1=='country') {
                      country = place1.address_components[i][componentForm1[addressType1]];
                     
                     // alert(country);
                    }
                    
                    else if(addressType1 == 'locality'){
                  	  locality = place1.address_components[i][componentForm1[addressType1]];
                  	  
                  	 //	 alert(locality);
                    }
               
                }
                 alert(country);
                 alert(locality);
              document.querySelector("#autocomplete").value = document.querySelector("#mobile-autocomplete").value;
        		  lng.value = longitude;
          	  lat.value = latitude;
          	  placeForm.value= placeName;
          	  countryText.value = country;
                localityText.value = locality;
          	  
          	  
            } 
	                
	                // Bias the autocomplete object to the user's geographical location,
	                // as supplied by the browser's 'navigator.geolocation' object.
	      	      function geolocate() {
	      	        if (navigator.geolocation) {
	      	          navigator.geolocation.getCurrentPosition(function(position) {
	      	            var geolocation = {
	      	              lat: position.coords.latitude,
	      	              lng: position.coords.longitude
	      	            };
	      	            var circle = new google.maps.Circle({
	      	              center: geolocation,
	      	              radius: position.coords.accuracy
	      	            });
	      	            for(var i=0 ; i<acInputs.length ; i++){
	      	            	autocomplete[i].setBounds(circle.getBounds());
	      	            }
	      	          });
	      	        }
	      	      }
	                
	       	      $('.no-enter').keydown(function (e) {
	      	    	  if (e.which == 13 && $('.pac-container:visible').length) return false;
	      	    	});
	       	      
	       	     /* -----------구글 맵 검색 창 z-index 위로 올리기----------- */
	       		 var autoComplete1 = document.querySelectorAll('#autocomplete');
	       		 var mobAutoComplete1 = document.querySelector('#mobile-autocomplete');
	       		 		 
	       			 autoComplete1[0].onclick = function(){
	       		     autoComplete1.value='';
	       		     var searchResultBox = document.querySelectorAll('.pac-container');
       		   		 for(var i=0;i<searchResultBox.length;i++)
	       			     searchResultBox[i].style.zIndex = '10000';
	       	   		 
	       			 }
	       	 		 
	       			 mobAutoComplete1.onclick = function(){
	       				 mobAutoComplete1.value='';
	       			     var searchResultBox = document.querySelectorAll('.pac-container');
	       		   		 for(var i=0;i<searchResultBox.length;i++)
		       			     searchResultBox[i].style.zIndex = '10000';
	       		   		 
	       			 }


</script>	              
	                
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y&libraries=places&callback=initAutocomplete"
        async defer></script>

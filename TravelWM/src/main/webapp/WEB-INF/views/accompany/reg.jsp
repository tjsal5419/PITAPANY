<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/TravelWM/resource/css/accompany/reg.css"
	type="text/css" />
	
<!-- <script>

$("#submit").click(function(){
	alert("전송합니다");
});
$(":file").filestyle();
</script>
 -->

<main id="main">
<div class="frame">
	<div class="content">
	
	<form class="form" method="post">
		<div class="head">
			<div class="title-logo">
				<span>Title</span>
			</div>
			<div class="title-content">
				<input class="ti form-control" type="text" name="title" placeholder="제목내용" required/>
			</div>
		</div>
		<div class="sel">
			<div class="search-bar-container-accom">
			
				<!-- -------- 구글 지도 검색창 ------ -->
			    <input class="form-control" id="autocomplete" name="form" placeholder="Enter your address" type="text" required/>
			    <input class="hidden" type="text" value="" name="lat" id="lat"/>			           
			    <input class="hidden" type="text" value="" name="lng" id="lng"/>  
			    <input class="hidden" type="text" value="" name="placeId" id="placeId"/>  
			    <input class="hidden" type="text" value="" name="locality" id="locality"/>  
			    <input class="hidden" type="text" value="" name="country" id="country"/>  
			    
  				<!-- -------- 달력 ------ -->
    	  		<input type="text" class="form-control" placeholder="Search" required>
	    	</div>
		</div>
		<div class="text">
			<textarea name="content"  class="form-control" placeholder="본문내용" required></textarea>
		</div>
		<div class="select-char">
			<span>선호 여행 스타일</span>
			<select class="select" name="style">
				<c:forEach var="l" items="${styleList }">
					<option value="${l.id}">${l.type } </option>	
				</c:forEach>
			</select>
		</div>
		<div class="foot">
 			<div class="insert-pic">
				<div><input class="form-control img-input-box" placeholder="첨부된 파일이 없습니다." type="text" readonly/></div>
				<div>
					<label  class="btn btn-default" for="filebox">첨부</label>
					<input type="file" name="img" id="filebox"/>
				</div>
 			  </div>
				
    			
    			
			</div>
			<div class="bottun">
				<div class="cancel">
					<button onclick="window.location.href='${root}/accompany/board'" class="btn btn-info chat">글 취소</button>	
				</div>
				<div class="reg">
					<button class="btn btn-info chat" id="submit" type ="submit">글 등록</button>
				</div>
			</div>
	
	</form>
	</div>
	
</div>

</main>
        
    
<script>
      // This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

/*  window.addEventListener("load",function(event){
 */    	     
          var placeSearch, autocomplete;
          var location;
          var componentForm = {
        	        street_number: 'short_name',
        	        route: 'long_name',
        	        locality: 'long_name',
        	        administrative_area_level_1: 'short_name',
        	        country: 'long_name',
        	        postal_code: 'short_name'
        	};
          

/*          
          var defaultBounds = new google.maps.LatLngBounds(
        		  new google.maps.LatLng(-33.8902, 151.1759),
        		  new google.maps.LatLng(-33.8474, 151.2631));

    	  var input = document.getElementById('autocomplete');

          var searchBox = new google.maps.places.SearchBox(input, {
        		  bounds: defaultBounds
          });
 */
          
	 function initAutocomplete() {
	     // Create the autocomplete object, restricting the search to geographical
	     // location types.
	     autocomplete = new google.maps.places.Autocomplete(
	         /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
	         {types: ['geocode']});
	
	     // When the user selects an address from the dropdown, populate the address
	     // fields in the form.
	     autocomplete.addListener('place_changed', getLocation);
	   }
 
          function getLocation(){
        	  var place = autocomplete.getPlace();
        	  var latitude = place.geometry.location.lat();
        	  var longitude = place.geometry.location.lng();
        	  var place_Id = place.place_id;
        	  var fotmattedAdress = place.formatted_address;
/*         	  
        	  alert("위도"+latitude);
        	  alert("경도"+longitude);
        	  alert(place.place_id);
        	  alert(place.vicinity);
        	  alert(place.name); */
        	  alert(place.name);
        	  var lng = document.querySelector("#lng");
        	  var lat = document.querySelector("#lat");
        	  var placeId = document.querySelector("#placeId");
        	  var localityText = document.querySelector("#locality");
        	  var countryText = document.querySelector("#country");
			  var locality = '';
			  var country = '';
        	  
        	  lng.value = longitude;
        	  lat.value = latitude;
        	  placeId.value= place_Id;
        	  
        	  /* address.value = fotmattedAdress;
        	   */
              for (var i = 0; i < place.address_components.length; i++) {
                  var addressType = place.address_components[i].types[0];
                  
                  if (addressType=='country') {
                    country = place.address_components[i][componentForm[addressType]];
                   
                   // alert(country);
                  }
                  
                  else if(addressType == 'locality'){
                	  locality = place.address_components[i][componentForm[addressType]];
                	  
                	 // alert(locality);
                  }
             
              }
        	   
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
	            autocomplete.setBounds(circle.getBounds());
	          });
	        }
	      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y&libraries=places&callback=initAutocomplete"
        async defer></script>
        
     <!-- ------엔터 클릭 시 전송되는것 막기--- -->
    <script type="text/javascript">
    window.addEventListener('keydown', function(e) {
        if (e.keyIdentifier == 'U+000A' || e.keyIdentifier == 'Enter' || e.keyCode == 13) {
            if (e.target.nodeName == 'form' && e.target.type == 'text') {
                e.preventDefault();
                return false;
            }
        }
    }, true);
	</script>

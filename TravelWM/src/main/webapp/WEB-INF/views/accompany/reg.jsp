<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/TravelWM/resource/css/accompany/reg.css"
	type="text/css" />


<main id="main">
<div class="frame">
	<div class="content">

	<form class="form" method="post" enctype="multipart/form-data">

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
			    <input class="form-control" id="autocomplete" name="form" placeholder="여행할 주소를 입력하세요." type="text" required/>
			    <input class="hidden" type="text" value="" name="lat" id="lat"/>			           
			    <input class="hidden" type="text" value="" name="lng" id="lng"/>  
			    <input class="hidden" type="text" value="" name="place" id="place"/>  
			    <input class="hidden" type="text" value="" name="locality" id="locality"/>  
			    <input class="hidden" type="text" value="" name="country" id="country"/>  
			    
  				<!-- -------- 달력 ------ -->

    	  		<input type="text" class="form-control calendar-reg" name="datefilter-reg" value="" placeholder="Search" required />
    	  		<input type="text" class="hidden" id="hidden-startDate" name="startDate" value="" placeholder="Search" required />
    	  		<input type="text" class="hidden" id="hidden-endDate" name="endDate" value="" placeholder="Search" required />
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
 			<!-- <div class="insert-pic">
				<div><input class="form-control img-input-box" placeholder="첨부된 파일이 없습니다." type="text" readonly/></div>
				<div>
					<label  class="btn btn-default" for="filebox">첨부</label>
					<input type="file" name="img" id="filebox"/>
				</div>
 			</div> -->
 			<div>
 				<input type="file" name="file" id="file-7" class="inputfile inputfile-6" data-multiple-caption="{count} files selected" multiple />
				<label for="file-7"><strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></strong><span></span></label>
 			</div>
 			
 			<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script>
 			
 			<script>
 			/*
 			By Osvaldas Valutis, www.osvaldas.info
 			Available for use under the MIT License
 		*/

 		'use strict';

 		;( function ( document, window, index )
 		{
 			var inputs = document.querySelectorAll( '.inputfile' );
 			Array.prototype.forEach.call( inputs, function( input )
 			{
 				var label	 = input.nextElementSibling,
 					labelVal = label.innerHTML;

 				input.addEventListener( 'change', function( e )
 				{
 					var fileName = '';
 					if( this.files && this.files.length > 1 )
 						fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
 					else
 						fileName = e.target.value.split( '\\' ).pop();

 					if( fileName )
 						label.querySelector( 'span' ).innerHTML = fileName;
 					else
 						label.innerHTML = labelVal;
 				});

 				// Firefox bug fix
 				input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
 				input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
 			});
 		}( document, window, 0 ));
 			</script>
 			
				
    			
    			
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

<!-- ------------google map API------------------- -->
    
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
	
	     autocomplete.addListener('place_changed', getLocation);

	   }
 
          function getLocation(){
        	  var place = autocomplete.getPlace();
        	  var latitude = place.geometry.location.lat();
        	  var longitude = place.geometry.location.lng();
        	  var placeName = place.name;
        	  var fotmattedAdress = place.formatted_address;
        	  
    	      
    	      /* ---------------------------------------- */
/*         	  
        	  alert("위도"+latitude);
        	  alert("경도"+longitude);
        	  alert(place.place_id);
        	  alert(place.vicinity);
        	  alert(place.name); */
        	  
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
                	  
                	 // alert(locality);
                  }
             
              }
              
             alert(placeName+'가 선택되었습니다.');
              lng.value = longitude;
        	  lat.value = latitude;
        	  placeForm.value= placeName;
        	  countryText.value = country;
              localityText.value = locality;
        	  /* address.value = fotmattedAdress;
        	   */
              
        	  
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
          
 	      $('#autocomplete').keydown(function (e) {
	    	  if (e.which == 13 && $('.pac-container:visible').length) return false;
	    	});
          
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y&libraries=places&callback=initAutocomplete"
        async defer></script>

<script>
	$('.calendar-reg').on("mousedown", function(){
		
	
		$('.daterangepicker').css({'position':'absolute'});
		$('.daterangepicker').css({'top':'170px'});
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
	      $(this).val(picker.startDate.format('MMM DD') + ' - ' + picker.endDate.format('MMM DD'));
	      $('input[name="endDate"]').val(picker.endDate.format('YYYY-MM-DD'));
	      $('input[name="startDate"]').val(picker.startDate.format('YYYY-MM-DD'));
	  });
	
	  $('input[name="datefilter-reg"]').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	  });
	
	});
</script>

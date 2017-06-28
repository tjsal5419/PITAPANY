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

		<div class="sel">
			<div class="search-bar-container-accom">
			
				<!-- -------- 구글 지도 검색창 ------ -->
			    <input class="form-control no-enter" id="autocomplete" name="form" placeholder="여행할 주소를 입력하세요." type="text" required/>
			    <input class="hidden" type="text" value="" name="lat" id="lat"/>			           
			    <input class="hidden" type="text" value="" name="lng" id="lng"/>  
			    <input class="hidden" type="text" value="" name="place" id="place"/>  
			    <input class="hidden" type="text" value="" name="locality" id="locality"/>  
			    <input class="hidden" type="text" value="" name="country" id="country"/>  
			   
	    	</div>
		</div>
		<div class="text">
			<textarea name="content"  class="form-control" placeholder="본인의 생각을 블로그에 담아보세요!" required></textarea>
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
	    			
			</div>
			<div class="bottun">
				<div class="cancel">
					<button onclick="window.location.href='${root}/profile/home?${id}'" class="btn btn-info chat">글 취소</button>	
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


<!-- -----------첨부파일 디자인 관련 스크립트------------- -->
 			
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
 			
        

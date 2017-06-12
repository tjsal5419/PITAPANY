<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/faq.css" rel="stylesheet"/>


<main class="main">
		<%@ include file="inc/aside.jsp" %>
		

		<div class="main-container">
			<div class="qna-container">
				<div class="qna-title">
					<h2>자주 하는 질문</h2>
				</div>
		
				<div class="qna-content-wrapper">
					
					<button class="accordion">Q. 동행하고 싶어</button>
					<div class="panel">
						<p> 네 하세요.
						</p>
					</div>
		
					<button class="accordion">Q. PITAPANY는 무슨 뜻이죠</button>
					<div class="panel">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
							do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</p>
					</div>
		
					<button class="accordion">Q. 일등하실 수 있나요?</button>
					<div class="panel">
						<p>예.
						</p>
					</div>
					
					<button class="accordion">Q. 일등하실 수 있나요?</button>
					<div class="panel">
						<p>예.
						</p>
					</div>
					
					<button class="accordion">Q. 일등하실 수 있나요?</button>
					<div class="panel">
						<p>예.
						</p>
					</div>
		
				</div>
			</div>

			<div class="location-container">
				<div class="location-title">
					<h2>Find Us Via Google Map</h2>
				</div>
				<div id="map-wrapper"></div>
					<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
					<script>
						function initialize() {
							var mapPosition = {
											center : new google.maps.LatLng(52.50056, 13.39889),
											zoom : 5,
											mapTypeId : google.maps.MapTypeId.ROADMAP
											};
							var map = new google.maps.Map(document.getElementById("map-wrapper"), mapPosition);}
							
							google.maps.event.addDomListener(window, 'load', initialize);
					</script>
			</div>
			
			
			<div class="contact-container">

			
				<div class="contact-title">
					<h2>Send Message</h2>
				</div>
				
				<form action="" method="POST">
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" name="InputName" placeholder="Name" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input type="email" name="InputEmail" placeholder="Email" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                <input type="number" name="InputCno" placeholder="Phone" class="form-control" required>
                            </div>
                        </div>
                        
                        <div class="form-group">	
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
                                <textarea name="InputMessage" rows="6" class="form-control" type="text" required></textarea>
                            </div>
                        </div>
                        
                        <div class="">
                        <button type="submit" class="btn btn-info pull-right">SEND MESSAGE</button>
                        </div>
                    </div>
            	</form>
				
			</div>
		</div>
		
		<div class="fake">
		</div>
			
</main>



<script>
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
	  acc[i].onclick = function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight){
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  }
	}
</script>

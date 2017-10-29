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
					<div class="head-start-line"></div>
					<h2>자주 하는 질문</h2>
				</div>
		
				<div class="qna-content-wrapper">
					
					<button class="accordion">Q. 동행하고 싶어요</button>
					<div class="panel">
						<p> 네.
						</p>
					</div>
		
					<button class="accordion">Q. PITAPANY는 무슨 뜻인가요?</button>
					<div class="panel">
						<p>PITAPANY는 두근두근 의미의 PIT-A-PAT과 COMPANY의 합성어로 사용자들이 두근두근 거릴 수 있는 서비스를 지향하는 회사입니다.
						</p>
					</div>
		
					<button class="accordion">Q. 박용우 선생님은 어떠신 분인가요?</button>
					<div class="panel">
						<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
						ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
						ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
						</p>
					</div>
					
					<button class="accordion">Q. 커플이 생기기도 하나요?</button>
					<div class="panel">
						<p>능력이 되신다면. ㅋ
						</p>
					</div>
					
					<button class="accordion">Q. PITAPANY 팀장님 번호가 궁금해요!</button>
					<div class="panel">
						<p>제 번호는 010358..ㅎ 데헷
						</p>
					</div>
		
				</div>
			</div>

			<div class="location-container">
				<div class="location-title">
					<div class="head-start-line"></div>
					<h2>Location</h2>
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
					<div class="head-start-line"></div>
					<h2>Contact Us</h2>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link href="${root}/resource/css/profile/home.css" rel="stylesheet"/>

<div>
   <div class="back-img">
      <div class="background">
         <img class="background-pictures"  src="${root}/resource/images/uah.jpg" alt="프로필사진">
      </div>
   </div> 
</div>  
<div class="setting-button"><button type="button" class="btn btn-info">프로필  설정</button></div>
<div class="prof-img">   
      <div class="name">프로필명</div>
      <div class="thumblist">
         <img class="prof-img-circle"  src="${root}/resource/images/sakura.jpg" alt="프로필사진">
      </div>
   <div class="center">닉네임</div>
</div>         
   

<main class="main">   
   <div>
      <div class="menu">
         <div class="list">
            <div class="change">목록전환</div>      
            <div class="write">대화하기(게스트) / 글쓰기(주인)</div>             
            <div class="detail">자세히</div>
         </div>               
      </div>
   </div>
   <div class="content-container">      
      <div class="box">
         <div class="info-box">            
            <div class="prof-box">
               <div class="prof-thumblist">
                  <img class="prof-small-img-circle"  src="${root}/resource/images/sana01.jpg" alt="프로필사진">
               </div>
               <div class="list">
                  <div class="nic">닉네임</div>
                  <div class="location">위치</div>
                  <div class="write-date">글 등록일</div>
               </div>   
            </div>
               
            <div class="content">               
               <div></div>
            </div>
            
            <div class="icon-box">
               <div class="icon">
                  <div class="heart">
                     <img class="heart-icon" src="${root  }/resource/images/ic_favorite_border_black_24dp_1x.png"/>
                  </div>
                  <div class="comment">
                     <img class="heart-icon" src="${root  }/resource/images/ic_comment_black_24dp_1x.png"/>
                  </div>
               </div>
               
               <div class="number">
                  <div class="number-of-Heart">하트수</div>
                  <div class="number-of-Comment">댓글수</div>
               </div>
            </div>
         </div>
      </div>   
   </div>
      
<div class="content-container">      
      <div class="box">
         <div class="info-box">            
            <div class="prof-box">
               <div class="prof-thumblist">
                  <img class="prof-small-img-circle"  src="${root}/resource/images/sana01.jpg" alt="프로필사진">
               </div>
               <div class="list">
                  <div class="nic">닉네임</div>
                  <div class="location">위치</div>
                  <div class="write-date">글 등록일</div>
               </div>   
            </div>
               
            <div class="content">               
               <div></div>
            </div>
            
            <div class="icon-box">
               <div class="icon">
                  <div class="heart">
                     <img class="heart-icon" src="${root  }/resource/images/ic_favorite_border_black_24dp_1x.png"/>
                  </div>
                  <div class="comment">
                     <img class="heart-icon" src="${root  }/resource/images/ic_comment_black_24dp_1x.png"/>
                  </div>
               </div>
               
               <div class="number">
                  <div class="number-of-Heart">하트수</div>
                  <div class="number-of-Comment">댓글수</div>
               </div>
            </div>
         </div>
      </div>   
   </div>
   
   <div>
      <div class="menu">
         <div class="list">
            <div class="change">동행평가</div>      
            <div class="write">대화하기(게스트) / 글쓰기(주인)</div>             
            <div class="detail">홈으포</div>
         </div>               
      </div>
   </div>
               
   <div class="content-container">            
      <div class="profile-box">
         <div class="prof-info">
            <div>자기정보</div>
            <input class="revision btn btn-info" type="button" value=" 프로필 수정" />
         </div>
         <div class="self-prof-box">
            <div class="prof-info-box">
               <div class="value-box">
                  <div class="age">나이</div>
                  <div class="value">표시란</div>
               </div>
               <div class="value-box">
                  <div class="gender">성별</div>
                  <div class="value">표시란</div>
               </div>         
               <div class="value-box">
                  <div class="blood">혈액형</div>
                  <div class="value">표시란</div>
               </div>         
               <div class="value-box">
                  <div class="job">직업</div>
                  <div class="value">표시란</div>
               </div>                         
            </div>
            <div class="self-intro-box">
               <div class="accompany-type">동행유형</div>
               <div class="self-intro">자기소개</div>
            </div>         
         </div>
         <div class="sns-button">
            <input class="sns btn btn-info" type="button" value="SNS"  />
            <input class="sns btn btn-info" type="button" value="SNS"  />
         </div>
      </div>      
   </div>
   
   <div class="content-container">      
      <div class="box">
            <div class="prof-info">
               <div>여행현황</div>
               <input class="btn btn-info" type="button" value="추가 버튼" />
            </div>
         <script
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
         <script>
            function initialize() {
               var mapProp = {
                  center : new google.maps.LatLng(52.50056,  13.39889),
                  zoom : 5,
                  mapTypeId : google.maps.MapTypeId.ROADMAP
               };
               var map = new google.maps.Map (document.getElementById("googleMap"),
                     mapProp);
            }
      
            google.maps.event.addDomListener(window, 'load',  initialize);
         </script>
         <div id="googleMap" style=" min-width: 210px; height:  380px;"></div>
         <div class="summary"><input class="summary-button btn btn-info"  type="button" value="현황 요약 " /></div>
      </div>
   </div>
</main>
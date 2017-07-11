<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${root}/resource/css/accompany/detail.css"
	type="text/css" />
<script>
	window.addEventListener("load", function() {
		var re = document.querySelector("#re");
		var rep = document.querySelector("#rep");
		re.onclick = function() {
			if (rep.style.display != "none") {
				rep.style.display = "none";
			} else if (rep.style.display == "none") {
				rep.style.display = "flex";
			}
		}
	});
</script>
<main id="main">
<div class="frame">
	<div class="content">
		<div class="head">
			<div class="profile">
				<div class="pic" style="background-image:url('${root}${memberProfile.imgSrc }${memberProfile.imgName }')"></div>
				<div class="info">
					<span class="item"><a
						href="${root }/accompany/profile?id=${accDetail.memberId }">${accDetail.writerNicName}</a></span>
					<span class="item">${accDetail.country }</span> <span class="item"><fmt:formatDate
							value="${accDetail.startDate}" pattern="yyyy-MM-dd" />~<fmt:formatDate
							value="${accDetail.endDate}" pattern="yyyy-MM-dd" /></span>
				</div>
			</div>
			<div class="bookmark">
				<a href=""><img
					src="/TravelWM/resource/images/accompany-detail/ic_bookmark_black_24dp_1x.png"></a>
			</div>
		</div>
		<div class="detail-title">
			<span>${accDetail.title}</span>
		</div>
		<div class="text">
			<div>
				<c:if test="${file.src != null}">
					<img src="${root}${file.src}${file.name}" style="width: 70%;" />
				</c:if>
			</div>
			<span>${accDetail.context}</span>
		</div>
		<div class="foot">
			<div class="char">
				<div class="item1">
					<c:choose>
						<c:when test="${member.sex eq 0}">남자</c:when>
						<c:when test="${member.sex eq 1}">여자</c:when>
						<c:otherwise>비공개</c:otherwise>
					</c:choose>
				</div>
				<div class="item2">${member.age}세</div>
				<div class="item3">${memberProfile.job}</div>
			</div>

			<!-- ------------ 본인이 작성한 글인지 여부 확인 -------------- -->
			<div>
			<c:choose>
				<c:when test="${member.id ne m.id  }">
					<button class="btn btn-info chat" onclick="window.location.href=''">대화하기</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-info chat" onclick="window.location.href='detail-edit?id=${accDetail.id }&p=${page }&pla=${pla }&sty=${sty }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }'">수정</button>
					<button class="btn btn-info chat delete-board" onclick="deleteBoard();">삭제</button>
				</c:otherwise>
			</c:choose>
				<button class="btn btn-info chat" onclick="window.location.href='board?p=${page }&pla=${pla }&sty=${sty }&sx=${sx }&min_a=${min_a }&max_a=${max_a }&lat=${lat }&lng=${lng }&sD=${sD }&eD=${eD }'">목록으로</button>
			</div>
		</div>
		<div class="reply">
			<div class="left">
				<button id="re" class="btn btn-info">댓글</button>
				<div class="view">
					<span>조회수: ${accDetail.hits}</span>
				</div>
			</div>
			<div class="right">
				<span>등록시간: <fmt:formatDate value="${accDetail.regDate}"
						pattern="yy.MM.dd HH:mm:ss" /></span>
			</div>
		</div>
		<!-- -------------------여기서부터 댓글란-------------------- -->
		<div id="rep" class="rep" style="display: none;">
			<form class="void" method="POST">
				<div class="re-pic"></div>
				<div class="re-text">
					<textarea name="reply"></textarea>
				</div>
				<button class="btn btn-info" type="submit">등록</button>
			</form>
			<div class="re-list">
				<c:forEach var="t" items="${boardReply}">
					<div class="list-void">
						<div class="id-date">
							<div class="re-id">
								<span>${t.nicName}</span>
							</div>
							<div class="re-date">
								<span><fmt:formatDate value="${t.regDate}"
										pattern="yy.MM.dd HH:mm:ss" /></span>
							</div>
						</div>
						<div class="list-content">
							<div class="list-pic"
								style='background: url("${root}${t.imgSrc}${imgName}") no-repeat center; background-size: cover;'></div>
							<div class="list-text">
								<span>${t.reply}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div id="map-wrapper" class="map-container"></div>
</main>
<!-- -----글 삭제 경고를 위한 자바스크립트----- -->
<script>
	var deleteBoard = function(){
		if(confirm("작성하신 글을 삭제하시겠습니까?")){
		document.location.href="detail-delete?id=${accDetail.id }";
		}
	};
</script>

<script>
	function initialize() {

		/* -----------지도 초기 위치 지정하기------------- */
		var lat = parseFloat('${accDetail.latitude }');
		var lng = parseFloat('${accDetail.longitude }');

		var mapPosition = {
			center : {
				lat : lat,
				lng : lng
			},
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map-wrapper"),
				mapPosition);

		/* -----------지도에 마커 추가하기------------- */

		var marker = new google.maps.Marker({
			position : {
				lat : lat,
				lng : lng
			},
			map : map,
			icon : '${root}/resource/images/marker/marker5.png'
		});

		var initContent = "<div style=\"display:flex;\">"
				+ "<div style=\"align-self:center; background-image: url('${root }/resource/images/Cat.jpg'); border-radius:100px; width:40px; height:40px; background-position: center; background-size: 40px 40px; \"></div>"
				+ "<div style=\"display:flex; flex-direction:column; margin-left:10px;\">"
				+ "<div>${accDetail.country }</div>"
				+ "<div>${accDetail.locality }</div>"
				+ "<div>${accDetail.place }</div>" + "</div>" + "</div>";

		/* -----------마커 눌렀을 때 발생하는 이벤트------------- */
		var infowindow = new google.maps.InfoWindow({
			content : initContent,
			maxWidth : 500,
			maxHeight : 300,
			disableAutoPan : true
		});

		infowindow.open(map, marker);

	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>


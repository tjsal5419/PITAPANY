
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root}/resource/css/profile/homeCopy.css" rel="stylesheet" />
<link rel="stylesheet" href="${root}/resource/css/accompany/detail.css"
	type="text/css" />
<script>
	window.addEventListener("load", function(event) {

		var detail = document.querySelector(".detail");
		var change = document.querySelector(".change");
		var profTable = document.querySelector(".prof-table");
		var infoTable = document.querySelector(".info-table");
		var boardContainer = document.querySelector(".board-container");

		infoTable.style.display = "none"; /* 초기값을 줘야 바로 작동함 */
		boardContainer.style.display = "none";

		detail.onclick = function() {
			if (infoTable.style.display === "none") {
				profTable.style.display = "none";
				infoTable.style.display = "block";
				boardContainer.style.display = "none";
				detail.innerHTML = "홈으로";
				change.innerHTML = "동행평가";
			} else {
				profTable.style.display = "block";
				infoTable.style.display = "none";
				boardContainer.style.display = "none";
				detail.innerHTML = "자세히";
				change.innerHTML = "목록전환";
			}
		};

		change.onclick = function() {
			if (boardContainer.style.display === "none") {
				boardContainer.style.display = "flex";
				profTable.style.display = "none";
				infoTable.style.display = "none";
				change.innerHTML = "동행평가";
			} else {
				boardContainer.style.display = "none";
				profTable.style.display = "block";
				infoTable.style.display = "none";
				change.innerHTML = "목록전환";
			}
		};
	});
</script>
<script>
	window.addEventListener("load", function(e) {

		var hearts = document.querySelector(".hearts");
		var emheart = document.querySelector("#emheart");
		var heart = document.querySelector("#heart");

		hearts.onclick = function() {
			if (emheart.style.display !== "none") {
				heart.style.display = "block"
				emheart.style.display = "none"
			} else if (emheart.style.display === "none") {
				heart.style.display = "none"
				emheart.style.display = "block"
			}
		}
	});
</script>

<div class="visual">
	<div class="back-img"
		style='background: url("${root}${memberProfile.backImgSrc}${memberProfile.backImgName}") no-repeat center; background-size: cover;'>
	</div>

	<div class="setting-button">
		<a href="${root}/member/profile-setting"><button type="button"
				class="btn btn-info">프로필 설정</button></a>
	</div>
	<div class="name">${memberProfile.status}</div>
	<div class="prof-img">
		<div class="thumblist">
			<img class="prof-img-circle"
				src="${root}${memberProfile.imgSrc}${memberProfile.imgName}"
				alt="프로필사진">
		</div>
		<div class="center">${member.nicName}</div>
	</div>
	<div class="empty-container"></div>
</div>

<main class="main">
<div>
	<div class="menu">
		<div class="list">
			<div class="change cursor">목록전환</div>
			<div class="write">대화하기</div>
			<div class="write">
				<a href="${root}/profile/reg">글쓰기</a>
			</div>
			<div class="detail cursor">자세히</div>
		</div>
	</div>
</div>

<div class="prof-table">
	<c:forEach var="f" items="${boardAndReplyLists}">
		<div class="content-container">
			<div class="box">
				<div class="info-box">
					<div class="prof-box">
						<div class="prof-thumblist">
							<img class="prof-small-img-circle"
								src="${root}${memberProfile.imgSrc}${memberProfile.imgName}"
								alt="프로필사진">
						</div>
						<div class="list">
							<div class="nic">${member.nicName}</div>
							<div class="location">${f.board.place}</div>
							<div class="write-date">
								<fmt:formatDate value="${f.board.regDate}" pattern="yy.MM.dd" />
							</div>
						</div>
					</div>

					<div class="content">
						<img src="${root}${f.board.src}${f.board.name}" />
						<div>${f.board.content}</div>
					</div>

					<div class="icon-box">
						<div class="icon">
							<div class="heart hearts">
								<img style="display: block;" id="emheart"
									class="heart-icon cursor"
									src="${root}/resource/images/ic_favorite_border_black_24dp_1x.png" />
								<img style="display: none;" id="heart" class="heart-icon cursor"
									src="${root}/resource/images/ic_favorite_black_24dp_1x.png" />
							</div>
						</div>
						<div id="rep" class="rep">
							<form class="void" method="POST">
								<div class="re-text">
									<input style="display: none;" type="text" name="id"
										value="${f.board.id}" />
									<textarea name="reply"></textarea>
								</div>
								<button class="btn btn-info" type="submit">등록</button>
							</form>
							<div class="re-list">
								<c:forEach var="li" items="${f.replyLists}">
									<div class="list-void">
										<div class="id-date">
											<div class="re-id">
												<span>${li.nicName}</span>
											</div>
											<div class="re-date" style="width: 200px;">
												<span><fmt:formatDate value="${li.regDate}"
														pattern="yy.MM.dd HH:mm:ss" /></span>
											</div>
										</div>
										<div class="list-content">
											<div class="list-pic"
												style='background: url("${root}${li.imgSrc}${li.imgName}") no-repeat center; background-size: cover;'></div>
											<div class="list-text">
												<span>${li.reply}</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<div class="page-info-container">
	<div class="page" class="move-page">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<c:forEach var="i" begin="${(listPerFive*5) + 1 }"
					end="${checkLast }">
					<c:choose>
						<c:when test="${i eq param.p or empty param.p and i eq '1'}">
							<li class="waves-effect  active"><a href="?p=${i }">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="waves-effect "><a href="?p=${i }">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</nav>
	</div>
</div>

<div class="info-table">
	<div class="content-container">
		<div class="profile-box">
			<div class="prof-info">
				<div>자기정보</div>
				<a href="${root}/member/profile-setting"><input
					class="revision btn btn-info" type="button" value=" 프로필 수정" /></a>
			</div>
			<div class="self-prof-box">
				<div class="prof-info-box">
					<div class="value-box">
						<div class="age">나이</div>
						<div class="value">${member.age}</div>
					</div>
					<div class="value-box">
						<div class="gender">성별</div>
						<div class="value">
							<c:choose>
								<c:when test="${member.sex eq 0}">남자</c:when>
								<c:when test="${member.sex eq 1}">여자</c:when>
								<c:otherwise>비공개</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="value-box">
						<div class="blood">혈액형</div>
						<div class="value">${memberProfile.bloodType}</div>
					</div>
					<div class="value-box">
						<div class="job">직업</div>
						<div class="value">${memberProfile.job}</div>
					</div>
				</div>
				<div class="self-intro-box">
					<div class="accompany-type">동행유형</div>
					<div class="self-intro">자기소개</div>
				</div>
			</div>
			<div class="sns-button">
				<a href="${memberProfile.facebookUrl}"><div
						class="sns btn btn-info" style="margin-right: 10px;">Facebook</div></a><a
					href="${memberProfile.instagramUrl}"><div
						class="sns btn btn-info">Instagram</div></a>
			</div>
		</div>
	</div>

	<div class="content-container">
		<div class="box">
			<div class="prof-info">
				<div>여행현황</div>
				<!--<input class="btn btn-info" type="button" value="추가 버튼" />-->
			</div>
			<script
				src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAiKSKx2BDNYeVofk9LM0-FuehS9qoXh6Y"></script>
			<script>
				function initialize() {
					var mapProp = {
						center : new google.maps.LatLng(52.50056, 13.39889),
						zoom : 5,
						mapTypeId : google.maps.MapTypeId.ROADMAP
					};
					var map = new google.maps.Map(document
							.getElementById("googleMap"), mapProp);
				}

				google.maps.event.addDomListener(window, 'load', initialize);
			</script>
			<div id="googleMap" style="min-width: 210px; height: 380px;"></div>
			<!-- <div class="summary">
				<input class="summary-button btn btn-info" type="button"
					value="현황 요약 " />
			</div> -->
		</div>
	</div>
</div>
<!-- ------------인스타페이지------------ -->
<div class="board-container">
	<div class="board-wrapper">
		<c:forEach var="f" items="${boardAndReplyLists}">
			<div class="board-card">
				<div class="board-content"
					style='background: url("${root}${f.board.src}${f.board.name}") no-repeat center; background-size: cover;'></div>
			</div>
		</c:forEach>
	</div>
</div>

</main>
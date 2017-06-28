<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/tip.css" rel="stylesheet"/>

<link rel="stylesheet"
	href="/TravelWM/resource/css/community/tip-detail.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

<main class="main">
<%@ include file="inc/aside.jsp" %>
<div class="frame">
	<div class="content">
		<div class="head">
			<div class="profile">
				<div class="pic"></div>
				<div class="info">
					<span class="item">${tipView.nicName }</span><span class="item">${tipView.category }</span>
				</div>
			</div>
			<div class="bookmark">
				<a href=""><img
					src="/TravelWM/resource/images/accompany-detail/ic_bookmark_black_24dp_1x.png"></a>
			</div>
		</div>
		<div class="detail-title">
			<span>${tipView.title }</span>
		</div>
		<div class="text">
			<span>${tipView.content }</span>
		</div>
		<div class="foot"></div>
		<div class="reply">
			<div class="left">
				<!-- <button id="re" class="btn btn-info">댓글</button> -->
				<div class="view">
					<span>조회수: ${tipView.hits }</span>
				</div>
			</div>
			<div class="right">
				<span>등록시간: ${tipView.regDate }</span>
			</div>
		</div>
		<div id="rep" class="rep">
			<form class="void" method="POST">
				<div class="re-pic"></div>
				<div class="re-text">
					<textarea name="reply"></textarea>
				</div>
				<button class="btn btn-info" type="submit">등록</button>
			</form>
			<div class="re-list">
				<c:forEach var="t" items="${reply}">
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
		
		<div class="delete-tip">
			<c:if test="${tipView.memberId eq m.id }">
				<div class="delete"><a href="${root }/community/tip-delete?id=${tipView.id }">삭제하기</a></div>
				<div class="update"><a href="${root }/community/tip-update?id=${tipView.id }">수정</a></div>
			</c:if>
				<div class="prev-button"><a href="${root }/community/tip?id=${tipView.id }">목록으로</a></div>
		</div>			
	</div>
</div>
</main>
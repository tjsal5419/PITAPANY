<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/tip.css" rel="stylesheet" />
<link rel="stylesheet" href="/TravelWM/resource/css/member/bookmark.css"
	type="text/css" />

<main id="main">

<%@ include file="inc/aside.jsp" %>

<div class="frame">
	<div class="fmain">
		<div class="content">
			<div class="head">
				<div>
					<span>북마크 글</span>
				</div>
			</div>
			<div class="blist">
				<table class="table">
					<thead>
						<tr>
							<td class="num" colspan="1">번호</td>
							<td colspan="3">제목</td>
							<td colspan="2">작성자</td>
							<td class="date" colspan="2">작성일</td>
							<td class="hit" colspan="1">조회수</td>
						</tr>

					</thead>
					<tbody>
						<!-- 				db서 데이터 가져와서 뿌려주는 역할 -->
						<c:forEach var="a" begin="1" end="20">
							<tr>
								<td class="num" colspan="1">${a }</td>
								<td colspan="3"><a href="">어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구</a></td>
								<td colspan="1">작성자</td>
								<td class="date" colspan="1">작성일</td>
								<td class="hit" colspan="1">조회수</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="head">
				<div>
					<span>내가 쓴 글</span>
				</div>
			</div>
			<div class="blist">
				<table class="table">
					<thead>
						<tr>
							<td class="num" colspan="1">번호</td>
							<td colspan="3">제목</td>
							<td colspan="2">작성자</td>
							<td class="date" colspan="2">작성일</td>
							<td class="hit" colspan="1">조회수</td>
						</tr>

					</thead>
					<tbody>
						<!-- 				db서 데이터 가져와서 뿌려주는 역할 -->
						<c:forEach var="a" begin="1" end="20">
							<tr>
								<td class="num" colspan="1">${a }</td>
								<td colspan="3"><a href="">어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구</a></td>
								<td colspan="2">작성자</td>
								<td class="date" colspan="2">작성일</td>
								<td class="hit" colspan="1">조회수</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</main>
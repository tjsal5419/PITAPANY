<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/tip.css" rel="stylesheet"/>

<main class="main">
	<div class="aside">
		<div>라운지</div>
		<div>게시판</div>
		<div>FAQ</div>
	
	</div>
	<div class="tip-container">
		<div>카테고리</div>
		<div>
			<div>검색 범위</div>
			<div>검색 내용</div>
			<div>검색</div>
		</div>
		<table>
			<thead>
				<tr>
					<td>번호</td>
					<td>카테고리</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				
			</thead>
			<tbody>
<!-- 				db서 데이터 가져와서 뿌려주는 역할 -->
				<c:forEach var="a" begin="1" end="10">
					<tr>
						<td>${a }</td>
						<td>카테고리</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>	
				</c:forEach>				
			</tbody>
		</table>

		<div>
			페이지 수 			
		</div>
		
		<div>
			글쓰기
		</div>
	</div>	
</main>

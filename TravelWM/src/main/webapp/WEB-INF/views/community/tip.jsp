<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/tip.css" rel="stylesheet"/>

<main class="main">
		<%@ include file="inc/aside.jsp" %>
		<div class="tip-container">
			<div class="category">
				<div class="title"><h2>여행 Tip 게시판 </h2></div>
				<div class="search">
					<div>
						<select class="select">
							<option>검색</option>
							<option>하하</option>
							<option>하하</option>
							<option>하하</option>
							<option>하하</option>
							<option>하하</option>
							
						</select>
					</div>
					<div>
		    			<input type="text" class="form-control" placeholder="Search">
				  	</div>
				  	<div>
				  		<input class="search-button" type="image" src="${root }/resource/images/ic_search_black_24dp_1x.png" alt="Submit">
			  		</div>
			  	</div>
			  	<div class="line"></div>
			  	<div class="filter">
						<select class="select">
							<option>카테고리선택</option>
							<option>하하</option>
							<option>하하</option>
							<option>하하</option>
							<option>하하</option>
							<option>하하</option>		
						</select>
				</div>
			  		
			</div>
			<table class="table">
				<thead>
					<tr>
						<td class="num" colspan="1">번호</td>
						<td class="category" colspan="2">카테고리</td>
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
							<td colspan="2" class="category">카테고리</td>
							<td colspan="3">어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구
								
							</td>
							<td colspan="2">작성자</td>
							<td class="date" colspan="2">작성일</td>
							<td class="hit" colspan="1">조회수</td>
						</tr>	
					</c:forEach>				
				</tbody>
			</table>
			
			<div class="foot">
			<!-- ----------페이지 수 표시하는 부분----------- -->
				<div class="page">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					    <li>
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li>
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>	
				</div>
				
				<div class="write">
					<a href="">글쓰기</a>
				</div>
			</div>
		</div>
		<div class="fake">
		
		</div>
			
</main>

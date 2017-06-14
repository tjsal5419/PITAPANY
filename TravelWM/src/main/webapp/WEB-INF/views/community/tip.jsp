<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/tip.css" rel="stylesheet"/>

<script>

function changeFunc(){
    var tipCategoryId = document.querySelector("#select-box");
    
    var category = tipCategoryId.options[tipCategoryId.selectedIndex].value;
    
    
    if(category!=="default"){
    	window.location.href = 'tip?c='+category;
    }
}
</script>

<main class="main">
		<%@ include file="inc/aside.jsp" %>
		<div class="tip-container">
			<div class="category">
				<div class="title"><h2>여행 Tip 게시판 </h2></div>
				<div class="search">
					<div>
						<select class="select" name="search-option">
							<option value="title">제목</option>
							<option value="nicName">작성자</option>
				
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
						<select id="select-box" class="select-box" onclick="changeFunc()" name="tipCategoryId">
							<option value="default" selected>카테고리 선택</option>
							<c:forEach items="${categoryList}" var="li">
								<option value="${li.id }">${li.category }</option>								
							</c:forEach>
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
					<c:forEach var="t" items="${tipList }">
						<tr>
							<td class="num" colspan="1">${t.id}</td>
							<td colspan="2" class="category">${t.category }</td>
							<td colspan="3"><a href="${root }/community/tip-detail?id=${t.id}">${t.title }</a></td>
							<td colspan="2">${t.nicName}</td>
							<td class="date" colspan="2">${t.regDate}</td>
							<td class="hit" colspan="1">${t.hits }</td>
						</tr>	
					</c:forEach>				
				</tbody>
			</table>
			
			<div class="foot">
			<!-- ----------페이지 수 표시하는 부분----------- -->
				<div class="page">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					  	 
						<c:if test="${page!=1 }">
						    <li>
						      <a href="${root}/community/tip?p=${page-1 }&c=${category}" aria-label="Previous">
							     <span aria-hidden="true">&laquo;</span>
							  </a>
							</li>
						</c:if>
					    
					    <c:forEach begin="${prev }" end="${next }" var="p" >
					    	<li><a href="${root 	}/community/tip?p=${p }&c=${category}">${p }</a></li>
					    </c:forEach>
					    
					    <c:if test="${page != pageCount}">
						    <li>
						      <a href="${root}/community/tip?p=${page+1 }&c=${category}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					    
					  </ul>
					</nav>	
				</div>
				
				<div class="write">
					<a href="${root }/community/tip-reg">글쓰기</a>
				</div>
			</div>
		</div>
		<div class="fake">
		
		</div>
			
</main>

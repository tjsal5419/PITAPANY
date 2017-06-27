<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link href="${root }/resource/css/community/tip.css" rel="stylesheet"/>

<script>
function changeFunc(){
    var tipCategoryId = document.querySelector("#select-box");   
    var category = tipCategoryId.options[tipCategoryId.selectedIndex].value;
    
    
    if(category!=="default")
 		   	window.location.href = 'tip?c='+category+'&f=${field}&q=${query}';
 	else
		window.location.href = 'tip';
	
}

window.addEventListener("load",function(){
	var searchBtn = document.querySelector("#search-button");

	searchBtn.onclick = function(){
    
		var field = document.querySelector(".search-option");
		var query = document.querySelector("#query").value;
		var selectedField = field.options[field.selectedIndex].value;

			window.location.href='tip?f='+selectedField+'&q='+query;

	};
	
});

</script>

<main class="main">
		<%@ include file="inc/aside.jsp" %>
		<div class="tip-container">
	
			<div class="search-result">검색 결과 : ${count }건</div>
	
			<div class="category-search">
			  	
			  	
			  	<div class="filter">
						<select id="select-box" class="select-box" onchange="changeFunc()" name="tipCategoryId">
							<option value="default" selected>전체 카테고리</option>
							<c:forEach items="${categoryList}" var="li">
								<c:choose>	
									<c:when test="${li.id eq category}">
										<option value="${li.id }" selected>${li.category }</option>
									</c:when>
									<c:otherwise>
										<option value="${li.id }">${li.category }</option>	
									</c:otherwise>
								</c:choose>							
							</c:forEach>
							
						</select>
						
				</div>
					
					
				<div class="search-form">
					<div>
						<select class="select search-option" name="search-option">
							<option value="title">제목</option>
							<option value="nicName">작성자</option>
				
						</select>
					</div>
					<div>
		    			<input type="text" id="query" class="form-control form-control-header tip-search"  placeholder="전체 카테고리 검색">
				  	</div>
				  	<div>
				  		<input class="search-button" id="tip-search-button" alt="Submit">
			  		</div>
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
							<td class="article-title" colspan="3"><a href="${root }/community/tip-detail?id=${t.id}">${t.title }</a></td>
							<td colspan="2">${t.nicName}</td>
							<td class="date" colspan="2">
								<fmt:formatDate value="${t.regDate}" pattern="yyyy-MM-dd" />
							</td>
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
					  	 
						<c:if test="${page!=1 && page!=0}">
						    <li>
						      <a id="move-page-button-number" href="${root}/community/tip?p=${page-1 }&c=${category}" aria-label="Previous">
							     <span aria-hidden="true">&laquo;</span>
							  </a>
							</li>
						</c:if>
					    
					    <c:forEach begin="${prev }" end="${next }" var="p" >
					    	
					    	<c:choose>
					    	<c:when test="${p== page }">
						    	<li class="active">
						    	<a id="move-page-button" href="${root }/community/tip?p=${p }&c=${category}">${p }</a>
						    	</li>
					    	</c:when>
					    	
					    	<c:otherwise>
						    	<li>
						    	<a id="move-page-button-number" href="${root }/community/tip?p=${p }&c=${category}">${p }</a>
						    	</li>
					    	</c:otherwise>
					    	
					    	</c:choose>
					    </c:forEach>
					    
					    <c:if test="${page != pageCount && count!=0}">
						    <li>
						      <a  id="move-page-button-number" href="${root}/community/tip?p=${page+1 }&c=${category}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					    
					    <c:if test="${count==0 }">
					    	<div>'${query }' 로 검색된 결과가 없습니다.</div>
					    </c:if>
					    
					  </ul>
					</nav>	
				</div>
				
				<div class="write" id="write-btn">
					<a href="${root }/community/tip-reg">글쓰기</a>
				</div>
			</div>
		</div>
		<div class="fake">
		
		</div>
			
</main>

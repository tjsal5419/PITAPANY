<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="/TravelWM/resource/css/member/bookmark.css"
	type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script>

	var memberListModule = angular.module("member-list", []);
	
	memberListModule.controller("member-list-controller", function($scope, $http){
		
	//	var memberList = [
	//		{"id":"woogisky", "name":"몽우기", "checked":true},
	//		{"id":"dragon", "name":"손오공", "checked":false}
	//	];
		
		$http({
			method: "GET",
			url:"/MavenPrj/admin/get-member-list"
		}).then(function(response){
	//		alert(typeof response);
			$scope.list = response.data;
		});
		
	//	var memberList = []; 오류 안나게 일시적으로 해준 것
		
		$scope.allCheck = false;
		$scope.list = memberList;
		$scope.delButtonClick = function(){
			
			var size = $scope.list.length;
			for(var i=0; i<size; i++)
				if($scope.list[size-1-i].checked)
					$scope.list.splice(size-1-i, 1);
			
	//		if(memberList[0].checked)
	//			memberList.splice(0,1);
		};
		
		$scope.selAllCkbClick = function(){
				for(var i=0; i<$scope.list.length; i++)
					$scope.list[i].checked = $scope.allCheck;
		}
		
		$scope.searchButtonClick = function(){
			
			$http({
				method: "GET",
				url:"/MavenPrj/admin/get-member-list?id="+$scope.queryText
			}).then(function(response){
				$scope.list = response.data;
			});
		}
		
	});

</script>

<main class="main">

	<%@ include file="inc/aside.jsp" %>

	<div class="profile-container">
	
	
		<div class="scrapArticle-info-container">
		
		
			<div class="scrapArticle-info-title info-title">
				<span>스크랩 글</span>
			</div>
	
			<div class="scrapArticle-info-content info-content">
	
				<table class="table">
					<thead>
						<tr>
							<td class="check" colspan="1">선택</td>
							<td colspan="2">제목</td>
							<td class="category" colspan="1">카테고리</td>
							<td colspan="1">작성자</td>
							<td class="date" colspan="1">작성일</td>
						</tr>
						
					</thead>
					<tbody>
						<!-- db서 데이터 가져와서 뿌려주는 역할 -->
						<c:forEach var="t" items="${tipList }">
							<tr ng-repeat="">
								<td class="check" colspan="1"><input type="checkbox" ng-model="" /></td>
								<td class="article-title" colspan="2"><a href="${root }/community/tip-detail?id=${t.id}">${t.title }</a></td>
								<td colspan="1" class="category">${t.category }</td>
								<td colspan="1">${t.nicName}</td>
								<td class="date" colspan="1">
									<fmt:formatDate value="${t.regDate}" pattern="yyyy-MM-dd" />
								</td>
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
						<a href="">선택삭제</a>
					</div>
				</div>


			</div>
	
	
			<div class="myArticle-info-container">
				<div class="myArticle-info-title info-title">
					<span>내가 쓴 글</span>
				</div>
				
				<div class="myArticle-info-content info-content">
				
				
						<table class="table">
							<thead>
								<tr>
									<td class="check" colspan="1">선택</td>
									<td colspan="2">제목</td>
									<td class="category" colspan="1">카테고리</td>
									<td class="date" colspan="1">작성일</td>
									<td class="hit" colspan="1">조회수</td>
								</tr>
								
							</thead>
							<tbody>
								<!-- db서 데이터 가져와서 뿌려주는 역할 -->
								<c:forEach var="t" items="${tipList }">
									<tr ng-repeat="m in list">
										<td class="check" colspan="1">${t.id}</td>
										<td class="article-title" colspan="2"><a href="">${t.title }</a></td>
										<td colspan="1" class="category">${t.category }</td>
										<td class="date" colspan="1">
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
								<a href="">선택삭제</a>
							</div>
						</div>		
				
				</div>
				
			</div>
	
	
		</div>
	
		<div class="fake"></div>
	
	</div>

</main>




<!-- 나중에 참고하시오 -->
<!-- <div>
                <h3>목록<input type="button" value="일괄삭제" ng-click="delButtonClick()"></h3>
                <table>
                    <thead>
                        <tr>
                            <th class=""><input type="checkbox" ng-model="allCheck" ng-click="selAllCkbClick()">선택</th>
                            <th class="">이름(아이디)</th>
                            <th class="">멤버등급</th>
                            <th class="">가입일</th>
                            <th class="mobile tablet desktop">연락처</th>
                            <th class="mobile">성별</th>
                            <th class="mobile">상태</th>
                            <th class="mobile">최종방문일</th>
                        </tr>
                    </thead>
                    <tbody>   
                   {{a}} -> 1 way binding : text
                    	ng-bind="a" -> 1 way binding : tag attr
                    	ng-model="a" -> 2 way binding : input
                        <tr ng-repeat="m in list">
                            <td><input type="checkbox" ng-model="m.checked" /></td>
                            <td>{{m.name}}(<a href="" ng-bind="m.id"></a>)</td>
                            <td>학생</td>
                            <td>2016-12-11</td>
                            <td class="mobile">010-1211-2234</td>
                            <td class="mobile">남성</td>
                            <td class="mobile">활성</td>
                            <td class="mobile">2016-10-10 12:34:010</td>
                        </tr>
                    </tbody>
                </table>                
            </div>             -->
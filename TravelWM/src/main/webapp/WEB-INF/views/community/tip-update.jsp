<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/tip.css" rel="stylesheet"/>

<link rel="stylesheet" href="/TravelWM/resource/css/community/tip-reg.css"
	type="text/css" />
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<main class="main">
<%@ include file="inc/aside.jsp" %>
<form class="frame" method="post">
	<div class="content">
		<div class="title">
			<h2>팁 수정 페이지</h2>
		</div>			
		<div class="head">
			<div class="title-logo">
				<span>Title</span>
			</div>
			<div class="title-content">
				<input class="ti form-control" name="title" type="text" placeholder="" value=${tipView.title }/>
			</div>
		</div>
		<div class="category">
			<select name="tipCategoryId">
			
			<!-- --------기존에 선택한 카테고리부터 보이게 하기-------- -->
				<c:forEach var="l" items="${categoryList }">
					<c:choose>
						<c:when test="${tipView.tipCategoryId eq l.id }"> 
							<option value="${l.id}" selected>${l.category } </option>
						</c:when>
						<c:otherwise> 
							<option value="${l.id}">${l.category } </option> 
						</c:otherwise>
					</c:choose>	
				</c:forEach>
			</select>
		
		</div>
		<div class="text">
			<textarea name="content" class="form-control" placeholder="" >${tipView.content }</textarea>
		</div>
		
		<div class="foot">
			<div class="bottun">
				<div class="cancel">
					<button type="reset" onclick="location.href='${root}/community/tip?${tipView.id }'" class="btn btn-info chat">글 취소</button>
				</div>
				<div class="reg">
					<button class="btn btn-info chat"  type ="submit">수정완료</button>
				</div>
			</div>
		</div>
		</div>
</form>

</main>
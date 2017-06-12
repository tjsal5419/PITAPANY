<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/inc/aside.css" rel="stylesheet"/>
		<div class="aside-hidden">
			<div><a href="">라운지</a></div>
			<div><a href="">여행 Tip</a></div>
			<div><a href="">FAQ</a></div>
		</div>
		<div class="aside">
			<div class="remote-controller">
				<div class="title"><h3>커뮤니티</h3></div>
				<div><a href="${root }/community/rounge">라운지</a></div>
				<div><a href="${root }/community/tip">여행 Tip</a></div>
				<div><a href="${root }/community/faq">FAQ</a></div>
				<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'], '/tip')}">
   					 팁페이지입니당.
				</c:if>
			</div>
		
		</div>
			
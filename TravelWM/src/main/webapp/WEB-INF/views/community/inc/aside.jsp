<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
				<%-- <c:if test="${fn:contains(pageContext.request.requestURI, '/tip')}">
   					 jjj
				</c:if> --%>
			
			</div>
		
		</div>
		
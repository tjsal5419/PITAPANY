<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/community/inc/aside.css" rel="stylesheet"/>
		<div class="aside-hidden">
			<div><a href="${root }/community/rounge">라운지</a></div>
			<div><a href="${root }/community/tip">여행 Tip</a></div>
			<div><a href="${root }/community/faq">FAQ</a></div>
		</div>
		<div class="aside">
			<div class="remote-controller">
				<div class="title"><h3>커뮤니티</h3></div>
				<ul>
					<li><a href="${root }/community/rounge">라운지</a><span>></span></li>
					<li><a href="${root }/community/tip">여행 Tip</a><span>></span></li>
					<li><a href="${root }/community/faq">FAQ</a><span>></span></li>
				</ul>
				
				<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'], '/tip')}">
   					<style>
						.remote-controller li:nth-child(2){
							font-weight: 100;
							font-family: "Spoqa";
							color: #33b5e5;
							
							border-top: 1px solid #e9e9e9;
							border-bottom: 1px solid #e9e9e9;
						}
						
						.remote-controller li:nth-child(2)>a{
							color: #33b5e5;
						}
						
						.remote-controller li:nth-child(2)>a:hover{
							color: #33b5e5;
						}
						
						.remote-controller li:nth-child(2)>span{
							display: table-cell;
							vertical-align: middle;
						}
						
						.aside-hidden div:nth-child(2){
							color: #fff;
							background: #87deff;
						}
						
						.aside-hidden div:nth-child(2)>a:hover{
							color: #fff;
						}
						
					</style>
				</c:if>
				
				<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'], '/faq')}">
   					<style>
						.remote-controller li:nth-child(3){
							font-weight: 100;
							font-family: "Spoqa";
							color: #33b5e5;
							
							border-top: 1px solid #e9e9e9;
							border-bottom: 1px solid #e9e9e9;
						}
						
						.remote-controller li:nth-child(3)>a{
							color: #33b5e5;
						}
						
						.remote-controller li:nth-child(3)>a:hover{
							color: #33b5e5;
						}
						
						.remote-controller li:nth-child(3)>span{
							display: table-cell;
							vertical-align: middle;

						}
						
						.aside-hidden div:nth-child(3){
							color: #fff;
							background: #87deff;
						}
						
						.aside-hidden div:nth-child(3)>a:hover{
							color: #fff;
						}
					</style>
				</c:if>
			</div>
		
		</div>
			
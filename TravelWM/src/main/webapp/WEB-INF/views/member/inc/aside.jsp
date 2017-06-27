<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="${root }/resource/css/member/inc/aside.css" rel="stylesheet"/>
		<div class="aside-hidden">
			<div><a href="${root }/member/profile-setting">프로필 관리</a></div>
			<div><a href="${root }/member/acc-setting">나의 동행 관리</a></div>
			<div><a href="${root }/member/bookmark">북마크 관리</a></div>
		</div>
		<div class="aside">
			<div class="remote-controller">
				<div class="title"><h3>계정설정</h3></div>
				<ul>
					<li><a href="${root }/member/profile-setting">프로필 관리</a><span>></span></li>
					<li><a href="${root }/member/acc-setting">나의 동행 관리</a><span>></span></li>
					<li><a href="${root }/member/bookmark">북마크 관리</a><span>></span></li>
				</ul>
				
				<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'], '/profile-setting')}">
   					<style>
						.remote-controller li:nth-child(1){
							color: #33b5e5;
							font-weight: bold;
						
							border-top: 1px solid #e9e9e9;
							border-bottom: 1px solid #e9e9e9;
						}
						
						.remote-controller li:nth-child(1)>span{
							display: table-cell;
							vertical-align: middle;
							font-weight: 100;
						}
						
						.aside-hidden div:nth-child(1){
							color: #fff;
							background: #87deff;
						}
						
						.aside-hidden div:nth-child(1)>a:hover{
							color: #fff;
						}
						
					</style>
				</c:if>
				
				<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'], '/acc-setting')}">
   					<style>
						.remote-controller li:nth-child(2){
							color: #33b5e5;
							font-weight: bold;
						
							border-top: 1px solid #e9e9e9;
							border-bottom: 1px solid #e9e9e9;
						}
						
						.remote-controller li:nth-child(2)>span{
							display: table-cell;
							vertical-align: middle;
							font-weight: 100;
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
				
				<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'], '/bookmark')}">
   					<style>
						.remote-controller li:nth-child(3){
							color: #33b5e5;
							font-weight: bold;
						
							border-top: 1px solid #e9e9e9;
							border-bottom: 1px solid #e9e9e9;
						}
						
						.remote-controller li:nth-child(3)>span{
							display: table-cell;
							vertical-align: middle;
							font-weight: 100;
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
			
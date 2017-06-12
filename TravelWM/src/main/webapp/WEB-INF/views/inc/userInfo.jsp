<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!-- ---------------- 개인정보 taglib로 설정 ------------- -->
<c:set var="userId" value="${sessionScope.user.id }"/>
<c:set var="userEmail" value="${sessionScope.user.email }"/>
<c:set var="userName" value="${sessionScope.user.name }"/>
<c:set var="userNicName" value="${sessionScope.user.nicName }"/>


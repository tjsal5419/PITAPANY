<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!-- ---------------- 개인정보 taglib로 설정 ------------- -->
<!DOCTYPE html>

<c:choose>

	<c:when test="${not empty sessionScope.userId }">
		<c:remove var="userId" scope="session"/>
		<c:remove var="userEmail"scope="session" />
		<c:remove var="userName"  scope="session"/>
		<c:remove var="userNicName" scope="session"/>
	
	
	<script>
		alert("로그인이 만료되었습니다. 다시 로그인해주세요.");
		window.location.href= '${root }/j_spring_security_logout';
			
			
	</script>
	</c:when>
	
	<c:otherwise>
		<script>
		window.location.href= '${root }/joinus/login';
		</script>
	</c:otherwise>

</c:choose>
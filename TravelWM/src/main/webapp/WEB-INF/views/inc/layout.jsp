<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동행이음 - 설레는 인연을 만나보세요</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="${root }/resource/css/bootstrap.css"  media="screen,projection"/>

<link rel="stylesheet" href="${root }/resource/css/reset.css"/>
<link rel="stylesheet" href="${root }/resource/css/style.css"/>
          
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${root }/resource/js/bootstrap.js"></script>

</head>

<body>
	<tiles:insertAttribute name="header"/>
	<%-- <tiles:insertAttribute name="aside"/> --%>
	<tiles:insertAttribute name="main" />
	<tiles:insertAttribute name="footer"/>
</body>
</html>
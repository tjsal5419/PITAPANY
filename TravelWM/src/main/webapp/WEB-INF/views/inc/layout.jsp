<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travel with me</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${root}/resource/css/style.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body class="homepage">
	<div id="page-wrapper">
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="main" />
		<tiles:insertAttribute name="footer"/>
	</div>
	
	<script src="${root}/resource/js/jquery.min.js"></script>
	<script src="${root}/resource/js/jquery.dropotron.min.js"></script>
	<script src="${root}/resource/js/skel.min.js"></script>
	<script src="${root}/resource/js/skel-viewport.min.js"></script>
	<script src="${root}/resource/js/util.js"></script>
	<script src="${root}/resource/js/layout.js"></script>
</body>
</html>
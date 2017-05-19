<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${root}/resource/css/inc/header.css" />
<script>
</script>

  <nav>
    <div class="navbar navbar-default navbar-fixed-top">
    	<div class="logo"> 로고zz </div>
    	<form class="search-bar" action="" method="get" class="form-group">
          <input type="text" class="form-control" placeholder="Search">
    	  <input type="text" class="form-control" placeholder="Search">
		  <input type="image" src="${root }/resource/images/ic_search_black_24dp_1x.png" alt="Submit">
	    </form>
        <div class="menu-bar">
	        <ul class="accompany">
	        	<li><a href="">동행찾기</a></li>
	        	<li><a href="">동행매칭</a></li>
	        	<li><a href="">커뮤니티</a></li>
	        </ul>
	        <ul class="mypage">
	        	<li><a href=""><img src="${root }/resource/images/ic_question_answer_black_24dp_1x.png"/></a></li>
	        	<li><a href=""><img src="${root }/resource/images/ic_announcement_black_24dp_1x.png"/></a></li>
	        	<li><a href=""><img src="${root }/resource/images/ic_account_circle_black_24dp_1x.png"/></a></li>
	        </ul>
        </div>
    </div>
  </nav>
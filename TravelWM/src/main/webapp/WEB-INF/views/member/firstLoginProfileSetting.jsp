<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="/TravelWM/resource/css/member/profile-setting.css"
	type="text/css" />



<main class="main">
	<div class="profile-container">
	
	<form method="post">
		<div class="profile-info-container">
			<div class="profile-info-title info-title">
			<span>프로필 정보</span>
			</div>
			
			<div class="profile-info-content info-content">
				
				<div class="profile-pic profile-item">
				</div>
				
				<div class="profile-nickname profile-item">
					<label class="profile-item-name" for="">닉네임</label>
					<div>
						<input type="text" value="${member.nicName }" readonly>
					</div>
				</div>
				
				<div class="profile-status profile-item">
					<label class="profile-item-name" for="">프로필 상태명</label>
					<div>
						<input type="text" name="status"/>
					</div>
				</div>
				
				<div class="profile-bloodtype profile-item">
					<label class="profile-item-name" for="">혈액형</label>
					<div class="select_style select_style_bloodtype">
						<select id="bloodtype" name="bloodtype">
							<option value="A" selected>A</option>
							<option value="B">B</option>
							<option value="O">O</option>
							<option value="AB">AB</option>
						</select>
						<div class="select_arrow"></div>
					</div>
				</div>
				
				<div class="profile-job profile-item" >
					<label class="profile-item-name" for="">직업</label>
					<div>
						<input type="text" id="" name="job"/>
					</div>
				</div>
				
				<div class="profile-style profile-item">
					<label class="profile-item-name" for="">동행 스타일</label>
					<div class="select_style select_style_style">
						<select id="style" name="styleId" required>
							<option value="0" selected>선택</option>
							<c:forEach var="li" items="${styles }">
								<option value="${li.id }">${li.type }</option>
							</c:forEach>
							
						</select>
						<div class="select_arrow"></div>
					</div>
				</div>
				
				<div class="profile-intro profile-item">
					<label class="profile-item-name" for="">자기소개</label>
					<div>
						<textArea rows="10" cols="5" name="introduce" required> </textArea>
					</div>
				</div>
				
				<div class="profile-reg profile-item">
					<input type="submit" class="btn-add" id="btn-add" value="등록"/>
				</div>
			</div>
			
	</div>
	</form>
   </div>
</main>
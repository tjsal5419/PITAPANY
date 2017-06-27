<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="/TravelWM/resource/css/member/profile-setting.css"
	type="text/css" />


<!-- --addButton--------------------------------------------- -->
<script type="text/javascript">
function add() {
	var div = document.querySelector(".profile-sns");
	var clone = div.cloneNode(true);
	var cloneLabel = clone.querySelector(".profile-item-name");
	
	clone.removeChild(cloneLabel);
	

	var editSNS = document.querySelector("#clone");
	clone.style.width = "80%";
	clone.style.float = "right";
	editSNS.appendChild(clone);
}
</script>

<script>
	$("#year").on("mouseover", function () {
		$(".select_style_year").css({"border-color": "#33b5e5"})
	});
	$("#year").on("mouseleave", function () {
		$(".select_style_year").css({"border-color": "#dcdcdc"})
	});
	
	$("#month").on("mouseover", function () {
		$(".select_style_month").css({"border-color": "#33b5e5"})
	});
	$("#month").on("mouseleave", function () {
		$(".select_style_month").css({"border-color": "#dcdcdc"})
	});
	
	$("#day").on("mouseover", function () {
		$(".select_style_day").css({"border-color": "#33b5e5"})
	});
	$("#day").on("mouseleave", function () {
		$(".select_style_day").css({"border-color": "#dcdcdc"})
	});
</script>

<script>
	window.addEventListener("load",function(){
/* ------------------------생년월일 날짜 추가 자바스크립트----------------------------------- */
		var year = document.querySelector("#year, #year-span");
		var month = document.querySelector("#month");
		var day = document.querySelector("#day");
		var yearStr = "<option value=0 selected>년도</option>";
		var monthStr = "<option value=0 selected>월</option>";
		var dayStr = "<option value=0 selected>일</option>";
		
		for(var i=1960;i<=2017;i++){
			yearStr += "<option value="+i+">"+i+"</option>";
		}
		
		for(var j=1;j<=12;j++){
			monthStr += "<option value="+j+">"+j+"</option>";
		}
		
		for(var k=1;k<=31;k++){
			dayStr += "<option value="+k+">"+k+"</option>";
		}
		
		year.innerHTML = yearStr;
		month.innerHTML = monthStr;
		day.innerHTML = dayStr;
	});	
</script>

<main class="main">
	<%@ include file="inc/aside.jsp" %>
	<div class="profile-container">
	
		
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
						<input type="text" id="" name="" value="">
					</div>
				</div>
				
				<div class="profile-status profile-item">
					<label class="profile-item-name" for="">프로필명</label>
					<div>
						<input type="text" id="" name="" value="">
					</div>
				</div>
				
				<div class="profile-bloodtype profile-item">
					<label class="profile-item-name" for="">혈액형</label>
					<div class="select_style select_style_bloodtype">
						<select id="bloodtype" name="bloodtype">
							<option value="0" selected>선택</option>
							<option value="a">A</option>
							<option value="b">B</option>
							<option value="o">O</option>
							<option value="ab">AB</option>
						</select>
						<div class="select_arrow"></div>
					</div>
				</div>
				
				<div class="profile-job profile-item" >
					<label class="profile-item-name" for="">직업</label>
					<div>
						<input type="text" id="" name="" value="">
					</div>
				</div>
				
				<div class="profile-style profile-item">
					<label class="profile-item-name" for="">동행 스타일</label>
					<div class="select_style select_style_style">
						<select id="style" name="style">
							<option value="0" selected>선택</option>
							<option value="">러브어페어</option>
							<option value="">급만남</option>
						</select>
						<div class="select_arrow"></div>
					</div>
				</div>
				
				<div class="profile-intro profile-item">
					<label class="profile-item-name" for="">자기소개</label>
					<div>
						<textarea rows="10" cols="5"></textarea>
					</div>
				</div>
				
			</div>
			
			
			<div class="account-info-container">
				<div class="account-info-title info-title">
				<span>계정 정보</span>
				</div>
				<div class="account-info-content info-content">
					<div class="profile-email profile-item">
						<label class="profile-item-name" for="">아이디</label>
						<div>
							<input type="text" id="" name="" value="woogisky">
						</div>
					</div>
					
					<div class="profile-birthday profile-item">
						<label class="profile-item-name" for="">생년월일</label>
						<div class="profile-birthday-wrapper">
							<div class="select_style select_style_year">
								<select id="year" name="year" ></select>
								<div class="select_arrow"></div>
							</div>
							
							<div class="select_style select_style_month">
								<select id="month" name="month"></select>
								<div class="select_arrow"></div>
							</div>
							
							<div class="select_style select_style_day">
								<select id="day" name="day"></select>
								<div class="select_arrow"></div>
							</div>
						</div>
					</div>
					
					<div class="profile-job profile-item" >
						<label class="profile-item-name" for="">휴대폰 번호</label>
						<div>
							<input type="text" id="" name="" value="">
						</div>
					</div>
					
					<div id="profile-sns">
						<div class="profile-sns profile-item">
							<label class="profile-item-name" for="">SNS</label>
							<div id="sns-input">
								<input type="text" id="" name="" value="">
							</div>
						</div>
					</div>
					
					<div id="clone">		
					</div>
					
				
					<div class="profile-add profile-item">
						<button type="button" class="btn-del" id="btn-del" onclick="del()">삭제</button>
			<button type="button" class="btn-add" id="btn-add" onclick="add()">추가</button>
					</div>
				</div>
			</div>
			
			
			<div class="password-info-container">
				<div class="password-info-title info-title">
				<span>비밀번호 변경</span>
				</div>
				<div class="password-info-content info-content">
					<div class="profile-current-password profile-item">
						<label class="profile-item-name" for="">현재 비밀번호</label>
						<div>
							<input type="password" id="" name="" value="">
						</div>
					</div>
					
					<div class="profile-new-password profile-item">
						<label class="profile-item-name" for="">새 비밀번호</label>
						<div>
							<input type="password" id="" name="" value="">
						</div>
					</div>
					
					<div class="profile-new-password-check profile-item">
						<label class="profile-item-name" for="">비밀번호 확인</label>
						<div>
							<input type="password" id="" name="" value="">
						</div>
					</div>
					
				
					<div class="profile-password-confirm profile-item">
						<button type="button" class="btn-add" id="btn-add" onclick="">변경</button>
					</div>
				</div>
			</div>
			
			
		</div>
	
	
		<div class="fake">
		</div>
		
		
	</div>
</main>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link href="${root }/resource/css/accompany/matching.css" rel="stylesheet"/>
 
<main class="container">
	<div class="accompany-option-section col-lg-7">
		<h1 class="hidden"> 동행 선택 옵션 추가 </h1>
		<div class="accompany-manage">
			<div>
				<h2>나의 동행 정보</h2>
				<a href="">나의 동행 관리</a>
			</div>
			<div>
				<c:forEach var="i" begin="0" end="5">
				<div>
					<input type="radio" name="select-accompany" value=${i }/>
					<label> ${i } 번째 동행 요약 </label>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="accompany-option col-lg-5">
			<div>
				선호하는 동행 스타일
			</div>
			<div class="sex">
				<label>성별</label>
				남<input type="radio" name="select-sex" value="0"/>
				여<input type="radio" name="select-sex" value="1"/>
			</div>
			<div class="age">
				<label>나이</label>
				<select id="age-select">
					<option value="default">나이선택</option>	
					<option value="20_22">20~22세</option>
					<option value="23_25">23~25세</option>
					<option value="26_28">26~28세</option>
					<option value="29_31">29~31세</option>
					<option value="32_34">32~34세</option>
					<option value="35_37">35~37세</option>
					<option value="38_40">38~40세</option>
					<option value="41_43">41~43세</option>
					<option value="44_46">44~46세</option>
					<option value="47_49">47~49세</option>
					<option value="50_52">50~52세</option>
				</select>
			</div>
			<div class="distance">
				<div>
				<label>거리</label>
				<select id="distance-select">
					<option value="500m" selected>거리선택</option>
					<option value="300m">300m 이내</option>
					<option value="500m">500m 이내</option>
					<option value="1km">1km 이내</option>
					<option value="2km">2km 이내</option>					
				</select>
				</div>
				<div><span>? 선택하신 여행지로부터의 거리를 선택하실 수 있습니다. 기본 반경은 500m 이내입니다.</span></div>
			</div>
			<div class="style">
				<label>동행 스타일</label>
				<select id="style-select">
					<option value="default" selected> </option>
					<option value="default" selected>DB서 가져오자...</option>
				</select>
			</div>
			<div>
				<button type="button" class="btn btn-info">동행 찾기</button>
			</div>
		</div>
	</div>
	<div class="matched-accompany-section">
		어쩔 ㅡㅡ
	</div>
</main>
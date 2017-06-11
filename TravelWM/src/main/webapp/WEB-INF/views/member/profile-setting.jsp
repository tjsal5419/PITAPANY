<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="/TravelWM/resource/css/member/profile-setting.css"
	type="text/css" />

<script type="text/javascript">
	function add() {
		var div = document.createElement('div');
		
		div.innerHTML = document.getElementById('sns').innerHTML;
		document.getElementById('clone').appendChild(div);

		div.style.display = "flex";
	}
</script>

<main id="main">
<div class="frame">
	<div class="aside-hidden">
		<div>
			<a href="">프로필관리</a>
		</div>
		<div>
			<a href="/TravelWM/member/acc-setting">동행관리</a>
		</div>
		<div>
			<a href="/TravelWM/member/bookmark">기타관리</a>
		</div>
	</div>
	<div class="aside">
		<div class="remote-controller">
			<div class="title">
				<h3>관리페이지</h3>
			</div>
			<div>
				<a href="">프로필관리</a>
			</div>
			<div>
				<a href="/TravelWM/member/acc-setting">동행관리</a>
			</div>
			<div>
				<a href="/TravelWM/member/bookmark">기타관리</a>
			</div>
		</div>
	</div>
	<div class="fmain">
		<div class="content">
			<div class="head">
				<div>
					<span>프로필 기본 정보</span>
				</div>
			</div>
			<div class="capa">
				<div class="first">
					<span>배경과 프사자리</span>
				</div>
				<div class="second">
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>닉네임</span>
							</div>
						</div>
						<div class="t-input">
							<input type="text" placeholder="입력란" />
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>프로필명</span>
							</div>
						</div>
						<div class="t-input">
							<input type="text" placeholder="입력란" />
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>혈액형</span>
							</div>
						</div>
						<div class="t-select">
							<select>
								<option>A</option>
								<option>B</option>
								<option>O</option>
								<option>AB</option>
							</select>
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>직업</span>
							</div>
						</div>
						<div class="t-input">
							<input type="text" placeholder="입력란" />
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>동행유형</span>
							</div>
						</div>
						<div class="t-select">
							<select>
								<option>유형</option>
								<option>무형</option>
								<option>문화재</option>
							</select>
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>자기소개</span>
							</div>
						</div>
						<div class="t-area">
							<textarea placeholder="입력란"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="head">
				<div>
					<span>계 정 정 보</span>
				</div>
			</div>
			<div class="capa">
				<div class="second">
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>아이디</span>
							</div>
						</div>
						<div class="t-display">
							<span>Macboy</span>
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>비밀번호</span>
							</div>
						</div>
						<div class="t-display">
							<span>*******</span>
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>생년월일</span>
							</div>
						</div>
						<div class="t-input">
							<input type="date" />
						</div>
					</div>
					<div class="info-factor">
						<div class="t-label">
							<div>
								<span>휴대전화</span>
							</div>
						</div>
						<div class="t-input">
							<input type="text" placeholder="입력란" />
						</div>
					</div>
					<div class="info-factor">
						<div id="sns" class="sns-info">
							<div id="sns-label" class="t-label">
								<div id="sns-label-div">
									<span>S N S</span>
								</div>
							</div>
							<div id="sns-input" class="t-input">
								<input id="sns-input-in" type="text" placeholder="입력란" />
							</div>
						</div>
						<div class="sns-button">
							<div class="btn-custom">
								<button class="btn btn-info customs" onclick="add()">추가</button>
							</div>
						</div>
					</div>
					<div id="clone" class="info-factor"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>





<!-- <div
	style="border: 1px solid; width: 80%; display: flex; flex-direction: column; align-items: center;">
	<table>
		<tbody>
			<tr>
				<th>닉네임</th>
				<td><textarea></textarea></td>
			</tr>
			<tr>
				<th>프로필명</th>
				<td><textarea></textarea></td>
			</tr>
			<tr>
				<th>혈액형</th>
				<td><select><option>A</option>
						<option>B</option>
						<option>O</option>
						<option>AB</option></select></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><textarea></textarea></td>
			</tr>
			<tr>
				<th>동행유형</th>
				<td><select><option>1</option>
						<option>2</option>
						<option>3</option></select></td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td><textarea cols="60"></textarea></td>
			</tr>
		</tbody>
	</table>

	<table>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>newlec</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>******</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date"></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><textarea></textarea></td>
			</tr>
			<tr>
				<th>SNS</th>
				<td><select><option>twitter</option>
						<option>facebook</option></select> <textarea cols="45"></textarea></td>
			</tr>
		</tbody>
	</table>
	<div style="width: 454px; display: flex; flex-direction: row-reverse;">
		<button>추가하기</button>
	</div>
</div> -->
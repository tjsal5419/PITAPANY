<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
main {
	flex: auto;
	min-height: 0px;
}

table {
	margin-top: 10px;
	width: 60%;
	border-collapse: collapse;
}

th, td {
	border-top: 1px solid;
	border-botton: 1px solid;
	padding: 5px, 10px;
}
</style>
<main id="main">
<h2 class="main-title">프로필 설정</h2>
<div
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
</div>
</main>
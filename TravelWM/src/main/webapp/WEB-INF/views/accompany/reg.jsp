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
<h2 class="main-title">등록</h2>
<div
	style="border: 1px solid; width: 80%; display: flex; flex-direction: column; align-items: center;">
	<table>
		<tbody>
			<tr>
				<th>제목</th>
				<td><textarea cols="60"></textarea></td>
			</tr>
			<tr>
				<td>동행장소 <select>
						<option>독일</option>
						<option>한국</option>
						<option>영국</option>
				</select></td>
				<td>동행날짜 <input type="date"></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="20" cols="80" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td><select><option>성향선택</option>
						<option>자유분방</option>
						<option>침착</option>
						<option>먹방</option></select></td>
				<td><input type="file" name="files" /></td>
			</tr>
		</tbody>
	</table>
	<div style="width: 512px; display: flex; flex-direction: row-reverse;">
		<input type="submit" value="등록" /> <input type="submit" value="취소" />
	</div>
</div>
</main>
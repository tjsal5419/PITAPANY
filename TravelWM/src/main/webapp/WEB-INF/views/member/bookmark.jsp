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
<h2 class="main-title">북마크</h2>
<div
	style="border: 1px solid; width: 80%; display: flex; flex-direction: column; align-items: center;">
	<table>
		<thead>
			<tr>
				<th colspan='4'>북마크 글</th>
			</tr>
		</thead>
		<tbody style="padding: 10px;">
			<tr>
				<td style="width: 10%;">번호</td>
				<td style="width: 60%;">글제목</td>
				<td style="width: 20%;">작성일</td>
				<td style="width: 10%;">조회</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>글제목</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>글제목</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>글제목</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
		</tbody>
	</table>

	<table>
		<thead>
			<tr>
				<th colspan='4'>내가 쓴 글</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="width: 10%;">번호</td>
				<td style="width: 60%;">글제목</td>
				<td style="width: 20%;">작성일</td>
				<td style="width: 10%;">조회</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>글제목</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>글제목</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>글제목</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
		</tbody>
	</table>
</div>
</main>
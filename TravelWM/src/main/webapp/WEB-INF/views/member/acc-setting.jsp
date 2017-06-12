<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="/TravelWM/resource/css/member/acc-setting.css" type="text/css" />

<script>
	window.addEventListener("load", function() {
		var mod = document.querySelector("#mod");
		var modAcc = document.querySelector("#mod-acc");
		var accZone = document.querySelector("#acc-zone");
		
		mod.onclick = function() {
			accZone.style.display = "none";
			modAcc.style.display = "flex";
		}
	});
</script>

<main id="main">
<div class="frame">
	<div class="aside-hidden">
		<div>
			<a href="/TravelWM/member/profile-setting">프로필관리</a>
		</div>
		<div>
			<a href="">동행관리</a>
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
				<a href="/TravelWM/member/profile-setting">프로필관리</a>
			</div>
			<div>
				<a href="">동행관리</a>
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
					<span>동행 정보 관리</span>
				</div>
			</div>
			<div class="capa">
				<div class="first">
					<div class="sel-zone">동행장소</div>
					<div class="sel-date">동행날짜</div>
					<button class="btn btn-info na">등록</button>
				</div>
				<div class="second">
					<div class="blist">
						<c:forEach var="a" begin="1" end="5">
							<div class="line">
								<div id="acc-zone" class="acc-zone">
									<span>동행장소</span>
								</div>
								<div id="mod-acc" class="mod-acc">
									<div class="sel-zone">동행장소</div>
									<div class="sel-date">동행날짜</div>
								</div>
								<button id="mod" class="btn btn-info na">수정</button>
								<button class="btn btn-info na">삭제</button>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="content spa">
			<div class="head">
				<div>
					<span>대화 친구 목록</span>
				</div>
			</div>
			<div class="capa">
				<div class="propic">
					<c:forEach var="a" begin="1" end="5">
						<div class="entity">
							<a href="#"><div class="pro"></div></a>
							<div class="nic">닉네임</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="content spa">
			<div class="head">
				<div>
					<span>매칭 친구 목록</span>
				</div>
			</div>
			<div class="capa">
				<div class="propic">
					<c:forEach var="a" begin="1" end="5">
						<div class="entity">
							<a href="#"><div class="pro"></div></a>
							<div class="nic">닉네임</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
</main>





<!-- <h2 class="main-title">동행 설정</h2>
<div
	style="border: 1px solid; width: 80%; display: flex; flex-direction: column; align-items: center;">
	<table border='1'>
		<thead>
			<tr>
				<th colspan='3'>동행 정보 관리</th>
			</tr>
		</thead>
		<tr>
			<td><textarea placeholder="동행장소"></textarea></td>
			<td><input type="date" /></td>
			<td><button>등록</button></td>
		</tr>
		<tbody>
			<tr>
				<td colspan='2'>동행장소</td>
				<td><button>수정</button>
					<button>삭제</button></td>
			</tr>
			<tr>
				<td colspan='2'>동행장소</td>
				<td><button>수정</button>
					<button>삭제</button></td>
			</tr>
			<tr>
				<td colspan='2'>동행장소</td>
				<td><button>수정</button>
					<button>삭제</button></td>
			</tr>
		</tbody>
	</table>


	<table>
		<thead>
			<tr>
				<th colspan='6'>대화 친구 목록</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
			</tr>
			<tr>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
			</tr>
		</tbody>
	</table>



	<table>
		<thead>
			<tr>
				<th colspan='6'>매칭 친구 목록</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
				<td><img src="a" /><a href="">닉네임</a></td>
			</tr>
			<tr>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
				<td style="border: none"><img src="a" /><a href="">닉네임</a></td>
			</tr>
		</tbody>
	</table>
</div> -->
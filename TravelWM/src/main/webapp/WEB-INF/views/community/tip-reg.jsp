<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/TravelWM/resource/css/community/tip-reg.css"
	type="text/css" />

<main id="main">
<div class="frame">
	<div class="content">
		<div class="head">
			<div class="title-logo">
				<span>Title</span>
			</div>
			<div class="title-content">
				<input class="ti" type="text" placeholder="제목내용" />
			</div>
		</div>
		<div class="sel">
		</div>
		<div class="text">
			<textarea placeholder="본문내용"></textarea>
		</div>
		<div class="foot">
			<div class="bottun">
				<div class="cancel">
					<a href="/TravelWM/community/tip"><button class="btn btn-info chat">글 취소</button></a>
				</div>
				<div class="reg">
					<button class="btn btn-info chat" type ="submit">글 등록</button>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<!-- 
<table class="table">
			<tbody>
				<tr>
					<th>제목</th>
					<td colspan='3'><textarea class="title-text"></textarea></td>
				</tr>
				<tr>
					<th>동행장소</th>
					<td><select>
							<option>독일</option>
							<option>한국</option>
							<option>영국</option>
					</select></td>
					<th>동행날짜</th>
					<td><input id="from" type="text"> <input id="to"
						type="text"> <script type="text/javascript">
							$("#from").datepicker({
							changeMonth : true, //콤보 박스에 월 보이기
							changeYear : true, // 콤보 박스에 년도 보이기
							showOn : 'button', // 우측에 달력 icon 을 보인다.
							buttonImage : '/TravelWM/resource/images/accompany-reg/ic_today_black_24dp_1x.png', // 우측 달력 icon 의 이미지 경로
							buttonImageOnly : true //달력에 icon 사용하기
							});

							//마우스를 손가락 손가락 모양으로 하고 여백주기
							$('img.ui-datepicker-trigger').css({
								'cursor' : 'pointer',
								'margin-left' : '5px',
								'margin-top' : '3px'
							});

							//날짜 형식을 0000-00-00으로 지정하기
							$.datepicker.setDefaults({
								dateFormat : 'yy-mm-dd'
							});

							$("#to").datepicker({
							changeMonth : true, //콤보 박스에 월 보이기
							changeYear : true, // 콤보 박스에 년도 보이기
							showOn : 'button', // 우측에 달력 icon 을 보인다.
							buttonImage : '/TravelWM/resource/images/accompany-reg/ic_today_black_24dp_1x.png', // 우측 달력 icon 의 이미지 경로
							buttonImageOnly : true //달력에 icon 사용하기
							});

							//마우스를 손가락 손가락 모양으로 하고 여백주기
							$('img.ui-datepicker-trigger').css({
								'cursor' : 'pointer',
								'margin-left' : '5px',
								'margin-top' : '3px'
							});

							//날짜 형식을 0000-00-00으로 지정하기
							$.datepicker.setDefaults({
								dateFormat : 'yy-mm-dd'
							});
						</script></td>
				</tr>
				<tr>
					<td colspan="4"><textarea class="main-text"></textarea></td>
				</tr>
			</tbody>
		</table>

		<div class="sel-char">
			<div>
				<select name="pick" id="char-pick">
					<option value="" disabled hidden>성향선택</option>
					<option value="1">자유분방</option>
					<option value="2">맛집탐방</option>
					<option value="3">여자여자</option>
					<option value="4">음주가무</option>
				</select>
				<script type="text/javascript">$('#char-pick').picker();</script>
			</div>
			<div>
				<input type="file" />
			</div>
			<div>
				<input type="submit" value="취소" /><input type="submit" value="등록" />
			</div>
		</div>
	</div> -->
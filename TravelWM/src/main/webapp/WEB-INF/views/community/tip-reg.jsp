<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/TravelWM/resource/css/community/tip-reg.css"
	type="text/css" />

<main class="main">
	<%@ include file="inc/aside.jsp" %>
	<form class="frame" method="post">
		<div class="content">
		
			<div class="head">
				<div class="head-title">
					<span>제목</span>
				</div>
				<div class="head-content">
					<input class="ti form-control form-control-reg" type="text" name="title" placeholder="제목내용" required/>
				</div>
			</div>
		
	        <div class="selec-category">
				<div class="category-title">
					<span>분류</span>
				</div>
				<div class="category-content">
					<select class="select" name="categoryId">
						<c:forEach var="l" items="${categoryList }">
							<option value="${l.id}">${l.category }</option>	
						</c:forEach>
					</select>
					<div class="category-content-arrow"></div>
				</div>
			</div>		
		
			
		
	
		
		
		
			<div class="text">
				<textarea name="content" class="form-control form-textarea" placeholder="내용입력" required></textarea>
			</div>
			
			<div class="attach-file">
				<div class="attach-title">
					<span>첨부파일</span>
				</div>
				<div class="attach-content">
	 				<input type="file" name="file" id="file-7" class="inputfile inputfile-6" data-multiple-caption="{count} files selected" multiple />
					<label for="file-7"><strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></strong><span></span></label>
	 			</div>
			</div>
			
			<input type="text" name="id" value="${tipView.id }" class="hidden"/>
			
			<div class="buttons">
				<div class="cancel">
					<button onclick="window.location.href='${root}/accompany/board'" id="cancel" class="btn btn-info chat">글 취소</button>	
				</div>
				<div class="submit">
					<button class="btn btn-info chat" id="submit" type ="submit">글 등록</button>
				</div>
			</div>
			
		</div>
	</form>
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
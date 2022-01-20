<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css?ver=4">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css?ver=7">
<title>My page</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/update.js?ver=2"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#location-selected').val('${vo.location}').prop("selected",true);			
	});
</script>
</head>
<body>

	<div class = "update-form">
		<header class="delete-title">
			<h1>회원 정보 수정</h1>
		</header>
		
		<form>
			<table align="center">
				<tr>
					<th class="input-label">아이디</th>
					<td class="input-box-disable">
						<input type="text" name="id" value = "${vo.id }" disabled="disabled" >
					</td>
				</tr>
					<tr>
					<th class="input-label">이름</th>
					<td class="input-box-disable">
						<input type="text" name="name" value="${vo.name }" disabled="disabled" >
					</td>
				</tr>
				
				<tr>
					<th class="input-label">전화번호</th>
					<td class="input-box">
						<input type="text" name="tel" value="${vo.tel}" >
					</td>
				</tr>
				<tr>
					<th class="input-label">이메일</th>
					<td class="input-box-disable">
						<input type="text" name="email" value="${vo.email}" disabled="disabled" >
					</td>
				</tr>

				<tr>
					<th class="input-label">거주지</th>
					<td class="input-box">
						<select name="location" id="location-selected">
							<option value="서울특별시" >서울특별시</option>
							<option value="경기도" >경기도</option>
							<option value="인천광역시" >인천광역시</option>
							<option value="부산광역시" >부산광역시</option>
							<option value="대구광역시" >대구광역시</option>
							<option value="경상남도" >경상남도</option>
							<option value="경상북도" >경상북도</option>
							<option value="강원도" >강원도</option>
							<option value="대전광역시" >대전광역시</option>
							<option value="충청남도" >충청남도</option>
							<option value="충청북도" >충청북도</option>
							<option value="전라남도" >전라남도</option>
							<option value="전라북도" >전라북도</option>
							<option value="광주광역시" >광주광역시</option>
							<option value="울산광역시" >울산광역시</option>
							<option value="제주도" >제주도</option>
							<option value="세종시" >세종시</option>
						</select>
					</td>
				</tr>

				<tr>
					<td class="update-box" colspan = "2">
						<br>
						<button type="button" class = "index-button" onclick="window.location.href='/index'">취소</button>
						<button type="button" class = "update-button" onclick="checkupdate(this.form);">수정 </button> <br>
						<button type="button" class = "delete-button" onclick="window.location.href='/member/deleteGuide'">회원 탈퇴</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>


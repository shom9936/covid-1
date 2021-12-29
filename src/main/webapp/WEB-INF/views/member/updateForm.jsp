<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Surf/css/join.css?ver=3">
<link rel="stylesheet" href="/Surf/css/member.css?ver=4">
<title>Kaja Surf</title>
<script type="text/javascript">

	function checkupdate(f){
		if(f.ckPW.value != f.pwd.value){
			alert('비밀번호가 일치하지 않습니다');
			f.pwd.focus();
			return;
		} else if(f.name.value==''){
			alert('이름을 입력하세요!');
			f.name.focus();
		} else if(f.email.value==''){
			alert('이메일을 입력하세요!');
			f.email.focus();
			return;
		} else if(f.tel.value==''){
			alert('전화번호를 입력하세요!');
			f.tel.focus();
			return;
		}
		
		
		f.action = "/member/join";
		f.submit();
	}
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
					<td class="input-box">
						<input type="text" name="id" value = "${vo.id }" disabled="disabled" placeholder="&nbsp;&nbsp;아이디">
					</td>
				</tr>
					<tr>
					<th class="input-label">이름</th>
					<td class="input-box">
						<input type="text" name="name" value="${vo.name }" placeholder="&nbsp;&nbsp;이름">
					</td>
				</tr>
				
				<tr>
					<th class="input-label">전화번호</th>
					<td class="input-box">
						<input type="text" name="tel" value="${vo.tel}" placeholder="&nbsp;&nbsp;전화번호">
					</td>
				</tr>
				<tr>
					<th class="input-label">이메일</th>
					<td class="input-box">
						<input type="text" name="email" value="${vo.email}" placeholder="&nbsp;&nbsp;이메일">
					</td>
				</tr>

				<tr>
					<th class="input-label">비밀번호</th>
					<td class="input-box">
						<input type="hidden" name="ckPW" value="${vo.pwd }">
						<input type="password" name="pwd" placeholder="&nbsp;&nbsp;비밀번호">	
					</td>
				</tr>

				<tr>
					<th></th>
					<td class="update-box">
						<button type="button" class = "index-button" onclick="location.href='/Surf/member/index.me'">취소</button>
						<button type="button" onclick="checkupdate(this.form);">수정 </button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>


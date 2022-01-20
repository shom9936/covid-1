<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css?ver=9">
<title>COVID-19</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    function checkLogin(f){
		if(f.id.value==''){
			alert('아이디를 입력하세요!')
			f.id.focus();
			return;
		}
		if(f.pwd.value==''){
			alert('비밀번호를 입력하세요!')
			f.password.focus();
			return;
		}
		
		f.action = "/member/login";
		f.submit();
	}
</script>
</head>
<body>
	<div class = "login-form">
		<header class="login-title">
			<h1> <a href="/index">COVID-19 안내 페이지</a></h1>
		</header>
		
		<form method="post">
			<div class="input-box">
				<input id = "id" type="text" name="id" value="${id }" placeholder="&nbsp;&nbsp;아이디">
	
			</div>
			<div class="input-box">
				<input id="password" type="password" name="pwd" placeholder="&nbsp;&nbsp;비밀번호">		
			</div>
			<br>
			
			<span class="login-button">
				<input type="button" value = "로그인" onclick="checkLogin(this.form);">
			</span>
			<br><br><br>
			<div class="go-join">
				<img src="${pageContext.request.contextPath }/resources/img/join.png" width="25px" height="25px">
				<a href="/member/joinForm"><font color="#77b8f4" style="font-weight: bold;">회원 가입</font></a>
			</div>
			<div class="find-pwd">
				<a href="/member/findPassword"><font color="black" size="3pt;" style="font-weight: bold;">비밀번호 찾기</font></a>
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/findPassword.css?ver=3">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/findPassword.js?ver=2"></script>
</head>
<body>
	<div class="find-password-header">
		<br>
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/index" id="goIndex">COVID-19 안내 페이지</a></h2>
	</div>
	<div class="find-password-body">
	<h3>비밀번호 찾기</h3>
	<hr>
	<p> 비밀번호를 찾고자 하는 아이디를 입력해주세요 </p>
	
		<form method="get" action="/member/findPasswordIdentify">
			<div class="inputID">
				<input type="text" name="id" placeholder="&nbsp;아이디"> <br>
			</div>
			<div class="inputIDSubmit">
				<button>다음</button>
			</div>
			
		</form>
	</div>
	<div class="find-password-footer">
		
	</div>
</body>
</html>
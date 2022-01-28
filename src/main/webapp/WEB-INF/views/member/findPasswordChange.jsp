<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/findPassword.css?ver=3">
<script type="text/javascript">
	function checkPWD(f){
		if(f.pwd.value != f.RePwd.value){
			alert('비밀번호 입력이 일치하지않습니다');
			return;
		}
		
		f.method = "post";
		f.action = "/member/changePassword";
		f.submit();
	}
</script>
</head>
<body>
	<div class="find-password-header">
		<br>
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/index" id="goIndex">COVID-19 안내 페이지</a></h2>
	</div>
	<div class="find-password-body">
		<h3>비밀번호 변경</h3>
		<hr>
		<form>
			<p>변경할 비밀번호를 입력해주세요</p> <br>
			<div class="find-password-change-inputpwd">
				<input type="password" name="pwd" placeholder="&nbsp;비밀번호"> <br> <br>
				<input type="password" name="RePwd" placeholder="&nbsp;비밀번호 확인"> <br>
				<input type="hidden" value="${id }" name="id">
			</div>
			<div class="find-password-change-submit">
				<input type="button" value="변경" onclick="checkPWD(this.form);">
			</div>
		</form>
	</div>
</body>
</html>
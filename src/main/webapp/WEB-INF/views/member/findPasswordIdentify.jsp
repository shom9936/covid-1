<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/findPassword.css?ver=3">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var ckEmail = false;
	var compString;
	
	$(function() {
		$('#inputCode').hide();			
	});
	
	function checkEmail(f){
		$.ajax({
			type : "post",
			dataType : "text" ,
			async : false, // false인 경우 동기식으로 처리한다.
			url : "http://localhost:8080/member/sendMail" ,
			data : {to: f.email.value, randomString : f.randomString.value} ,
			success:function (data, textStatus) {
				$("#identifyCode").append("<h3>본인 이메일로 본인인증코드가 전송되었습니다.</h3>"
						+ "<h3>대, 소문자 구별해서 입력해주세요</h3>");
				$('#inputCode').show();
				$('#emailButton').hide();
			},
			error:function (data, textStatus){
				alert('에러가 발생했습니다.');
			},
			complete:function (data, textStatus){
				/* alert('작업을 완료했습니다.'); */
			}
		});
	}
	
	function checkCode(f){
		if(f.compString.value == ''){
			alert('본인 확인 코드를 입력해주세요!');
			return;
		} else if(f.randomString.value != f.compString.value){
			alert('본인 확인 코드가 일치하지 않습니다.');
			return;
		} 
		
		f.method = "post";
		f.action = "/member/findPasswordChange";
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
	<h3>본인 인증 코드 발급</h3>
	<hr>
		<form>
			<div id = "emailButton"><button type="button" onclick="checkEmail(this.form);">인증 코드 받기</button></div>
			<input type="hidden" value="${randomString }" name="randomString">
			<input type="hidden" value="${vo.email }" name="email">
		</form>
		<div id="identifyCode"></div>
		<form>
			<div id="inputCode">
				<input type="text" name="compString"> &nbsp;
				<input type="button" value="확인" onclick="checkCode(this.form);">
				<input type="hidden" value="${randomString }" name="randomString">
				<input type="hidden" value="${vo.id }" name="id">
			</div>
		</form>
	</div>
</body>
</html>
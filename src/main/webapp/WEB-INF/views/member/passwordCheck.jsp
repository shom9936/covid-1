<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COVID-19</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/findPassword.css?ver=4">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function checkPWD(f){
		$.ajax({
			type : "post",
			dataType : "text" ,
			async : false, // false인 경우 동기식으로 처리한다.
			url : "http://localhost:8080/member/checkPWD" ,
			data : {pwd: document.getElementById('pwd').value} ,
			success:function (data, textStatus) {
				if(data == 'true'){
					location.href = "/member/updateForm";
				} else {
					alert('비밀번호가 일치하지않습니다');
				}
			},
			error:function (data, textStatus){
				alert('에러가 발생했습니다.');
			},
			complete:function (data, textStatus){
				/* alert('작업을 완료했습니다.'); */
			}
		});
	}
</script>
</head>
<body>
	
	<div class="find-password-header">
		<br>
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/index" id="goIndex">COVID-19 안내 페이지</a></h2>
	</div>
	<div class="find-password-body">
	<h3>비밀번호 입력</h3>
	<hr>
	<p> 본인 확인을 위해 비밀번호를 한번 더 입력해주세요 </p>
	
		<form method="get" action="/member/findPasswordIdentify">
			<div class="inputID">
				<input type="password" name="pwd" id="pwd"> <br>
			</div>
			<div class="inputIDSubmit">
				<button type="button" onclick="checkPWD(this.form);">확인</button>
			</div>
			
		</form>
	</div>

</body>
</html>
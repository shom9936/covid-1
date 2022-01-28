<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css?ver=4">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/findPassword.css?ver=4">
<title>COVID-19</title>
<script type="text/javascript">
		function ckCheck(f){
			var ck=cb1.checked;
			if(ck==''){
				alert("약관에 동의해주십시오");
				return;
			}else{
				f.method = "get";
				f.action = "/member/delete";
				f.submit();
			}
		}
</script>
</head>
<body>
		<div class="find-password-header">
			<br>
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/index" id="goIndex">COVID-19 안내 페이지</a></h2>
		</div>
		<div class="delete-guide">
		<h1>회원 탈퇴 안내</h1>
		<h4>탈퇴 시 주의사항</h4>
		<hr>
			<form>
			<div class="delete-mention">
			<ol>
				<li>사용하고 계신 아이디는 탈퇴할 경우<font color="#FE2E2E"><ins> 재사용 및 복구가 불가능</ins></font> 합니다.</li><br>
				<li>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</li><br>
				<li>리뷰와 문의 같은 게시판형 서비스에 등록 된 게시물은 <font color="#FE2E2E"><ins> 탈퇴 후에도 자동 삭제 되지 않습니다.</ins></font></li><br>
			</ol>
			</div>
	    	
			<div class="join-button">
			
			<input type="checkbox" id="cb1"> 
			<label for="cb1">안내사항을 모두 확인하였으며, 이에 동의합니다.</label> <br><br><br>
				<div class="deleteGuide-button-box">
					<button class="index-button-deleteGuide" onclick="location.href='/index'">취소</button>
					<button class="con-button-deleteGuide" onclick="ckCheck(this.form)">탈퇴</button>
				</div>
			</div>
		</form>
		</div>
</body>
</html>
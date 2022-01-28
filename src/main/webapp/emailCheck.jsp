<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {
		text-align: center;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	 var id = opener.$("#randomString").val(); //부모창에서 id가 randomString인 태그의 val()
	 
	 function checkCode(f){
		 if(id == f.randomchild.value){
			 alert('본인 확인이 완료되었습니다.');
			 $(opener.location).attr("href", "javascript:windowClose();");
		 } else {
			 alert('본인 확인 코드가 일치하지않습니다.');
			 return;
		 }
	 }
	 
</script>
</head>
<body>
	<h3>입력한 이메일 주소로 본인확인 코드가 전송되었습니다. </h3>
	<h3>대, 소문자 구별해서 입력해주세요</h3>
	<div>
		<form>
			<input type="text" name="randomchild">
			<input type="button" value="확인" onclick="checkCode(this.form)">
		</form>
	</div>
</body>
</html>
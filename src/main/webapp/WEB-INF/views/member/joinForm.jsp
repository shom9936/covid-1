<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css?ver=12">
<title>COVID-19</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/join.js?ver=2"></script>
<script type="text/javascript">
	var ckID = false;
	var ckPW = false;
	var ckEmail = false;

	function fn_process(f){
		
		if(f.id.value==''){
			alert('아이디를 입력하세요!')
			f.id.focus();
			return;
		}
		
		$.ajax({
			type : "post",
			dataType : "text" ,
			async : false, // false인 경우 동기식으로 처리한다.
			url : "http://localhost:8080/member/checkID" ,
			data : {id: f.id.value} ,
			success:function (data, textStatus) {
				if(data == 'true'){
					alert('사용 가능한 아이디입니다.');
					if(confirm('이 아이디를 사용하시겠습니까?')){
						ckID = true;
						$('.confirmID-box').attr('disabled', true);
						$('#id').attr('readonly', true);
					}
				} else if(data=='false'){
					alert('이미 사용중인 아이디입니다.');
				} else {
					alert(data);
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

	var child;

	function checkEmail(f){
		$.ajax({
			type : "post",
			dataType : "text" ,
			async : false, // false인 경우 동기식으로 처리한다.
			url : "http://localhost:8080/member/sendMail" ,
			data : {to: f.email.value, randomString : f.randomString.value} ,
			success:function (data, textStatus) {
				child = window.open('http://localhost:8080/emailCheck.jsp', '_blank', 'height:300, width:300');
			},
			error:function (data, textStatus){
				alert('에러가 발생했습니다.');
			},
			complete:function (data, textStatus){
				/* alert('작업을 완료했습니다.'); */
			}
		});
		
	}
	
	function windowClose(){
		ckEmail = true;
		child.close();
	}
	
	
	
</script>



</head>
<body>
	
	<div class = "join-form">
		<header class="join-title">
			<h1> <a href="/index">COVID-19</a></h1>
		</header>
		
		<form method="post" id="frmData" name="frmData">
			<table align="center">
				<tr>
					<th class="input-label-includeText">아이디</th>
					<td class="input-box-includeText">
						<input type="text" name="id" id="id" placeholder="&nbsp;&nbsp;아이디" maxlength="12" >
						<button class= "confirmID-box" type="button" onclick="fn_process(this.form);">중복 확인</button> <br>
						<font style="font-size: 7px;">(4~12자까지, 소문자/숫자만 허용 )</font>
					</td>
				</tr>
				<tr>
					<th class="input-label-includeText">비밀번호</th>
					<td class="input-box-includeText">
						<input type="password" name="pwd" placeholder="&nbsp;&nbsp;비밀번호"><br>
						<font style="font-size: 7px;">(8자 이상, 문자, 숫자, 특수문자 허용 )</font>
					</td>
				</tr>
				<tr>
					<th class="input-label">비밀번호 확인</th>
					<td class="input-box">
						<input type="password" name="rePW" placeholder="&nbsp;&nbsp;비밀번호">		
						<button class= "confirm-box" onclick="checkPW(this.form);" type="button">확인</button>
					</td>
				</tr>
				<tr>
					<th class="input-label">이름</th>
					<td class="input-box">
						<input type="text" name="name" placeholder="&nbsp;&nbsp;이름">
					</td>
				</tr>
				<tr>
					<th class="input-label">이메일</th>
					<td class="input-box">
						<input type="text" name="email" placeholder="&nbsp;&nbsp;이메일">
						<input type="hidden" name="randomString" id="randomString" value="${randomString }" >
						<button class= "confirm-box" onclick="checkEmail(this.form);" type="button"><font style="font-size: 8px;">본인 인증</font></button>
					</td>
				</tr>
				<tr>
					<th class="input-label">거주지</th>
					<td class="input-box">
						<select name="location">
							<option value='' disabled="disabled" >----- 선택 -----</option>
							<option value="서울특별시">서울특별시</option>
							<option value="경기도">경기도</option>
							<option value="인천광역시">인천광역시</option>
							<option value="부산광역시">부산광역시</option>
							<option value="대구광역시">대구광역시</option>
							<option value="경상남도">경상남도</option>
							<option value="경상북도">경상북도</option>
							<option value="강원도">강원도</option>
							<option value="대전광역시">대전광역시</option>
							<option value="충청남도">충청남도</option>
							<option value="충청북도">충청북도</option>
							<option value="전라남도">전라남도</option>
							<option value="전라북도">전라북도</option>
							<option value="광주광역시">광주광역시</option>
							<option value="울산광역시">울산광역시</option>
							<option value="제주도">제주도</option>
							<option value="세종시">세종시</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="input-label">전화번호</th>
					<td class="input-box">
						<input type="text" name="tel" placeholder="&nbsp;&nbsp;전화번호">
					</td>
				</tr>
				<tr>
					<th></th>
					<td class="join-box">
						<button onclick="checkJoin(this.form);" type="button"> 회원가입 </button> <br>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>


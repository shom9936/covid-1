<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css?ver=6">
<title>COVID-19</title>
<script type="text/javascript">
	var ckID = false;
	var ckPW = false;

	function checkID(f){
		
		if(f.id.value==''){
			alert('아이디를 입력하세요!')
			f.id.focus();
			return;
		}
		
		f.action = "/Surf/member/checkID.me";
		f.submit();
		
	}
	function checkPW(f){
		if(f.pwd.value == f.rePW.value){
			alert('비밀번호가 일치합니다.');
			ckPW = true;
		} else {
			alert('비밀번호가 일치하지 않습니다.');
		}
	}

    function checkJoin(f){
    	/* if(!ckID){
    		alert('아이디를 확인해주세요');
    		f.id.focus();
    		return;

    	} */
    	
    	/* if(!ckPW){
    		alert('비밀번호를 확인해주세요');
    		f.pwd.focus();
    		return;
    	} */
		if(f.id.value==''){
			alert('아이디를 입력하세요!');
			f.id.focus();
			return;
		}
		if(f.pwd.value==''){
			alert('비밀번호를 입력하세요!');
			f.pwd.focus();
			return;
		}
		if(f.name.value==''){
			alert('이름을 입력하세요!');
			f.name.focus();
			return;
		}
		if(f.email.value==''){
			alert('이메일을 입력하세요!');
			f.email.focus();
			return;
		}
		if(f.tel.value==''){
			alert('전화번호를 입력하세요!');
			f.tel.focus();
			return;
		}
		f.action = "/controller/member/join";
		f.submit();
	}
</script>

</head>
<body>
<%-- 	<c:if test="${available}">
		<script>
			ckID = true;
		</script>
	</c:if>
 --%>
	<div class = "join-form">
		<header class="join-title">
			<h1> <a href="/controller/index">COVID-19</a></h1>
		</header>
		
		<form method="post">
			<table align="center">
				<tr>
					<th class="input-label">아이디</th>
					<td class="input-box">
						<input type="text" name="id" value = "${id }" placeholder="&nbsp;&nbsp;아이디">
						<%-- <c:choose>
							<c:when test="${available}">
								<button class= "available" onclick="checkID(this.form);" disabled="disabled">사용 가능</button>
							</c:when>
							<c:otherwise>
								<button class= "confirm-box" onclick="checkID(this.form);">사용</button>
							</c:otherwise>
						</c:choose> --%>
					</td>
				</tr>
				<tr>
					<th class="input-label">비밀번호</th>
					<td class="input-box">
						<input type="password" name="pwd" value = "${pwd }" placeholder="&nbsp;&nbsp;비밀번호">	
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
						<input type="text" name="name" value="${name }" placeholder="&nbsp;&nbsp;이름">
					</td>
				</tr>
				<tr>
					<th class="input-label">이메일</th>
					<td class="input-box">
						<input type="text" name="email" value="${email}" placeholder="&nbsp;&nbsp;이메일">
						<button class= "confirm-box" onclick="checkPW(this.form);" type="button"><font style="font-size: 8px;">본인 인증</font></button>
					</td>
				</tr>
				<tr>
					<th class="input-label">거주지</th>
					<td class="input-box">
						<input type="text" name="location" value="${location}">
					</td>
				</tr>
				<tr>
					<th class="input-label">전화번호</th>
					<td class="input-box">
						<input type="text" name="tel" value="${tel}" placeholder="&nbsp;&nbsp;전화번호">
					</td>
				</tr>
				<tr>
					<th></th>
					<td class="join-box">
						<button onclick="checkJoin(this.form);"> 회원가입 </button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>


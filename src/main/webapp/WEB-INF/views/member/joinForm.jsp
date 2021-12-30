<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css?ver=6">
<title>COVID-19</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/join.js"></script>
<script type="text/javascript">
	var ckID = false;
	var ckPW = false;

	function fn_process(id){
		$.ajax({
			type : "post",
			dataType : "text" ,
			async : false, // false인 경우 동기식으로 처리한다.
			url : "http://localhost:8080/member/checkID" ,
			data : {param: id} ,
			success:function (data, textStatus) {
				ckID = data;
				if(ckID){
					alert('사용 가능한 아이디입니다.');
				} else {
					alert('이미 사용중인 아이디입니다.');
				}
			},
			error:function (data, textStatus){
				alert('에러가 발생했습니다.');
			},
			complete:function (data, textStatus){
				alert('작업을 완료했습니다.');
			}
		});
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
						<c:choose>
							<c:when test="${ckID}">
								<button class= "available" onclick="checkID(this.form);" disabled="disabled">사용 가능</button>
							</c:when>
							<c:otherwise>
								<button class= "confirm-box" onclick="checkID(this.form);">사용</button>
							</c:otherwise>
						</c:choose>
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


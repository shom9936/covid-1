<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/info/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/foreign1.css?ver=11">
</head>
<body>
	<div class="select_Nation">
	<div>
		<span class="foreign_title"><br>나라별 입·출국 정보</span>
	</div>
	
	<div class="select_Nation_option">
		<h5>조회를 희망하는 국가를 선택해주세요.</h5>
		<form method="get" action="/info/foreign">
			<select name="NationNum">
				<option value="1">대한민국</option>
				<option value="2">미국</option>
				<option value="3">일본</option>
				<option value="4">중국</option>
				<option value="5">영국</option>
			</select> <input type="submit" value="조회하기">
		</form>
	</div>
	</div>
</body>
</html>
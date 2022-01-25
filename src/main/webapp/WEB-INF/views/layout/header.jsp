<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/basic.css?ver=8">
</head>
<body>
<header class="header">
	
	<div class="header-content">
		<span class="header-title">
			COVID-19 안내 페이지
		</span>
		<span class="log_button">
			<c:choose>
				<c:when test="${isLogin}">
					<button class="logout_button" type="button" onclick="location.href='/member/logout'">logout</button> &nbsp;
					<button class="login_button" type="button" onclick="location.href='/member/passwordCheck'">update</button>
				</c:when>
				<c:otherwise>
					<button class="login_button" type="button" onclick="location.href='/member/loginForm'">login</button> &nbsp;
					<button class="join_button" type="button" onclick="location.href='/member/joinForm'">join</button>
				</c:otherwise>
			</c:choose>
		</span>
	</div>
	
	<hr>
</header>
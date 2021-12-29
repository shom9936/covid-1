<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/basic.css?ver=6">
</head>
<body>
<header class="header">
	<div>
		<span class="title">
			covid-19 안내 페이지
		</span>
		<span class="log_button">
			<c:choose>
				<c:when test="${login == null }">
					<button class="login_button" type="button" onclick="location.href='/controller/member/loginForm'">login</button>
				</c:when>
				<c:otherwise>
					<button class="logout_button" type="button" onclick="location.href='logout'">logout</button>
				</c:otherwise>
			</c:choose>
		</span>
	</div>
	<hr>
</header>
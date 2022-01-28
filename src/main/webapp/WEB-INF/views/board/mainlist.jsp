<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판</h2>

	<table>
		<c:forEach var="list" items="${mainlist}">
			<tr>
				<td>${list.no}</td>
				<td>${list.title}</td>
				<td>${list.writer}</td>
				<td>${list.regdate}</td>
				<td>${list.cnt}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
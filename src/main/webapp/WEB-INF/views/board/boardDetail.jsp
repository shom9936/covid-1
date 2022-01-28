<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="/WEB-INF/views/board/layout/header.jsp"%>

<script>
	$(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();
		
		location.href = "${pageContext.request.contextPath}/board/boardForm";
	});
	
</script>
<title>board</title>
</head>
<h2>게시판</h2>
<body>
	<article>
		<div class="container">
			<div class="table-reponsive">
				<table class="table table-strped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty viewAll}">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다</td>
								</tr>
							</c:when>
							<c:when test="${!empty viewAll}">
								<c:forEach var="list" items="${viewAll}">
									<tr>
										<td><c:out value="${list.no}" /></td>
										<td><c:out value="${list.title}" /></td>
										<td><c:out value="${list.writer}" /></td>
										<td><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd" /></td>
										<td><c:out value="${list.cnt}" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				<div>
					<button type="button" class="btn btn-sm btn-primary"
						id="btnWriteForm">글쓰기</button>
				</div>
			</div>
	</article>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/board/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script>
	// 목록으로 이동 이벤트
	$(document).on('click', '#btnList', function(){
		location.href = "${pageContext.request.contextPath}/board/boardList";
	});
	
	//수정 버튼 클릭 이벤트
	$(document).on('click', '#btnUpdate', function(){
		var url = "${pageContext.request.contextPath}/board/editForm";
		url = url + "?no=" + ${boardContent.no};
		url = url + "&mode=edit";
		
		location.href= url;
	});
	
	//삭제 버튼 클릭 이벤트
	$(document).on('click', '#btnDelete', function(){
		var url = "${pageContext.request.contextPath}/board/deleteBoard";
		
		url = url + "?no=" + ${boardContent.no};
		location.href = url;
	});
</script>

</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>${boardContent.title}</h2>
			<div class="bg-white rounded shadow-sm">
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardContent.writer}"/>,</span><span class="board_date"><fmt:formatDate value="${boardContent.regdate}" pattern="yyyy.MM.dd" /></span>
				</div>
				<div class="board_content">${boardContent.content}</div>
			</div>
			
			<div style="margin-top : 20px">
				<c:if test="${vo.id == boardContent.writer }">
					<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				</c:if>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>
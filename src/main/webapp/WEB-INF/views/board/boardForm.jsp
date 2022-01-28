<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 

<%@ include file="/WEB-INF/views/board/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	
	$(document).on('click', '#btnList', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/getBoardList";
	});
	
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		if ( mode == 'edit'){
			//입력 폼 셋팅
			$("#reg_id").prop('readonly', true);
			$("input:hidden[name='no']").val(<c:out value="${boardContent.no}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#writer").val('<c:out value="${boardContent.writer}"/>');
			$("#title").val('<c:out value="${boardContent.title}"/>');
			$("#content").val('<c:out value="${boardContent.content}"/>');
			$("#boardvalues").val('<c:out value="${boardContent.boardvalues}"/>');
		}
	});

</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>게시글 수정</h2>
			<form:form name="form" id="form" role="form" modelAttribute="boardVO" method="post" 
			action="${pageContext.request.contextPath}/board/saveBoard">
			<form:hidden path="no"/>
			<input type="hidden" name="mode" value="write"/>
				<div class="mb-3">
					<label for="title">제목</label>
					<form:input path="title" type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" />
				</div>
				<div class="mb-3">
					<label for="writer">작성자</label> 
					<form:input path="writer"  type="text" class="form-control" name="writer" id="writer" value="${vo.id }" readonly="true"/>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<form:textarea path="content" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요"/>
				</div>
				<%-- <div class="mb-3">
					<label for="boardvalues">게시판 종류</label><br>
					<form:radiobutton path="boardvalues" value="1"/> 공지사항&nbsp;&nbsp;
					<form:radiobutton path="boardvalues" value="2"/> 자주 묻는 질문&nbsp;&nbsp;
					<form:radiobutton path="boardvalues" value="3"/> 자료실&nbsp;&nbsp;
					<form:radiobutton path="boardvalues" value="4"/> 자유게시판
				</div> --%>
				<input type="hidden" name="boardvalues" value="2">
			</form:form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>
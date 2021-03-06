<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="/WEB-INF/views/board/layout/header.jsp"%>

<script>
	$(document).on('click', '#btnWriteForm', function(e) {
		e.preventDefault();

		location.href = "${pageContext.request.contextPath}/board/boardForm";
	});

	function fn_contentView(no) {
		var url = "${pageContext.request.contextPath}/board/getBoardContent";
		url = url + "?no=" + no;
		location.href = url;
	}
</script>

<script>

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;


		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>

<title>board</title>
</head>
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
							<c:when test="${empty boardList}">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다</td>
								</tr>
							</c:when>
							<c:when test="${!empty boardList}">
								<c:forEach var="list" items="${boardList}">
									<tr>
										<td><c:out value="${list.no}" /></td>
										<td>
										<a href="#" onClick="fn_contentView(<c:out value="${list.no}"/>)">
										<c:out value="${list.title}" /></a></td>
										<td><c:out value="${list.writer}" /></td>
										<td><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd" /></td>
										<td><c:out value="${list.cnt}" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
					<c:if test="${isLogin }">
						<div>
							<button type="button" class="btn btn-sm btn-primary" id="btnWriteForm">글쓰기</button>
						</div>
					</c:if>
				<br>
				<div id="paginationBox">

					<ul class="pagination">

						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
						</c:if>

						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
							'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
						</c:if>
					</ul>
				</div> <!-- paginationBox end -->

				</div>
			</div>
	</article>
</body>
</html>
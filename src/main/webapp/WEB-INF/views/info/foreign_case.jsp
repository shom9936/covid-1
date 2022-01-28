<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/info/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/foreign2.css?ver=13">
</head>
<body>

	<div class="foreign_contents">	
		<div class="info_title">
			<br>[ 해외 확진자 추세 ]
		</div>
		<div class="foreign_info">
			<table>
				<tr class="foreign_case_table-th">
					<th> 지역명 </th>
					<th> 나라명 </th>
					<th> 확진자 수 </th>
					<th> 사망자 수 </th>
					<th> 사망자 비율 </th>
				</tr>
				<c:forEach items="${resultList }" var="list">
					<tr class="foreign_case_table-td">
						<td>${list.areaName } </td>
						<td class="area_name">${list.nationName } </td>
						<td>${list.natDefCnt } </td>
						<td>${list.natDeathCnt } </td>
						<td>${list.natDeathRate }% </td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
	</div>
</body>
</html>
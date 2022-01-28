<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/info/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/korea1.css?ver=12">
</head>
<body>
	<div class="korea_contents">
		<div class="gam">
			<div class="gam_title"><br> ▷감염 현황
				<table class="gam_table">
					<tr class="gam_table_th">
						<th class="area_name">지역 </th>
						<th>확진자 </th>
						<th>사망자 </th>
						<th>격리 해제</th>
						<th>해외 유입</th>
						<th>지역 발생</th>
					</tr>
					<c:forEach items="${resultList }" var="list">
						<tr class="gam_table_info">
							<td width="80px" class="area_name">${list.gubun } </td>
							<td>${list.defCnt }<br><font style="color:red;font-size: 9pt;">(+${list.incDec })</font>  </td>
							<td>${list.deathCnt } </td>
							<td>${list.isolClearCnt } </td>
							<td>${list.overFlowCnt } </td>
							<td>${list.localOccCnt } </td>
						</tr>
					</c:forEach>
				</table>
				
			</div>
		</div>
	</div>
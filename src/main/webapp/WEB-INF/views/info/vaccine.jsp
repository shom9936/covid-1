<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/info/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/vaccine1.css?ver=12">
</head>
<body>
	<div>
		<span class="vaccine_title"><br>
			백신 정보
		</span>
		</div>
	<div class="vaccine_contents">
		<div class="pfizer_info">
			<div class="pfizer_title"><br> ▷화이자</div> <br>
			<div class="vaccine_info">
				<table class="vaccine_info_tb">
					<tr>
						<th> 생산 방식 </th>
						<td> ${vaccine1.info_vp } </td>
					</tr>
					<tr>
						<th> 접종 연령 </th>
						<td> ${vaccine1.info_ages } </td>
					</tr>
					<tr>
						<th> 접종 횟수  </th>
						<td> ${vaccine1.info_num } </td>
					</tr>
					<tr>
						<th> 접종 간격 </th>
						<td> ${vaccine1.info_prd } </td>
					</tr>
					<tr>
						<th> 추가 접종 </th>
						<td> ${vaccine1.info_bs } </td>
					</tr>
				</table>

			</div>
		</div>
		<div class="moderna_info">
			<div class="moderna_title"><br> ▷모더나</div> <br>
			<div class="vaccine_info">
				<table class="vaccine_info_tb">
					<tr>
						<th> 생산 방식 </th>
						<td> ${vaccine2.info_vp } </td>
					</tr>
					<tr>
						<th> 접종 연령 </th>
						<td> ${vaccine2.info_ages } </td>
					</tr>
					<tr>
						<th> 접종 횟수  </th>
						<td> ${vaccine2.info_num } </td>
					</tr>
					<tr>
						<th> 접종 간격 </th>
						<td> ${vaccine2.info_prd } </td>
					</tr>
					<tr>
						<th> 추가 접종 </th>
						<td> ${vaccine2.info_bs } </td>
					</tr>
				</table>
			</div>
		</div>
		<div class="janssen_info">
			<div class="janssen_title"><br> ▷얀센</div> <br>
			<div class="vaccine_info">
				<table class="vaccine_info_tb">
					<tr>
						<th> 생산 방식 </th>
						<td> ${vaccine3.info_vp } </td>
					</tr>
					<tr>
						<th> 접종 연령 </th>
						<td> ${vaccine3.info_ages } </td>
					</tr>
					<tr>
						<th> 접종 횟수  </th>
						<td> ${vaccine3.info_num } </td>
					</tr>
					<tr>
						<th> 접종 간격 </th>
						<td> ${vaccine3.info_prd } </td>
					</tr>
					<tr>
						<th> 추가 접종 </th>
						<td> ${vaccine3.info_bs } </td>
					</tr>
				</table>
			</div>
		</div>
		<div class="astra_info">
			<div class="astra_title"><br> ▷아스트라제네카</div><br>
			<div class="vaccine_info">
				<table class="vaccine_info_tb">
					<tr>
						<th> 생산 방식 </th>
						<td> ${vaccine4.info_vp } </td>
					</tr>
					<tr>
						<th> 접종 연령 </th>
						<td> ${vaccine4.info_ages } </td>
					</tr>
					<tr>
						<th> 접종 횟수  </th>
						<td> ${vaccine4.info_num } </td>
					</tr>
					<tr>
						<th> 접종 간격 </th>
						<td> ${vaccine4.info_prd } </td>
					</tr>
					<tr>
						<th> 추가 접종 </th>
						<td> ${vaccine4.info_bs } </td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
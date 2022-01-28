<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/info/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/foreign1.css?ver=11">
<style type="text/css">

</style>
</head>
<body>

	<div class="info_title">
		<br>[ ${Nat } 입·출국 정보 ]<br><br>
	</div>

	<div class="foreign_contents">
		
		<c:choose>
			<c:when test="${Num == 1 }">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3313740.102447098!2d125.6247104034776!3d35.79810877976146!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356455ebcb11ba9b%3A0x91249b00ba88db4b!2z64yA7ZWc66-86rWt!5e0!3m2!1sko!2skr!4v1642657351876!5m2!1sko!2skr"
					width="400" height="400" style="border: 0;" allowfullscreen=""
					loading="lazy">
					<img class="info_map">
				</iframe>
			</c:when>
			<c:when test="${Num == 2 }">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d55543285.69710573!2d-131.9749650168961!3d31.822456994483378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2z66-46rWt!5e0!3m2!1sko!2skr!4v1642653783811!5m2!1sko!2skr"
					width="400" height="400" style="border: 0;" allowfullscreen=""
					loading="lazy">
					<img class="info_map">
				</iframe>
			</c:when>
			<c:when test="${Num == 3 }">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13678908.731015066!2d128.132077354953!3d33.17272167403105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34674e0fd77f192f%3A0xf54275d47c665244!2z7J2867O4!5e0!3m2!1sko!2skr!4v1643020032043!5m2!1sko!2skr"
					width="400" height="400" style="border: 0;" allowfullscreen=""
					loading="lazy">
					<img class="info_map">
				</iframe>
			</c:when>
			<c:when test="${Num == 4 }">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26964315.526345287!2d86.04009944007676!3d34.412974635368165!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31508e64e5c642c1%3A0x951daa7c349f366f!2z7KSR6rWt!5e0!3m2!1sko!2skr!4v1643020107169!5m2!1sko!2skr"
					width="400" height="400" style="border: 0;" allowfullscreen=""
					loading="lazy">
					<img class="info_map">
				</iframe>
			</c:when>
			<c:when test="${Num == 5 }">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9555540.862912428!2d-13.446078295960936!3d54.21733434286606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x25a3b1142c791a9%3A0xc4f8a0433288257a!2z7JiB6rWt!5e0!3m2!1sko!2skr!4v1643020127635!5m2!1sko!2skr"
					width="400" height="400" style="border: 0;" allowfullscreen=""
					loading="lazy">
					<img class="info_map">
				</iframe>
			</c:when>
		</c:choose>
		<!-- <img class="info_map"> -->
		<div class="info_text">
			<font style="font-weight: bold;">입국정보</font><br>${Arr }<br>
			<font style="font-weight: bold;">자가격리면제정보</font><br>${Exp }<br>

		</div>

	</div>
	<div class="footer">
	
	</div>
</body>
</html>
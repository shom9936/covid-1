<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/info/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   
   function fn_baro(){
      window.location.href="https://ncvr2.kdca.go.kr/";
   }
   
   function fn_naver(){
      window.location.href="https://v-search.nid.naver.com/home";
   }
   
   function fn_kko(){
      window.location.href="https://www.kakaocorp.com/page/detail/9457?lang=KOR";
   }

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/vaccine2.css?ver=9">
</head>
<body>
   <div>
      <span class="vaccine_title"><br>
         백신 접종 예약
      </span>
      </div>
   <div class="vaccine_contents">
      <div class="reserve1">
         <div class="reserve1_title"><br>▷사전예약</div>
         <div class="baro" onclick="fn_baro();">사전예약</div>
      </div>
      <div class="reserve2">
         <div class="reserve2_title"><br>▷당일예약</div>
         <div class="naver"  onclick="fn_naver();">네이버 <br>예약</div>
         <div class="kko"  onclick="fn_kko();">카카오<br>예약</div></div>
   </div>
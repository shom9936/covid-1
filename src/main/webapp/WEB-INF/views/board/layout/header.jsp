<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous">
</script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<!-- common CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?ver=6">

<script>
$(document).ready(function() {
    if (window.location.href.indexOf("board") > -1) {
      $('#li_board').css({"background-color" : "gray", "color" : "black"});
    }
    else if (window.location.href.indexOf("foreign") > -1) {
        $('#li_foreign').css({"background-color" : "gray", "color" : "black"});
      }
    else if (window.location.href.indexOf("vaccine") > -1) {
        $('#li_vaccine').css({"background-color" : "gray", "color" : "black"});
      }
    else if (window.location.href.indexOf("korea") > -1) {
        $('#li_korea').css({"background-color" : "gray", "color" : "black"});
      }
    
  });
</script>

<div class="board-header">
	<br>	
	<span class="header-title">
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/index" id="goIndex">COVID-19 안내 페이지</a></h2>
	</span>
	<span class="log_button">
		<c:choose>
			<c:when test="${isLogin}">
				<button class="logout_button" type="button" onclick="location.href='/member/logout'">logout</button> &nbsp;
				<button class="login_button" type="button" onclick="location.href='/member/passwordCheck'">update</button>
			</c:when>
			<c:otherwise>
				<button class="login_button" type="button" onclick="location.href='/member/loginForm'">login</button> &nbsp;
				<button class="join_button" type="button" onclick="location.href='/member/joinForm'">join</button>
			</c:otherwise>
		</c:choose>
	</span>
</div>
<nav>
	<ul class="header-nav-ul">
		<li class="header-nav" id="li_foreign"> <a href ="/info/foreign"">해외 여행 정보</a><ul>
				<li><a href="/info/foreignNation">나라별 입·출국 정보</a></li>
				<li><a href="/info/foreign_case">해외 확진자 추세</a></li>
			</ul>
		</li>
		<li class="header-nav" id="li_vaccine"> <a href ="/info/vaccine">백신</a> 
			<ul>
				<li><a href="/info/vaccine">백신 정보</a></li>
				<li><a href="/info/vaccine_case">백신 접종 예약</a></li>
			</ul>
		</li>
		<li class="header-nav" id="li_korea"> <a href ="/info/korea">국내 코로나 현황 및 정보</a>
			<ul>
				<li><a href="/info/korea">확진자 추세</a></li>
				<li><a href="/info/korea_info">거리두기 정보</a></li>
			</ul>
		</li>
		<li class="header-nav" id="li_board"> <a href ="/board/boardList">게시판</a> 
			<ul>
				<li><a href="/board/boardList">공지사항</a></li>
				<li><a href="/board/boardList">자유게시판</a></li>
			</ul>
		</li>
	</ul>
</nav>
<br>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="index-page">
	<nav>
		<div class="foreign">
		    <label class="foreignLabel">해외 여행 정보</label>
		    <ul>
		        <li> 나라별 입.출입국 정보 </li>
		        <li> 해외 확진자 추세 </li>
		    </ul>
		</div>
		<div class="vaccine">
		    <label class="vaccineLabel">백신 정보</label>
		    <ul>
		        <div></div>
		        <li> 나라별 입.출입국 정보 </li>
		        <li> 해외 확진자 추세 </li>
		    </ul>
		</div>
		<div class="korea">
		    <label class="koreaLabel">국내 코로나 현황 및 정보</label>
		    <ul>
		        <li> 나라별 입.출입국 정보 </li>
		        <li> 해외 확진자 추세 </li>
		    </ul>
		</div>
		<div class="board">
		    <label class="boardLabel">게시판</label>
		    <ul>
		        <li> <a href="/board/boardList?boardValues=1">공지사항</a></li>
		        <li> <a href="/board/boardList?boardValues=2">자유 게시판</a> </li>
		    </ul>
		</div>
	</nav>
	<div class="home_contents">
	    <div class="home_image">
	        <img class="covid_gif" src="${pageContext.request.contextPath }/resources/img/covid19.jpg">
	    </div>
	    <div class="news_title"><br><strong>▷코로나뉴스</strong></div>
	    <div class="news_contents"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
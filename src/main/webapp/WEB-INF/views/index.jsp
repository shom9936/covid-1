<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

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
		<li> <a href="/board/mainList?boardValues=1"></a>공지사항</li>
		<li> <a href="/board/mainList?boardValues=2"></a> 2</li>
		<li> <a href="/board/mainList?boardValues=3"></a> 3</li>
		<li> <a href="/board/mainList?boardValues=4"></a> 4</li>
	</ul>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
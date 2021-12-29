<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<button type="button" class="board" onclick="location.href='list'">게시판</button>
<div class="foreign">
	<label>해외 여행 정보</label>
	<ul>
		<li> 나라별 입.출입국 정보 </li>
		<li> 해외 확진자 추세 </li>
	</ul>
</div>
<div class="vaccine">
	<label>백신 정보</label>
	<ul>
		<div></div>
		<li> 나라별 입.출입국 정보 </li>
		<li> 해외 확진자 추세 </li>
	</ul>
</div>
<div class="korea">
	<label>국내 코로나 현황 및 정보</label>
	<ul>
		<li> 나라별 입.출입국 정보 </li>
		<li> 해외 확진자 추세 </li>
	</ul>
</div>
<div class="board">
	<label>게시판</label>
	<ul>
		<li> 나라별 입.출입국 정보 </li>
		<li> 해외 확진자 추세 </li>
	</ul>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/info/layout/header.jsp" %>



<div class="index-page">
	<div class="home_contents">
	    <div class="home_image">
	        <img src="${pageContext.request.contextPath }/resources/img/covid19_1.jpg" id="mainImage" class="covid_gif" alt="slide" onclick="moving();"/>
	        <script>
				var myImage = document.getElementById("mainImage");
				var imageArray = [ "${pageContext.request.contextPath }/resources/img/covid19_1.jpg",
						"${pageContext.request.contextPath }/resources/img/covid19_2.jpg", "${pageContext.request.contextPath }/resources/img/covid19_3.jpg" ];
				var imageIndex = 0;
			
				function changeImage() {
					myImage.setAttribute("src", imageArray[imageIndex]);
					imageIndex++;
					if (imageIndex >= imageArray.length) {
						imageIndex = 0;
					}

				}
				setInterval(changeImage, 1500);
				
				function moving(){
					if(imageArray[imageIndex] == "${pageContext.request.contextPath }/resources/img/covid19_3.jpg"){
						window.location.href="/member/loginForm";
					}
				}
				
			</script>
	    </div>
	    <div class="news_title"><br><strong>▷코로나뉴스</strong></div>
	    <div class="news_contents"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
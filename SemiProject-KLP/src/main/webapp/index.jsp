<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .slider-container {
     width: 600px;
     height: 320px;
     overflow: hidden;
     border-radius: 30px;
     margin: 50px auto;
 }
  .slider {
     width: 1800px; /* (600px * 3) */
     height: 320px;
     display: flex;
     transition: transform 0.5s ease;
     border: 1px solid black;
     align-self: center;
 }
 
 .slide {
     width: 600px;
     height: 350px;
     align-self: center;
 }

 .slide img {
     align-content: center;
     width: 100%;
     height: 100%;
     object-fit: cover;
 }

 .prev, .next {
     position: absolute;
     top: 42%;
     transform: translateY(-50%);
     background-color: rgba(255, 255, 255, 0.5);
     color: #333;
     font-size: 24px;
     padding: 10px;
     cursor: pointer;
     transition: background-color 0.3s ease;
 }

 .prev:hover, .next:hover {
     background-color: rgba(0, 0, 0, 0.5);
     color: #fff;
 }
 
 .prev {
     left: 150px;
 }

 .next {
     right: 150px;
 }
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="slider-container">
        <div class="slider" style="transform: translateX(0px);">
            <div class="slide"><img src="<%=request.getContextPath() %>/image/banner/banner1.jpg" alt="Slide 1"></div>
            <div class="slide"><img src="<%=request.getContextPath() %>/image/banner/banner2.jpeg" alt="Slide 2"></div>
            <div class="slide"><img src="<%=request.getContextPath() %>/image/banner/banner3.jpg" alt="Slide 3"></div>
        </div>
        <div class="prev">❮</div>
        <div class="next">❯</div>
    </div>
	 
	<div>
	<% if(loginMember != null){ %>
		<h2><%=loginMember.getMemberName()%>님 안녕하세요 :)</h2>
	<%} %>
	</div>
	<br><br><br>
	<a href="<%=request.getContextPath()%>/feed/feedView.do">피드</a>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/report/reportList.do')">신고내역</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/noticelist.do')">공지사항</button>
	</div>
	<div>
		<button onclick="">아티스트</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/faqlist.do')">faq</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/home.do')">관리자페이지</button>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</html>
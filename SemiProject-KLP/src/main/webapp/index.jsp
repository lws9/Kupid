<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	안녕하세요 12321ㅇㅈㅇㄴㅁㅇㅇㄴㄴ
	 
	<div>
	<% if(loginMember == null){ %>
		<button onclick="location.assign('<%=request.getContextPath()%>/login.do')">로그인</button>
	<%}else{ %>
		<h2><%=loginMember.getMemberName()%>님 안녕하세요 :)</h2>
		<button onclick="location.assign('<%=request.getContextPath()%>/logout.do')">로그아웃</button>
	<%} %>
	</div>
	<br><br><br>
	<a href="<%=request.getContextPath()%>/feed/feedView.do">피드</a>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/report/reportList.do')">신고내역</button>
	</div>
	<br><br><br>
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
		<button onclick="location.assign('<%=request.getContextPath()%>/mypage/myprofile.do?pagenum=1')">마이페이지</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/home.do')">관리자페이지</button>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</html>
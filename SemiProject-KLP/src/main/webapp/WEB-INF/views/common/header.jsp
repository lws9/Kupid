<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kupid.member.model.dto.MemberDto" %>
<script src = "<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>

<%
	MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	String saveid = null;
	for(Cookie c : cookies) {
		//쿠키에 저장된 네임과 밸류 가져오기
		if(c.getName().equals("saveid")){
			saveid = c.getValue();
		}
	}
	String servletHistory=request.getParameter("return");
%>

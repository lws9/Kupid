<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.manager.inquiry.model.dto.Inquiry" %>
<%
	List<Inquiry> inq=(List<Inquiry>)request.getAttribute("inquiry");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{
   /* width:80%; */
   display:table;
   padding:0px;
   margin:auto;
}
ul li { 
   list-style-type: none; 
   width: 8em; 
   height: 2em;
   float: left; 
   text-align: center; 
   font-family: "휴먼모음T", sans-serif; 
   border-left: 1px #00bcd4 solid;
   background-color: #5283de; 
}
ul li:last-of-type{border-right:1px #00bcd4 solid;;}
ul li a {
   display: block;
   padding:.5em;
   text-decoration: none;
   color: #292929;
}

/* hover시 배경색 변경 */
ul li:hover{
   background-color: #3300ff;
}
ul li:hover > a{
   color:#FFF; /* 글자색*/
}
.inq-container{
	display:flex;
}
.inq-sec{
	width:85%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.table-size{
	width:85%;
	height:650px;
	font-size:30px;
	border :1px solid blue;
}
</style>
</head>
<body>
<div class="inq-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
<div class="inq-sec">
	<h1>문의</h1>
	<table class="table-size">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
		</tr>
	<%if(inq!=null){ %>
			<%for(Inquiry i : inq){ %>
			<tr>
				<td><%=i.getInqNo()%></td>
				<td><%=i.getInqTitle()%></td>
				<td><%=i.getInqDate()%></td>
				<td><%=i.getWriter()%></td>
				<%if(i.isAnswer()){ %>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/answerinsert.do?no=<%=i.getInqNo()%>')">답변</button></td>
				<%}else{ %>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/answerupdate.do?no=<%=i.getInqNo()%>')">수정</button></td>
				<%} %>
			</tr>
			<%} 
		}else{%>
			<tr><td>문의내역이 없습니다</td></tr>
		<%} %>
	</table>
		<div><%=pagebar %></div>
	</div>
</div>
</body>
</html>
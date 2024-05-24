<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.manager.faq.model.dto.Faq" %>
<%
	List<Faq> faqs=(List<Faq>)request.getAttribute("faq");
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
.faq-container{
	display:flex;
}
.faq-sec{
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
.top-categry{
	display:flex;
	border :1px solid blue;
	width:100%;
}
</style>
</head>
<body>

<div class="faq-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
<div class="faq-sec">
	<div class="top-categry">
		<span><button>faq</button></span>
		<span><button onclick="location.assign('<%=request.getContextPath()%>/manager/inquirylist.do')">문의</button></span>
	</div>
		<h1>FAQ</h1>
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		
			<%if(faqs!=null){ %>
				<%for(Faq f : faqs){ %>
				<tr>
					<td><%=f.getFaqNo()%></td>
					<td><%=f.getFaqCategory()%></td>
					<td><%=f.getFaqTitle()%></td>
					<td><%=f.getFaqDate()%></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/faqupdate.do?no=<%=f.getFaqNo()%>')">수정</button></td>
					<td><button onclick="deleteFaq(<%=f.getFaqNo()%>);">삭제</button></td>
				</tr>
				<%} 
			}else{%>
				<span>등록된 faq가 없습니다</span>
			<%} %>
		</table>
			<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/faqinsert.do')">작성</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>

	<script>
		const deleteFaq=(n)=>{
			if(confirm("정말 삭제 하시겠습니까?")){
				location.assign("<%=request.getContextPath()%>/manager/faqdelete.do?no="+n)
			}else{
				alert("삭제가 취소되었습니다");
			}
		}
	</script>

</body>
</html>


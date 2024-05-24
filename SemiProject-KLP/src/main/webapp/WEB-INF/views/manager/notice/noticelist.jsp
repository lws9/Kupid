<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.manager.notice.model.dto.Notice" %>
<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notice");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	String searchType=request.getParameter("searchType");
	String searchKeyword=request.getParameter("searchKeyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
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
.notice-container{
	display: flex;
	
}
.notice-sec{
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
.section{
	width:95%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.btn{
	float: right;
}

div#search-일반{display:inline-block;}
div#search-굿즈{display:none;}
div#search-행사{display:none;}
</style>
</head>
<body>
<div class="notice-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
	<div class="notice-sec">
		<h1>공지사항</h1>
		<h1>
			<div>
				<select id="searchType">
		       		<option value="일반" <%=searchType!=null&&searchType.equals("일반")?"selected":"" %>>일반</option>
		        	<option value="굿즈" <%=searchType!=null&&searchType.equals("굿즈")?"selected":"" %>>굿즈</option>
		        	<option value="행사" <%=searchType!=null&&searchType.equals("행사")?"selected":"" %>>행사</option>
	        	</select>
	        	<div id="search-일반">
					<form action="<%=request.getContextPath()%>/manager/searchNotice.do">
						<input type="hidden" name="searchType" value="일반">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
				<div id="search-굿즈">
					<form action="<%=request.getContextPath()%>/manager/searchNotice.do">
						<input type="hidden" name="searchType" value="굿즈">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
				<div id="search-행사">
					<form action="<%=request.getContextPath()%>/manager/searchNotice.do">
						<input type="hidden" name="searchType" value="행사">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
			</div> 
		</h1>
		<section class="section">
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>카테고리</th>
				<th style="text-align:left;">제목</th>
				<th>작성일</th>
			</tr>
		
			<%if(notices!=null){ %>
				<%for(Notice n : notices){ %>
				<tr>
					<td style="text-align:center;"><%=n.getNoticeNo()%></td>
					<td style="text-align:center;"><%=n.getNoticeCategory()%></td>
					<td><%=n.getNoticeTitle() %></td>
					<td style="text-align:center;"><%=n.getNoticeDate() %></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/noticeupdate.do?no=<%=n.getNoticeNo()%>')">수정</button></td>
					<td><button onclick="deleteNotice(<%=n.getNoticeNo()%>);">삭제</button></td>
				</tr>
				<%} 
			}else{%>
				<span>공지사항이 없습니다</span>
			<%} %>
		</table>
		</section>
			<div class="btn"><button onclick="location.assign('<%=request.getContextPath()%>/manager/noticeinsert.do')">작성</button></div>
			<br><br>
			<div><%=pagebar %></div>
	</div>
</div>
	<script>
		const deleteNotice=(n)=>{
			if(confirm("정말 삭제 하시겠습니까?")){
				location.assign("<%=request.getContextPath()%>/manager/noticedelete.do?no="+n)
			}else{
				alert("삭제가 취소되었습니다");
			}
		}
		
		$(()=>{
	    	 $("#searchType").change();
	     })
	     
	     
	     $("#searchType").change(e=>{
     			const type=e.target.value;
     			$(e.target).parent().children("div").hide();
     			/* $("#search-container>div").hide(); */
     			$("#search-"+type).css("display","inline-block");
     		})
	</script>
	
</body>
</html>
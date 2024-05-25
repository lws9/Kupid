<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.member.model.dto.MemberDto" %>
<%
	List<MemberDto> member=(List<MemberDto>)request.getAttribute("member");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	String searchType=request.getParameter("searchType");
	String searchKeyword=request.getParameter("searchKeyword");
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
.member-container{
	display: flex;
	
}
.member-sec{
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

</style>
</head>
<body>
<div class="member-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
	<div class="member-sec">
		<h1>MEMBER</h1>
		<h1>
			<div>
				<select id="searchType">
		       		<option value="member_name" <%=searchType!=null&&searchType.equals("member_name")?"selected":"" %>>이름</option>
		        	<option value="member_id" <%=searchType!=null&&searchType.equals("member_id")?"selected":"" %>>아이디</option>
		        	<option value="nickname" <%=searchType!=null&&searchType.equals("nickname")?"selected":"" %>>닉네임</option>
	        	</select>
	        	<div id="search-member_name">
					<form action="<%=request.getContextPath()%>/manager/searchMember.do">
						<input type="hidden" name="searchType" value="member_name">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
				<div id="search-member_id">
					<form action="<%=request.getContextPath()%>/manager/searchMember.do">
						<input type="hidden" name="searchType" value="member_id">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
				<div id="search-nickname">
					<form action="<%=request.getContextPath()%>/manager/searchMember.do">
						<input type="hidden" name="searchType" value="nickname">
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
				<th>이름</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>가입일</th>
				
				
			</tr>
			<%if(member!=null){ %>
				<%for(MemberDto m : member){ %>
				<tr>
					<td style="text-align:center;"><%=m.getMemberNo()%></td>
					<td style="text-align:center;"><%=m.getMemberName()%></td>
					<td style="text-align:center;"><%=m.getMemberId()%></td>
					<td style="text-align:center;"><%=m.getNickname() %></td>
					<td style="text-align:center;"><%=m.getEnrollDate() %></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/memberview.do?no=<%=m.getMemberNo()%>')">상세정보</button></td>
					<td><button onclick="deleteMember(<%=m.getMemberNo()%>);">회원삭제</button></td>
				</tr>
				<%} 
			}else{%>
				<span>회원이 없습니다</span>
			<%} %>
		</table>
		</section>
			
			<br><br>
			<div><%=pagebar %></div>
		</div>
	</div>
</div>
<script>
const deleteMember=(n)=>{
	if(confirm("정말 삭제 하시겠습니까?")){
		location.assign("<%=request.getContextPath()%>/manager/memberdelete.do?no="+n);
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
     			$("#search-"+type).css("display","inline-block");
     		})
	</script>
</body>
</html>
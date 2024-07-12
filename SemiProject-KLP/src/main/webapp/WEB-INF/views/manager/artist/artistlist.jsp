<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List,com.kupid.member.model.dto.MemberDto" %>
<%
	List<MemberDto> artist=(List<MemberDto>)request.getAttribute("artist");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	String searchType=request.getParameter("searchType");
	String searchKeyword=request.getParameter("searchKeyword");
%>
<!DOCTYPE html>
<html>
<body>
<style>
 ul{
   /* width:80%; */
   display:table;
   padding:0px;
   margin:auto;
}
ul li { 
   list-style-type: none; 
   width: 5em; 
   height: 2em;
   float: left; 
   text-align: center; 
   font-family: "�޸ո���T", sans-serif;  
   border-left: 1px white solid;
   background-color: lightgray; 
   border-radius: 9px;
   margin-left: 2px;
   margin-right:2px;
}

ul li:last-of-type{background-color: white; } 
ul li:first-of-type{background-color: white;} 

ul li a {
   display: block;
   padding:.5em;
   text-decoration: none;
   color: #292929;
}
ul li span {
   display: block;
   padding:.5em;
   text-decoration: none;
   color: #292929;
   background-color: #d1ade3;
   border-radius: 9px;
   height: 1em;
   background-color: white;
}
#nowpage{
   display: block;
   padding:.5em;
   text-decoration: none;
   color: #292929;
   background-color: #d1ade3;
   border-radius: 9px;
   height: 1em;
}

/* hover�� ���� ���� */
ul li:hover{
   background-color: #d1ade3;
}
ul li:hover > a{
   color:#FFF; /* ���ڻ�*/
}
.artist-container{
	display: flex;
	
}
.artist-sec{
	width:85%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
	
}
.section{
	width:95%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
} */


/*gpt css  */


.artist-sec h1 div {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.artist-sec select {
    font-size: 14px;
    padding: 10px;
    margin-right: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;

}

.artist-sec form {
    display: inline-block;
    margin: 0;
}

.artist-sec input[type="text"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-right: 5px;
}

.artist-sec button {
    background-color: lightgray;
    color: black;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.artist-sec button:hover {
    background-color: #d1ade3;;
}

.section {
    margin-top: 20px;
}


.table-size th, .table-size td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.table-size th {
    background-color: #faf0ff;/*������*/
    font-weight: bold;
}

.table-size td button {
    /* background-color: #e9bcff;/*����*/ */
    background-color:lightgray;
    color: black;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.table-size td button:hover {
    background-color: #d1ade3;/*������*/
}

.btn {
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
    width: 100%;
    padding-right: 15%;
}

.btn button {
    background-color: #e9bcff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}


.btn button:hover {
    background-color: #d1ade3;
}

.pagebar {
    text-align: center;
    margin-top: 20px;
}
</style>
</head>
<body>
<div class="artist-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
<div class="artist-sec">
		<h1>ARTIST</h1>

			<div>
				<select id="searchType">
		       		<option value="group_name" <%=searchType!=null&&searchType.equals("group_name")?"selected":"" %>>�׷��</option>
		        	<option value="member_name" <%=searchType!=null&&searchType.equals("member_name")?"selected":"" %>>�̸�</option>
		        	<option value="group_company" <%=searchType!=null&&searchType.equals("group_company")?"selected":"" %>>�Ҽӻ�</option>
	        	</select>
	        	<div id="search-member_name">
					<form action="<%=request.getContextPath()%>/manager/searchArtist.do">
						<input type="hidden" name="searchType" value="member_name">
						<input type="text" name="searchKeyword" placeholder="�˻��� ������ �Է��ϼ���" style="width:300px">
						<button type="submit">�˻�</button>
					</form>
				</div>
				<div id="search-group_name">
					<form action="<%=request.getContextPath()%>/manager/searchArtist.do">
						<input type="hidden" name="searchType" value="group_name">
						<input type="text" name="searchKeyword" placeholder="�˻��� ������ �Է��ϼ���" style="width:300px">
						<button type="submit">�˻�</button>
					</form>
				</div>
				<div id="search-group_company">
					<form action="<%=request.getContextPath()%>/manager/searchArtist.do">
						<input type="hidden" name="searchType" value="group_company">
						<input type="text" name="searchKeyword" placeholder="�˻��� ������ �Է��ϼ���" style="width:300px">
						<button type="submit">�˻�</button>
					</form>
				</div>
			</div> 
		</h1>
		
		<section class="section">
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>�׷��</th>
				<th>�̸�</th>
				<th>�Ҽӻ�</th>
				<th>�����</th>
				<th colspan="2"></th>
			</tr>
		
			<%if(artist!=null){ %>
				<%for(MemberDto m : artist){ %>
				<tr>
					<td><%=m.getMemberNo()%></td>
					<td><%=m.getGroupName()%></td>
					<td><%=m.getMemberName()%></td>
					<td><%=m.getGroupCompany()%></td>
					<td><%=m.getEnrollDate()%></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/artistupdate.do?no=<%=m.getMemberNo()%>')">������</button></td>
					<td><button onclick="deleteArtist(<%=m.getMemberNo()%>);">����</button></td>
				</tr>
				<%} 
			}else{%>
				<span>��ϵ� artist�� �����ϴ�</span>
			<%} %>
		</table>
		</section>
			<div class="btn"><button onclick="location.assign('<%=request.getContextPath()%>/manager/artistinsert.do')">���</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>
<script>
const deleteArtist=(n)=>{
	if(confirm("���� ���� �Ͻðڽ��ϱ�?")){
		location.assign("<%=request.getContextPath()%>/manager/memberdelete.do?no="+n)
	}else{
		alert("������ ��ҵǾ����ϴ�");
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
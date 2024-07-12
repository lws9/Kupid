<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List,com.kupid.group.model.dto.GroupDto" %>
<%
	List<GroupDto> group=(List<GroupDto>)request.getAttribute("group");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
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
.group-container{
	display: flex;
	
}
.group-sec{
	width:85%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
	
}
.table-size{
	width:85%;
	height:650px;
	font-size:30px;

}
.section{
	width:95%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
} */


/*gpt css  */


.group-sec h1 div {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.group-sec select {
    font-size: 14px;
    padding: 10px;
    margin-right: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;

}

.group-sec form {
    display: inline-block;
    margin: 0;
}

.group-sec input[type="text"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-right: 5px;
}

.group-sec button {
    background-color: lightgray;
    color: black;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.group-sec button:hover {
    background-color: #d1ade3;;
}

.section {
    margin-top: 20px;
}

.table-size {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
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

<div class="group-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
<div class="group-sec">
		<h1>GROUP</h1>
	
		<div>
			<form action="<%=request.getContextPath()%>/manager/searchgroup.do">
							<input type="text" name="searchKeyword" placeholder="�˻��� �׷���� �Է��ϼ���" style="width:300px">
							<button type="submit">�˻�</button>
			</form>
		</div>
		<section class="section">
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>�׷��</th>
				<th>�Ҽӻ�</th>
				<th>�����</th>
				<th>������</th>
				<th colspan="2"></th>
			</tr>
		
			<%if(group!=null){ %>
				<%for(GroupDto m : group){ %>
				<tr>
					<td><%=m.getGroupNo()%></td>
					<td><%=m.getGroupName()%></td>
					<td><%=m.getGroupCompany()%></td>
					<td><%=m.getMemberCount()%></td>
					<td><%=m.getGroupDebutday()%></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/groupupdate.do?no=<%=m.getGroupNo()%>')">����</button></td>
					<td><button onclick="deleteGroup(<%=m.getGroupNo()%>);">����</button></td>
				</tr>
				<%} 
			}else{%>
				<span>��ϵ� group�� �����ϴ�</span>
			<%} %>
		</table>
		</section>
			<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/groupinsert.do')">���</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>
<script>
const deleteGroup=(n)=>{
	if(confirm("���� ���� �Ͻðڽ��ϱ�?")){
		location.assign("<%=request.getContextPath()%>/manager/groupdelete.do?no="+n)
	}else{
		alert("������ ��ҵǾ����ϴ�");
	}
}
</script>
</body>
</html>
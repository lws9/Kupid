<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.group.model.dto.GroupDto" %>      
<%
	GroupDto g=(GroupDto)request.getAttribute("group");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<div class="myInfo-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
    <main class="main">
        <section class="myInfo">
            <div class="flex_col">
                <h1 class="title">GROUP 수정</h1>
                <div class="content_box">
                    <div class="flex_row">
                        <form action="<%=request.getContextPath()%>/manager/groupupdateend.do?no=<%=g.getGroupNo()%>" method="post">
                       	<div class="content-container">
                            <h3>그룹명</h3>
                            	<div class="input_box">
									<input type="text" name="name" value="<%=g.getGroupName()%>" class="inputTag" required>
								</div>
							<h3>멤버수</h3>
                           	<div class="input_box">
								<input type="number" name="count" value="<%=g.getMemberCount()%>" class="inputTag" required>
							</div>
							<h3>소속사</h3>
                           	<div class="input_box">
								<input type="text" name="company" value="<%=g.getGroupCompany()%>" class="inputTag" required>
							</div>
							<h3>사진</h3>
                           	<div class="input_box">
								<input type="file" name="img"  value="<%=g.getGroupImg()%>" class="inputTag" required>
							</div>								    
                           	<br>
	                		<button name="submit" class="btn">수정</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="java.util.List,com.kupid.faq.model.dto.FaqDto,java.text.SimpleDateFormat" %>
	<%@ page import="com.kupid.faq.model.dto.FaqDto" %>
	
	<% List<FaqDto> faqs = (List<FaqDto>) request.getAttribute("faq");
	  StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	  String category=request.getParameter("category");
	String searchKeyword=request.getParameter("searchkeyword");
	%>
	
	<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <title>FAQ</title>
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	        }
	        .faq-header {
	            text-align: center;
	            margin: 20px 0;
	        }
	        .search-container {
	            text-align: center;
	            margin-bottom: 20px;
	        }
	        .search-container select,
	        .search-container input[type="text"] {
	            margin: 0 5px;
	            padding: 5px;
	        }
	        table {
	            width: 80%;
	            margin: 0 auto;
	            border-collapse: collapse;
	        }
	        table, th, td {
	            border: 1px solid #ddd;
	        }
	        th, td {
	            padding: 10px;
	            text-align: center;
	        }
	        .pagination {
	            text-align: center;
	            margin: 20px 0;
	        }
	        .pagination button {
	            padding: 5px 10px;
	            margin: 0 5px;
	        }
	        .footer {
	            text-align: center;
	            margin: 20px 0;
	        }
	        .pagination ul {
		    list-style: none; 
		    padding: 0;
			}
		
			.pagination li {
			    display: inline; 
			    margin-right: 5px; 
			}
		        
	    </style>
	</head>
	<body>
	    <div class="faq-header">
	        <h1>FAQ</h1>
	    </div>
	   <div class="search-container">
	        <label for="category">카테고리:</label>
	        <form action="<%=request.getContextPath()%>/faq/faqserch.do" method="get">
		        <select id="category" name="category">
		            <option value="all">전체</option>
					<option value="회원" <%=category!=null&&category.equals("회원")?"selected:":"" %>>회원</option>
		            <option value="상점" <%=category!=null&&category.equals("상점")?"selected:":"" %>>상점</option>
		            <option value="커뮤니티" <%=category!=null&&category.equals("커뮤니티")?"selected:":"" %>>커뮤니티</option>
		        </select>
		        <input type="text" id="search" name="searchKeyword" placeholder="검색어 입력">
		        <button type="submit" >검색</button>
	  		</form>
    	</div>
	    <table>
	        <thead>
	            <tr>
	                <th>No</th>
	                <th>카테고리</th>
	                <th>제목</th>
	                <th>내용</th>
	                <th>작성날짜</th>
	            </tr>
	        </thead>
	        <tbody>
	    <% if(faqs != null) { %>
	        <% for(FaqDto f : faqs) { %>
	            <tr>
	                <td><%= f.getFaqNo() %></td>
	                <td><%= f.getFaqCategory() %></td>
	                <td><%= f.getFaqTitle() %></td>
	                <td><%= f.getFaqContent() %></td>
	                <td><%= new SimpleDateFormat("yyyy-MM-dd").format(f.getFaqDate()) %></td>
	            </tr>
	        <% } %>
	    <% } else { %>
	        <tr>
	            <td colspan="5"><span>등록된 FAQ가 없습니다</span></td>
	        </tr>
	    <% } %>
	        </tbody>
	    </table>
	    <div class="pagination">
	        <%=pagebar.toString()%>
	    </div>
	    <div class="footer">
	        <button type="button" onclick="location.assign('<%=request.getContextPath()%>/customer/customermain.do')">고객센터 바로가기</button>
	        <button type="button" onclick="location.assign('<%=request.getContextPath()%>/inquiry/inquiry.do')">1:1 문의하기</button>
	    </div>
	</body>
	</html>
	

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <div class="faq-header">
        <h1>FAQ</h1>
    </div>
    <div class="search-container">
        <label for="category">카테고리:</label>
        <select id="category" name="category">
            <option value="all">전체</option>
            <option value="category1">회원</option>
            <option value="category2">상점</option>
            <option value="category3">커뮤니티</option>
        </select>
        <input type="text" id="search" name="search" placeholder="검색어 입력">
        <button type="button" onclick="searchFAQ()">검색</button>
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
 <%--            <% 
                // 데이터베이스에서 FAQ 목록을 불러와야함
                String[][] faqData = {
                    {"1", "카테고리 1", "제목 1", "2024-05-01", "100"},
                    {"2", "카테고리 2", "제목 2", "2024-05-02", "150"},
                    
                };

                for(int i = 0; i < faqData.length; i++) {
            %>
            <tr>
                <td><%= faqData[i][0] %></td>
                <td><%= faqData[i][1] %></td>
                <td><%= faqData[i][2] %></td>
                <td><%= faqData[i][3] %></td>
                <td><%= faqData[i][4] %></td>
                <td><%= faqData[i][5] %></td>
                <td><%= faqData[i][6] %></td>
                <td><%= faqData[i][7] %></td>
                <td><%= faqData[i][8] %></td>
                <td><%= faqData[i][9] %></td>
            </tr>
            <% } %> --%>
        </tbody>
    </table>
    <div class="pagination">
        <button type="button" onclick="prevPage()">이전</button>
     <!--  페이지 설정해주는거 추가해야됨 -->
        <button type="button" onclick="nextPage()">다음</button>
    </div>
    <div class="footer">
        <button type="button" 
        onclick="location.assign('<%=request.getContextPath()%>/customer/customermain.do')">고객센터 바로가기</button>
        <button type="button" 
         onclick="location.assign('<%=request.getContextPath()%>/inquiry/inquiry.do')">1:1 문의하기</button>
    </div>
    <script>
     
        function searchFAQ() {
            var category = document.getElementById('category').value;
            var search = document.getElementById('search').value;
            
            alert('검색어: ' + search + ', 카테고리: ' + category);
        }

      
        function prevPage() {
            // 이전 페이지로 이동하는 로직 구현
            alert('이전 페이지로 이동');
        }

        function nextPage() {
            // 다음 페이지로 이동하는 로직 구현
            alert('다음 페이지로 이동');
        }

  


    </script>
</body>
</html>
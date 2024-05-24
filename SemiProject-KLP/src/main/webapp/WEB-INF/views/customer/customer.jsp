<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.faq.model.dto.Faq,java.text.SimpleDateFormat"%>     
<%@ include file="/WEB-INF/views/common/header.jsp" %>  

    <title>kupid 고객센터</title>
    <style>
       
        body {
            font-family: Arial, sans-serif;
        }
        .center-header {
            text-align: center;
            margin: 20px 0;
        }
        .search-container {
            text-align: center;
            margin: 20px 0;
        }
        .search-container input[type="text"] {
            padding: 5px;
            width: 300px;
        }
        .search-container button {
            padding: 5px 10px;
        }
        .button-container {
            text-align: center;
            margin: 20px 0;
        }
        .button-container button {
            padding: 15px 30px;
            margin: 10px;
            font-size: 16px;
            cursor: pointer;
        }
        .pagination {
            text-align: center;
            margin: 20px 0;
        }
        .pagination button {
            padding: 5px 10px;
            margin: 0 5px;
        }
        .faq-section {
            text-align: center;
  		    padding: 20px;
		}
		
		.faq-section h1 {
		    text-align: left;
            text-align: center;
		}
		
		.faq-buttons {
		    margin-bottom: 20px;
		}
		
		.faq-buttons button {
		    margin-right: 10px;
		    padding: 10px 20px;
		    cursor: pointer;
		}
		
		.faq-list {
		    margin-top: 20px;
		}
		
		.help-section {
		    margin-top: 40px;
		    padding: 20px;
		    background-color: #f9f9f9;
		    text-align: center;
		}
		
		.help-section h2 {
		    font-weight: bold;
		}
		
		.help-section p a {
		    text-decoration: none;
		    color: blue;
		}
    </style>
</head>
<body>
    <div class="center-header">
        <h1>kupid 고객센터</h1>
    </div>
    <div class="search-container">
        <label for="problem-description">문제를 설명해주세요:</label>
        <input type="text" id="problem-description" name="problem-description" placeholder="질문 또는 키워드를 입력하세요">
        <button type="button" onclick="searchimgbutton">
  		<img src="C:\Users\user\Downloads\free-icon-magnifying-glass-4475396.png"/>
		</button>
    </div>
    <div class="button-container">
        <button type="button" onclick="handlePayment()">회원</button>
        <button type="button" onclick="handleAccount()">상점</button>
        <button type="button" onclick="handleCommunity()">커뮤니티</button>
    </div>
	<div class="faq-section">
        <h1>대표 FAQ</h1>
        <div class="faq-buttons">
            <button onclick="showFAQ('member')">회원</button>
            <button onclick="showFAQ('store')">상점</button>
            <button onclick="showFAQ('community')">커뮤니티</button>
        </div>
        <div>
        	<button class="btn btn-outline-primary" 
        	onclick="location.assign('<%=request.getContextPath()%>/faq/faq.do')">FAQ 바로가기</button>
        </div>
        <div id="faq-list" class="faq-list"></div>
    </div>

    <div class="help-section">
        <h2>도움이 필요하신가요?</h2>
        <button class="btn btn-outline-primary"
        onclick="location.assign('<%=request.getContextPath()%>/inquiry/inquiry.do')">문의하기</button>
    </div>

    <script src="scripts.js"></script>
 
    <script>
        // 검색 기능 구현 
        function searchProblem() {
            var description = document.getElementById('problem-description').value;
            // 검색 로직 구현
            alert('검색어: ' + description);
        }

        // 버튼 클릭 이벤트
        function handlePayment() {
            alert('회원관련 도움말로 이동');
        }

        function handleAccount() {
            alert('상점관련 도움말로 이동');
        }

        function handleCommunity() {
            alert('커뮤니티 관련 도움말로 이동');
        }

        const faqData = {
        	    member: [
        	        "회원 가입 방법",
        	        "회원 정보 수정",
        	        "비밀번호 재설정",
        	        "회원 탈퇴 방법",
        	        "계정 복구 방법"
        	    ],
        	    store: [
        	        "상점 등록 방법",
        	        "상품 등록 방법",
        	        "상점 정보 수정",
        	        "판매 내역 확인",
        	        "상점 탈퇴 방법"
        	    ],
        	    community: [
        	        "커뮤니티 참여 방법",
        	        "게시글 작성 방법",
        	        "댓글 작성 방법",
        	        "커뮤니티 규칙",
        	        "게시글 삭제 방법"
        	    ]
        	};

        	function showFAQ(category) {
        	    const faqListDiv = document.getElementById('faq-list');
        	    faqListDiv.innerHTML = ''; 

        	    const faqItems = faqData[category];
        	    faqItems.forEach((faq, index) => {
        	        if (index < 5) { // 
        	            const faqItem = document.createElement('div');
        	            faqItem.textContent = faq;
        	            faqListDiv.appendChild(faqItem);
        	        }
        	    });
        	}

    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        /* 간단한 스타일링 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .navigation {
            text-align: right;
            margin-bottom: 20px;
        }
        .navigation a {
            text-decoration: none;
            color: #333;
            margin-left: 10px;
        }
        .product {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            overflow: hidden;
        }
        .product img {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
        .product h2 {
            margin-top: 0;
        }
        .product p {
            margin: 10px 0;
        }
        .product .price {
            font-weight: bold;
            color: #ff6600;
        }
        .button {
            padding: 10px 20px;
            background-color: #ff6600;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #e55a00;
        }
        .fine-print {
            margin-top: 20px;
            font-style: italic;
            color: #666;
        }
        .article {
            line-height: 1.6;
            color: #333;
        }
    </style>
</head>
<body>
	 <div class="container">
        <div class="navigation">
            <a href="#">KUPID</a>
            <a href="#">공지사항</a>
            <a href="#">고객센터</a>
            <a href="#">장바구니</a>
        </div>
        <div class="product">
            <h2>BTS ALBUM</h2>
            <p>Subheading</p>
            <p class="price">21,800원</p>
            <button class="button">장바구니</button>
            <button class="button">구매</button>
            <p class="fine-print">Text box for additional details or fine print</p>
        </div>
        <div class="article">
            <p>Excepteur efficient emerging, minim veniam anim aute carefully curated Ginza conversation exquisite perfect nostrud nisi intricate Content. Qui international first-class nulla ut. Punctual adipisicing, essential lovely queen tempor eiusmod irure. Exclusive izakaya charming Scandinavian impeccable aute quality of life soft power pariatur Melbourne occaecat discerning. Qui wardrobe aliquip, et Porter destination Toto remarkable officia Helsinki excepteur Basset hound. Zürich sleepy perfect consectetur.</p>
            <p>Exquisite sophisticated iconic cutting-edge laborum deserunt Addis Ababa esse bureaux cupidatat id minim. Sharp classic the best commodo nostrud delightful. Conversation aute Rochester id. Qui sunt remarkable deserunt intricate airport handsome K-pop excepteur classic esse Asia-Pacific laboris.</p>
        </div>
        <div class="pagination">
            <a href="#">Topic</a>
            <a href="#">Topic</a>
            <a href="#">Topic</a>
            <a href="#">Page</a>
            <!-- 추가 페이지 및 주제 링크 -->
        </div>
    </div>
</body>
</html>
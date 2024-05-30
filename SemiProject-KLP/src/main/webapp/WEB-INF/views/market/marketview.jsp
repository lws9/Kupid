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
        .container1 {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
            width:100%;
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
        	display: flex;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 40px;
            overflow: hidden;
            
        }
        .product img {
            max-width: 100%;
            height: auto;
            margin-bottom: 40px;
        }
        .product h2 {
            margin-top: 0;
        }
        .product p {
            margin: 10px 0;
        }
        .product .price {
            font-weight: bold;
            font-size: 40px;
        }
        .button {
            padding: 10px 20px;
            background-color: #e9bcff;
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
	.marketprice{
		width: 100%;
		padding-left: 50px;
	}
	
	.membership-info {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #f9f9f9;
}

.membership-info dl {
    margin: 0;
    padding: 0;
}

.membership-info dt {
    font-weight: bold;
    margin-bottom: 5px;
}

.membership-info dd {
    margin-bottom: 10px;
}

.membership-info .attention {
    color: #ff0000;
    font-style: italic;
}
    </style>
</head>
<body>
     <%@ include file="/WEB-INF/views/common/header.jsp"%>
	 <div class="container">
        <div class="product">
       		<img src="https://cdn-contents.weverseshop.io/public/shop/8089acae4f647f847a5ed7beeadc8230.png?q=95&w=720" width="500px" height="600px">
            <div class="marketprice">
            	<h2>RIIZE MEMBERSHIP</h2>
	            <p>Subheading</p>
	            <p class="price">30,000원</p>
	            <!-- <button class="button">장바구니</button> -->
	            <button class="button" onclick="location.assign('<%=request.getContextPath()%>/membershipinsert.do?no=<%=loginMember.getMemberNo()%>')">구매</button>
            </div>
        </div>
        <div class="article">
        	<div class="membership-info">
    <dl>
        <dt>안내사항</dt>
        <dd>RIIZE OFFICIAL FANCLUB BRIIZE MEMBERSHIP(이하 멤버십)은 상시 가입 가능합니다. (멤버십 유효기간 : 가입일로부터 365일)</dd>
        <dd>하나의 계정으로 해당 아티스트의 오픈된 모든 국가샵의 멤버십 구매가 가능합니다.</dd>
        <dd>위버스(Weverse)와 위버스샵(Weverse Shop)에서 동일한 계정을 사용하셔야 정상적으로 멤버십 혜택을 받으실 수 있습니다.</dd>
        <dd>멤버십 가입 후 7일 이내 환불 가능합니다. 단, 일부라도 멤버십 혜택을 받은 경우 환불이 불가합니다.</dd>
        <dd class="attention">※하단 상품 상세 이미지에 나온 1) 가입 혜택 2) 기타 안내사항 3) 자주 묻는 질문을 필독해 주세요※</dd>
    </dl>
</div>
        	<!-- <div class="sc-c288ee72-20">
	        	<dl class="sc-be4a1006-0 bvraTF">
	        	<dt class="sc-be4a1006-1 exLTfv">안내사항</dt>
	        	<dd class="sc-be4a1006-2 gIdytb">RIIZE OFFICIAL FANCLUB BRIIZE MEMBERSHIP(이하 멤버십)은 상시 가입 가능합니다. (멤버십 유효기간 : 가입일로부터 365일)</dd>
	        	<dd class="sc-be4a1006-2 gIdytb">하나의 계정으로 해당 아티스트의 오픈된 모든 국가샵의 멤버십 구매가 가능합니다.</dd>
	        	<dd class="sc-be4a1006-2 gIdytb">위버스(Weverse)와 위버스샵(Weverse Shop)에서 동일한 계정을 사용하셔야 정상적으로 멤버십 혜택을 받으실 수 있습니다.</dd>
	        	<dd class="sc-be4a1006-2 gIdytb">멤버십 가입 후 7일 이내 환불 가능합니다. 단, 일부라도 멤버십 혜택을 받은 경우 환불이 불가합니다.</dd>
	        	<dd class="sc-be4a1006-2 gIdytb">※하단 상품 상세 이미지에 나온 1) 가입 혜택 2) 기타 안내사항 3) 자주 묻는 질문을 필독해 주세요※</dd>
        	</dl>
        	</div> -->
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
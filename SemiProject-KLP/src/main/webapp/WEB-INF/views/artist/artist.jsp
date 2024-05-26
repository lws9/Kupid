<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ArtistPage</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:black;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header iframe {
            width: 100%;
            height: 400px;
        }
        .member-photos {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }
        .member-photos img {
            width: 100px;
            height: 130px;
            border-radius: 10px; /* 사각형 모서리가 둥글게 */
        }
        .icons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .social-icons {
            display: flex;
            gap: 10px;
        }
        .social-icons a {
            text-decoration: none;
        }
        .membership-button {
            text-align: center;
        }
        .membership-button button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .membership-button button:hover {
            background-color: #0056b3;
        }
        .section-title {
            font-size: 24px;
            margin-bottom: 10px;
            color:white;
            
        }
        .media-videos, .membership-videos, .shop-items {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .media-videos iframe, .membership-videos iframe {
            width: 23%;
            height: 200px;
        }
        .blur {
            filter: blur(5px);
        }
        .shop-item {
            width: 23%;
            text-align: center;
        }
        .shop-item img {
            width: 100%;
        }
        .calendar {
            filter: blur(5px);
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <!-- 대표 영상 -->
            <iframe width="560" height="315" src="https://www.youtube.com/embed/Ey53EQhkLY8?autoplay=1&mute=1&controls=0"si=TLlgxCwOTmXdJfOz&amp;start=22" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        <div class="member-photos">
            <!-- 멤버별 사진 -->
            <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fed820b8e-777c-4e7a-962d-2ef1917d7bc9.jpg" alt="Member 1">
            <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F35907455-0647-4976-9b7e-fb6f3aabd0a0.jpg" alt="Member 2">
            <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F8a0cd064-f916-42ce-9eb1-5732cbbc0608.jpg" alt="Member 3">
            <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F55982851-20de-4ab5-b19c-92c4908c5f72.jpg" alt="Member 4">
            <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F736edaee-5fb4-4444-891d-bcdfb32d6216.jpg" alt="Member 5">
        </div>
        <div class="icons">
            <div class="social-icons">
                <!-- 페이스북, 유튜브, 인스타그램 아이콘 -->
                
                <a href="https://www.instagram.com/riize_official/" target="_blank"><img src="./free-icon-instagram-174855.png" alt="Instagram"></a>
                <a href="https://twitter.com/riize_official" target="_blank"><img src="./free-icon-youtube-logo-1384884.png" alt="YouTube"></a>
                <a href="https://www.youtube.com/channel/UCdVD0MsYecQaIE5Ru-pOIQQ" target="_blank"><img src="./free-icon-twitter-5968830.png" alt="Twitter"></a>
            </div>
            <div class="membership-button">
                <!-- 멤버십 가입 버튼 -->
                <button onclick=onclick=location.assign('<%=request.getContextPath()%>/artist/artist.do')">멤버십 가입하기</button>
            </div>
        </div>
        <div class="media-section">
            <div class="section-title">Media</div>
            <div class="media-videos">
                <!-- 유튜브 영상들 -->
               <iframe width="560" height="315" src="https://www.youtube.com/embed/0TAAUWHo4Ec?autoplay=1&mute=1&controls=0"si=1kmu4B5VzJFrNBx1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
               <iframe width="560" height="315" src="https://www.youtube.com/embed/iUw3LPM7OBU?autoplay=1&mute=1&controls=0"si=MT2ORM8s8D-TNH3v&amp;start=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/gJMheHHf4GQ?autoplay=1&mute=1&controls=0"si=iz1JtWyaju_lZqIY&amp;start=3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/2H0duKgnYgE?autoplay=1&mute=1&controls=0"si=inidK_mYa4NZg7JV&amp;start=5" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>    
        </div>
        <div class="membership-section">
            <div class="section-title">Membership</div>
            <div class="membership-videos">
                <!-- 블러 처리된 유튜브 영상들 -->
                <iframe class="blur" width="560" height="315" src="https://www.youtube.com/embed/xbEUaaRlZl4?autoplay=1&mute=1&controls=0"si=Co3tdmMdABwSvW6R&amp;start=1150" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            	<iframe class="blur" width="560" height="315" src="https://www.youtube.com/embed/lPKynzuWt58?autoplay=1&mute=1&controls=0"si=hApw0xoGaXLjHqEe&amp;start=121" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
              	<iframe class="blur"width="560" height="315" src="https://www.youtube.com/embed/HLrNjCXNNa4?autoplay=1&mute=1&controls=0"si=OTfQ-szXICaE5A69&amp;start=1198" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe class="blur" width="560" height="315" src="https://www.youtube.com/embed/u25WgPC7ACU?autoplay=1&mute=1&controls=0"si=nHZJtXN4fK6psCEX&amp;start=727" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>
        <div class="shop-section">
            <div class="section-title">Shop</div>
            <div class="shop-items">
                <!-- 상품 카드들 -->
                <div class="shop-item">
                    <img src="https://cdn-contents.weverseshop.io/public/shop/636a3419bbbbf77462d67a9db5b07fe7.png?q=95&w=720" alt="Item 1">
                    <p>1st Mini Album [RIIZING] (SMini Ver.)</p>
                    <p>₩13,300</p>
                </div>
                <div class="shop-item">
                    <img src="https://cdn-contents.weverseshop.io/public/shop/7bde05dc407b56d33f6d17395de85237.png?q=95&w=720" alt="Item 2">
                    <p>1st Single Album [Get A Guitar] (Random)</p>
                    <p>₩14,800</p>
                </div>
<!--                 <div class="shop-item">
                    <img src="path/to/item3.jpg" alt="Item 3">
                    <p>Item 3 Description</p>
                </div>
                <div class="shop-item">
                    <img src="path/to/item4.jpg" alt="Item 4">
                    <p>Item 4 Description</p>
                </div> -->
            </div>
        </div>
        <div class="calendar-section">
            <div class="section-title">Calendar</div>
            <!-- 블러 처리된 캘린더 -->
            <div class="calendar">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MDNfMTYx%2FMDAxNzEyMDk3NTQzMTQy.Wr25jGs1V1b23R6TbxxLLyMLgoGQqCVHc6rtMSgBSJAg.2glg-cOWv0JqFVqkemxcslVLjxOZ9Nf0lipfitPckKog.JPEG%2F2024%25B3%25E2_6%25BF%25F9_%25B4%25DE%25B7%25C2_%25B8%25DE%25B8%25F0%252C_A4%25C7%25C1%25B8%25B0%25C6%25AE_%25C0%25BA%25B3%25AA%25B8%25A3_%25BE%25C6%25C6%25AE.jpg&type=sc960_832" alt="Calendar">
            </div>
        </div>
    </div>
</body>
</html>

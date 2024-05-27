<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ArtistPage</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            color: white;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 0px;
        }
        .header iframe {
         position:relative;
         left:0;
         top: -60px;
   		 bottom: -60px;
         width: 1100px;
         height: 600px;
         margin-bottom: 10px; 
        }
        .header::after {
	    content:'';
	    position: relative;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    z-index: 1;
		}
        .member-photos {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-bottom: 70px;
        }
	    .member-photo {
	    text-align: center;
	    transition: transform 0.3s ease; /* 변환 효과에 대한 transition 추가 */
		}
		
		.member-photo img {
		    width: 100px;
		    height: 130px;
		    border-radius: 10px;
		}
		
		.member-photo:hover {
		    transform: scale(1.2); /* 마우스 호버 시 이미지를 1.2배 확대 */
		}

        .icons {
            text-align: center;
            margin-bottom: 70px;
        }
        .icons img {
		    width: 50px; 
		    height: auto; 
		    margin: 0 10px; 
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
            position: fixed;
		    bottom: 0;
		    width: 100%;
		    left: 0;
		    padding: 0px 0px 30px;
		    z-index: 1000;
        }
        
        .membership-button button {
		    background-color: #fff;
		    border-radius: 100px;
		    box-shadow: 0 10px 60px 0 #000c;
		    color: #000;
		    display: inline-block;
		    font-size: 15px;
		    font-weight: 700;
		    line-height: 31px;
		    padding: 8px 15px;
		    vertical-align: top;
		    
            
        }
        .membership-button button:hover {
            background-color: rgb(226, 196, 239);
        }
        .section-title {
            font-size: 24px;
            margin-bottom: 20px;
            color: white;
        }
        .media-videos, .membership-videos {
	        display: flex;
	        justify-content: space-between;
	        margin-bottom: 70Px;
    	}
        }
        .media-videos iframe, .membership-videos iframe {
            display:flex;
            justify-center:space-between;
            left:0px;
            width: 300px;
            height: 169px;
            flex-shrink: 0;
        }
        .blur {
            filter: blur(5px);
        }
        .shop-item {
            width: 200px;
            text-align: center;
            flex-shrink: 0;
            margin-botton: 70px;
        }
        .shop-item img {
            width: 80%;
            higth: 40%;
            
        }
        .shop-items{
            display: flex;
            justify-content: flex-start;
            gap: 30px;
            margin-bottom: 70px;
            flex-wrap: nowrap;
            overflow-x: auto;

        	
        }
        .calendar {
            filter: blur(5px);
            margin-bottom: 40px;
            text-aline:center;
        }
    </style>
</head>
<body>
    <div class="container">
    	
    		
        <div class="header">
            <!-- 대표 영상 -->
            <iframe src="https://www.youtube.com/embed/Ey53EQhkLY8?autoplay=1&mute=1&controls=0&start=22" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            	<img src="data:image/png;base64,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">
        </div>
          <div class="media-section">
            <div class="section-title">Profile</div>
		        <div class="member-photos">
		            <!-- 멤버별 사진 -->
		            <div class="member-photo">
		                <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2Fed820b8e-777c-4e7a-962d-2ef1917d7bc9.jpg" alt="WONBIN">
		                <p>WONBIN</p>
		            </div>
		            <div class="member-photo">
		                <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F35907455-0647-4976-9b7e-fb6f3aabd0a0.jpg" alt="ANTON">
		                <p>ANTON</p>
		            </div>
		            <div class="member-photo">
		                <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F8a0cd064-f916-42ce-9eb1-5732cbbc0608.jpg" alt="SOHEE">
		                <p>SOHEE</p>
		            </div>
		            <div class="member-photo">
		                <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F55982851-20de-4ab5-b19c-92c4908c5f72.jpg" alt="ENSEOK">
		                <p>ENSEOK</p>
		            </div>
		            <div class="member-photo">
		                <img src="https://search.pstatic.net/common?type=b&size=3000&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2FprofileImg%2F736edaee-5fb4-4444-891d-bcdfb32d6216.jpg" alt="SHOTARO">
		                <p>SHOTARO</p>
		            </div>
	            </div>
        </div>
        <div class="media-section">
            <div class="section-title">Media</div>
            <div class="media-videos">
                <!-- 유튜브 영상들 -->
                <iframe src="https://www.youtube.com/embed/0TAAUWHo4Ec?autoplay=1&mute=1&controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe src="https://www.youtube.com/embed/iUw3LPM7OBU?autoplay=1&mute=1&controls=0&start=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe src="https://www.youtube.com/embed/gJMheHHf4GQ?autoplay=1&mute=1&controls=0&start=3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe src="https://www.youtube.com/embed/2H0duKgnYgE?autoplay=1&mute=1&controls=0&start=5" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>
        <div class="membership-section">
            <div class="section-title">Membership</div>
            <div class="membership-videos">
                <!-- 블러 처리된 유튜브 영상들 -->
                <iframe class="blur" src="https://www.youtube.com/embed/xbEUaaRlZl4?autoplay=1&mute=1&controls=0&start=1150" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe class="blur" src="https://www.youtube.com/embed/lPKynzuWt58?autoplay=1&mute=1&controls=0&start=121" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe class="blur" src="https://www.youtube.com/embed/HLrNjCXNNa4?autoplay=1&mute=1&controls=0&start=1198" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <iframe class="blur" src="https://www.youtube.com/embed/u25WgPC7ACU?autoplay=1&mute=1&controls=0&start=727" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
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
                <!-- 추가 상품 카드들 필요 시 여기에 추가 -->
            </div>
        </div>
        <div class="calendar-section">
            <div class="section-title">Calendar</div>
            <!-- 블러 처리된 캘린더 -->
               <div class="calendar">
    		    <img src="https://blog.kakaocdn.net/dn/yBMRy/btrRvcufQI4/smYyR8LB9KZhNwyeKychxk/2023%EB%85%84%206%EC%9B%94%20%EB%8B%AC%EB%A0%A5.jpg?attach=1&knm=img.jpg" alt="Calendar" style="width: 60%; display: block; margin: 0 auto;">
  		    </div>

        </div>
        <div class="icons">
            <div class="social-icons">
                <!-- 페이스북, 유튜브, 인스타그램 아이콘 -->
                <a href="https://www.instagram.com/riize_official/" target="_blank"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZF4DTH7F_qryjx-dGzUr5Nk3HfaZ8DVd1qw&usqp=CAU" alt="Instagram"></a>
                <a href="https://twitter.com/riize_official" target="_blank"><img src="https://img.freepik.com/free-vector/new-2023-twitter-logo-x-icon-design_1017-45418.jpg?size=338&ext=jpg&ga=GA1.1.44546679.1716422400&semt=ais_user"></a>
                <a href="https://www.youtube.com/channel/UCdVD0MsYecQaIE5Ru-pOIQQ" target="_blank"><img src="data:image/jpeg;base64,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" alt="Twitter"></a>
            </div>
        </div>
        <div class="membership-button">
  	    <button>멤버쉽 가입하기 ></button>
		</div>
    </div>   
    <script>
        
        document.querySelectorAll('.membership-section').forEach(function(video) {
            video.addEventListener('click', function() {
                showMembershipPopup();
            });
        });

        
        document.querySelector('.calendar').addEventListener('click', function() {
            showMembershipPopup();
        });
        
        document.querySelector('.shop-items').addEventListener('click', function() {
            showMembershipPopup();
        });


        document.querySelector('').addEventListener('click', function() {
            showMembershipPopup();
        });
       
        function showMembershipPopup() {
            alert("멤버쉽 가입이 필요한 서비스입니다");
        }
       </script>
</body>
</html>
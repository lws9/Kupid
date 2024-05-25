<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.member.model.dto.MemberDto, com.kupid.group.model.dto.GroupDto, java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .slider-container {
    width: 598px;
    overflow: hidden;
    border-radius: 30px;
    margin: 15px 30px 15px 30px;
    /* border: 1px solid blue; */
    height: 325px;
    display: inline-block;
 }
  .slider {
     width: 2400px; /* (600px * 6) */
     height: 330px;
     display: flex;
     transition: transform 0.5s ease;
 }
 
 .slide {
     width: 600px;
     height: 325px;
     align-self: center;
 }

 .slide img {
     width: 100%;
     height: 100%;
     object-fit: cover;
     display: inline;
 }

 .prev, .next {
     position: absolute;
     top: 38%;
     transform: translateY(-50%);
     background-color: rgba(255, 255, 255, 0.5);
     color: #333;
     font-size: 24px;
     padding: 10px;
     cursor: pointer;
     transition: background-color 0.3s ease;
 }

 .prev:hover, .next:hover {
     background-color: rgba(0, 0, 0, 0.5);
     color: #fff;
 }
 
 .prev {
     left: 45px;
 }

 .next {
     right: 45px;
 }
 .banner{
 	margin: 35px auto;
 	display: flex;
 	justify-content: center;
 }
 .featurette-divider{
 	margin: 3rem 0;
 }
 .img_outline{
 	outline: 5px #faf0ff solid;
 }
   .favorite1_box {
	  position: relative;
	  margin: 8px 0px 0px;
	  min-width: 0px;
	  width: 40%;
	  border-radius: 8px 8px 8px 8px;
	  padding: 8px 16px 8px 16px;
	  outline: 1px solid #e0e0e0;
	  outline-offset: -1px;
	}
	.searchAritist {
      width: 100%;
	  color: black;
	  background-color: transparent;
	  border: 0px;
	  padding: 0px;
	  vertical-align: top;
  }
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	//구독여부 확인
	boolean subscribeCk = false;
	List<GroupDto> groupList = (List<GroupDto>) request.getAttribute("GroupList");
	List<MemberDto> favorite = new ArrayList<>();
	if(loginMember!=null){
		favorite=(List<MemberDto>) request.getAttribute("GroupSubscribe");
		subscribeCk = (boolean) request.getAttribute("subscribeCk");
	}
	//인기순 정렬?
	/* List<MemberDto> artist_popular =  */
%>
<body>
<div class="banner">
	<div class="slider-container">
        <div class="slider" id="slider1" style="transform: translateX(0px);">
            <div class="slide"><img src="<%=request.getContextPath() %>/image/banner/banner1.png" alt="Slide 1"></div>
            <div class="slide"><img src="<%=request.getContextPath() %>/image/banner/banner2.png" alt="Slide 2"></div>
	    </div>
    </div>
	<div class="slider-container">
        <div class="slider" id="slider2" style="transform: translateX(0px);">
            <div class="slide"><img src="<%=request.getContextPath() %>/image/banner/banner3.png" alt="Slide 3"></div>
            <div class="slide"><img src="<%=request.getContextPath() %>/image/banner/banner4.jpeg" alt="Slide 4"></div>
	    </div>
    </div>
        <div class="prev">❮</div>
        <div class="next">❯</div>
</div>
<main class="p-5">
	<%-- <div>
	<% if(loginMember!=null){ %>
		<h2><%=loginMember.getMemberName()%>님 안녕하세요 :)</h2>
	<%} %>
	</div> --%>
	<!-- 샘플 출력 양식(지우지 말것) -->
	<%-- <div class="container mb-5">
	<h2 class="main_title">테스트 출력</h2>
	   <div class="row mt-4 text-center">
	       <div class="col-md-3 pb-2">
	        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath() %>/image/아이유셀카.jpg" width="100%"/></svg>
	        <h4 class="fw-normal mt-4">아티스트 2</h4>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-md-3 pb-2">
	        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath() %>/image/아이유셀카.jpg" width="100%"/></svg>
	        <h4 class="fw-normal mt-4">아티스트 3</h4>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-md-3 pb-2">
	        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath() %>/image/아이유셀카.jpg" width="100%"/></svg>
	        <h4 class="fw-normal mt-4">아티스트 4</h4>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-md-3 pb-2">
	        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath() %>/image/아이유셀카.jpg" width="100%"/></svg>
	        <h4 class="fw-normal mt-4">아티스트 4</h4>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-md-3 pb-2">
	        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath() %>/image/아이유셀카.jpg" width="100%"/></svg>
	        <h4 class="fw-normal mt-4">아티스트 4</h4>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
    </div><!-- /.container -->  --%>
    <div class="container mb-5">
		<div class="row d-flex justify-content-center">
		    <input class="searchAritist form-control w-50" placeholder="아티스트명을 입력해주세요" id="searchArtist">
	    </div>
    </div>
    <script>
    $('input#searchAritist').keyup(e=>{
		console.log(e.target.value);
		$.ajax({
			url: "<%=request.getContextPath()%>/searchgroup.do",
			data : {
				"searchKeyword" : e.target.value,
			},
			success: data=>{
				const members=JSON.parse(data);
				console.log(members);
				/* $("#searchResult").html(members); */
				const $table = $("<table>");
				//방법 1
				/* members.map(e=>`<td>\${e.userId}</td><td>\${e.userName}</td>`) */
				//방법 2
				members.map(e=>{
				let tds="";
					for(k in e){
						tds+=`<td>\${e[k]}</td>`
						console.log(tds);
					}
					return tds; //return값이 없으면 비어있음
				})
					.forEach(e=>{
						console.log(e);
						$("<tr>").append(e).appendTo($table);
					});
				$("#searchResult").html($table);
			}
		});
	});
    </script>
    
    <%if(loginMember != null && favorite.size()>0){ %>
    <div class="container mb-5">
		<h2 class="main_title">구독 아티스트</h2>
	    <div class="row mt-4 text-center">
    	<%for(int i=0; i<favorite.size();i++){
 			if(favorite.get(i).getMemberNo()==loginMember.getMemberNo()){%>
		      <div class="col-md-3 pb-2">
		        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath()%>/upload/artist/<%=favorite.get(i).getGroupImg() %>" width="100%"/></svg>
		        <h4 class="fw-normal mt-4"><%= favorite.get(i).getGroupName()%></h4>
		      </div><!-- /.col-lg-4 -->
	      <%} %>
		<%} %>
      </div>
      </div>
	     <%-- <%}else if(loginMember != null && favorite.size()<=0){ %> --%>
	    <!-- 비회원이거나 회원중에 아무도 구독하지 않은 회원 -->
		<%}else if(loginMember != null && subscribeCk==false){ %>
	        <%for(int i=0; i<4;i++){ %>
        <div class="container mb-5">
			<h4 class="">아래에서 관심있는 아티스트를 선택해주세요 :)</h4>
		</div>
            <div class="container mb-5">
				<h2 class="main_title">인기 아티스트</h2>
			    <div class="row mt-4 text-center">
			    	<div class="col-md-3 pb-2">
				        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath()%>/upload/artist/<%=groupList.get(i).getGroupImg() %>" width="100%"/></svg>
				        <h4 class="fw-normal mt-4"><%= groupList.get(i).getGroupName()%></h4>
			      	</div><!-- /.col-lg-4 -->
				</div>
			</div>
				<%} %>
		<%}/* else if(loginMember == null){ */ %>
            <div class="container mb-5">
				<h2 class="main_title">인기 아티스트</h2>
			    <div class="row mt-4 text-center">
			<%for(int i=0; i<4;i++){ %>
			    	<div class="col-md-3 pb-2">
				        <svg class="mt-4 bd-placeholder-img img_outline rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect><image href="<%=request.getContextPath()%>/upload/artist/<%=groupList.get(i).getGroupImg() %>" width="100%"/></svg>
				        <h4 class="fw-normal mt-4"><%= groupList.get(i).getGroupName()%></h4>
			      	</div><!-- /.col-lg-4 -->
				<%} %>
				</div>
				<a class="icon-link" style="color: $purple-300" href="#">
				  더보기
				  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
				</a>
			</div>
		<%-- <%} %> --%>


	

   <!--  <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">And lastly, this one. <span class="text-body-secondary">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-bg)"></rect><text x="50%" y="50%" fill="var(--bs-secondary-color)" dy=".3em">500x500</text></svg>
      </div>
	<br>
	</div> -->
    <hr class="featurette-divider">
	
	<a href="<%=request.getContextPath()%>/feed/feedView.do">피드</a>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/report/reportList.do')">신고내역</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/noticelist.do')">공지사항</button>
	</div>
	<div>
		<button onclick="">아티스트</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/faqlist.do')">faq</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/home.do')">관리자페이지</button>
	</div>
</main>
</body>
<script>
document.addEventListener('DOMContentLoaded', () => {
	let currentIndex = 0;
    const slidesCount = 2; // Number of slides in each slider

    const sliders = [
        document.getElementById('slider1'),
        document.getElementById('slider2')
    ];

    const updateSliderPosition = () => {
        sliders.forEach(slider => {
            $(slider).transform = `translateX(${-currentIndex * slider.offsetWidth}px)`;;
        });
    };

    const showNextSlide = () => {
    	console.log('next');
    	currentIndex = (currentIndex + 1) % slidesCount;
        updateSliderPosition();
    };

    const showPrevSlide = () => {
    	console.log('pre');
    	currentIndex = (currentIndex - 1 + slidesCount) % slidesCount;
        updateSliderPosition();
    };

    document.querySelector('div.next').addEventListener('click', () => {
        showNextSlide();
        resetAutoSlide();
    });

    document.querySelector('div.prev').addEventListener('click', () => {
        showPrevSlide();
        resetAutoSlide();
    });

    let autoSlideInterval = setInterval(()=>showNextSlide(), 3000);

    const resetAutoSlide = () => {
        clearInterval(autoSlideInterval);
        autoSlideInterval = setInterval(()=>showNextSlide(), 3000);
    };
});

</script>
</html>
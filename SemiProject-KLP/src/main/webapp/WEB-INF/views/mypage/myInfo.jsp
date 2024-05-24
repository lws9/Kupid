<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.myInfo-container{
	display: flex;
	width: 100%;
	justify-content: left;
}
.myInfo.main {
  position: relative;
  display: flex;
  flex-direction: column;
  background-color: white;
  width: auto;
}
.myInfo .section1 {
  position: relative;
  display: flex;
  flex-direction: column;
}
.myInfo .flex_col {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0px auto;
  width: 100%;
  min-width: 700px;
}

.myInfo .title {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  color: black;
  text-align: center;
  letter-spacing: -0.36px;
}
.myInfo .content-container{
	padding: 15px;
	margin-bottom: 10px;
	min-width: 400px;
}
.myInfo .flex_row {
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 0px 10px;
  margin: 0px auto;
}
.myInfo .btn {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0px auto;
  width: 83px;
  max-width: 100%;
  color: black;
  text-align: center;
  background-color: #d1ade3;
  border-radius: 8px;
  padding: 8px 8px 8px 8px;
}
.myInfo .btn2 {
   position: relative;
   display: flex;
   justify-content: center;
   align-items: center;
   min-width: 75px;
   color: black;
   text-align: center;
   background-color: #e9bcff;
   border-radius: 8px;
   padding: 4px 8px 4px 8px;
   border: none;
   height: 30px;
}
.myInfo .flex_col2 {
  position: relative;
  display: flex;
  flex-direction: column;
  width: 318px;
  min-width: 0px;
}
.myInfo .nickname {
  position: relative;
  color: black;
}
.myInfo .content_box {
  position: relative;
  display: flex;
  flex-direction: column;
  margin: 8px 0px 0px;
  background-color: white;
  border-radius: 8px 8px 8px 8px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
  width: 100%;
}
/* .myInfo .favorite {
  position: relative;
  margin: 32px 0px 0px;
  color: black;
} */
.myInfo .input_box {
  position: relative;
  margin: 8px;
  min-width: 0px;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.myInfo .input_box_fail {
  background-color: #ffc6c6;
}
.myInfo .inputTag {
  width: 100%;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  vertical-align: top;
}
.myInfo .inputTag:focus {
  outline: none;
}
.myInfo .flex_row1 {
  position: relative;
  display: flex;
  gap: 0px 13px;
  margin: 84px 0px 0px;
  width: 37.09%;
}
.myInfo .h3_btn_container{
	display: flex;
	gap: 15px;
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: space-between;
	margin: 0px;
	padding: 0px;
}
.myInfo .h3_btn_container> p, .myInfo .h3_btn_container>h5{
	margin-bottom: 5px;
	margin-top: -5px;
}
.myInfo .readonly_box{
	background-color: #ededed;
}
.myInfo .result-container{
	display: flex;
	gap: 10px;
	align-items: center;
}
</style>
<!-- 임시디자인 -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="myInfo-container">
<%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
    <main class="main">
        <section class="myInfo d-flex">
            <div class="flex_col p-5">
                <h1 class="title">개인정보 수정</h1>
                <div class="content_box p-5 right">
                    <div class="flex_row">
                        <form action="<%=request.getContextPath() %>/mypage/infoupdate.do" method="post" onsubmit="fnInputCk(event);" >
                       	<div class="content-container flex flex-fill">
                            <h3>이름</h3>
                            <div class="input_box mt-3 mb-4">
	                            <input type="text" name="name" class="inputTag" id="name" value="<%=loginMember.getMemberName()%>">
                            </div>
                            <h3>아이디</h3>
                            <div class="input_box readonly_box mt-3 mb-4">
	                            <input type="text" name="id" class="inputTag" value="<%=loginMember.getMemberId()%>" readOnly>
                            </div>
                            <div class="result-container">
                            <h3>비밀번호</h3><h5 id="pwckResult"></h5>
                            </div>
                            <div class="h3_btn_container">
                            	<p>영문, 숫자, 특수문자가 포함된 4~20글자 사용가능</p>
                            </div>
                            <div class="input_box mt-3 mb-3">
	                            <input type="password" id="prepw" name="prepw" class="inputTag" required placeholder="현재 비밀번호 입력">
                            </div>
                            <div class="input_box mt-3">
	                            <input type="password" id="newpw" name="newpw" class="inputTag" placeholder="변경할 비밀번호 입력">
                            </div>
                            <div class="input_box mt-3 mb-4">
	                            <input type="password" id="newpwck" class="inputTag" placeholder="비밀번호 확인">
                            </div>
                            <h3>연락처</h3>
                            <div class="input_box mt-3 mb-4">
	                            <input type="text" name="phone" class="inputTag" value="<%=loginMember.getPhone()%>">
                            </div>
                            <div class="h3_btn_container">
                            	<h3>이메일</h3>
                            	<button class="btn2" type="button" onclick="emailValidCk();">이메일 검증</button>
                            </div>
                            <div class="input_box readonly_box mt-3 mb-4">
	                            <input type="text" name="email" class="inputTag" id="inputEmail" readOnly value="<%=loginMember.getEmail()%>">
                            </div>
                           <div class="h3_btn_container">
                            	<h3>주소</h3>
                            	<button class="btn2" type="button" id="searchAddress" onclick="addressSearch();">주소 검색</button>
                           	</div>
                            <div class="input_box readonly_box mt-3 mb-3">
                            	<input type="text" id="inputAddress" class="inputTag" name="address" value="<%if(loginMember.getAddress() != null) %><%=loginMember.getAddress()%>">
                            </div>
                            <div class="input_box mt-3 mb-3">
                            	<input type="text" id="inputAddressDetail" class="inputTag" name="addressDetail" placeholder="상세주소 입력"  value="<%if(loginMember.getAddressDetail() != null) %><%=loginMember.getAddressDetail()%>">
                            </div>
                           <!--  <div class="input_box">
                            	<input type="text" id="sample6_postcode" placeholder="우편번호">
                            </div> -->
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
<script>
	$("#name").keyup(e=>{
		let target = e.target.value;
		target = target.replace(/[^가-힣]/g, '');
		e.target.value = target;
		console.log(target);
	});
	$("#prepw").keyup(e=>{
		let target = e.target.value;
		target = target.replace(/[^a-zA-Z0-9ㄱ-ㅎ가-힣!@#$%^&*]/g, '');
		e.target.value = target;
		console.log(target);
	});
	$("#newpw").keyup(e=>{
		let target = e.target.value;
		console.log(target);
		target = target.replace(/[^a-zA-Z0-9ㄱ-ㅎ가-힣!@#$%^&*]/g, '');
		e.target.value = target;
		const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{4,20}$/;
		if(regex.test(e.target.value)){
			$(".h3_btn_container>p").text('영문, 숫자, 특수문자가 포함된 4~20글자 사용가능').css("color",'black');
		}else{
			$(".h3_btn_container>p").text('영문, 숫자, 특수문자가 포함된 4~20글자만 사용가능합니다.').css("color","#ff5e5e");
		}
	});
	$("#newpwck").keyup(e=>{
		console.log(e.target.value);
		console.log($("#newpw").val());
		let input = e.target.value;
		
		let target = input;
		target = target.replace(/[^a-zA-Z0-9ㄱ-ㅎ가-힣!@#$%^&*]/g, '');
		input = target;
		if($("#newpw").val() !== ""){
			if(input ===$("#newpw").val()){
				$("#pwckResult").text('비밀번호가 일치합니다.').css("color","#c552ff");
				$("#newpwck").parent().removeClass('input_box_fail');
				if($("#newpwck").blur()){
					$("#pwckResult").text('');
				}
			}else{
				$("#pwckResult").text('비밀번호가 일치하지 않습니다.').css("color","#ff5e5e");
				$("#newpwck").parent().addClass('input_box_fail');
			}
		} else{
			$("#pwckResult").text('');
		}
	});
	const fnInputCk=(e)=>{
		console.log(e.target.value);
		if($("prepw").val().trim()===""){
			alert('수정하려면 현재 비밀번호를 입력해주세요.');
			$("#prepw").focus();
			e.preventDefault();
			return false;
		}		
		const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{4,20}$/;
		//비밀번호 암호화 전까지 잠시 보류
		/* if(!regex.test($("#newpw").val())){
			alert('영문, 숫자, 특수문자가 포함된 4~20글자 비밀번호가 아닙니다.');
			e.preventDefault();
			$("#newpw").focus();
			return false;
		} */
		if($("#newpwck").val()!== $("#newpw").val()){
			alert('비밀번호 확인 값이 일치하지 않습니다.');
			$("#newpwch").focus();
			e.preventDefault();
			return false;
		}
	    // 모든 input 필드가 비어있지 않은지 확인
 		let isValid=true;
	    $("form input").each(function() {
	        if ($(this).val().trim() === "") {
	            alert('모든 필드를 입력해주세요.');
	            $(this).focus();
	            isValid = false;
	            e.preventDefault();
	            return false; // jQuery each의 루프 종료
	        }
	    }); 
		//현재 비밀번호가 일치해야 제출
		if($("#prepw").val !== m.getMemberPw()){
            e.preventDefault();
			return false;
		}
	};
	const emailValidCk=()=>{
		console.log('email');	
		window.open('<%=request.getContextPath()%>/mypage/emailCheck.do?no=<%=loginMember.getMemberNo()%>','emailVerification','width=570px, height=320px');
	};
	function setEmail(email){
		console.log(email);
		//$(document).ready();
		$("#inputEmail").val(email);
	}
	<%-- const addressSearch=()=>{
		window.open('<%=request.getContextPath()%>/mypage/addressSearch.do','addressSearch','width=570px, height=320px');	
	}; --%>
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	const addressSearch=()=>{
		let width= 500;
		let height= 772;
		new daum.Postcode({
			theme: themeObj,
			oncomplete: data=>{
				document.querySelector("#inputAddress").value= data.address;
				document.querySelector("#inputAddressDetail").value= "";
				document.querySelector("#inputAddressDetail").focus();
			}
		}).open({
			left: (window.screen.width/2)-(width/2),
			top: (window. screen.height/2)-(height/2),
			popupTitle: '우편번호 검색',
		});
	};
	var themeObj = {
			   bgColor: "#ececec", //바탕 배경색
			   searchBgColor: "#ffffff", //검색창 배경색
			   contentBgColor: "ffffff", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
			   pageBgColor: "fafafa", //페이지 배경색
			   textColor: "#333333", //기본 글자색
			   queryTextColor: "#222222", //검색창 글자색
			   postcodeTextColor: "#fa4256", //우편번호 글자색
			   emphTextColor: "#008bd3", //강조 글자색
			   outlineColor: "#e0e0e0" //테두리
			};
</script>
</html>
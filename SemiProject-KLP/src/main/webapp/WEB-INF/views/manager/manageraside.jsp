<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.member.model.dto.MemberDto" %>
<%	
	int pagenum = 0;
	if((Integer) request.getAttribute("pagenum")!=null){
		pagenum=(Integer) request.getAttribute("pagenum");
	}
%>

<!DOCTYPE html>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<html>
<style>
.myInfo-container{
	display: flex;
	width: 100%;
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
  padding: 30px 70px 30px 70px;
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
  width: 90%;
}
.myInfo .highlight_box {
  position: relative;
  margin: 8px 0px 8px 16px;
  width: 45px;
}
.myInfo .highlight {
  width: 100%;
  font: 500 16px/1.5 "Inter", Helvetica, Arial, serif;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  letter-spacing: -1px;
  vertical-align: top;
}
.myInfo .highlight:focus {
  outline: none;
}
.myInfo .introduce {
  position: relative;
  margin: 32px 0px 0px;
  color: black;
}
.myInfo .textarea_box {
  position: relative;
  margin: 8px 0px 0px;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 123px 16px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.myInfo .textarea {
  width: 100%;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  letter-spacing: -0.8px;
  vertical-align: top;
}
.myInfo .textarea:focus {
  outline: none;
}
.myInfo .favorite {
  position: relative;
  margin: 32px 0px 0px;
  color: black;
}
.myInfo .input_box {
  position: relative;
  margin: 8px 0px 0px;
  min-width: 0px;

  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
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
.myInfo .address-search{
	display: flex;
	gap: 15px;
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: space-between;
}
.sidebar-container{
	/* min-width: 250px;*/
	width:100%;
	margin : 0px auto;
	background-color: #faf0ff;
	justify-content: left;
	align-items: left;
}
.sidebar-container .flex_col {
  width : 80%;
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 12px 0px;
  margin: 24px 8px 718px;
  /* border : 1px solid black; */
}
.sidebar-container .flex_col1 {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 22px 0px;
  /* border : 1px solid black; */
}
.sidebar-container .flex_row {
  position: relative;
  display: flex;
  justify-content: space-between;
  gap: 0px 10px;
  width: 90%;
}
.sidebar-container .subtitle {
  position: relative;
  display: flex;
  align-items: center;
  margin: 0px 0px 2px;
  min-width: 0px;
  color: black;
  letter-spacing: -0.2px;
}
.sidebar-container .btn {
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
.sidebar-container .flex_col2 {
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 4px 0px;
  width: 100%;
  /* border : 1px solid black; */
}
.sidebar-container .btn1 {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0px 14px;
  background-color: #d1ade3;
  border-radius: 8px;
  padding: 8px 16px 8px 16px;
  height: 50px;
  /* border: none; */
}
.sidebar-container .btn2 {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0px 16px;
  background-color: #faf0ff;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
  height: 50px;
  /* border: none; */
}
.sidebar-container .btn_icon1 {
  position: relative;
  margin: 2px 0px;
  width: 22px;
  min-width: 0px;
  height: 20px;
}
.sidebar-container .flex_col3 {
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 20px 0px;
  margin: 0px 0px 0px 16px;
  width: 92px;
}
.sidebar-container .flex_row1 {
  position: relative;
  display: flex;
  gap: 0px 16px;
}
.sidebar-container .highlight {
  position: relative;
  display: flex;
  align-items: center;
  min-width: 0px;
  color: black;
}
.aside{
        width: 15%;
        height: 1100px;
        border: 1px solid blue; 
        display: flex;
        justify-content: left;
        /* align-items: top; */
        }
</style>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
</head>
<!-- 임시디자인 -->
<aside class="aside">
    <div class="sidebar-container">
        <div class="flex_col">
            <div class="flex_col1">
                <div class="flex_row">
                    <h2 class="subtitle">관리자 메뉴</h2>
                </div>
            </div>
            <div class="flex_col2">
                <button class="<%=pagenum==1?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/home.do?pagenum=1')">
                    <h3>메인화면</h3>
                </button>
                <button class="<%=pagenum==2?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/noticelist.do?pagenum=2')">
                    <h3>공지사항</h3>
                </button>
                <button class="<%=pagenum==3?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/faqlist.do?pagenum=3')">
                    <h3>faq</h3>
                </button>
                  <button class="<%=pagenum==4?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/inquirylist.do?pagenum=4')">
                    <h3>1:1문의</h3>
                </button>
                 <button class="<%=pagenum==5?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/reportlist.do?pagenum=5')">
                    <h3>신고내역</h3>
                </button>
           </div>
           <br>
           <div class="flex_col1">
                <div class="flex_row">
                    <h3 class="subtitle">회원 관리</h3>
                </div>
            </div>
            <div class="flex_col2">
                <button class="<%=pagenum==6?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/artistlist.do?pagenum=6')">
                    <h3>아티스트</h3>
                </button>
                <button class="<%=pagenum==7?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/grouplist.do?pagenum=7')">
                    <h3>그룹</h3>
                </button>
                <button class="<%=pagenum==8?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/manager/memberlist.do?pagenum=8')">
                    <h3>팬</h3>
                </button>
           </div>
           <br>
           <div class="flex_col1">
                <div class="flex_row">
                    <h3 class="subtitle">피드 관리</h3>
                </div>
            </div>
            <div class="flex_col2">
                <button class="<%=pagenum==9?"btn1":"btn2" %>">
                    <h3>아티스트</h3>
                </button>
                <button class="<%=pagenum==10?"btn1":"btn2" %>" onclick="">
                    <h3>팬</h3>
                </button>
           </div>
           <br>
           <div class="flex_col1">
                <div class="flex_row">
                    <h3 class="subtitle">상점 관리</h3>
                </div>
            </div>
            <div class="flex_col2">
                <button class="<%=pagenum==11?"btn1":"btn2" %>">
                    <h3>배너</h3>
                </button>
                <button class="<%=pagenum==12?"btn1":"btn2" %>" onclick="">
                    <h3>상품</h3>
                </button>
                <button class="<%=pagenum==13?"btn1":"btn2" %>" onclick="">
                    <h3>결제내역</h3>
                </button>
           </div>
           
    	</div>
    </div>
</aside>
</html>
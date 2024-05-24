<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="myInfo-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
    <main class="main">
        <section class="myInfo">
            <div class="flex_col">
                <h1 class="title">FAQ 등록</h1>
                <div class="content_box">
                    <div class="flex_row">
                        <form action="<%=request.getContextPath()%>/manager/faqinsertend.do" method="post">
                       	<div class="content-container">
							<h3>카테고리</h3>
                       		<div >
								<select name="category" >
        						<option value="회원" >회원</option>
        						<option value="상점" >상점</option>
        						<option value="커뮤니티" >커뮤니티</option>
        						</select>
							</div>
                            <h3>제목</h3>
                            	<div class="input_box">
									<input type="text" name="title" class="inputTag" required>
								</div>
                            <h3>내용</h3>
                            <div class="input_box">
								<textarea rows="10" cols="30" name="content" class="inputTag" required></textarea>	
							</div>
                           	<br>
	                		<button name="submit" class="btn">등록</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>
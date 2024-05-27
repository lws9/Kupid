<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">   	
        	$(function(){
        	      nhn.husky.EZCreator.createInIFrame({
        	          oAppRef: oEditors,
        	          elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다. 
        	          //SmartEditor2Skin.html 파일이 존재하는 경로
        	          sSkinURI: "/SemiProject-KLP/smarteditor2/SmartEditor2Skin.html",  
        	          htParams : {
        	              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
        	              bUseToolbar : true,             
        	              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
        	              bUseVerticalResizer : true,     
        	              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
        	              bUseModeChanger : true,         
        	              fOnBeforeUnload : function(){
        	                   
        	              }
        	          }, 
        	          fOnAppLoad : function(){
        	              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
        	              oEditors.getById["content"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
        	          },
        	          fCreator: "createSEditor2"
        	      });
        	      
        	      //저장버튼 클릭시 form 전송
        	      $("#save").click(function(){
        	          oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        	          $("#frm").submit();
        	      });    
        	});
   
        </script> --%>
</head>
<body>

<div class="myInfo-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
    <main class="main">
        <section class="myInfo">
            <div class="flex_col">
                <h1 class="title">공지사항 등록</h1>
                <div class="content_box">
                    <div class="flex_row">
                        <form id="frm" action="<%=request.getContextPath()%>/manager/noticeinsertend.do" method="post">
                       	<div class="content-container">
							<h3>카테고리</h3>
                       		<div>
								<select name="category" >
	        						<option value="굿즈" >굿즈</option>
	        						<option value="일반" >일반</option>
	        						<option value="행사" >행사</option>
	        					</select>
							</div>
                            <h3>제목</h3>
                            	<div class="input_box">
									<input type="text" name="title" class="inputTag" required>
								</div>
                            <h3>내용</h3>
                            <div class="input_box">
								<textarea rows="20" cols="30" name="content" id="content" class="inputTag" ></textarea>	
							</div>
                           	<br>
	                		<button name="submit" class="btn" id="save">등록</button>
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
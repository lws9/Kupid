<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
    #customer-container {
        width: 800px;
        margin: 50px auto 30px;
        text-align: left; 
        
    }

    #customer-container table {
        width: 100%;
        border-collapse: collapse;
    }

    #customer-container th { 
        background-color: white;
        color: #b39ddb;
        padding: 10px;
        text-align: left; 
    }

    #customer-container input[type="text"],
    #customer-container textarea {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    #customer-container input[type="submit"] {
        width: 100px;
        background-color: #b39ddb;
        color: white;
        padding: 10px;
        margin: 10px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #customer-container input[type="submit"]:hover {
        background-color:  #6a0dad;
        
    }
   .btn-container {
         text-align: right; /* 버튼을 오른쪽으로 정렬 */
		margin-top: 20px;
		margint-left:100px;
    }
</style>

<section id="customer-container">
    <form action="<%=request.getContextPath()%>/inquiry/inquirywriteend.do" method="post" enctype="multipart/form-data">
        <table id="tbl-customer">
            <tr>
                <th>제 목</th>
            </tr>
            <tr>
                <td><input class="form-control" type="text" name="title" required></td>
            </tr>
            <tr>
                <th>문의 내용</th>
            </tr>
            <tr>
                <td><textarea class="form-control" cols="47" rows="10" name="content" style="resize:none"></textarea></td>
            </tr>
            <tr>
                <th>파일 첨부</th>
            </tr>
            <tr>
                <td><input class="form-control" type="file" name="upfile"></td>
            </tr>
            <tr>
                <th>회원 번호</th>
            </tr>
            <tr>
                <td><input class="form-control" type="text" name="inq_member" value="<%=loginMember.getMemberNo()%>"></td>
            </tr>
          
            
        </table>
         <div class="btn-container">
            <input class="form-control d-flex align-items-center" type="submit" value="접수하기" onclick="">
        </div>
    </form>
</section>

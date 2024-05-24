<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,java.text.SimpleDateFormat
,com.kupid.feed.model.dto.Feed
,com.kupid.feed.model.service.FeedService
,com.kupid.member.model.dto.MemberDto"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div>
		 <form id="feedForm" action="<%=request.getContextPath()%>/feed/feedWrite.do" enctype="multipart/form-data" method="post" onsubmit="return submitFeed();">
			<input type ="hidden" name="writer" value="<%=loginMember.getMemberId()%>">
			<div>
				<input type ="file" id="upfile" multiple>
			</div>
			<div>
				<textarea class="form-control" cols="40" rows="5" name="content" id="content"></textarea>
			</div>
			<button type="submit">제출</button>
				<button onclick="test()">테스트용 버튼</button>
			
		</form>
<%-- <a onclick = "likeClick()"> 좋아요 <%= %></a> --%>
	</div> 

		
<!-- 	<div>
		<input type ="file" name="upfile" id="upfile" multiple>
	</div>
	<div>
		<textarea class="form-control" cols="40" rows="5" name="content" id="content"></textarea>
	</div>
	<button id="submitButton">제출</button> -->
	

    <div id="result"></div>
	
	<div class="container" id="container">
	</div>  
    
</body>
<style>
/*  .slider_btn a {
    position: absolute;
    background-color: #fff;
    line-height: 50;
    text-align: center;
} 

	.slider_btn a.prev {
	    left: 0;
	}
	.slider_btn a.next {
	    right: 0;
	}
	#container{
		justify-content:center;
		 display:flex;
		 align-items: center;
		 flex-direction: column;
	}
	.img_listBt{
			 display:flex;
		justify-content:center;
				 align-items: center;
		
	} */
	
	.img_list {
    position: relative;
    width: 500px;
    overflow: hidden;
    justify-content: center;
    align-items: center;
    left: 150px;
    
}

.img_listBt {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.img_listBt > div {
    min-width: 500px;
}

.slider_btn {
    position: absolute;
    top: 50%;
    width: 100%;
    display: flex;
    justify-content: space-between;
    transform: translateY(-50%);
}

.slider_btn a {
    background-color: rgba(0,0,0,0.5);
    color: white;
    padding: 10px;
    text-decoration: none;
    cursor: pointer;
}
</style>
<script>
const test = ()=>{
	console.log(<%=loginMember.getMemberNo()%>);
	console.log(<%=loginMember.getProfileImgOriname()%>);
}
/* $("#submitButton").click(e=>{
	const form = new FormData();
	const files = ($("#upfile")[0].files);
	for(let i=0;i<files.length;i++){
		form.append("upfile"+i,files[i]);
	}
	form.append("content",$("#content".val))
	console.log(form);
}) */

	function submitFeed() {
		$.each($('#upfile')[0].files, function(idx, file) {

			var fileInput = $('<input>')
				.attr('type', "file")
				.attr('name', "upfile"+idx)
				.css({'display':'none'});
			
			fileInput[0].file = file
			console.log(fileInput[0].file);
			$('#feedForm').append(fileInput);
		})
		return true;
	}
				
				
   const container = document.getElementById("container");
   $(container).css({"display": "flex",
	   		"flex-direction":"column",
		    "justify-content": "center", 
   			"align-items": "center"});
   let page = 1; 
   const perPage = 10;
   let time=true;
   

   const loadPage = () => {	
	    $.ajax({
	        type: "POST",
	        url: "<%=request.getContextPath()%>/feed/InfiniteScroll.do",
	        data: {
	            "cPage": page,
	            "numPerPage": perPage
	        },
	        success: function(data) {
	            console.log(data);
	            $.each(data, function(idx, element) {
	                const $div = $("<div>").css({
	                    "border": "1px solid red",
	                    "width": "800px",
	                    'overflow': 'hidden'
	                }).attr("class", "board");
	                
	                $div.append('<input type="hidden" class="feedNo" value='+element.feedNo+'>');
	                $div.append('<input type="hidden" class="memberNo" value='+element.feedMemberName+'>');
	                $div.append('<img src='+"<%=request.getContextPath()%>/upload/member/profile/"+element.profileImgOriname+'>');
	                $div.append('<h3>' + element.feedWriterName + '</h3>');
	                $div.append('<h3>' + element.feedWriteDate + '</h3>');
	                $div.append('<h3>' + element.feedUpdateDate + '</h3>');
	                $div.append('<h3>' + element.feedContent + '</h3>');
	                $div.append('<h3>' + element.likes + '</h3>');
	                $div.append('<h3>' + element.report + '</h3>');

	                if (element.filePath != undefined) {
	                    const fileArr = element.filePath.split(",");
	                    const img_list = $('<div>').attr('class', 'img_list');
	                    $div.append(img_list);
	                    const img_listBt = $('<div>').attr('class', 'img_listBt');
	                    img_list.append(img_listBt);

	                    for (let i = 0; i < fileArr.length; i++) {
	                        if (fileArr[i] != "/SemiProject-KLP/upload/feed/null") {
	                            img_listBt.append($('<div>').html($('<img>').attr({
	                                'src': fileArr[i],
	                                'width': '500px',
	                                'height': '500px'
	                            })));
	                        }
	                    }

	                    const slider_btn = $('<div>').attr('class', 'slider_btn');
	                    slider_btn.append($('<a>').html('이전').attr('class', 'prev'));
	                    slider_btn.append($('<a>').html('다음').attr('class', 'next'));
	                    img_list.append(slider_btn);

	                    // Initialize carousel
	                    initializeCarousel(img_list);
	                }

	                $div.append('<br>' + '<button class="likes">' + '좋아요' + '</button>');
	                $div.append('<br>' + '<button class="comment">' + '댓글' + '</button>');
	                $div.append('<br>' + '<button class="reportBt">' + '신고' + '</button>');
	                $(container).append($div);
	            });
	            time = true;
	            page++;
	        },
	        error: function(request, status, error) {
	            alert('code:' + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}
   
   $(document).on("click", "button.reportBt", function(e) {
	    const $button = $(e.target);
	    const $board = $button.closest('.board');
	    const $feedNo = $board.find('.feedNo');
	    const feedNoText = $feedNo.val();
	    
	    let url = '<%=request.getContextPath()%>/feed/feedreportview.do?feedno=' + feedNoText;
	    let popup = window.open(url, "popup", "width=400, height=300, left=100, top=50");
	});
//댓글 버튼 클릭  
   $(document).on("click", "button.comment", function(e) {
	    const $parent = $(e.target).parent();
	    const existingDiv = $parent.find('.comment-container');
		const feedNoText = $(e.target).parent().find('.feedNo').val();
		console.log(feedNoText);
	    if (existingDiv.length > 0) {
	        existingDiv.remove();
	    } else {
	        const newDiv = $("<div>").addClass('comment-container').css("border", "1px solid red");
	        const commentBt = $("<a>").text("등록").addClass('commentBt');
	        const innerDiv = $("<div>").css("border", "1px solid blue");
	        const textArea = $("<textarea>").css("width", "80%")
			
	        innerDiv.append(textArea);
	        innerDiv.append(commentBt);
	        newDiv.append(innerDiv);
	        $parent.append(newDiv);
	        
	        selectComment(feedNoText)
	    }
	});
//댓글 작성버튼 클릭
   $(document).on("click", "a.commentBt", function(e) {
	    const $button = $(e.target);
	    const $board = $button.closest('.board');
	    const $feedNo = $board.find('.feedNo');
	    const $textArea = $button.closest('div').find('textarea');

	    let commentText = $textArea.val();
	    const feedNoText = $feedNo.text();
	    ajaxComment(commentText, feedNoText);

	    $textArea.val("");
	});

	const ajaxComment = (commentText, feedNoText) => {
	    $.ajax({
	        type: "POST",
	        url: "<%=request.getContextPath()%>/feed/feedcomment.do",
	        data: {
	            "loginMember":"<%=loginMember.getMemberNo()%>"
	            ,  
	            "commentText": commentText,
	            "feedNoText": feedNoText
	        },
	        success: function(data) {
	            selectComment(feedNoText);
	        },
	        error: function(xhr, status, error) {
	            console.error('Error submitting comment:', error);
	        }
	    });
	};
	
	
// 해당 피드 댓글목록 불러오기 
	const selectComment = (feedNoText) => {
	    $.ajax({
	        type: "POST",
	        url: "<%=request.getContextPath()%>/feed/selectcomment.do",
	        data: {
	            "feedNo": feedNoText
	        },
	        success: function(data) {
	            const $commentContainer = $('.board .comment-container');
	            $commentContainer.find('.comment-item').remove();

	            $.each(data, function(idx, element) {
	                const $commentDiv = $("<div>").css({
	                    "border": "1px solid red",
	                    "width": "800px",
	                    'overflow': 'hidden'
	                }).addClass("comment-item");

	                $commentDiv.append('<input type="hidden" class="replyNumber" value='+element.replyNumber+'>');
	                $commentDiv.append('<input type="hidden" class="feedNo" value='+ element.feedNo +'>');
	                $commentDiv.append('<h3>' + element.replyDate + '</h3>');
	                $commentDiv.append('<h3>' + element.likes + '</h3>');
	                $commentDiv.append('<h3>' + element.memberNo + '</h3>');
	                $commentDiv.append('<h3 class="replyContent">' + element.replyContent + '</h3>');
	                
	                if(<%=loginMember.getMemberNo()%>==element.memberNo){
	               		$commentDiv.append('<br><a class="deleteBt"=>' + '삭제' + '</a>');
	               		$commentDiv.append('<a class="updateBt"=>' + '수정' + '</a>');
	                }

	                $commentContainer.append($commentDiv);
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error('Error fetching comments:', error);
	        }
	    });
	};
	
//댓글 삭제기능
	 $(document).on("click", "a.deleteBt", function(e){	

		 	const replyNumber =  $(e.target).parent().find('.replyNumber').val();
		 	const feedNo = $(e.target).parent().find('.feedNo').val();
			
			$.ajax({
				type:"POST",
				url:"<%=request.getContextPath()%>/feed/feedcommentdelete.do",
				data:{
					"replyNumber":replyNumber
				},
				success:
					function(data){
						selectComment(feedNo)
					}
				
				
				
			})
		
	 })
	 
//댓글 수정기능
$(document).on("click", "a.updateBt", function(e) {
    const $parent = $(e.target).parent();
    const replyNumber = $parent.find('.replyNumber').val();
    const feedNo = $parent.find('.feedNo').val();
    const $feedReply = $parent.find('h3.replyContent');
    const feedReplyContent = $feedReply.text();
    
    const $textarea = $("<textarea>").val(feedReplyContent);
    
    const $cancelButton = $("<button>").text("취소").addClass("cancelUpdate");
    const $confirmButton = $("<button>").text("확인").addClass("confirmUpdate");
    
    const $container = $("<div>").append($textarea, $cancelButton, $confirmButton);
    
    $feedReply.replaceWith($container);
    
    $cancelButton.click(function() {
        $container.replaceWith($feedReply);
    });
    $confirmButton.click(function() {
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/feed/feedcommentupdate.do",
            data: {
                "replyNumber": replyNumber,
                "replyContent": $textarea.val() 
            },
            success: function(data) {
                selectComment(feedNo);
            },
            error: function(xhr, status, error) {
                console.error('Error updating comment:', error);
            }
        });
    });
});

	
// 캐러셀 기능 
   const initializeCarousel = (carousel) => {
	    const imgListBt = carousel.find('.img_listBt');
	    const slides = imgListBt.children();
	    const totalSlides = slides.length;
	    let index = 0;

	    const showSlide = (idx) => {
	        const slideWidth = slides.first().outerWidth();
	        if (idx >= totalSlides) idx = 0;
	        if (idx < 0) idx = totalSlides - 1;
	        imgListBt.css('transform', 'translateX(' + (-idx * slideWidth) + 'px)');
	        index = idx;  // Update the global index after correction
	    }

	    carousel.find('.prev').click(() => {
	        showSlide(index - 1);
	    });

	    carousel.find('.next').click(() => {
	        showSlide(index + 1);
	    });

	    // Initial display of the first slide
	    showSlide(index);
	}
// 좋아요 기능
   function switchingLikes(feedNo,e) {
	    $.ajax({
	        type: "POST",
	        url: "<%=request.getContextPath()%>/feed/likesswitch.do",
	        data: {
	            "memberNo": '<%=loginMember.getMemberNo()%>',
	            "feedNo": feedNo
	        },
	        success: function(data) {
	            console.log(data + "data");
	            $(e.target).text("좋아요 "+data);
	        }
	    });
	}
	   
	$(document).ready(function () {
	    $(document).on('click', '.likes', function(e) {
	        const feedNo = $(e.target).parent().find('input.feedNo').val();
	        console.log(feedNo);
	        switchingLikes(feedNo, e);
	    });
	}); 

   

document.addEventListener("DOMContentLoaded", function () {
		loadPage();
  		window.addEventListener("scroll", function () {
       const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
       const windowHeight = window.innerHeight;
       const scrollHeight = document.documentElement.scrollHeight;
	if (scrollTop + windowHeight >= scrollHeight - 150) {
     		if(time){
	      time=false;
        	loadPage();
	        	
      		}
		}
    });
});

</script>
</html>
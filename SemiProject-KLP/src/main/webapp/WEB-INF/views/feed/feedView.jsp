<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,java.text.SimpleDateFormat,com.kupid.feed.model.dto.Feed,com.kupid.feed.model.service.FeedService,com.kupid.member.model.dto.MemberDto"  %>
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
            <input type="hidden" name="writer" value="<%=loginMember.getMemberId()%>">
            <div>
                <input type="file" id="upfile" multiple>
            </div>
            <div>
                <textarea class="form-control" cols="40" rows="5" name="content" id="content"></textarea>
            </div>
            <button type="submit" >제출</button>
            <button type="button" onclick="test()">테스트용 버튼</button>
        </form>
    </div>

    <div id="result"></div>
    <div class="container" id="container"></div>  
</body>
<style>
.indicators {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
}

.indicator {
    width: 10px;
    height: 10px;
    background-color: black;
    margin: 0 5px;
    border-radius: 50%;
    cursor: pointer;
}

.indicator.active {
    background-color: gray; /* 활성 상태일 때 색상 변경 */
}


*, *:before, *:after {
  position: relative;
  box-sizing: border-box;
}:root {
  --color-bg: #FDF1F2;
  --color-heart: #EA442B;
  --easing: cubic-bezier(.7,0,.3,1);
  --duration: .5s;
}


.likes {
  font-size: 47px;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  border: none;
  border-radius: 50%;
  background: transparent;
  width: 1em;
  height: 1em;
  padding: 0;
  margin: 0;
  outline: none;
  z-index: 2;
  -webkit-transition: -webkit-transform var(--duration) var(--easing);
  transition: -webkit-transform var(--duration) var(--easing);
  transition: transform var(--duration) var(--easing);
  transition: transform var(--duration) var(--easing), -webkit-transform var(--duration) var(--easing);
  cursor: pointer;
}
.likes:before {
  z-index: -1;
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: inherit;
  -webkit-transition: inherit;
  transition: inherit;
}
.likes:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: #fff;
  border-radius: inherit;
  z-index: -1;
}

@-webkit-keyframes depress {
  from, to {
    -webkit-transform: none;
            transform: none;
  }
  50% {
    -webkit-transform: translateY(5%) scale(0.9);
            transform: translateY(5%) scale(0.9);
  }
}
@keyframes depress {
  from, to {
    -webkit-transform: none;
            transform: none;
  }
  50% {
    -webkit-transform: translateY(5%) scale(0.9);
            transform: translateY(5%) scale(0.9);
  }
}
@-webkit-keyframes depress-shadow {
  from, to {
    -webkit-transform: none;
            transform: none;
  }
  50% {
    -webkit-transform: scale(0.5);
            transform: scale(0.5);
  }
}
@keyframes depress-shadow {
  from, to {
    -webkit-transform: none;
            transform: none;
  }
  50% {
    -webkit-transform: scale(0.5);
            transform: scale(0.5);
  }
}
.like-wrapper {
  display: grid;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: center;
          justify-content: center;
  z-index: 1;
}
.like-wrapper > * {
  margin: auto;
  grid-area: 1 / 1;
}

.heart {
  width: .5em;
  height: .5em;
  display: block;
  -webkit-transform-origin: center 80%;
          transform-origin: center 80%;
}
.heart > path {
  stroke: var(--color-heart);
  stroke-width: 1.5;
  fill: transparent;
  -webkit-transition: fill var(--duration) var(--easing);
  transition: fill var(--duration) var(--easing);
}

/* 빨간 하트로 바꿔주기 */
.likes:focus .heart > path {
  fill: var(--color-heart);
}

.heart {
  -webkit-animation: heart-bounce var(--duration) var(--easing);
          animation: heart-bounce var(--duration) var(--easing);
}
@-webkit-keyframes heart-bounce {
  40% {
    -webkit-transform: scale(0.7);
            transform: scale(0.7);
  }
  0%, 80%, 100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@keyframes heart-bounce {
  40% {
    -webkit-transform: scale(0.7);
            transform: scale(0.7);
  }
  0%, 80%, 100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
/* Added wrapper to prevent layout jank with resizing particles */
.particles {
  width: 1px;
  height: 1px;
}

.particle {
  position: absolute;
  top: 0;
  left: 0;
  height: .1em;
  width: .1em;
  border-radius: .05em;
  background-color: var(--color);
  --percentage: calc( var(--i) / var(--total-particles) );
  --Θ: calc( var(--percentage) * 1turn );
  -webkit-transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(0) scaleY(0);
          transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(0) scaleY(0);
  -webkit-transition: all var(--duration) var(--easing);
  transition: all var(--duration) var(--easing);
}
.likes:focus .particle {
  -webkit-animation: particles-out calc(var(--duration) * 1.2) var(--easing) forwards;
          animation: particles-out calc(var(--duration) * 1.2) var(--easing) forwards;
}
@-webkit-keyframes particles-out {
  50% {
    height: .3em;
  }
  50%, 60% {
    height: .3em;
    -webkit-transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(0.8em) scale(1);
            transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(0.8em) scale(1);
  }
  60% {
    height: .2em;
  }
  100% {
    -webkit-transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(1em) scale(0);
            transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(1em) scale(0);
  }
}
@keyframes particles-out {
  50% {
    height: .3em;
  }
  50%, 60% {
    height: .3em;
    -webkit-transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(0.8em) scale(1);
            transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(0.8em) scale(1);
  }
  60% {
    height: .2em;
  }
  100% {
    -webkit-transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(1em) scale(0);
            transform: translate(-50%, -50%) rotate(var(--Θ)) translateY(1em) scale(0);
  }
}
.ripple {
  height: 1em;
  width: 1em;
  border-radius: 50%;
  overflow: hidden;
  z-index: 1;
}
.ripple:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border: 0.4em solid var(--color-heart);
  border-radius: inherit;
  -webkit-transform: scale(0);
          transform: scale(0);
}
.likes:focus .ripple:before {
  -webkit-animation: ripple-out var(--duration) var(--easing);
          animation: ripple-out var(--duration) var(--easing);
}
@-webkit-keyframes ripple-out {
  from {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  to {
    -webkit-transform: scale(5);
            transform: scale(5);
  }
}
@keyframes ripple-out {
  from {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  to {
    -webkit-transform: scale(5);
            transform: scale(5);
  }
}

/* 다시 클릭하면 원래대로 */
.likes:focus {
  pointer-events: none;
  cursor: normal;
}

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

    .board-header {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .board-footer {
        display: flex;
        justify-content: left;
        margin-top: 10px;
    }

    .textArea {
  width: 300px;
  height: 80px;
  font-size: 18px;
  resize: none;
  color: black;
  border: none;
  border-bottom: 2px solid #0000007e;
  outline: none;
}
</style>
<script>
const test = () => {
    console.log(<%=loginMember.getMemberNo()%>);
    console.log('<%=loginMember.getProfileImgOriname()%>');
}

function submitFeed() {
	 var textareaContent = document.getElementById("content").value;

	    if (textareaContent.trim() === '') {
	        alert("내용을 입력하세요.");
	        return false;
	    }else{
    $.each($('#upfile')[0].files, function(idx, file) {
        var fileInput = $('<input>').attr('type', "file").attr('name', "upfile"+idx).css({'display':'none'});
        fileInput[0].file = file;
        $('#feedForm').append(fileInput);
    })}
    return true;
}

const container = document.getElementById("container");
$(container).css({"display": "flex", "flex-direction": "column", "justify-content": "center", "align-items": "center"});
let page = 1; 
const perPage = 10;
let time = true;
//피드 페이지 불러오기
const loadPage = () => {    
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/feed/InfiniteScroll.do",
        data: {
            "cPage": page,
            "numPerPage": perPage
        },
        success: function(data) {
            $.each(data, function(idx, element) {
                const $div = $("<div>").css({
                    "border-bottom": "1px solid #aba7a7",
                    "width": "800px",
                    'overflow': 'hidden',
                    'padding-bottom': '10px'
                }).attr("class", "board");

                $div.append('<input type="hidden" class="feedNo" value='+element.feedNo+'>');
                $div.append('<input type="hidden" class="memberNo" value='+element.feedMemberName+'>');

                const $header = $('<div>').addClass('board-header');
                $header.append('<div><img style="border-radius:50%; height:32px; width:32px;" src="<%=request.getContextPath()%>/upload/member/profile/' + element.profileImgOriname + '"></div>');
                $header.append('<div>' + element.feedWriterName + '</div>');
                if(element.feedUpdateDate == undefined){
                $header.append('<div>' + element.feedWriteDate + '</div>');
                }else $header.append('<div>' + element.feedUpdateDate + '</div>');
                $div.append($header);

                $div.append('<div>' + element.feedContent + '</div>');

                if (element.filePath !== undefined) {
                    const fileArr = element.filePath.split(",");
                    const img_list = $('<div>').attr('class', 'img_list');
                    $div.append(img_list);
                    const img_listBt = $('<div>').attr('class', 'img_listBt');
                    img_list.append(img_listBt);

                    for (let i = 0; i < fileArr.length; i++) {
                        if (fileArr[i] !== "/SemiProject-KLP/upload/feed/null") {
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

                    initializeCarousel(img_list);
                }

                const $footer = $('<div>').addClass('board-footer');
                $footer.append('<button class="likes">'+
                	    '<div class="like-wrapper">'+
                	      '<div class="ripple"></div>'+
                	      '<svg class="heart" width="24" height="24" viewBox="0 0 24 24">'+
                	        '<path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>'+
                	      '</svg>'+
                	      '<div class="particles" style="--total-particles: 6">'+
                	        '<div class="particle" style="--i: 1; --color: #7642F0"></div>'+
                	        '<div class="particle" style="--i: 2; --color: #AFD27F"></div>'+
                	        '<div class="particle" style="--i: 3; --color: #DE8F4F"></div>'+
                	        '<div class="particle" style="--i: 4; --color: #D0516B"></div>'+
                	        '<div class="particle" style="--i: 5; --color: #5686F2"></div>'+
                	        '<div class="particle" style="--i: 6; --color: #D53EF3"></div>'+
                	      '</div>'+
                	    '</div>'+
                	  '</button>');
                $footer.append('<button class="comment">댓글</button>');
                $footer.append('<button class="reportBt">신고</button>');
                $div.append($footer);

                $(container).append($div);
            });
            time = true;
            page++;
        },
        error: function(request, status, error) {
            alert('code:' + request.status + "\nmessage:" + request.responseText + "\nerror:" + error);
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
    const $footer = $(e.target).closest('.board-footer');
    const existingDiv = $footer.next('.comment-container');
    const feedNoText = $(e.target).closest('.board').find('input.feedNo').val();

    if (existingDiv.length === 0) { // 기존에 댓글 입력창이 없으면 새로 생성
        const newDiv = $("<div>").addClass('comment-container')
        ;
        const commentBt = $("<button>").text("등록").addClass('commentBt');
        const innerDiv = $("<div>");
        const textArea = $("<textarea>").css("width", "80%").addClass('textArea');

        innerDiv.append(textArea);
        innerDiv.append(commentBt);
        newDiv.append(innerDiv);
        $footer.after(newDiv);

        // 생성된 댓글 입력창을 보이도록 설정
        newDiv.show();

        selectComment(feedNoText);
    } else { // 기존에 댓글 입력창이 있으면 토글
        existingDiv.toggle();
    }
});


// 댓글 작성 버튼 클릭
$(document).on("click", "button.commentBt", function(e) {
    const $button = $(e.target);
    const $board = $button.closest('.board');
    const $feedNo = $board.find('.feedNo');
    const $textArea = $button.closest('div').find('textarea');

    let commentText = $textArea.val().trim();
    const feedNoText = $feedNo.val();

    if (commentText !== undefined && commentText !== "") {
        ajaxComment(commentText, feedNoText);
        $textArea.val("");
    } else {
        alert("내용을 입력하세요.");
    }
});

const ajaxComment = (commentText, feedNoText) => {
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/feed/feedcomment.do",
        data: {
            "loginMember": "<%=loginMember.getMemberNo()%>",
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

// 해당 피드 댓글 목록 불러오기 
const selectComment = (feedNoText) => {
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/feed/selectcomment.do",
        data: {
            "feedNo": feedNoText
        },
        success: function(data) {
            const $commentContainer = $('input.feedNo[value="' + feedNoText + '"]').closest('.board').find('.comment-container');

            $.each(data, function(idx, element) {
                const $commentDiv = $("<div>").css({
                    "border-bottom": "1px solid #aba7a7",
                    "width": "800px",
                    'overflow': 'hidden',
                    'padding-bottom': '10px'
                }).addClass("comment-item");

                $commentDiv.append('<input type="hidden" class="replyNumber" value=' + element.replyNumber + '>');
                $commentDiv.append('<input type="hidden" class="feedNo" value=' + element.feedNo + '>');
                $commentDiv.append('<div>' + element.replyDate + '</div>');
                $commentDiv.append('<div>' + element.likes + '</div>');
                $commentDiv.append('<div>' + element.memberNo + '</div>');
                $commentDiv.append('<div class="replyContent">' + element.replyContent + '</div>');

                if (<%=loginMember.getMemberNo()%> == element.memberNo) {
                    $commentDiv.append('<br><a class="deleteBt">삭제</a>');
                    $commentDiv.append('<a class="updateBt">수정</a>');
                }

                $commentContainer.append($commentDiv);
            });
        },
        error: function(xhr, status, error) {
            console.error('Error fetching comments:', error);
        }
    });
};

// 댓글 삭제 기능
$(document).on("click", "a.deleteBt", function(e) {    
    const replyNumber = $(e.target).parent().find('.replyNumber').val();
    const feedNo = $(e.target).parent().find('.feedNo').val();
    
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/feed/feedcommentdelete.do",
        data: {
            "replyNumber": replyNumber
        },
        success: function(data) {
            selectComment(feedNo);
        }
    });
});

// 댓글 수정 기능
$(document).on("click", "a.updateBt", function(e) {
    const $parent = $(e.target).parent();
    const replyNumber = $parent.find('.replyNumber').val();
    const feedNo = $parent.find('.feedNo').val();
    const $feedReply = $parent.find('div.replyContent');
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

//캐러셀 기능 
const initializeCarousel = (carousel) => {
    const imgListBt = carousel.find('.img_listBt');
    const slides = imgListBt.children();
    const totalSlides = slides.length;
    let index = 0;

    const indicators = $('<div class="indicators"></div>');
    for (let i = 0; i < totalSlides; i++) {
        const indicatorClass = i === 0 ? ' active' : '';
        indicators.append('<span class="indicator' + indicatorClass + '" data-index="' + i + '"></span>');
    }
    carousel.append(indicators);
    
    const showSlide = (idx) => {
        const slideWidth = slides.first().outerWidth();
        if (idx >= totalSlides) idx = 0;
        if (idx < 0) idx = totalSlides - 1;
        imgListBt.css('transform', 'translateX(' + (-idx * slideWidth) + 'px)');
        index = idx;

        updateIndicators();
    }
    
 // Update indicators
    const updateIndicators = () => {
        carousel.find('.indicator').removeClass('active').eq(index).addClass('active');
    }

    // Handle click events for indicators
    carousel.on('click', '.indicator', function() {
    const idx = $(this).data('index');
    showSlide(idx);
});


    carousel.find('.prev').click(() => {
        showSlide(index - 1);
    });

    carousel.find('.next').click(() => {
        showSlide(index + 1);
    });

    showSlide(index);
}


// 좋아요 기능
function switchingLikes(feedNo, e) {
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/feed/likesswitch.do",
        data: {
            "memberNo": '<%=loginMember.getMemberNo()%>',
            "feedNo": feedNo
        },
        success: function(data) {
            $(e.target).text("좋아요 " + data);
        }
    });
}

$(document).ready(function() {
    $(document).on('click', '.likes', function(e) {
        const feedNo = $(e.target).parent().find('input.feedNo').val();
        switchingLikes(feedNo, e);
    });
}); 

document.addEventListener("DOMContentLoaded", function() {
    loadPage();
    window.addEventListener("scroll", function() {
        const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        const windowHeight = window.innerHeight;
        const scrollHeight = document.documentElement.scrollHeight;
        if (scrollTop + windowHeight >= scrollHeight - 150) {
            if (time) {
                time = false;
                loadPage();
            }
        }
    });
});
</script>
</html>

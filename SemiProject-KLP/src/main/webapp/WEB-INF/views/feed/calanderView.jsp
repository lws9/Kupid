<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,java.text.SimpleDateFormat,com.kupid.feed.model.dto.Feed,com.kupid.feed.model.service.FeedService,com.kupid.member.model.dto.MemberDto"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js'></script>
</head>
<script>

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectMirror: true,
        select: function(arg) {
            console.log(arg);

            var title = prompt('입력할 일정:');
            if (title) {
                calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                    backgroundColor: "yellow",
                    textColor: "blue"
                });
            }
            calendar.unselect();
        },
        eventClick: function(arg) {
            console.log("#등록된 일정 클릭#");
            console.log(arg.event);
            
            if (confirm('Are you sure you want to delete this event?')) {
                arg.event.remove();
            }
        },
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        events: function(fetchInfo, successCallback, failureCallback) {
            //================ ajax 데이터 불러올 부분 =====================//
            $.ajax({
                url: '<%=request.getContextPath()%>/feed/calendarbirth.do', // 이벤트 데이터를 불러올 서버의 URL
                method: 'GET',
                data:{"groupNo":}
                dataType: 'json',
                success: function(data) {
                    successCallback(data);
                },
                error: function() {
                    failureCallback();
                }
            });
        }
    });
	console.log("dsasad");
    calendar.render();
});

  

</script>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	    <div id='calendar'></div>
	
</body>
</html>
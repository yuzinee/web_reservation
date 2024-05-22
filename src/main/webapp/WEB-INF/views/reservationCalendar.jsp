<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="/css/tab1.css">
<script src="/js/common.js"></script>
<!-- Full Calendar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<title>title</title>
</head>

<style>
    /* 캘린더 테이블 스타일 */
    #calendar {
        width: 100%;
        height: 800px;
        background-color: #ffffff;
    }
</style>

<body>
    <div class="tab">
        <ul class="tabnav">
            <li><a href="#tab01">탭1</a></li>
            <li><a href="#tab02">탭2</a></li>
        </ul>
        <div class="tabcontent">
            <div id="tab01">
                <button id="openButton">Open</button>
                <div id='calendar'></div>
            </div>
            <div id="tab02">tab2 content</div>
        </div>
    </div>
</body>

<script>
	var calendar;

    $(document).ready(function() {
        // Tab event
        tabControl();
        
        // Calendar load
        calendarLoad();

        // open click
        $('#openButton').click(function() {
            insertMonthDates(calendar);
        }); 
    });

    /* Tab event */
    function tabControl() {
        $('.tabcontent > div').hide();
        $('.tabnav a').click(function () {
            $('.tabcontent > div').hide().filter(this.hash).fadeIn();
            $('.tabnav a').removeClass('active');
            $(this).addClass('active');
            
            return false;
        }).filter(':eq(0)').click();
    }
	
    /* Calendar load */
    function calendarLoad(){
    	
    	var param = {
      		"queryId" : "userReservationDAO.selectRoomListPayN"
      	}
      	
      	com_selectList(param, function(reservationList) {
      		var calendarEl = document.getElementById('calendar');
            calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events: reservationList,
                eventClick : function(info) {
                	// 클릭된 이벤트에 대한 타이틀을 가져옴
	                var roomNm = info.event.title;
	                
	                // 클릭된 이벤트의 시작 날짜를 가져옴
	                var startDate = info.event.start;
	
	                // 날짜에 하루를 추가
	                var adjustedDate = new Date(startDate);
	                adjustedDate.setDate(adjustedDate.getDate() + 1);
	
	                // 날짜를 원하는 형식으로 변환 (예: YYYY-MM-DD)
	                var formattedDate = adjustedDate.toISOString().split('T')[0];
	
	                // 타이틀과 날짜를 콘솔에 출력
	                console.log('Event Title: ', roomNm);
	                console.log('Event Start Date: ', formattedDate);
	                
	                location.href = 'http://localhost:8083/reservationList?startDate='+formattedDate;

                },
                displayEventTime: false
            });

            calendar.render();
      	})
    }
	
    /* open click */
    function insertMonthDates(calendar) {
    	var today = calendar.getDate(); 
        var start = new Date(today.getFullYear(), today.getMonth(), 2); 
        var end = new Date(today.getFullYear(), today.getMonth() + 1, 1); 
        var dates = [];
        
        for (var date = new Date(start); date <= end; date.setDate(date.getDate() + 1)) {
            dates.push(new Date(date));
        }

        var formattedDates = dates.map(function(date) {
            return date.toISOString().split('T')[0];
        });
        
        var selectParam = {
            	"queryId" : "userReservationDAO.selectRoomList"
            }
            
        com_selectList(selectParam, function(e){
        	var room = e;
        	
        	var insertParam = {
              	"queryId" : "userReservationDAO.insertReservationList"
              , "room" : room
              , "date" : formattedDates
            }
              	
            com_insert(insertParam);
        })    
    }
</script>
</html>
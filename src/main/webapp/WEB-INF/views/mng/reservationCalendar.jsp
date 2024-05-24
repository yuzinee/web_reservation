<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="/css/com/tab1.css">
<link rel="stylesheet" type="text/css" href="/css/com/table1.css">
<link rel="stylesheet" type="text/css" href="/css/com/calendar.css">
<script src="/js/com/common.js"></script>
<!-- Full Calendar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<title>title</title>
</head>

<body>
    <div id="tab01">
        <button id="btnOpen" style="display:none">Open</button>
        <div id='calendar'></div>
    </div>   
</body>

<script>
	var calendar;

    $(document).ready(function() {
    	initializeCalendar([]);	// 캘린더 로드
    	
    	// 캘린더 버튼 이벤트 추가
    	$('.fc-today-button, .fc-prev-button, .fc-next-button').on('click', function() {
        	selectReserList()
        });

        // open 클릭
        $('#btnOpen').click(function() {
            insertMonthDates(calendar);
        }); 
    });

    /* 캘린더 로드 */
    function initializeCalendar(events) {
        var calendarEl = document.getElementById('calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            events: events,
            eventClick: function(info) {
                location.href = '';
            },
            displayEventTime: false
        });

        calendar.render();	// 캘린더 렌더링
        selectReserList();	// 예약내역 조회
    }
    
 	/* 캘린더 events 추가 */
    function addEventsToCalendar(events) {
    	calendar.removeAllEvents();
        calendar.addEventSource(events);
    }
 	
 	/* 예약내역 조회 */
    function selectReserList(){
 		var param = {
            "queryId": "userReservationDAO.selectRoomListPayN",
            "date": calendar.getDate().getFullYear() + '-' + ('0' + (calendar.getDate().getMonth() + 1)).slice(-2)
        };

        com_selectList(param, function(reservationList) {
            if (reservationList.length > 0) {
                addEventsToCalendar(reservationList);
            }
        });
 	}
	
    /* open 클릭 */
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
              	"queryId" 	: "userReservationDAO.insertReservationList"
              , "room"	  	: room
              , "date" 		: formattedDates
            }
              	
            com_insert(insertParam);
        })    
    }
</script>
</html>
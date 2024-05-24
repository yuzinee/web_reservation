<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="/css/com/tab1.css">
<link rel="stylesheet" type="text/css" href="/css/com/table1.css">
<script src="/js/com/common.js"></script>
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
    <div id="tab01">
        <button id="btnOpen" style="display:none">Open</button>
        <div id='calendar'></div>
    </div>   
</body>

<script>
	var calendar;

    $(document).ready(function() {
        // Calendar load
        calendarLoad();

        // open click
        $('#btnOpen').click(function() {
            insertMonthDates(calendar);
        }); 
    });

    /* Calendar load */
    function calendarLoad(){
    	var param = {
      		"queryId" : "userReservationDAO.selectRoomListPayN"
      	}
      	
      	com_selectList(param, function(reservationList) {
      		
      		if(reservationList.length == 0){
      			$("#btnOpen").show();
      		}
      		
      		var calendarEl = document.getElementById('calendar');
            calendar = new FullCalendar.Calendar(calendarEl, {
                initialView	: 'dayGridMonth'
              , events		: reservationList
              , eventClick 	: function(info) {
	                location.href = '';

                }
              , displayEventTime: false
            });

            calendar.render();
            
            $('.fc-next-button').on('click', function() {
           		console.log("asdf");
           	});
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
              	"queryId" 	: "userReservationDAO.insertReservationList"
              , "room"	  	: room
              , "date" 		: formattedDates
            }
              	
            com_insert(insertParam);
        })    
    }
</script>
</html>
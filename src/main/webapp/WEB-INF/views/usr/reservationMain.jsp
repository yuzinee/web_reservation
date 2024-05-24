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
    <div class="tab">
        <ul class="tabnav">
            <li><a href="#tab01">실시간예약</a></li>
            <li><a href="#tab02">예약확인/취소</a></li>
        </ul>
        <div class="tabcontent">
            <div id="tab01">
                <button id="openButton">Open</button>
                <div id='calendar'></div>
            </div>
            <div id="tab02">
            	<h2>예약정보입력</h2>
            	<div role="region" aria-label="data table" tabindex="0" class="primary">
					<table id="tbUserInfo">
						<tbody>
							<tr>
								<th>성함</th>
								<td><input type="text" id="userNm"/></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" id="userNbr1_1"/> - <input type="text" id="userNbr1_2"/> - <input type="text" id="userNbr1_3"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<input type="button" id="btnConfirm" value="예약확인 및 취소" onclick="btnConfirmOnclick()"/>
				<div id="divReservationInfo" style="display: none">
					<h2>예약내역</h2>
	            	<div role="region" aria-label="data table" tabindex="0" class="primary">
						<table id="tbReservationInfo">
				        	<thead>
						        <tr>						        	
						            <th>선택</th>
						            <th>객실</th>
						            <th>이용날짜</th>
						            <th>방문인원</th>
						            <th>결제금액</th>
						            <th>결제일</th>
						            <th>예약확정여부</th>
						        </tr>
				      	    </thead>
				      		<tbody>
				        	</tbody>
				    	</table>
					</div>
					<input type="button" id="btnCancel" value="예약취소" onclick="btnCancelOnclick()"/>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
	var calendar;

    $(document).ready(function() {
        tabControl(); 			 	// 탭 이벤트
        initializeCalendar([]);		// 캘린더 로드
        
        // 캘린더 버튼 이벤트 추가
        $('.fc-today-button, .fc-prev-button, .fc-next-button').on('click', function() {
        	selectReserList();
        }); 
    });

    /* 탭 이벤트 */
    function tabControl() {
        $('.tabcontent > div').hide();
        $('.tabnav a').click(function () {
            $('.tabcontent > div').hide().filter(this.hash).fadeIn();
            $('.tabnav a').removeClass('active');
            $(this).addClass('active');
            
            return false;
        }).filter(':eq(0)').click();
    }
    
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
    
    /* 예약확인 및 취소 클릭 */
    function btnConfirmOnclick(){
    	var param = {
    		"queryId" 	: "userReservationDAO.selectReservationConfirm"
    	  , "userNm" 	: $("#userNm").val()
    	  , "userNbr"	: $("#userNbr1_1").val() + '-' + $("#userNbr1_2").val() + '-' + $("#userNbr1_3").val()
    	}
    	
    	com_selectList(param, function(data){
    		if(data.length >= 1){
    			$("#btnConfirm").hide();
    			$("#divReservationInfo").show();
    			
    			data.forEach(function(data) {
    				var row = $("<tr>");
    				row.append($("<td>").append($("<input>").attr("type", "checkbox")));
    				row.append($("<td>").text(data.room_nm));
    				row.append($("<td>").text(data.reser_dt));
    				row.append($("<td>").text(data.reser_ppl));
    				row.append($("<td>").text(data.reser_prc));
    				row.append($("<td>").text(data.pay_dt));
    				row.append($("<td>").text(data.pay_yn === 'O' ? '대기' : '확정'));
    				
    				$("#tbReservationInfo tbody").append(row);
    	        });
    		}
    	})
    }
    
    /* 예약취소 클릭 */
    function btnCancelOnclick(){
    	var checkedRows = [];

        $("#tbReservationInfo tbody tr").each(function() {
            var checkbox = $(this).find("input[type='checkbox']");

            if (checkbox.is(":checked")) {
                var rowData = {
                	"roomNm"	: $(this).find("td:nth-child(2)").text()
                  , "reserDt"	: $(this).find("td:nth-child(3)").text()
                };
                
                checkedRows.push(rowData);
            }
        });
		
        var param = {
        	"queryId" 		: "userReservationDAO.updateReservationCancel"
          , "cancelList"	: checkedRows
        }
        
        com_update(param, function(){

        })
    }
</script>
</html>
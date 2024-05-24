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
<!-- bootstrap -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>title</title>
</head>

<body>
    <button id="btnOpen" style="display:none">예약 오픈</button>
    <div id='calendar'></div>
    
    <div class="modal" id="modal1"  role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" >
		<div class="modal-dialog" style="width:850px;">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						×
					</button>
					<h4 class="modal-title" id="reserTitle"></h4>
				</div>
				<div class="modal-body">
					<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-togglebutton="false">
						<div role="content">
							<div class="widget-body">		
								 <table border="1">
						            <tbody>
						                <tr>
						                	<th>객실명</th>
						                    <td id="roomNm"></td>
						                    <th>인원</th>
						                    <td id="reserPpl"></td>
						                </tr>
						                <tr>
						                	<th>예약자</th>
						                    <td id="reserNm"></td>
						                	<th>날짜</th>
						                    <td id="reserDt"></td>
						                </tr>
						                <tr>
						                	<th>연락처</th>
						                    <td id="reserNbr1"></td>
						                	<th>비상연락망</th>
						                    <td id="reserNbr2"></td>
						                </tr>
						                <tr>
						                	<th>결제금액</th>
						                    <td id="reserPrc"></td>
						                	<th>예약일</th>
						                    <td id="payDt"></td>
						                </tr>
						                <tr>
						                	<th>요청사항</th>
						                    <td id="reserEtc" colspan="3"></td>
						                </tr>
						            </tbody>
						        </table>	
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnConfirm" onclick="btnConfirmOnclick()" style="display:none">예약확정</button>
					<button type="button" class="btn btn-primary" id="btnCancel" onclick="btnCancelOnclick()">예약취소</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal2"  role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" >
		<div class="modal-dialog" style="width:850px;">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						×
					</button>
					<h4 class="modal-title" id="reserTitle"></h4>
				</div>
				<div class="modal-body">
					<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-togglebutton="false">
						<div role="content">
							<div class="widget-body">		
								 <table border="1">
						            <tbody>
						                <tr>
						                	<th>객실명</th>
						                    <td id="inpRoomNm"></td>
						                	<th>날짜</th>
						                    <td id="inpReserDt"></td>
						                    <th>가격</th>
						                    <td><input type="text" id="inpReserPrc"/></td>
						                </tr>
						            </tbody>
						        </table>	
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnUpdate" onclick="btnUpdateOnclick()" style="display:none">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
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
            initialView: 'dayGridMonth'
          , events: events
          , eventClick: function(info) {
       	    	var title = info.event.title;
       	    	var startDate = new Date(info.event.start);
       	    	startDate.setDate(startDate.getDate() + 1); // 날짜를 하루 더함
       	    	var date = startDate.toISOString().split('T')[0];
       	    	
       	    	if (title.indexOf('예약확정') === -1 && title.indexOf('예약대기') === -1) {
       	    		showModal2(title, date);
				} else {
					showModal1(title, date);
				}
            }
          , displayEventTime: false
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
            "queryId": "managerReservationDAO.selectReserList"
          , "date": calendar.getDate().getFullYear() + '-' + ('0' + (calendar.getDate().getMonth() + 1)).slice(-2)
        };

        com_selectList(param, function(reservationList) {
            if (reservationList.length > 0) {
                addEventsToCalendar(reservationList);
                
                $("#btnOpen").hide();
            } else {
            	$("#btnOpen").show();
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
    
    /* 예약대기ㆍ예약확정 모달 */
    function showModal1(title, date){
    	$('#reserTitle').text(title)
        $("#modal1").modal("show");
    	
    	var roomNm = title.substring(0, title.lastIndexOf(' ', title.indexOf('(')));

    	var param = {
    		"queryId" 	: "managerReservationDAO.selectReserInfo"
    	  , "roomNm"	: roomNm
    	  , "reserDt"	: date
    	}
    	
    	com_selectOne(param, function(info){
    		$("#roomNm").text(info.room_nm);
    		$("#reserDt").text(info.reser_dt);
    		$("#reserNm").text(info.reser_nm);
    		$("#reserNbr1").text(info.reser_nbr1);
    		$("#reserNbr2").text(info.reser_nbr2);
    		$("#reserPpl").text(info.reser_ppl);
    		$("#reserPrc").text(info.reser_prc);
    		$("#payDt").text(info.pay_dt);
    		$("#reserEtc").text(' ');
    		
    		if (info.pay_yn == 'O') {
    			$("#btnConfirm").show();
    		} else if (info.pay_yn == 'Y') {
    			$("#btnConfirm").hide();
    		}
    	})
    }
    
    /* 예약없음 모달 */
    function showModal2(title, date){
    	$('#reserTitle').text(title)
        $("#modal2").modal("show");
    	$("#btnUpdate").show();
    	
    	var param = {
    		"queryId" 	: "managerReservationDAO.selectReserInfo"
    	  , "roomNm"	: title
    	  , "reserDt"	: date
    	}
    	
    	com_selectOne(param, function(info){
    		$("#inpRoomNm").text(info.room_nm);
    		$("#inpReserDt").text(info.reser_dt);
    		$("#inpReserPrc").val(info.reser_prc);
    	})
    }
    
    /* 예약확정 클릭 */
    function btnConfirmOnclick() {
    	if(confirm("예약을 확정하시겠습니까?")){
    		var param = {
   	    		"queryId" 	: "managerReservationDAO.updateReserConfirm"
   	    	  , "roomNm"	: $("#roomNm").text()
   	          , "reserDt"	: $("#reserDt").text()
   	    	}
   	    	
   	    	com_update(param);
    	}
    }
    
    /* 예약취소 클릭 */
	function btnCancelOnclick() {
		if(confirm("예약을 취소하시겠습니까?")){
    		var param = {
   	    		"queryId" 	: "managerReservationDAO.updateReserCancel"
   	    	  , "roomNm"	: $("#roomNm").text()
   	          , "reserDt"	: $("#reserDt").text()
   	    	}
   	    	
   	    	com_update(param);
    	}
    }
    
	/* 수정 클릭 */
	function btnUpdateOnclick() {
		if(confirm("가격을 수정하시겠습니까?")){
    		var param = {
   	    		"queryId" 	: "managerReservationDAO.updateReserPrice"
   	    	  , "roomNm"	: $("#inpRoomNm").text()
   	          , "reserDt"	: $("#inpReserDt").text()
   	          , "reserPrc"	: $("#inpReserPrc").val()
   	    	}
   	    	
   	    	com_update(param);
    	}
    }
</script>
</html>
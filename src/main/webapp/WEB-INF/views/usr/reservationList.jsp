<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/com/common.js"></script>
<!-- table -->
<link rel="stylesheet" type="text/css" href="/css/com/table1.css">
<title>title</title>
</head>

<style>
</style>

<body>
  <h2 id="pnsNm"></h2>
  <div role="region" aria-label="data table" tabindex="0" class="primary">
    <table id="tbPns">
      <tbody>
      	<tr>
          <th>주소</th>
          <td id="pnsAdr"></td>
        </tr>
        <tr>
          <th>전화번호</th>
          <td id="pnsNbr"></td>
        </tr>
        <tr>
          <th>체크인</th>
          <td id="checkIn"></td>
        </tr>
        <tr>
          <th>체크아웃</th>
          <td id="checkOut"></td>
        </tr>
        <tr>
          <th>추가요금</th>
          <td id="addPrice"></td>
        </tr>
        <tr>
          <th>기타</th>
          <td id="ect"></td>
        </tr>
      </tbody>
    </table>
  </div>

  <h2>이용날짜</h2>
  <span id="useDate"></span>

  <h2>객실선택</h2>
  <div role="region" aria-label="data table" tabindex="0" class="primary">
    <table id="tbRoom">
      <thead>
        <tr>
          <th>객실명</th>
          <th>크기</th>
          <th>인원</th>
          <th>방문인원</th>
          <th>요금</th>
          <th>선택</th>
        </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
  </div>
  
  <input type="button" value="예약하기" onclick="setInfo()"/>
</body>

<script>
	var startDate = '';
	var endDate = '';
	
    $(document).ready(function() {
    	// 펜션정보 세팅
    	var param = {
    		"queryId" : "userReservationDAO.selectPnsData"
    	}
    	
    	com_selectOne(param, function(data){
    		console.log(data);
    		
    		$("#pnsNm").text(data.pns_nm);
    		$("#pnsAdr").text(data.pns_adr);
    		$("#pnsNbr").text(data.pns_nbr);
    		$("#checkIn").text(data.check_in);
    		$("#checkOut").text(data.check_out);
    		$("#addPrice").text("추가인원: "+data.add_ppl+", 바베큐: "+data.add_bbq);
    		$("#etc").text(' ');
    	})
    	
    	// 이용날짜 세팅
    	startDate = com_getParameter('startDate');
    	
    	var date = new Date(startDate);
    	date.setDate(date.getDate() + 1);
    	endDate = date.toISOString().split('T')[0];
    	
    	$('#useDate').text(startDate + " ~ " + endDate);
    	
    	// 객실선택 세팅
    	var param = {
    		"queryId" : "userReservationDAO.selectRoomListDate"
    	  , "startDate" : startDate
    	}
    	
    	com_selectList(param, function(data){
    		var tableBody = $("#tbRoom tbody");

            $.each(data, function(index, item) {
                var row = $("<tr>");
                row.append($("<td>").text(item.room_nm));
                row.append($("<td>").text(item.room_size));
                row.append($("<td>").text("기준인원: " + item.stndr_ppl + "인  (최대: " + item.max_ppl + "인)"));
                var select = $("<select>");
                for (var i = 1; i <= parseInt(item.max_ppl); i++) {
                    select.append($("<option>").text(i).val(i));
                }
                row.append($("<td>").append(select));
                row.append($("<td>").text(item.reser_prc));
                row.append($("<td>").append($("<input>").attr("type", "checkbox")));
                tableBody.append(row);
            });
    	})
    });
    
    function setInfo() {
    	// 선택된 객실 정보를 저장할 배열
        var selectedRooms = [];

        // 각 행의 체크박스를 확인하여 선택된 객실 정보를 배열에 추가
        $("#tbRoom tbody tr").each(function(index, row) {
            var checkbox = $(row).find("input[type='checkbox']");
            if (checkbox.is(":checked")) {
                var roomInfo = {
                    roomNm: $(row).find("td:first-child").text()
                  , ppl: $(row).find("select").val()
                  , price: $(row).find("td:nth-child(5)").text()
                  , startDate: startDate
                  , endDate: endDate
                };
                
                selectedRooms.push(roomInfo);
            }
        });
        
        // 선택된 객실 정보를 로컬 스토리지에 저장
        localStorage.setItem("selectedRooms", JSON.stringify(selectedRooms));

        location.href = "http://localhost:8083/usr/reservationInfo";
    }
</script>
</html>
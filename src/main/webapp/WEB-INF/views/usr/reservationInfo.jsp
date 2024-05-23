<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<body>
	<h2>선택목록</h2>
	<div role="region" aria-label="data table" tabindex="0" class="primary">
		<table id="tbRoom">
			<thead>
				<tr>
					<th>객실명</th>
					<th>이용날짜</th>
					<th>인원</th>
					<th>결제금액</th>
					<th>추가요금</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

	<h2>예약정보입력</h2>
	<div role="region" aria-label="data table" tabindex="0" class="primary">
		<table id="tbReservation">
			<tbody>
				<tr>
					<th>성함 *</th>
					<td><input type="text" id="userNm"/></td>
				</tr>
				<tr>
					<th>생년월일 *</th>
					<td><input type="text" id="userBirth"/></td>
				</tr>
				<tr>
					<th>연락처 *</th>
					<td><input type="text" id="userNbr1_1"/> - <input type="text" id="userNbr1_2"/> - <input type="text" id="userNbr1_3"/></td>
				</tr>
				<tr>
					<th>비상연락처</th>
					<td><input type="text" id="userNbr2_1"/> - <input type="text" id="userNbr2_2"/> - <input type="text" id="userNbr2_3"/></td>
				</tr>
				<tr>
					<th>요청사항</th>
					<td><input type="text" id="userRemark"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<h2>안내사항 및 약관동의</h2>
	
	<input type="button" id="btnReservation" value="예약" onclick="btnReservationOnclick()"/>
</body>

<script>
	var reservationList = [];

	$(document).ready(function() {
		setReservation(); // 선택목록 세팅
	});
	
	/* 선택목록 세팅 */
	function setReservation() {
		reservationList = JSON.parse(localStorage.getItem("selectedRooms"));
		
		console.log(reservationList);
		
		var tableBody = $("#tbRoom tbody");
		
		$.each(reservationList, function(index, item) {
			var row = $("<tr>");
			row.append($("<td>").text(item.roomNm));
			row.append($("<td>").text(item.startDate+" ~ "+item.endDate));
			row.append($("<td>").text(item.ppl + "인"));
			row.append($("<td>").text(item.price));
			if (index === 0) { 
				row.append($("<td rowspan='" + reservationList.length + "'>").text("현장결제"));
			}
			
			tableBody.append(row);
		});
		
		localStorage.removeItem("selectedRooms");
	}
	
	function btnReservationOnclick() {
		for(var i=0; i<reservationList.length; i++){
			reservationList[i]["userNm"] = $("#userNm").val();
			reservationList[i]["userBirth"] = $("#userBirth").val();
			reservationList[i]["userNbr1"] = $("#userNbr1_1").val() + '-' + $("#userNbr1_2").val() + '-' + $("#userNbr1_3").val()
			reservationList[i]["userNbr2"] = $("#userNbr2_1").val() + '-' + $("#userNbr2_2").val() + '-' + $("#userNbr2_3").val()
			reservationList[i]["userRemark"] = $("#userRemark").val();
		}
		
		var param = {
			"queryId" : "userReservationDAO.updateReservation"
		  , "reservationList" : reservationList
		}
		
		com_insert(param, function(){
			console.log("update");
		})
	}
</script>
</html>
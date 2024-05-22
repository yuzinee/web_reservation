<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/common.js"></script>
<!-- table -->
<link rel="stylesheet" type="text/css" href="/css/table1.css">
<title>title</title>
</head>

<body>
	<h2>선택목록</h2>
	<div role="region" aria-label="data table" tabindex="0" class="primary">
		<table id="tbRoom">
			<thead>
				<tr>
					<th>객실명</th>
					<th>이용일</th>
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
					<td><input type="text"/></td>
				</tr>
				<tr>
					<th>생년월일 *</th>
					<td><input type="text"/></td>
				</tr>
				<tr>
					<th>연락처 *</th>
					<td><input type="text"/> - <input type="text"/> - <input type="text"/></td>
				</tr>
				<tr>
					<th>비상연락처</th>
					<td><input type="text"/> - <input type="text"/> - <input type="text"/></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text"/></td>
				</tr>
				<tr>
					<th>요청사항</th>
					<td><input type="text"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<h2>약관동의</h2>
</body>

<script>
	$(document).ready(
			function() {
				var roomList = JSON
						.parse(localStorage.getItem("selectedRooms"));

				console.log(roomList);

				var tableBody = $("#tbRoom tbody");

				$.each(roomList, function(index, item) {
					var row = $("<tr>");
					row.append($("<td>").text(item.roomNm));
					row.append($("<td>").text(' '));
					row.append($("<td>").text(item.ppl + "인"));
					row.append($("<td>").text(item.price));
					// 마지막 현장결제 td에만 rowspan 추가
					if (index === 0) { // 첫 번째 행에만 추가
						row.append($("<td rowspan='" + roomList.length + "'>")
								.text("현장결제"));
					}
					tableBody.append(row);
				});
			});
</script>
</html>
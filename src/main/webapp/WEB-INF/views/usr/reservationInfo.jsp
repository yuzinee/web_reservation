<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="/js/common.js"></script>
  <title>ㅇㅇ펜션</title>
  <link href="/css/com/bootstrap.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.122.0">
  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .b-example-divider {
      width: 100%;
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }

    .btn-bd-primary {
      --bd-violet-bg: #712cf9;
      --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

      --bs-btn-font-weight: 600;
      --bs-btn-color: var(--bs-white);
      --bs-btn-bg: var(--bd-violet-bg);
      --bs-btn-border-color: var(--bd-violet-bg);
      --bs-btn-hover-color: var(--bs-white);
      --bs-btn-hover-bg: #6528e0;
      --bs-btn-hover-border-color: #6528e0;
      --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
      --bs-btn-active-color: var(--bs-btn-hover-color);
      --bs-btn-active-bg: #5a23c8;
      --bs-btn-active-border-color: #5a23c8;
    }

    .bd-mode-toggle {
      z-index: 1500;
    }

    .bd-mode-toggle .dropdown-menu .active .bi {
      display: block !important;
    }

    .carousel-item {
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }

    .b-example-divider {
      width: 100%;
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }

    .btn-bd-primary {
      --bd-violet-bg: #712cf9;
      --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

      --bs-btn-font-weight: 600;
      --bs-btn-color: var(--bs-white);
      --bs-btn-bg: var(--bd-violet-bg);
      --bs-btn-border-color: var(--bd-violet-bg);
      --bs-btn-hover-color: var(--bs-white);
      --bs-btn-hover-bg: #6528e0;
      --bs-btn-hover-border-color: #6528e0;
      --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
      --bs-btn-active-color: var(--bs-btn-hover-color);
      --bs-btn-active-bg: #5a23c8;
      --bs-btn-active-border-color: #5a23c8;
    }

    .bd-mode-toggle {
      z-index: 1500;
    }

    .bd-mode-toggle .dropdown-menu .active .bi {
      display: block !important;
    }
  </style>

  <!-- Custom styles for this template -->
  <link href="/css/com/carousel.css" rel="stylesheet">
</head>

<body>

  <div class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
    <button class="btn btn-bd-primary py-2 d-flex align-items-center dropdown-toggle-icon" id="bd-theme" type="button"
      aria-expanded="false" aria-label="Toggle theme (auto)">
      Top
    </button>
  </div>

<header data-bs-theme="dark">
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <div class="offcanvas-body">
        <ul class="navbar-nav col-md-auto mb-2 justify-content-center mb-md-0">
          <li class="nav-item"><a class="nav-link px-5" href="/home/home">홈</a></li>
          <li class="nav-item"><a class="nav-link px-5" href="#">소개</a></li>
          <li class="nav-item"><a class="nav-link px-5" href="#">시설안내</a></li>
          <li class="nav-item"><a class="nav-link px-5" href="#">이용안내</a></li>
          <li class="nav-item"><a class="nav-link px-5" href="/usr/reservationMain">실시간예약</a></li>
          <li class="nav-item"><a class="nav-link px-5" href="#">예약확인</a></li>
          <li class="nav-item"><a class="nav-link px-5" href="#">공지사항</a></li>
        </ul>
      </div>
    </div>
  </nav>
</header>

  <main>

    <div class="container mt-5">
      <div class="py-5 text-center">
        <h2>선택목록</h2>
        <div class="table-responsive">
          <table id="tbRoom" class="table table-bordered table-hover mt-3">
            <thead class="thead-dark">
              <tr>
                <th scope="col">객실명</th>
                <th scope="col">이용날짜</th>
                <th scope="col">인원</th>
                <th scope="col">결제금액</th>
                <th scope="col">추가금액</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>바다</th>
                <td>2024-05-23(목) ~ 2024-05-24(금) 1박2일</td>
                <td>4명</td>
                <td>150,000 원</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="row g-5 justify-content-center">
        <div class="col-md-6 col-lg-7">
          <h4 class="mb-3">예약정보입력</h4>
          <form class="needs-validation" novalidate>
            <div class="row g-3">
              <div class="col-sm-6">
                <label for="userName" class="form-label">이름<span style="color: red;">*</span></label>
                <input type="text" class="form-control" id="userName" placeholder="" value="" required>
              </div>

              <div class="col-sm-6">
                <label for="userBirth" class="form-label">생년월일<span style="color: red;">*</span></label>
                <input type="text" class="form-control" id="userBirth" placeholder="" value="" required>
              </div>

              <div class="col-12">
                <label for="UserNbr1" class="form-label">연락처<span style="color: red;">*</span></label>
                <input type="tel" class="form-control" id="userNbr2" oninput="oninputPhone(this)" maxlength="13" required>
              </div>

              <div class="col-12">
                <label for="userNbr2" class="form-label">비상연락처</label>
                <input type="tel" class="form-control" id="userNbr2" oninput="oninputPhone(this)" maxlength="13" required>
              </div>

              <div class="col-12">
                <label for="userRemark" class="form-label">요청사항</label>
                <textarea class="form-control" id="userRemark" required></textarea>
              </div>
            </div>
            <hr class="my-4">
            <h4 class="mb-3">안내사항 및 약관동의</h4>
            <p>본 예약 시스템은 이용 약관에 동의하는 것으로 간주됩니다. 예약하시기 전에 약관을 숙지해주시기 바랍니다.</p>

            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="save-info">
              <label class="form-check-label" for="save-info">동의합니다</label>
            </div>

            <hr class="my-4">

			<input class="w-100 btn btn-dark btn-lg" type="button" id="btnReservation" value="예약" onclick="btnReservationOnclick()"/>
          </form>
        </div>
      </div>
    </div>

    <!-- FOOTER -->
    <footer class="container mt-5">
      <p>&copy; 2017–2024 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
  </main>
  <script src="/js/com/bootstrap.bundle.min.js"></script>
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
			reservationList[i]["userNbr1"] = $("#userNbr1").val();
			reservationList[i]["userNbr2"] = $("#userNbr2").val();
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
	
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
</html>
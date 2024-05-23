	/* 단건 조회 */
	function com_selectOne(param, callbackFun) {	
		// 쿼리 ID가 생략되었을 경우
		if(param.length < 1){
			alert("쿼리 ID를 입력해 주세요.");
			
			return false;
		}
			
		$.ajax({
		    url: "/main/selectOne",
		    type: "POST",
		    contentType: "application/json",
		    data: JSON.stringify(param),
		    success: function (responseData) {

				// callback 함수가 있을 경우 함수 실행
				if(callbackFun != undefined){
					callbackFun(responseData);
				}
		    },
		    error: function (responseData) {
		        alert("error");
		    }
		});
	}
	
	/* 리스트 조회 */
	function com_selectList(param, callbackFun) {	
		// 쿼리 ID가 생략되었을 경우
		if(param.length < 1){
			alert("쿼리 ID를 입력해 주세요.");
			
			return false;
		}
		
		$.ajax({
		    url: "/main/selectList",
		    type: "POST",
		    contentType: "application/json",
		    data: JSON.stringify(param),
		    success: function (responseData) {

				// callback 함수가 있을 경우 함수 실행
				if(callbackFun != undefined){
					callbackFun(responseData);
				}
		    },
		    error: function (result) {
		        alert("error");
		    }
		});
	}
	
	/* 등록 */
	function com_insert(param, callbackFun) {	
		// 쿼리 ID가 생략되었을 경우
		if(param.length < 1){
			alert("쿼리 ID를 입력해 주세요.");
			
			return false;
		}
		
		$.ajax({
		    url: "/main/insert",
		    type: "POST",
		    contentType: "application/json",
		    data: JSON.stringify(param),
		    success: function (responseData) {

				// callback 함수가 있을 경우 함수 실행
				if(callbackFun != undefined){
					callbackFun(responseData);
				}
		    },
		    error: function (result) {
		        alert("error");
		    }
		});
	}
	
	/* 수정 */
	function com_update(param, callbackFun) {
		// 쿼리 ID가 생략되었을 경우	
		if(param.length < 1){
			alert("쿼리 ID를 입력해 주세요.");
			
			return false;
		}
		
		$.ajax({
		    url: "/main/update",
		    type: "POST",
		    contentType: "application/json",
		    data: JSON.stringify(param),
		    success: function (responseData) {

				// callback 함수가 있을 경우 함수 실행
				if(callbackFun != undefined){
					callbackFun(responseData);
				}
		    },
		    error: function (result) {
		        alert("error");
		    }
		});
	}
	
	/* 삭제 */
	function com_delete(param, callbackFun) {	
		// 쿼리 ID가 생략되었을 경우
		if(param.length < 1){
			alert("쿼리 ID를 입력해 주세요.");
			
			return false;
		}
		
		$.ajax({
		    url: "/main/delete",
		    type: "POST",
		    contentType: "application/json",
		    data: JSON.stringify(param),
		    success: function (responseData) {

				// callback 함수가 있을 경우 함수 실행
				if(callbackFun != undefined){
					callbackFun(responseData);
				}
		    },
		    error: function (result) {
		        alert("error");
		    }
		});
	}
	
	/* 파라미터 받는 함수(GET) */
	function com_getParameter(key) {
		// 현재 URL "?" 이후 부분
	    var urlParams = new URLSearchParams(window.location.search);
	    
	    // key에 해당하는 값 가져오기
	    var paramValue = urlParams.get(key);

	    return paramValue;
	}
	
	/* form -> Json 변환(document.getElementById('form_product')) */
	function com_formToJson(formElement) {
	    var formData = new FormData(formElement); 	// 폼 데이터
	    var jsonObject = {}; 						// Json

	    for (var pair of formData.entries()) {
	        jsonObject[pair[0]] = pair[1];
	    }

	    return jsonObject;
	}
	
	/* 가격 format 지정 */
	function com_priceFormat(price){
		return "₩" + price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	/* 페이징 */
	function com_paging(result, limit){
		var htmlPaging = "";
		
		// 2페이지 이상일 경우
		if(limit <= result[0].count){
			htmlPaging += "<li class='datatable-pagination-list-item datatable-hidden datatable-disabled' style='cursor: pointer'>";
			htmlPaging += "<a data-page='1' class='datatable-pagination-list-item-link' onclick='search_product_list(0," + limit + ")'><</a></li>";
			
			var pagingNum = 0;
			
			if(result[0].count%limit == 0){
				pagingNum = result[0].count / limit;
			} else {
				pagingNum = result[0].count / limit + 1;
			}
			
			for(var i=1; i<=pagingNum; i++){
			    htmlPaging += "<li class='datatable-pagination-list-item datatable-active' style='cursor: pointer'>";
			    htmlPaging += "<a data-page="+ i +" class='datatable-pagination-list-item-link' onclick='search_product_list("+ (i-1) +"," + limit + ")'>"+ i +"</a></li>";
			}
			
			htmlPaging += "<li class='datatable-pagination-list-item' style='cursor: pointer'>";
			htmlPaging += "<a data-page='2' class='datatable-pagination-list-item-link' onclick='search_product_list("+ (pagingNum-1) +"," + limit + ")'>></a></li>";
			
			$("#ul_paging").html(htmlPaging);
		}
	}
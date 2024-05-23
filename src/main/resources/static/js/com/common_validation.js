
	/* 영어 or 영어+숫자 */
	function com_isAlphanumeric(input){
		var regex = /^[a-zA-Z]+[a-zA-Z0-9]*$/;
		
		return regex.test(input);
	}
	
	/* 영어+숫자+특수문자(8-20자) */
	function com_isValidAlphanumericSpecial(input){
		var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,20}$/;
		
		return regex.test(input);
	}
	
	/* 영어 or 한글 */
	function com_isValidAlphaKorea(input){
		var regex = /^[가-힣a-zA-Z]+$/;
		
		return regex.test(input);
	}
	
	/* 전화번호(010-1111-1111) */
	function com_isValidPhoneNumber(input){
		var regex = /^010-\d{4}-\d{4}$/;
		
		return regex.test(input);
	}
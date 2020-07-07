function isValidEmail(email) {
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (email.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}	

function sendIt(){
	
	var korCheck = /[ㄱ-ㅎ]/;
	var engCheck = /[a-z]/; 
	var numCheck = /[0-9]/; 
	var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	var f = document.myForm;
	
	if(!f.id.value){
		alert("아이디를 입력하세요");
		f.id.focus();
		return;
	}
	
	if (f.USERID.value.length < 6 || f.id.value.length > 20) { 
		alert("아이디는 영문 및 숫자 6~20자 입니다."); 
		f.id.focus();
		return;
	} else if (specialCheck.test(f.id.value)) { 
		alert("아이디는 특수문자를 포함 할 수 없습니다.");
		f.id.focus();
		return;
	} else if (!engCheck.test(f.id.value) || korCheck.test(f.id.value)) {
		alert("아이디는 영문 및 숫자 입니다.");
		f.id.focus();
		return;
	}
	
	if(!f.pwd.value){
		alert("비밀번호를 입력하세요");
		f.pwd.focus();
		return;
	} 
	
	if (f.pwd.value.length < 4 || f.pwd.value.length > 20) { 
		f.pwd.focus();
		alert("비밀번호는 4~20자 입니다.");
		return;
	}

	if(!f.name.value){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}

	if(!f.email.value){
		alert("이메일을 입력하세요");
		f.email.focus();
		return;
	}
	
	if(!isValidEmail(f.email.value)) {
        alert("\n정상적인 E-Mail을 입력하세요. ");
        f.email.focus();
        return;
	}

	f.action = "insert.action";
	f.submit();

}

$(function() {
		
	$("#findId").click(function(){
	
		var korCheck = /[ㄱ-ㅎ]/;
		var engCheck = /[a-z]/; 
		var numCheck = /[0-9]/; 
		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	
		var f = document.myForm;
		
		if(!f.id.value){
			alert("아이디를 입력하세요");
			f.id.focus();
			return;
		}
		
		if (f.id.value.length < 6 || f.id.value.length > 20) { 
			alert("아이디는 영문 및 숫자 6~20자 입니다."); 
			f.id.focus();
			return;
		} else if (specialCheck.test(f.id.value)) { 
			alert("아이디는 특수문자를 포함 할 수 없습니다.");
			f.id.focus();
			return;
		} else if (!engCheck.test(f.id.value) || korCheck.test(f.id.value)) {
			alert("아이디는 영문 및 숫자 입니다.");
			f.id.focus();
			return;
		}
		
		if(!f.email.value){
			alert("이메일을 입력하세요");
			f.email.focus();
			return;
		}
		
		if(!isValidEmail(f.email.value)) {
	        alert("\n정상적인 E-Mail을 입력하세요. ");
	        f.email.focus();
	        return;
		}
	
		f.action = "findidpw_ok.action";
		f.submit();
	
	});
});

$(function() {
		
	$("#idcheck").click(function(){

		if($("#id").val()==null || $("#id").val()=="") {
			alert("아이디를 입력하세요");
			return;
		}

		var param = "id=" + $("#id").val();
        
        $.ajax({
            url: "test.action",
            type: "POST",
            data: param,
            success: function(data){
                alert(data);
            },
            error: function(){
                alert("Error");
            }
        });
	
	});
	
});

$(function() {
		
	$("#login").click(function(){
	
		var f = document.myForm;

		if($("#id").val()==null || $("#id").val()=="") {
			alert("아이디를 입력하세요");
			return;
		}
        
		f.action = "login_ok.action";
		f.submit();
	
	});
	
});

function execDaumPostcode() {

	document.getElementById('addr').value = "";
	
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
 
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			// document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('addr').value = fullRoadAddr;
			// document.getElementById('addr2').focus();
    	}
	}).open();
}
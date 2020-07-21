function cartList() {

	var param = "id=" + $("#sessionId").val();

    $.ajax({
        url: "cartList.action",
        type: "POST",            
        data: param,
        success: function(data){
        	$("#cartList").text("주문표(" + data + ")");
        },
        error: function(){
            alert("Error");
        }
    });
}

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
	
	if (f.id.value.length < 6 || f.id.value.length > 20) { 
		alert("아이디는 영문과 숫자 6~20자 입니다."); 
		f.id.focus();
		return;
	} else if (specialCheck.test(f.id.value)) { 
		alert("아이디는 특수문자를 포함 할 수 없습니다.");
		f.id.focus();
		return;
	} else if ((!engCheck.test(f.id.value) || !numCheck.test(f.id.value)) || korCheck.test(f.id.value)) {
		alert("아이디는 영문 및 숫자 입니다.");
		f.id.focus();
		return;
	}
	
	if(!f.pw.value){
		alert("비밀번호를 입력하세요");
		f.pw.focus();
		return;
	} 
	
	if (f.pw.value.length < 4 || f.pw.value.length > 20) { 
		f.pw.focus();
		alert("비밀번호는 4~20자 입니다.");
		return;
	}  else if ((!engCheck.test(f.pw.value) || !numCheck.test(f.pw.value) || !specialCheck.test(f.pw.value)) || korCheck.test(f.pw.value)) {
		alert("비밀번호는 특수문자를 포함한 영문 및 숫자 입니다.");
		f.pw.focus();
		return;
	}

	if(!f.name.value){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	
	if(!f.tel.value){
		alert("전화번호를 입력하세요");
		f.tel.focus();
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
	
	if(!f.addr1.value){
		alert("주소를 입력하세요");
		f.addr1.focus();
		return;
	}

	f.action = "insert.action";
	f.submit();

}

function tryId_click() {

	var f = document.myForm;
	
	var mode = document.createElement('input');
	mode.setAttribute("type", "hidden");
	mode.setAttribute("name", "mode");
	mode.setAttribute("value", "id");
	
	f.appendChild(mode);
        
	f.action = "findidpw.action";
	f.submit();
}

function tryPw_click() {

	var f = document.myForm;
	
	var mode = document.createElement('input');
	mode.setAttribute("type", "hidden");
	mode.setAttribute("name", "mode");
	mode.setAttribute("value", "pw");
	
	f.appendChild(mode);
        
	f.action = "findidpw.action";
	f.submit();
}

function updateIt(){
	
	var f = document.myForm;
	
	var korCheck = /[ㄱ-ㅎ]/;
	var engCheck = /[a-z]/; 
	var numCheck = /[0-9]/; 
	var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	var f = document.myForm;
	
	if(!f.pw.value){
		alert("비밀번호를 입력하세요");
		f.pw.focus();
		return;
	} 
	
	if (f.pw.value.length < 4 || f.pw.value.length > 20) { 
		f.pw.focus();
		alert("비밀번호는 4~20자 입니다.");
		return;
	}  else if ((!engCheck.test(f.pw.value) || !numCheck.test(f.pw.value) || !specialCheck.test(f.pw.value)) || korCheck.test(f.pw.value)) {
		alert("비밀번호는 특수문자를 포함한 영문 및 숫자 입니다.");
		f.pw.focus();
		return;
	}

	if(!f.name.value){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	
	if(!f.tel.value){
		alert("전화번호를 입력하세요");
		f.tel.focus();
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
	
	if(!f.addr1.value){
		alert("주소를 입력하세요");
		f.addr1.focus();
		return;
	}

	f.action = "update.action";
	f.submit();
}

$(function() {

	$("#cartList").show(function(){
		cartList();
	});
	
	$("#kakao-login-btn").show(function(){
		
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('da5ed75e6d7f9bcac9abaeae41fd1108');
	   
	   	// 카카오 로그인 버튼을 생성합니다.
	   	Kakao.Auth.createLoginButton({
	    	container: '#kakao-login-btn',
	    	success: function(authObj) {
	    		// 로그인 창을 매번 새로 띄웁니다.
	     		Kakao.Auth.loginForm({
	     			success: function(authObj) {
				     	// 로그인 성공시, API를 호출합니다.
				     	Kakao.API.request({
				      		url: '/v2/user/me',
				      		success: function(res) {
				      			kakaoLogin(JSON.stringify(res.kakao_account.profile.nickname), JSON.stringify(res.kakao_account.email));
				      		},
				      		fail: function(error) {
				       			alert(JSON.stringify(error));
				      		}
						});
					},
					fail: function(erro) {
        				alert(JSON.stringify(erro));
       				}			
				});
	    	},
		    fail: function(err) {
		    	alert(JSON.stringify(err));
		    }
		});
	});
	
	var kakaoLogin = function(nickName, email) {
	
		nickName = nickName.replace("\"", "");
		nickName = nickName.replace("\"", "");
		
		email = email.replace("\"", "");
		email = email.replace("\"", "");
		
		var f = document.myForm;
		
		$("#kakaoSession").val(nickName);
		$("#kakaoSession2").val(email);
		
		f.action = "kakaoLogin_ok.action";
		f.submit();
	}
		
	$("#findIdPw").click(function(){

		var korCheck = /[ㄱ-ㅎ]/;
		var engCheck = /[a-z]/; 
		var numCheck = /[0-9]/; 
		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	
		var f = document.myForm;
		
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
	
	$("#idcheck").click(function(){
	
		if($("#id").val()==null || $("#id").val()=="") {
			alert("아이디를 입력하세요");
			return;
		}

		var param = "id=" + $("#id").val();
            
        $.ajax({
            url: "idcheck.action",
            type: "POST",            
            data: param,
            success: function(data){
            	alert(data=="fail" ? "이미 사용중인 아이디입니다." : "사용가능한 아이디입니다.");
            },
            error: function(){
                alert("Error");
            }
        });
        
	});
	
	$("#pwcheck").click(function(){
	
		var f = document.myForm;
	
		if($("#pw").val()==null || $("#pw").val()=="") {
			alert("패스워드를 입력하세요");
			return;
		}

		var param = "id=" + $("#id").val();
		param += "&pw=" + $("#pw").val();
            
        $.ajax({
            url: "pwcheck.action",
            type: "POST",            
            data: param,
            success: function(data){
            	if(data=="fail") {
            		alert("비밀번호가 일치하지 않습니다.");
            	} else {
            		f.action = "delete.action";
					f.submit();
            	}
            },
            error: function(){
                alert("Error");
            }
        });
        
	});
	
	$("#logon").click(function(){
		
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

	document.getElementById('addr1').value = "";
	
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
			document.getElementById('addr1').value = fullRoadAddr;
			document.getElementById('addr2').focus();
    	}
	}).open();
}

    function foldDaumPostcode() {
    	// 우편번호 찾기 찾기 화면을 넣을 element
    	var element_wrap = document.getElementById('wrap');
    	
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {

    	// 우편번호 찾기 찾기 화면을 넣을 element
    	var element_wrap = document.getElementById('wrap');
    	document.getElementById('addr1').value = "";
    	document.getElementById('addr2').value = "";
    	
    	// 이미 켜져있으면 화면 닫음
    	if(element_wrap.style.display != 'none') {
    		element_wrap.style.display = 'none';
    		return;
    	}
    	
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		
        new daum.Postcode({
            oncomplete: function(data) {
            
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    // document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById('sample3_postcode').value = data.zonecode;			// 우편번호
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            /*
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
            */
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
        // $(document).scrollTop($(document).height());		// 스크롤 최하단으로 이동
        
    }

/*    
$(function() {
		
	$(".btn-example").click(function(){
		alert($(".btn-example").text());
	});
	
});
*/
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<title>G마켓 - 일반 구매 회원가입 정보입력</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name='description' />
	<meta name='keywords' />
	<link rel='shortcut icon' href='https://sslimage.gmarket.co.kr/_Net/MyG/favicon/gmarket.ico' />	
	<link rel="apple-touch-icon-precomposed" href='https://sslimage.gmarket.co.kr/_Net/apple-touch-icon-precomposed.png'/>
    <link rel="apple-touch-icon" href='https://sslimage.gmarket.co.kr/_Net/apple-touch-icon.png'/>

	<script type='text/javascript' src='https://www.gmarket.co.kr/challenge/neo_include/favicon_net.js'></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/json2.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
    <script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery.popupwindow.js"></script>
    <script type="text/javascript" src="https://script.gmkt.kr/_Net/../fnp/desktop-layout.js"></script>
	<script type="text/javascript" src="/Scripts/Common.js" ></script>
	<script type="text/javascript" src="/Scripts/ScriptEventErrorHandler.js" ></script>
	<script type="text/javascript">
		$(document).jsErrorHandler();
		var _ContentUrls = ["http://script.gmkt.kr/_Net/css/myg/","http://image.gmarket.co.kr/_Net/","http://script.gmkt.kr/_Net/","https://script.gmkt.kr/_Net/css/myg/ssl/","https://sslimage.gmarket.co.kr/_Net/","https://script.gmkt.kr/_Net/","http://myg.gmarket.co.kr/","https://myg.gmarket.co.kr/","http://member.gmarket.co.kr/","https://member.gmarket.co.kr/","http://gbank.gmarket.co.kr/","https://gbank.gmarket.co.kr/","http://claim.gmarket.co.kr/","https://claim.gmarket.co.kr/","http://escrow.gmarket.co.kr/","https://sslescrow.gmarket.co.kr/","http://diary.gmarket.co.kr/","http://event.gmarket.co.kr/","http://sns.gmarket.co.kr/","http://www.gmarket.co.kr/","https://www.gmarket.co.kr/","http://item.gmarket.co.kr/","http://shop.gmarket.co.kr/","http://member2.gmarket.co.kr/","https://sslmember2.gmarket.co.kr/","http://promotion.gmarket.co.kr/","http://diary2.gmarket.co.kr/","http://eventnet.gmarket.co.kr/","http://ebay.gmarket.co.kr/","http://www.g9.co.kr/","http://signin.gmarket.co.kr/","https://signinssl.gmarket.co.kr/","http://english.gmarket.co.kr/","https://english.gmarket.co.kr/","http://pics.gmkt.kr/","https://pics.gmkt.kr/","/","/","/","/","/","/","/","/","/","/","https://www.g9.co.kr/","http://diary2.gmarket.co.kr/",];

    </script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/dimmed.js"></script>
	<script type='text/javascript' src='https://script.gmkt.kr/_Net/js/gmkt.js?dummy=2012091327262'></script>
	
	<!-- 회원가입 Renewal //-->
	<link rel="stylesheet" type="text/css" href="https://script.gmarket.co.kr/pc/css/ko/common.css" />	
    <link rel="stylesheet" type="text/css" href="https://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css" />
	<script type="text/javascript" src="https://script.gmarket.co.kr/pc/js/ko/joinRenewal.js"></script>
	<script type="text/javascript" src="https://script.gmarket.co.kr/js/common/pds_gmkt.js"></script>
	<!-- 회원가입 Renewal //-->

	<!--[if IE 6]>
		<script src="https://script.gmkt.kr/_Net/js/DD_belatedPNG.js"></script>
		<script>
			DD_belatedPNG.fix('#main_menu .menu_list span');
			DD_belatedPNG.fix('#main_menu .menu_list p');
		</script>
	<![endif]-->

	
	
<script type="text/javascript" src='https://sslmember2.gmarket.co.kr/Scripts/Registration/PasswordValidation.js'></script>
<script type="text/javascript">
var idFlag = false;
var pwFlag = false;
var pwValidMsg = "";
var nameFlag = false;
var emailFlag = false;

$(document).ready(function() {

	if($("#CertType").val() == "I")
	{
		$('#hpno').show();
	}

	// 공백입력방지
	$("#login_id, #hp_no2, #hp_no3, #pwd1, #pwd2, #email1, #email2").bind("keypress", function (e) {
		Events.PreventSpace(e);
	});

	// 한글입력방지
	$("#login_id, #hp_no2, #hp_no3, #email1, #email2").css("ime-mode", "disabled");

	// 숫자만입력
	$("#hp_no2, #hp_no3").bind("keypress", function (e) {
		Events.CheckDigit(e);
	});	
		
	$("#cancel").click(function () {
		location.href = 'https://sslmember2.gmarket.co.kr/Registration/MemberRegistrationBuyer';
	});

	/////////////////////////////// 휴대폰 체크 ///////////////////////////////
	$("#hp_no2").blur(function(){
		var phone = document.getElementById("hp_no2").value;
		var phone3 = document.getElementById("hp_no3").value;
		var oMsg = document.getElementById("hpMsg");
		var oMsgC = document.getElementById("hpMsgCheck");

		if (phone == "" || (getStringByteLength(phone) < 3)) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "전화번호를 정확히 입력해 주세요.";
			oMsgC.className = "bg_area icon_bg chk";
			return false;
		}

		if ( passonlynum($("#hp_no2").val()) ) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "전화번호는 숫자로만 입력하세요.";
			oMsgC.className = "bg_area icon_bg chk";
			$("#hp_no2").val("");
			return false;
		}

		if (phone3 != "") {
			oMsgC.className = "bg_area icon_bg chk submit";
		}

		if (true) {
			oMsg.style.display = "none";		
			return true;
		}

		return true;
	});
	
	$("#hp_no3").blur(function(){
		var phone = document.getElementById("hp_no3").value;
		var phone2 = document.getElementById("hp_no2").value;
		var oMsg = document.getElementById("hpMsg");
		var oMsgC = document.getElementById("hpMsgCheck");

		if (phone == "" || (getStringByteLength(phone) != 4)) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "전화번호를 정확히 입력해 주세요.";
			oMsgC.className = "bg_area icon_bg chk";
			return false;
		}

		if ( passonlynum($("#hp_no3").val()) ) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "전화번호는 숫자로만 입력하세요.";
			oMsgC.className = "bg_area icon_bg chk";
			$("#hp_no3").val("");
			return false;
		}
		
		if (phone2 != "") {
			oMsgC.className = "bg_area icon_bg chk submit";
		}

		if (true) {
			oMsg.style.display = "none";
			return true;
		}
		return true;
	});
	/////////////////////////////// 휴대폰 체크 ///////////////////////////////

	/////////////////////////////// 아이디 체크 /////////////////////////////// 
	$("#login_id").blur(function(){
		var id = document.getElementById("login_id").value;
		var oMsg = document.getElementById("idMsg");
		var oMsgC = document.getElementById("idMsgCheck");

		idFlag = false;

		if (id == "") {
			oMsg.style.display = "block";
			oMsg.className = "ability_chk";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}
		var isID = /^[a-zA-Z0-9]{6,10}$/;
		if (!isID.test(id)) {
			oMsg.style.display = "block";
			oMsg.className = "ability_chk";
			oMsg.innerHTML = "회원 아이디(ID)는 띄어쓰기 없이 6~10자리의 영문자와 숫자 조합만 가능합니다.";
			$("#login_id").focus();
//			$("#login_id").val("");
			return false;
		}

		try {
			// 성공 Api
			var url = 'https://sslmember2.gmarket.co.kr/Registration/VerificationLoginId';
			var param = [{ name: "loginId", value: id }];

			$.ajax({
				url: url,
				data: param,
				type: "GET",
				contentType: "application/json;",
				dataType: "json",
				success: function (data) {
					if (data) {
						oMsg.style.display = "block";
						oMsg.className = "ability_chk";
						oMsg.innerHTML = "이미 사용중인 아이디입니다.";
						$("#login_id").focus();
//						$("#login_id").val("");
						return false;
					} else {
						oMsg.style.display = "block";
						oMsg.className = "ability_chk submit";
						oMsg.innerHTML = "사용가능한 아이디 입니다.";
						oMsgC.className = "bg_area icon_bg chk submit";
					}
					idFlag = true;
					return true;
				},
				error: function (error) {
					alert("Error");
				}
			});
		} catch (e) {
			if (window.bridgeGotTime) {
				throw e;
			 } else {
				//page reload?
             }
		}
		return true;
	});
	/////////////////////////////// 아이디 체크 /////////////////////////////// 

	/////////////////////////////// 비밀번호 체크 ///////////////////////////////	
	$("#pwd1").blur(function(){
		var num = 2;
		var grade = "";
		var pwd;
		var oMsg;
		var oMsgC;

		pwFlag = false;

		if (num == 2) {
			pwd =  $("#pwd1").val();
			oMsg = document.getElementById("pwd1Msg");
			oMsgC = document.getElementById("pwd1MsgCheck");
		} else if (num == 3) {
			pwd = $("#pwd2").val();
			oMsg = document.getElementById("pwd2Msg");
			oMsgC = document.getElementById("pwd2MsgCheck");
		}		

		var safe_level = chkPasswordNew2(pwd);
	
		if (pwd.length > 0)
		{
			if (num == 2)
			{
				if (safe_level == "level00") {				
					grade = 1;
				}
				else if (safe_level == "level01") {
					grade = 2;
				}
				else if (safe_level == "level11") {
					grade = 11;
					pwValidMsg = "안전한 정보 관리를 위해 개인정보 ID, 사업자번호, 생일, 전화번호 등의 개인정보가 포함되지 않은 비밀번호를 입력해 주세요.";
				}
				else if (safe_level == "level02") {	// 정상
					grade = 3;
					pwFlag = true;
				}
				else if (safe_level == "level03") {	// 정상
					grade = 4;
					pwFlag = true;
				}
			}
		} else {
			if (num == 2)
			{
				grade = 0;
			}
		}

		pwChk(grade, num);

		/*		
		""		grade = 0;	띄어쓰기 없는 6~15자의 영문 대/소문자, 숫자 및 특수문자 조합으로 입력하셔야 합니다.
		level00 grade = 1;	비밀번호 조합기준에 적합하지 않습니다.
		level11 grade = 11;	회원 아이디가 포함된 비밀번호는 사용할 수 없습니다.
		level01 grade = 2;	보안에 매우 취약하여 사용할 수 없습니다.
		level02 grade = 3;	적정 수준의 안전한 비밀번호입니다.
		level03 grade = 4;	매우 안전한 비밀번호 입니다.
		*/
	});  

	$("#pwd2").blur(function(){
		var pwd;
		var oMsg;
		var oMsgC;

		pwd1 = $("#pwd1").val();
		pwd2 = $("#pwd2").val();
		oMsg = document.getElementById("pwd2Msg");
		oMsgC = document.getElementById("pwd2MsgCheck");

		if (pwd1 == "") {
			oMsgC.className = "bg_area icon_bg chk pw2";
			oMsg.style.display = "block";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}
		if (pwd1 != pwd2) {
			oMsgC.className = "bg_area icon_bg chk pw2";
			oMsg.style.display = "block";
			oMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
			document.getElementById("pswd2").value = "";
			return false;
		} else {
			oMsgC.className = "bg_area icon_bg chk pw2 submit";
			oMsg.style.display = "none";
			return true;
		}

		return true;
	});  
	/////////////////////////////// 비밀번호 체크 ///////////////////////////////
		
	/////////////////////////////// 이메일 체크 ///////////////////////////////
	$("#email1").blur(function(){

		var _char = "@";
		var email1 = document.getElementById("email1").value;
		var email2 = document.getElementById("email2").value;
		var email = document.getElementById("email1").value + _char + document.getElementById("email2").value;
		var oMsg = document.getElementById("emailMsg");

		emailFlag = false;

		if (email1 == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
			return false;
		}

		var isEmail = /^[a-z0-9_.-]*$/;
		if (!isEmail.test(email1)) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
			return false;
		}

		if (email1 != "" && email2 != "") {			

			var isEmail = /^[ㄱ-힣\w-\.\_]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,3}$/;
			var isHan = /[ㄱ-ㅎ가-힣]/g;
			if (!isEmail.test(email) || isHan.test(email)) {
				oMsg.style.display = "block";
				oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
				return false;
			}

			// 이메일 길이 제한 : 50
			if(email.length > 50){
				oMsg.style.display = "block";
				oMsg.innerHTML = "이메일 글자수가 도메인 포함하여 전체 50자 이내로 입력해주세요.";
				return false;
			}
		
			try {		
				// 성공 Api : Registration/ExistsEmail?email=ebaykorea@ebay.com
				var url = 'https://sslmember2.gmarket.co.kr/Registration/VerificationEmail';
				var param = [{ name: "email", value: email }];			

				$.ajax({
					url: url,
					data: param,
					type: "GET",
					contentType: "application/json;",
					dataType: "json",
					success: function (data) {			
						if (data) {
							oMsg.style.display = "block";
							oMsg.innerHTML = "이미 사용중인 이메일입니다.";
							$("#email1").val("");
							$("#email2").val("");
							return false;
						} else {
							//oMsg.style.display = "block";				
							//oMsg.innerHTML = "사용가능한 이메일 입니다.";
						}
						emailFlag = true;
						//return true;
					},
					error: function (error) {
						emailFlag = false;
						alert("Error");
						return false;
					}
				});	
			} catch (e) {
				if (window.bridgeGotTime) {
					throw e;
				 } else {
					//page reload?
				 }
			}		
		}

		if (true) {
			oMsg.style.display = "none";
			return true;
		}

		return true;
	});  
	
	$("#email2").blur(function(){
		var _char = "@";
		var email2 = document.getElementById("email2").value;
		var email = document.getElementById("email1").value + _char + document.getElementById("email2").value;
		var oMsg = document.getElementById("emailMsg");
		
		emailFlag = false;

		if (email2 == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
			return false;
		}

		if (email == "") {
			oMsg.style.display = "none";
			return true;
		}

		var isEmail = /^[ㄱ-힣\w-\.\_]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,3}$/;
		var isHan = /[ㄱ-ㅎ가-힣]/g;
		if (!isEmail.test(email) || isHan.test(email)) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
			return false;
		}

		// 이메일 길이 제한 : 50
			if(email.length > 50){
				oMsg.style.display = "block";
				oMsg.innerHTML = "이메일 글자수가 도메인 포함하여 전체 50자 이내로 입력해주세요.";
				return false;
			}

		try {		
			// 성공 Api : Registration/ExistsEmail?email=ebaykorea@ebay.com
			var url = 'https://sslmember2.gmarket.co.kr/Registration/VerificationEmail';
			var param = [{ name: "email", value: email }];			

			$.ajax({
				url: url,
				data: param,
				type: "GET",
				contentType: "application/json;",
				dataType: "json",
				success: function (data) {			
					if (data) {
						oMsg.style.display = "block";
						oMsg.innerHTML = "이미 사용중인 이메일입니다.";
						$("#email1").val("");
						$("#email2").val("");
						return false;
					} else {
						//oMsg.style.display = "block";				
						//oMsg.innerHTML = "사용가능한 이메일 입니다.";
					}
					emailFlag = true;
					//return true;
				},
				error: function (error) {
					emailFlag = false;
					alert("Error");
					return false;
				}
			});	
		} catch (e) {
			if (window.bridgeGotTime) {
				throw e;
			 } else {
				//page reload?
             }
		}

		if (true) {
			oMsg.style.display = "none";
			return true;
		}		
		
		return true;
	});

	$("#email2").focus(function(){
		if ($(this).val() == "직접입력") {
			$('#email2').val("");
			$('#email2').focus();
		} else {
			$('#email2').val($(this).val());
		}
	});
	// 이메일 선택
	$("#select_mail_server").click(function(){
		ChangeMailServer($('#email2').val(), $("#mail_server").val());
	});
	/////////////////////////////// 이메일 체크 ///////////////////////////////

	/////////////////////////////// 이름 체크 /////////////////////////////// 
	$("#userName").blur(function(){
		var name = document.getElementById("userName").value;
		var oMsg = document.getElementById("userNameMsg");
		var oMsgC = document.getElementById("userNameMsgCheck");
		var bytes = getByteLength(name);

		nameFlag = false;

		if (name == "") {
			oMsg.style.display = "block";
			oMsg.className = "ability_chk";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}

		if (bytes < 2 || bytes > 30) {
			oMsg.style.display = "block";
			oMsg.className = "ability_chk";
			oMsg.innerHTML = "이름은 최대 15자(30 Byte)이내로 한글/영문만 가능합니다.";
			// document.getElementById("userName").value = "";
			return false;
		}
				
		var pattern = /[^ㄱ-힣0-9a-zA-Z\s]/;
        if(pattern.test(name)) {
			oMsg.style.display = "block";
			oMsg.className = "ability_chk";
			oMsg.innerHTML = "이름은 최대 15자(30 Byte)이내로 한글/영문만 가능합니다.";
            // document.getElementById("userName").value = "";
            return false;
        }
		
		if (true) {
			oMsg.style.display = "none";
			nameFlag = true;
			oMsgC.className = "bg_area icon_bg chk submit";
			return true;
		}

		return true;
	});

	$("#userName").keyup(function(){
		var name = document.getElementById("userName").value;
		var oMsg = document.getElementById("userNameMsg");
		var oMsgC = document.getElementById("userNameMsgCheck");
		var bytes = getByteLength(name);

		nameFlag = false;

		if (bytes > 30) {
			oMsg.style.display = "block";
			oMsg.className = "ability_chk";
			oMsg.innerHTML = "이름은 최대 15자(30 Byte)이내로 한글/영문만 가능합니다.";
			document.getElementById("userName").value = StringCutByte(name, 30);
			return false;
		}

		return true;
	});

	function StringCutByte(str, len){
		var l = 0;
		for (var i = 0; i < str.length; i++) {
			l += (str.charCodeAt(i) > 128) ? 2 : 1;
			if (l > len) return str.substring(0, i);
		}
		return str;
	}
	/////////////////////////////// 이름 체크 /////////////////////////////// 
});


// --------------------------------------------------
// Events 
// --------------------------------------------------
function Events() { }

Events.StopPostback = function (e) {
	if (e.preventDefault) {
		e.preventDefault();
		return false;
	}
	else {
		e.returnValue = false;
		return false;
	}
}

Events.PreventSpace = function (e) {
	if (e.which && (e.which == 13 || e.which == 32)) {
		e.preventDefault();
	}
}

// 숫자만 입력받을 수 있도록 keypress 이벤트로 처리
Events.CheckDigit = function (e) {
	if (window.event) { // IE                              
		keynum = e.keyCode;
	} else if(keynum){ // Netscape/Firefox/Opera                   
		keynum = e.which;
	} 

	if (keynum && (keynum > 47 && keynum < 58 || keynum == 8)) {

	}
	else {
		e.preventDefault();
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ChangeMailServer(value1, value2) {
	if (value1 == "" || value2 == "직접입력") {
		//$("#email2").prop('readonly', false);
		$("#email2").prop('readonly', '');
	}
	else {
		//$("#email2").prop('readonly', true);
		$("#email2").prop('readonly', 'readonly');
	}
}

function pwChk(grade, num){	
	var pwd;
	var oMsg;
	var oMsgC;

	if (num == 2) {
		pwd =  $("#pwd1").val();
		oMsg = document.getElementById("pwd1Msg");
		oMsgC = document.getElementById("pwd1MsgCheck");
	} else if (num == 3) {
		pwd = $("#pwd2").val();
		oMsg = document.getElementById("pwd2Msg");
		oMsgC = document.getElementById("pwd2MsgCheck");
	}

	if (grade == 0) {				
		oMsgC.className = "bg_area icon_bg chk pw";
		oMsg.style.display = "block";
		oMsg.className = "ability_chk";
		oMsg.innerHTML = "띄어쓰기 없는 6~15자의 영문 대/소문자, 숫자 및 특수문자 조합으로 입력하셔야 합니다.";
	}
	else if (grade == 1) {
		oMsgC.className = "bg_area icon_bg chk pw";
		oMsg.style.display = "block";
		oMsg.className = "ability_chk";
		oMsg.innerHTML = "비밀번호 조합기준에 적합하지 않습니다.";	
	}
	else if (grade == 11) {
		oMsgC.className = "bg_area icon_bg chk pw";
		oMsg.style.display = "block";
		oMsg.className = "ability_chk";
		oMsg.innerHTML = "회원 아이디가 포함된 비밀번호는 사용할 수 없습니다.";
	}
	else if (grade == 2) {
		oMsgC.className = "bg_area icon_bg chk pw";
		oMsg.style.display = "block";
		oMsg.className = "ability_chk";
		oMsg.innerHTML = "보안에 매우 취약하여 사용할 수 없습니다.";	
	}
	else if (grade == 3) {
		oMsgC.className = "bg_area icon_bg chk pw submit";
		oMsg.style.display = "block";
		oMsg.className = "ability_chk submit";
		oMsg.innerHTML = "적정 수준의 안전한 비밀번호입니다.";	
	}
	else if (grade == 4) {
		oMsgC.className = "bg_area icon_bg chk pw submit";
		oMsg.style.display = "block";
		oMsg.className = "ability_chk submit";
		oMsg.innerHTML = "매우 안전한 비밀번호 입니다.";	
	}	
}

function chkPasswordNew(pwd)
{
	var tmpStr	= null;
	var pw		= pwd;
	var EnNum_pattern = /[^a-zA-Z0-9!\"#$%&\'()*+,-./:;<>=?@[]\\^_`{|}~]/;

	// 비밀번호는 6 ~ 15 자리만 허용
	if (pw.length < 6 || pw.length > 15) {
		alert("6글자 이상, 15글자 이하의 비밀번호를 입력해 주세요.");
		$("#pwd1").val("");
		$("#pwd1").focus();
		return false;
	}

	//비밀번호는 영문자, 숫자, 특수문자로만 구성
	if (EnNum_pattern.test(pw))
	{
		alert("안전한 정보 관리를 위해 띄어쓰기 없이 영문 대/소문자, 숫자, 특수문자 중 2가지 이상을 조합한 6~15자의 비밀번호를 입력해 주세요.");
		$("#pwd1").val("");
		$("#pwd1").focus();	
		return false;
	}

	//비밀번호는 영문자, 숫자, 특수문자 혼용 (영문자, 숫자, 특수문자로만 된 패스워드 생성 금지)
	if (!(passonlynum(pw) && passonlyEng(pw) && passonlyChar(pw)))
	{
		alert("안전한 정보 관리를 위해 띄어쓰기 없이 영문 대/소문자, 숫자, 특수문자 중 2가지 이상을 조합한 6~15자의 비밀번호를 입력해 주세요.");
		$("#pwd1").val("");
		$("#pwd1").focus();		
		return false;
	}

	//영문자, 숫자, 특수문자만 사용
	if (!onlyEngNew(pw))
	{
		alert("안전한 정보 관리를 위해 띄어쓰기 없이 영문 대/소문자, 숫자, 특수문자 중 2가지 이상을 조합한 6~15자의 비밀번호를 입력해 주세요.");
		$("#pwd1").val("");
		$("#pwd1").focus();		
		return false;
	}	

	//ID 를 포함한 패스워드 생성 금지
	tmpStr = $("#login_id").val(); 
	if (tmpStr == pw || (tmpStr.length > 0 && pw.length >= tmpStr.length && pw.indexOf(tmpStr) >= 0))
	{
		alert("안전한 정보 관리를 위해 개인정보 ID, 사업자번호, 생일, 전화번호 등의 개인정보가 포함되지 않은 비밀번호를 입력해 주세요.");
		$("#pwd1").val("");
		$("#pwd1").focus();		
		return false;
	}
	
	//동일한 숫자(문자)로 이루어진 패스워드 생성 금지
	for (var i=0; i<=pw.length-4; i++)
	{
		if (pw.charAt(i)==pw.charAt(i+1) && pw.charAt(i)==pw.charAt(i+2) && pw.charAt(i)==pw.charAt(i+3))
		{
			alert("4개 이상의 동일한 문자(숫자)가 포함된 비밀번호는 사용할 수 없습니다.");		
			$("#pwd1").val("");
			$("#pwd1").focus();		
			return false;
		}
	}

	//연속된 숫자로 이루어진 패스워드 생성 금지
	strNum = "01234567890";
	for (var i=0; i<=strNum.length-4; i++)
	{
		tmpStr=strNum.substring(i,i+4);
		if (pw.indexOf(tmpStr)>=0)
		{
			alert("연속된 4자리의 숫자가 포함된 비밀번호는 사용할 수 없습니다.");					
			$("#pwd1").val("");
			$("#pwd1").focus();		
			return false;
		}
	}

	// 회원가입을 위한 패스워드 유효성 체크
	var custNo = "";
	var password = $("#pwd1").val();
	var loginId = $("#login_id").val();
	var custType = "PP";
	var foreignYn = "N";
	var hpNoLastNumber = $("#hp_no3").val();
	var corpIdNo = "";
	var chkPassword = CheckPasswordValidationForRegister(custNo, password, loginId, custType, foreignYn, hpNoLastNumber, corpIdNo);

	if (chkPassword != 0) {
		$("#pwd1").val("");
		$("#pwd1").focus();
		return false;
	}

	return true;
}

// 비밀번호 유효성 체크
function chkPasswordNew2(pwd)
{
	var tmpStr	= null;
	var EnNum_pattern = /[^a-zA-Z0-9!\"#$%&\'()*+,-./:;<>=?@[]\\^_`{|}~]/;
	//비밀번호는 영문자, 숫자, 특수문자로만 구성, 6 ~ 15 자리만 허용
	if (EnNum_pattern.test(pwd) || pwd.length < 6 || pwd.length > 15)
	{
		return "level00";
	}
	//동일한 숫자(문자)로 이루어진 패스워드 생성 금지
	for (var i=0; i<=pwd.length-4; i++)
	{
		if (pwd.charAt(i)==pwd.charAt(i+1) && pwd.charAt(i)==pwd.charAt(i+2) && pwd.charAt(i)==pwd.charAt(i+3))
		{
			return "level00";
		}
	}

	//연속된 숫자로 이루어진 패스워드 생성 금지
	strNum = "01234567890";
	for (var i=0; i<=strNum.length-4; i++)
	{
		tmpStr=strNum.substring(i,i+4);
		if (pwd.indexOf(tmpStr)>=0)
		{
			return "level00";
		}
	}
	//영문자, 숫자, 특수문자만 사용
	if (pwd.length >= 6 && !onlyEngNew(pwd))
	{
		return "level01";
	}
	//반드시 영문자, 숫자, 특수문자 혼용 (영문자, 숫자, 특수문자로만 된 패스워드 생성 금지)
	if (pwd.length >= 6 && !(passonlynum(pwd) && passonlyEng(pwd) && passonlyChar(pwd)))
	{
		return "level01";
	}

	//ID 를 포함한 패스워드 생성 금지
	var tmpStr = document.getElementById("login_id").value;
	if (tmpStr.length > 0 && pwd.length >= tmpStr.length) {
		if (pwd.indexOf(tmpStr) >= 0) {
			return "level11";
		}
	}

	if (pwd.length >= 6 && pwd.length <= 11)
	{
		return "level02";
	}
		return "level03";
}	

//숫자로만 되어있는지 확인
function passonlynum(inText){
	var ret;
	for (var i = 0; i < inText.length; i++) {
		ret = inText.charCodeAt(i);
		if (!((ret > 47) && (ret < 58))) {
			return true;
		}
	}
	return false;
}

//문자로만 되어 있는지 확인
function passonlyEng(inText)
{
	var ret;
	var j = 0;
	var alpha_num_Str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	for (var i = 0; i < inText.length; i++) {
		var substr = inText.substring(i,i+1);
		if (alpha_num_Str.indexOf(substr) < 0) {
			//영문자가 아닌값
		}else{
			j = j + 1;	//영문자
		}
	}
	if (j == inText.length) {
		return false;	//영문자만 있는경우
	}else{
		return true;	//영문자와 다른 문자가 있는경우
	}
}

//특수문자로만 되어 있는지 확인
function passonlyChar(inText)
{
	var ret;
	var j = 0;
	var char_num_Str = "!\"#$%&\'()*+,-./:;<>=?@[]\\^_`{|}~";
	for (var i = 0; i < inText.length; i++) {
		var substr = inText.substring(i,i+1);
		if (char_num_Str.indexOf(substr) < 0) {
			//특수문자가 아닌값
		}else{
			j = j + 1;	//특수문자
		}
	}
	if (j == inText.length) {
		return false;	//특수문자만 있는경우
	}else{
		return true;	//특수문자와 다른 문자가 있는경우
	}
}

//영문, 숫자만 사용
function onlyEng(inText) {
var ret;
	for (var i = 0; i < inText.length; i++) {
	ret = inText.charCodeAt(i);
		if ( i != 0 ) {
			if ((ret > 122) || (ret < 48) || (ret > 57 && ret < 65) || (ret > 90 && ret < 97)) {
				return false;
			}
		}
	}
	return true;
}

// 영문, 숫자, 특수문자만 사용
function onlyEngNew(inText)
{
	var ret;
	for (var i = 0; i < inText.length; i++) {
		ret = inText.charCodeAt(i);
		if ( i != 0 ) {
			if ((ret < 33) || (ret > 126)) {
				return false;
			}
		}
	}
	return true;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/// 회원 가입 ///
function Signup() {

	if (!idFlag) {	
		alert("아이디 입력이 잘못 되었습니다.");
		return;
	}

	if (!pwFlag && pwValidMsg != "") {
		alert(pwValidMsg);
		$("#pwd1").val("");
		$("#pwd1").focus();
		return false;
	}

	if (!nameFlag) {	
		alert("이름 입력이 잘못 되었습니다.");
		return;
	}

	if (!emailFlag) {
		alert("이메일 입력이 잘못 되었습니다.");
		return;
	}

	// 인증 유무
	if (!AuthCheck()) return;
	// 아이디 체크
	if (!IDCheck()) return;
	// 비밀번호 체크
	if (!PasswordCheck()) return;
	// 이름 체크
	if (!NameCheck()) return;
	// 휴대폰 체크
	if (!HpNoCheck()) return;

	// 이메일
	if (!EmailCheck()) return;

	$('#form1').attr('action', 'AddMemberSimpleRegistrationPersonalBuyer').submit();

	return;
}

function AuthCheck()
{
	if($("#CertType").val() == "" || $("#CertName").val() == "" ||	$("#BirthDate").val() == "")
	{
		alert("실명확인 후에 가입이 가능합니다.");
		return false;
	}

	return true;
}

function IDCheck() {

	if ($("#login_id").val() == "" ||  $.trim($("#login_id").val()) == 0) {
		alert("회원아이디(ID)를 입력해 주세요.");
//		$("#login_id").val("");
		$("#login_id").focus();
		return false;
	}
	
	if(!IsValidID($("#login_id").val()))
	{
		alert("회원 아이디(ID)는 띄어쓰기 없이 6~10자리의 영문자와 숫자 조합만 가능합니다.");
//		$("#login_id").val("");
		$("#login_id").focus();
		return false;
	}	
	return true;
}

function PasswordCheck() {

	if ($("#pwd1").val() == "" || $.trim($("#pwd1").val()) == 0) {
		alert("비밀번호를 입력해 주세요.");
		$("#pwd1").val("");
		$("#pwd1").focus();
		return false;
	}

	if ($("#pwd2").val() == "" || $.trim($("#pwd2").val()) == 0) {
		alert("비밀번호 확인을 위해서 한번 더 입력해 주세요.");
		$("#pwd2").val("");
		$("#pwd2").focus();
		return false;
	}

	if ($("#pwd1").val() != $("#pwd2").val()) {
		alert("비밀번호가 틀립니다.");
		$("#pwd1").val("");
		$("#pwd2").val("");
		$("#pwd1").focus();
		return false;
	}
	
	if (!chkPasswordNew($("#pwd1").val())) {
		return false;
	}
	return true;
}

function NameCheck() {

	if ($("#userName").val() == "" ||  $.trim($("#userName").val()) == 0) {
		alert("이름을 입력해 주세요.");
//		$("#login_id").val("");
		$("#userName").focus();
		return false;
	}
	
	if(IsValidName($("#userName").val()))
	{
		alert("이름은 최대 15자(30 Byte)이내로 한글/영문만 가능합니다.");
//		$("#login_id").val("");
		$("#userName").focus();
		return false;
	}	
	return true;
}

function HpNoCheck()
{
	if ($("#hp_no2").val() == "") {
		alert("휴대폰 번호를 입력해 주세요.");
		$("#hp_no2").focus();
		return false;
	}

	if ($("#hp_no3").val() == "") {
		alert("휴대폰 번호를 입력해 주세요.");
		$("#hp_no3").focus();
		return false;
	}

	if ($("#hp_no1").val() == "") {
		alert("휴대폰 번호를 입력해 주세요.");
		return false;
	}
		
	if(	passonlynum($("#hp_no2").val()) || passonlynum($("#hp_no3").val()) ) {
		alert("휴대폰번호는 숫자로만 입력하세요.");
		$("#hp_no2").focus();
		return false;
	}

	//아이핀 인증 후 휴대폰 수동 입력 시
	$("#MobilePhoneNum").val($("#hp_no1").val()+"-"+$("#hp_no2").val()+"-"+$("#hp_no3").val());

	return true;
}

function EmailCheck() {

	if ($("#email1").val().length < 2) {
		alert("E-Mail 주소를 입력해 주세요.");
		$("#email1").val("");
		$("#email1").focus();
		return false;
	}

	if ($("#email2").val().length < 2) {
		alert("E-Mail 주소를 입력해 주세요.");
		$("#email2").val("");
		$("#email2").focus();
		return false;
	}

	if ($("#email2").val().indexOf(".") < 0) {
		alert("올바르지 않은 E-Mail 주소입니다. 다시 입력해 주세요.");
		$("#email2").val("");
		$("#email2").focus();
		return false;
	}

	if ($("#email2").val() == "gmarket.co.kr") {
		alert("등록이 불가능한 이메일 주소입니다. \ngmarket.co.kr 외에 다른 이메일 주소를 입력해주세요");
		$("#email1").val("");
		$("#email2").val("");
		$("#email1").focus();
		return false;
	}

	// 전체 이메일 주소!
	var email = $("#email1").val() + "@" + $("#email2").val();

	if (email == "help@gmarket.co.kr" || email == "gmarket@gmarket.co.kr" || email == "webmaster@gmarket.co.kr") {
		alert("올바르지 않은 E-Mail 주소입니다. 다시 입력해 주세요.");
		$("#email1").val("");
		$("#email1").focus();
		return false;
	}

	if (sTextByteLen(email) > 50) {
		alert("이메일 주소가 너무 길어 입력이 되지 않습니다. 다른 이메일 주소를 선택하여 주십시오.");
		return false;
	}	
	return true;
}

function RcvYNCheck() {

	// 이메일 수신 여부
	if ($("#isRcvMail").prop('checked') == true) {
		$("#ERcvYn").val("Y");
	}
	else {
		$("#ERcvYn").val("N");
	}

	if ($("#isRcvSMS").prop('checked') == true) {
		$("#SmsRcvYn").val("Y");
	}
	else {	
		$("#SmsRcvYn").val("N");
	}
	return true;
}

function IsValidID(value)
{
	if (sTextByteLen(value) < 6 || sTextByteLen(value) > 10)
	{
		return false;
	}
	else{
		var regExp = /[^0-9A-Za-z]/;
		return (!regExp.test( value ));
	}
}

function IsValidName(value)
{
	if (getByteLength(value) < 2 || getByteLength(value) > 30)
	{
		return false;
	}
	else{
		var regExp = /[^(ㄱ-힣0-9a-zA-Z\. )]/;
		return (regExp.test( value ));
	}
}


function sTextByteLen(sText) {
	var sTextLen = 0;

	for (var i = 0; i < sText.length; i++) {
		if (sText.charCodeAt(i) > 128) {
			sTextLen += 2;
		}
		else {
			sTextLen += 1;
		}
	}
	return sTextLen;
}

function getByteLength(strValue) {
		var iLength = 0;
		var chValue;

		if (strValue == null)
			return (0);

		for (var i = 0; i < strValue.length; i++) {
			chValue = escape(strValue.charAt(i));

			if (chValue.length == 1)				// 영문(1), 숫자(1)
				iLength++;
			else if (chValue.indexOf("%u") != -1)	// 한글(2)
				iLength += 2;
			else if (chValue.indexOf("%") != -1)	// ASCII(1)
				iLength += chValue.length / 3;
		}
		return (iLength);
	}

function getStringByteLength(pStr) {
	var c;
	var nLength = 0;
	var sStr = new String(pStr);

	for (i = 0; i < sStr.length; i++) {
		c = sStr.charAt(i);
		if (escape(c).length > 4)   // 한글
			nLength += 2;
		else
			nLength++;
	}
	return nLength;
}

/* 모바일 체크(모바일 경우 실행 될 함수);
function mobChk(fnc) {
	var mobileKeyWords = new Array('iPhone', 'iPad', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	for (var word in mobileKeyWords) {
		if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
			//alert("모바일");
		}
	}
}*/
</script>


	<link rel="stylesheet" type="text/css" href="https://script.gmarket.co.kr/pc/css/ko/member_join.css?dummy=20170309" />
</head>

<body>
    <div id="skip-navigation">
        <strong class="for-a11y">스킵 네비게이션</strong>
        <ul>
            <li><a href="#skip-navigation-search">검색창 바로가기</a></li>
            <li><a href="#skip-navigation-category-all">전체카테고리 바로가기</a></li>
            <li><a href="#container">본문 바로가기</a></li>
        </ul>
    </div> 
    <div id="header"></div>
    <script>
		DesktopLayout.render([
			{
			  name: "Header",
			  params: {"type":"simple",
					"user":{"name":"","type":"unknown","grade":"unknown"},
					"isAdult":false},
			  container: document.getElementById("header"),
			}
		  ]);
    </script>
	<div id="wrap">
        <a name="top"></a>
		<div id="contents">
			


<!-- container -->
<div id="container">
	<div class="join_wrap">
		<div id="join_container">
			<!-- join_header -->
			<div class="join_header">
				<h2 class="bg_area join_bg">구매 회원가입</h2>
				<ol class="join_step">
					<li class="bg_area join_bg step1">가입</li>
					<li class="bg_area join_bg step2">약관동의</li>
					<li class="bg_area join_bg step3 now"><span class="blind">현재페이지</span> 정보입력</li>
					<li class="bg_area join_bg step4">가입완료</li>
				</ol>
			</div>
			<!-- // join_header -->
			<div class="join_content">
				<div class="form">
					<form id="form1" method="post" action="">
						<fieldset>
							<legend>구매 회원가입 정보입력</legend>
							<input type="hidden" name="CertType" id="CertType" value="S">
							<input type="hidden" name="FromWhere" id="FromWhere" value="G">

							<input type="hidden" name="G9JoinYN" id="G9JoinYN" value="Y">
							<input type="hidden" name="PersonalInfoThirdPartySupportAgrYN" id="PersonalInfoThirdPartySupportAgrYN" value="Y">
							<input type="hidden" name="PersonalInfoCollectUseAgrYN" id="PersonalInfoCollectUseAgrYN" value="Y">
							<input type="hidden" name="ERcvYN" id="ERcvYN" value="Y">
							<input type="hidden" name="SMSRcvYN" id="SMSRcvYN" value="Y">
							<input type="hidden" name="AccessReserveKey" id="AccessReserveKey" value="CEE154E0-E63C-4E51-9ECC-0C42F8D4DCE7">

							<input type="hidden" name="MobilePhoneNum" id="MobilePhoneNum" value="">
							<input type="hidden" name="hdnTargetUrl" id="hdnTargetUrl" value="http://myg.gmarket.co.kr/">

							<!-- <ul class="humint">
			<li class="icon_bg name">홍길동</li>
			<li class="icon_bg phone">010-1234-5678</li> N : 아이핀인증시엔 감춤
			<li class="icon_bg birthday">1984년 07월 21일</li>
		</ul> -->
							<p class="">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p><!-- WPR-973 -->
							<ul class="form_list">
								<!-- N : 유효성 체크 메세지 p.ability_chk는 처음에 존재하지 않다가 유효성 체크후에 추가가 되는 형식입니다.  -->
								<!-- N : 입력 상태 아이콘 span.bg_area.icon_bg.chk 입력이 정상적인 경우 아이콘에 submit 클래스 추가 -->
								<li>
									<div class="guide_txt">
										<label for="login_id">ID를 만들어주세요</label>
										<p class="placeholder">띄어쓰기 없이 영/숫자 6-10자</p>
									</div>
									<input type="text" name="login_id" id="login_id" maxlength="10">
									<!--  오류 메세지  -->
									<!-- <p class="ability_chk">이미 사용중인 아이디입니다.</p> -->
									<p id="idMsg" class="ability_chk submit" style="display:none">사용가능한 아이디 입니다.</p>
									<!-- N : 유효성 체크 메세지는 처음에 존재하지 않다가 유효성 체크후에 추가가 되는 형식입니다.  -->
									<!--  오류 메세지  -->
									<span id="idMsgCheck" class="bg_area icon_bg chk ">아이디 입력 체크</span>
									<!-- N: 입력이 정상적인 경우 아이콘에 submit 클래스 추가 -->
								</li>
								<li>
									<div class="guide_txt">
										<label for="pwd1">비밀번호 입력</label>
										<p class="placeholder">6-15자의 영문 대소문자, 숫자 및 특수문자 조합</p>
									</div>
									<input type="password" name="pwd1" id="pwd1" maxlength="15">
									<p id="pwd1Msg" class="ability_chk" style="display:none">비밀번호를 정확히 입력해주세요.</p>
									<span id="pwd1MsgCheck" class="bg_area icon_bg chk pw">비밀번호 입력 체크</span>
								</li>
								<li>
									<div class="guide_txt">
										<label for="pwd2">위의 비밀번호를 다시 입력해주세요.</label>
									</div>
									<input type="password" name="pwd2" id="pwd2" maxlength="15">
									<p id="pwd2Msg" class="ability_chk" style="display:none">비밀번호가 동일하지 않습니다.</p>
									<span id="pwd2MsgCheck" class="bg_area icon_bg chk pw2 ">비밀번호 확인 입력 체크</span>
								</li>

								<!-- WPR-973 -->
								<li>
									<div class="guide_txt">
										<label for="name" id="name">이름</label>
									</div>
									<input type="text" name="name" id="userName" maxlength="30" />
									<p id="userNameMsg" class="ability_chk" style="display:none">이름은 최대 15자(30 Byte)이내로 한글/영문만 가능합니다.</p>
									<span id="userNameMsgCheck" class="bg_area icon_bg chk">이름 입력 체크</span><!-- WPR-973_2015-06-10수정추가 --><!-- N: 입력이 정상적인 경우 아이콘에 submit 클래스 추가 -->
								</li>
								<!--  WPR-973_2015-05-06수정(생년월일 빼고, 하단에 14세 미만여부 내용으로 변경 요청)
			<li>
				<div class="guide_txt">
					<label for="birthdate1">생년월일</label>
					<p class="placeholder">YYYYMMDD로 입력</p>
				</div>
				<input type="text" name="birthdate1" id="birthdate1" style="width:50px;" maxlength="4" title="생년월일 년도">
				<span class="md_txt">-</span>
				<input type="text" name="birthdate2" id="birthdate2" class="txt_center" style="width:40px;" maxlength="2" title="생년월일 월">
				<span class="md_txt">-</span>
				<input type="text" name="birthdate3" id="birthdate3" class="txt_center" style="width:40px;" maxlength="2" title="생년월일 일">
			</li> -->
								<!-- 아이핀인증시엔 휴대폰 입력 노출안됨 -->
								<li class="select_first">
									<div class="guide_txt cover">
										<label for="hp_no2">휴대폰번호입력</label>
									</div>
									<select name="hp_no1" id="hp_no1" class="left" title="휴대폰번호 첫자리 선택입력">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									<input type="text" name="hp_no2" id="hp_no2" class="first_select" style="width:40px;" maxlength="4" title="휴대폰번호 가운데 자리">
									<span class="md_txt">-</span>
									<input type="text" name="hp_no3" id="hp_no3" style="width:257px;" maxlength="4" title="휴대폰번호 마지막 자리">
									<p id="hpMsg" class="ability_chk" style="display:none">휴대폰번호를 정확히 입력해주세요.</p>
									<!-- N : 유효성 체크 메세지는 처음에 존재하지 않다가 유효성 체크후에 추가가 되는 형식입니다.  -->
									<span id="hpMsgCheck" class="bg_area icon_bg chk">체크</span>
								</li>
								<!-- // 아이핀인증시엔 휴대폰 입력 노출안됨 -->
								<!-- //WPR-973 -->

								<li class="select_last">
									<div class="guide_txt">
										<label for="email1">이메일</label>
									</div>
									<input type="text" name="email1" id="email1" style="width:210px;"><!-- 2014-10-23 -->
									<span class="md_txt">@</span>
									<input type="text" name="email2" id="email2" class="email" style="width:130px;" title="이메일 주소 뒷 자리">
									<select name="mail_server" id="mail_server" class="right" title="이메일 주소 뒷 자리 선택입력">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="paran.com">paran.com</option>
										<option value="empas.com">empas.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="korea.com">korea.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmir.com">hanmir.com</option>
									</select>
									<p id="emailMsg" class="ability_chk" style="display:none">메일주소를 정확히 입력해주세요.</p>
								</li>
								<!-- <li class="form_clear">
				<strong class="form_title">쇼핑 메일 SMS 수신</strong>
				<p class="form_cont">
				<label for="email"><input type="checkbox" id="email" name="" class="chk">이메일 수신</label>
				<label for="sms"><input type="checkbox" id="sms" name="" class="chk">SMS 수신</label>
				</p>
				<p class="add_text">
					할인쿠폰, 특가상품 이벤트정보를 받아보세요!<br>(거래정보-결제 교환, 환불 등과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.)
				</p>
			</li> -->
								<!-- WPR-973_2015-05-18삭제 -->
								<!-- WPR-973_2015-05-06수정 -->
								
								<!--// WPR-973_2015-05-06수정 -->
								<!--// WPR-973_2015-05-18삭제 -->
							</ul>
							<div class="btn_zone">
								<a href="#" id="cancel" class="bg_area btn_bg l2"><span>처음으로</span></a>
								<a href="javascript:Signup();" id="next" class="bg_area btn_bg l1 md"><span>확인</span></a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- // join_content -->
		</div> 
		<!--// join_container -->
	</div>
</div>
<!-- //container -->

		</div>
	</div>
    <!-- S:푸터:19.10.25 -->
    <div id="footer"></div>
    <script>
		DesktopLayout.render([
			{
			  name: "Footer",
			  params: {"type":"default"},
			  container: document.getElementById("footer"),
			},
		  ]);
    </script>
    <!-- E:푸터:19.10.25 -->

	<!-- Jira : BC9186-24 -->
	

</body>

</html>
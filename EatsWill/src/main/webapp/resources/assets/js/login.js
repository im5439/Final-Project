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
		
	$("#logincheck").click(function(){

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
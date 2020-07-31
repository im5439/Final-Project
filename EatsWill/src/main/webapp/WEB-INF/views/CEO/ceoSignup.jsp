<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html lang="ko" class=""><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>EATSWILL 사장님 사이트</title>
<link rel="shortcut icon"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="72x72">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="114x114">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="144x144">
    <meta name="naver-site-verification" content="4cdda9d96d7ffd83e486b2bf7d2d63e5ea479f3b">
    <meta name="google-site-verification" content="sjuYAwgH5hN_We8OTVoWve7cwBlU5yvn6sADTbxCmsU">
    <link rel="stylesheet" type="text/css" href="https://owner.yogiyo.co.kr/media/css/jquery-ui-1.10.3.min.css">
    <link rel="stylesheet" type="text/css" href="https://owner.yogiyo.co.kr/media/owners/css/owners_new.css?v=587f2d4">
    <link href="https://owner.yogiyo.co.kr/media/compressed/owners_page_base.rffe6aa724bb156908393fab4f615e785.css" rel="stylesheet" type="text/css">
    
    <script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
    
    
<style type="text/css">

	.control-group {
		padding-top: 15px;
		padding-bottom: 15px;
		border-top: 1px solid #d0d0d0;
	}
	
	.control-label {
		position: absolute;
		font-weight: bold;
		padding-top: 3px;
	}
	
	.controls {
		margin-left: 16%;
	}
	
	 .control-text {
	 	width: 200px;
	 	height: 30px;
	 }
	 
	 .alert-text {
	 	color: crimson;
	 	font-weight: bold;
	 	font-size: 12px;
	 }

</style>


<body>
    
<script type="text/javascript">
	
	function inNumber(){
	    if(event.keyCode<48 || event.keyCode>57){
	       event.returnValue=false;
	    }
	}
	
	function inPwd(){
	    var f = document.myForm;
	    if(!f.ceoPw.value){
	       event.returnValue=false;
	    }
	}
	
	function isValidEmail(email) {
		var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
	    if (email.search(format) != -1)
	        return true; //올바른 포맷 형식
	    return false;
	}	

	function sendIt(){
		
		var f = document.myForm;
		
		var numCheck = /[0-9]/; 

		if(!f.company_number.value){
			alert("사업자번호를 입력하세요");
			f.company_number.focus();
			return;
		}
		
		if(!f.ceoId.value){
			alert("아이디를 입력하세요");
			f.ceoId.focus();
			return;
		}

		if(!f.ceoPw.value){
			alert("비밀번호를 입력하세요");
			f.ceoPw.focus();
			return;
		}
		
		if(!f.ceoPwChk.value){
			alert("비밀번호를 확인하세요");
			f.ceoPwChk.focus();
			return;
		}
		
		if(f.ceoPw.value != f.ceoPwChk.value){
			alert("비밀번호가 일치하지 않습니다");
			f.ceoPwChk.focus();
			return;
		}
		
		if(!f.ceoName.value){
			alert("이름을 입력하세요");
			f.ceoName.focus();
			return;
		}
		
		if(!f.ceoEmail.value){
			alert("이메일을 입력하세요");
			f.ceoEmail.focus();
			return;
		}
		
		if(!isValidEmail(f.ceoEmail.value)) {
       	 	alert("\n정상적인 E-Mail을 입력하세요. ");
        	f.ceoEmail.focus();
        	return;
		}
		
		var param = "ceoId=" + $("#ceoId").val();
		var params = "ceoNumber=" + $("#company_number").val();
		var saupjaExists = 0;
	            
        $.ajax({
            url: "saupjaCheck.action",
            type: "POST",            
            data: params,
            async: false,
            success: function(data){
            	if(data=="fail") {
            		saupjaExists = 1;
            	}
            },
            error: function(){
                alert("Error");
            }
        });
        
        if(saupjaExists == 1) {
       	 	alert("사업자번호를 확인해주세요");
        	f.company_number.focus();
        	return;
		}
		
		$.ajax({
            url: "ceoIdCheck.action",
            type: "POST",            
            data: param,
            success: function(data){
            	if(data=="fail") {
            		alert("이미 사용중인 아이디입니다");
            		f.ceoId.focus();
            		return;
            	} else {
            		f.action = "<%=cp%>/ceoSignup_ok.action";
            		f.submit();
            	}
            },	
            error: function(){
                alert("Error");
            }
	    });
	}

</script>   

<script type="text/javascript">

$(function() {
	$("#company_number").blur(function(){
		if($("#company_number").val() != "") {
			var params = "ceoNumber=" + $("#company_number").val();
            
		        $.ajax({
		            url: "saupjaCheck.action",
		            type: "POST",            
		            data: params,
		            success: function(data){
		            	if(data=="fail") {
		            		$("#company_numbers").attr('class', 'alert-text');
		            		$("#company_numbers").text("사업자번호를 확인해주세요");
		            	} else {
		            		$("#company_numbers").text("");
		            	}
		            },
		            error: function(){
		                alert("Error");
		            }
		        });
		} else {
			$("#company_numbers").attr('class', '');
			$("#company_numbers").text("'-' 제외하고 입력 필요. ex) 1234");
		}
	});
	
	$("#ceoId").blur(function(){
		if($("#ceoId").val() != "") {
			var param = "ceoId=" + $("#ceoId").val();
            
		        $.ajax({
		            url: "ceoIdCheck.action",
		            type: "POST",            
		            data: param,
		            success: function(data){
		            	if(data=="fail") {
		            		$("#ceoIds").text("이미 사용중인 아이디입니다");
		            	} else {
		            		$("#ceoIds").text("");
		            	}
		            },
		            error: function(){
		                alert("Error");
		            }
		        });
		} else {
			$("#ceoIds").text("");
		}
	});
	
	$("#ceoPw").blur(function(){
		if($("#ceoPw").val() == "") {
			$("#ceoPwChk").val("");
			$("#ceoPwChks").text("");
		}
	});
	
	$("#ceoPwChk").blur(function(){
		if($("#ceoPw").val() != "" && $("#ceoPwChk").val() != "") {
			if($("#ceoPw").val() != $("#ceoPwChk").val()) {
				$("#ceoPwChks").text("패스워드가 일치하지 않습니다");
			} else {
				$("#ceoPwChks").text("");
			}
		} else {
			$("#ceoPwChks").text("");
		}
	});
	
	$("#ceoEmail").blur(function(){
		if($("#ceoEmail").val() != "") {
			if(!isValidEmail($("#ceoEmail").val())) {
				$("#ceoEmails").text("\n정상적인 E-Mail이 아닙니다 ");
			} else {
				$("#ceoEmails").text("");
			}
		} else {
			$("#ceoEmails").text("");
		}
	});
	
});

</script> 

	<div id="nav" >
		<div class="clearfix">
		
			<h1>
				<a href="<%=cp%>/CEO.action/" style="text-decoration: none;">
				<img alt="" src="/eatswill/resources/img/1sajang.png" width="128px" height="58px" style=" margin-left: 60px; margin-top: 20px;"> 
				<img alt="" src="/eatswill/resources/img/sajang.png" width="96px"  height="22px" style="margin-bottom: 10px;">
				</a>
			</h1>
		</div>
	</div>
	
	

<div class="rd-wrapper contact-wrapper" style="margin: 4% 28% 6.5% 22%;text-align: center;">
    
    <form class="form-horizontal form-signin" method="POST" action="" name="myForm">
      <div class="registration-wrap" style="text-align: left;">
    
		<div class="control-group">
			<div class="control-label">사업자번호</div>
			<div class="controls">
				<input type="text" name="company_number" id="company_number" class="control-text" maxlength="10" 
				onkeypress="inNumber();">
				<span id="company_numbers">"-" 제외하고 입력 필요. ex) 1234</span>
			</div>    
		</div>
		    
		<div class="control-group">  
			<div class="control-label">아이디</div>
		    <div class="controls">	
		    	<input type="text" name="ceoId" id="ceoId" class="control-text">
		    	<span class="alert-text" id="ceoIds"></span>
		    </div>
		</div>
		
		<div class="control-group">
			<div class="control-label">패스워드</div>
			<div class="controls">
				<input type="password" name="ceoPw"  id="ceoPw" class="control-text">
		    </div>
		</div>
		
		<div class="control-group">
			<div class="control-label">패스워드확인</div>
			<div class="controls">
           		<input type="password"  name="ceoPwChk"  id="ceoPwChk" class="control-text" onkeypress="inPwd();">
           		<span class="alert-text" id="ceoPwChks"></span>
	        </div>
		</div>
		
		<div class="control-group"> 
		  	<div class="control-label">이름</div>
		    <div class="controls">	
		    	<input type="text" name="ceoName" id="ceoName" class="control-text">
		    </div>
		</div>
		
		<div class="control-group" style="border-bottom: 1px solid #d0d0d0;">
			<div class="control-label" >이메일</div>
			<div class="controls">
				<input type="text" name="ceoEmail" id="ceoEmail" class="control-text">
				<span class="alert-text" id="ceoEmails"></span>
		  	</div>
		</div>
      
      </div>


    </form>
      <div class="btn-wrapper">
        <button type="submit" class="btn" onclick="sendIt();"
        style="width: 150px;height: 40px;margin-top: 40px;font-weight: bold;">회원 가입</button>
      </div>
  </div>


<jsp:include page="ceoIncludeBottom.jsp" flush="false"/>

</body></html>
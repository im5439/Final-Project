<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
  <script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
  <script type="text/javascript">
  
  function kakaoLogout() {
	Kakao.Auth.logout(function(response) {
		alert(response + 'logout');
	}); 
  }
  
  </script>
  
 </head>
 
 <body>
  <a id="kakao-login-btn"></a>
  <input type="button" id="logout" value="로그아웃" onclick="kakaoLogout();"/>
  
  <script type='text/javascript'>
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('da5ed75e6d7f9bcac9abaeae41fd1108');
   
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
   	  Kakao.Auth.loginForm({
       success: function(authObj) {
	     // 로그인 성공시, API를 호출합니다.
	     Kakao.API.request({
	      url: '/v2/user/me',
	      success: function(res) {
	    	  alert(JSON.stringify(res));
	    	  alert(JSON.stringify(res.kakao_account.profile.nickname));
	    	  alert(JSON.stringify(res.kakao_account.email));
	      },
	      fail: function(error) {
	       alert(JSON.stringify(error));
	      }
	     });
       },
       fail: function(err) {
         alert("ABC");
       }
     });
    },
    fail: function(err) {
     alert(JSON.stringify(err));
    }
   });
  </script>
</body>
</html>

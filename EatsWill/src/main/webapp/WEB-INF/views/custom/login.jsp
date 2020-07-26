<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String message = (String)request.getAttribute("message");
%>
<html lang="ko" ng-controller="base_controller" class="ng-scope">
<head>
<style type="text/css">
@charset "UTF-8"; 

[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak, .ng-hide:not(.ng-hide-animate) {
	display: none !important;
}

ng\:form {
	display: block;
	
}




</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">
<meta name="google-site-verification"
	content="U4GhkkNiUMneDT6RC-apM8m8D6hZJfAXVfXi2_SuyWU">
<meta name="keywords"
	content="치킨, 요기요, 중국집, 피자, 치킨추천, 배달음식, 야식, 내주변맛집, 짜장면, 근처중국집, 배달, 뭐먹지, 맛있는치킨추천, 여기요, 점심메뉴추천, 요기요첫주문할인, 중화요리, 피자추천, 맛있는음식, 치킨배달, 피자배달, 근처중국집배달, 맛있는치킨순위, 야식추천, 근처치킨집, 후라이드치킨순위, 족발집, 낙지소면, 요기요쿠폰, 짜장면집, 배달앱, 족발배달, 피자집, 피자할인, 식사, 요기요할인, 낙지볶음배달, 곱창배달, 배달어플할인, 24시중국집, 배달어플, 치킨할인, 떡볶이배달, 야식배달, 낙지소면배달, 중국집배달, 냉면배달, 점심배달음식, 치킨집, 요기요첫주문, 요기요쿠폰코드, 배달떡볶이, 피자치킨세트, 야식어플, 배달피자, 배달앱추천, 보쌈, 요기요할인쿠폰, 배달요기요, 초밥배달, 근처피자집, 맛있는치킨, 배달야식추천, 24시간중국집, 족발, 돈까스배달, 배달맛집, 배달음식순위, 비비큐할인, 삼계탕배달, 24시간피자배달, 집들이음식배달, 맛있는피자, 분식배달, 24시치킨, 배달사이트, 저녁메뉴추천, 요기오, 부대찌개배달, 혼자배달음식, 배달음식추천, 요기요배달, 요기요치킨, 배달서비스, 스파게티배달, 아침식사배달, 24시야식배달, 24시배달, 배달할인, 여기요할인, 24시간배달, 24시간치킨, 요기여, 1인분배달, yogiyo, 치킨배달할인, 강남역배달, 배달죽, 요기요플러스, 플러스요기요">
<meta name="description"
	content="요기요에서 원하는 배달음식을 쉽고 편리하게! 먹어본 사람만 쓸 수 있는 클린리뷰로 배달맛집 인증, 다양한 할인 혜택과 함께 배달되지 않던 인기맛집까지, 지금 바로 요기요에서 주문하세요.">




	<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
	<link rel="stylesheet" href="/eatswill/resources/assets/css/owners_page_base.css" />
	<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
	<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/buttons.css" />
	<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/normalize.css" />
	<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/vicons-font.css" />
	<link rel="stylesheet" href="/eatswill/resources/assets/css/bootstrap.min.css" />
	
	<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="/eatswill/resources/assets/js/login.js"></script>	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	


<script type="text/javascript">

	$(function() {
		
		if('${message }'!=null && '${message }'!="") {
			alert('${message }');
		}
		
	});

</script>

<meta name="theme-color" content="#DC1400">
<meta property="og:title" content="lets eats will !">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:image"
	content="https://www.yogiyo.co.kr/mobile/image/app_img_560x292.png">
<meta property="og:description" content="">
<!-- ngIf: ! page.title -->
<title ng-if="! page.title" class="ng-scope">다함께 eats will</title>
<!-- end ngIf: ! page.title -->
<!-- ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="icon" type="image/png"
	href="/eatswill/resources/images/sicon.jpg">

</head>
<body class="asp_check" style="margin-top: 0px;">

	<div yogiyo-header="">
		<div id="header" class="header">
			<%@ include file="/WEB-INF/views/layout/header.jsp" %>
		</div>
		
		<div class="rd-wrapper contact-wrapper">
	    	<form class="form-horizontal form-signin" method="POST" action="" name="myForm">
		      	<div class="registration-wrap" style="width: 420px"> 
					<div class="control-group">
		        		<div class="control-label">아이디</div>
		
		        		<div class="controls">
		            		<input type="text" name="id" id="id" style="display: inline;height: 34px;width: 90%"/>
						</div>
					</div>
		
					<div class="control-group">
		        		<div class="control-label">패스워드</div>
		
		        		<div class="controls">
		            		<input type="password" name="pw" id="pw" style="display: inline;height: 34px;width: 90%" onkeyup="enterkey();"/>
						</div>
					</div>
				</div>
				
				<div style="text-align: center; font-size: 14px; color: brown;">
					<label><a class="tryId" onclick="tryId_click();">아이디</a></label> / 
					<label><a class="tryPw" onclick="tryPw_click();">비밀번호 찾기</a></label>
				</div>
		
		      	<div class="btn-wrapper" style="margin-bottom: 20px; text-align: -webkit-center">
		        	<button type="button" class="button button--login"
		        		onclick="logon();">로그인</button>
		      	</div>
		      	
		      	<div style="text-align: center;padding-bottom: 20px">
		      		<a id="kakao-login-btn" style="padding-right: 5px;"></a>
		      		<input type="hidden" id="kakaoSession" name="kakaoSession">
		      		<input type="hidden" id="kakaoSession2" name="kakaoSession2">
		      	</div>
	    	</form>
	    </div>
		

		<div id="quick-btn" class="hide-btn">
			<a ng-click="click_cart_button()" id="button-cart-btm" href=""
				class="btn-cart ng-hide" ng-show="check_show_cart_button('quick')"><span
				class="badge ng-binding" ng-bind="global_cart.get_amount()">0</span></a>
			<a ng-click="scrollTop($event)" class="btn-top">top</a>
		</div>

	</div>
	<div id="messages" class="messages"></div>
	<div id="messages_bottom" class="messages messages-bottom"></div>
	<div ng-show="on_loading" id="spinner" style="" class="ng-hide">
		<div></div>
		<span class="message"></span>
	</div>
	<!-- ngView:  -->
	<div id="content" class="container-fluid ng-scope" ng-view="">
		
	</div>
	
	  <div class="footer" style="background-color: #FDF5E6; display: block; padding-bottom: 239px;">
		<div class="footer-menu">
		
		</div>
		
		<!-- =========================================================================================== 하단끝 -->
		
		<div class="company-wrap">
			<div class="company-logo">
				
			</div>
			<div class="company-info">
				<p>
					<strong>(유) 윗츠윌 코리아 </strong>
				</p>
				
			</div>
		</div>
		
		<!-- ========================================================================= 하단 부분 -->
		
		<div class="service-info">
			<div class="bpg">
				<a href="#/trust/"><span class="img"></span><span class="text">잇츠윌<br>안심센터
				</span></a>
			</div>
			<div class="cleanreview">
				<a href="#/cleanreview/"><span class="img"></span><span
					class="text">잇츠윌 100%<br>클린리뷰
				</span></a>
			</div>
			<div class="csc">
				<em>고객만족센터</em> <strong>1661-5270</strong> <span>24시간, 연중무휴</span>
			</div>
		</div>
		<div class="guide">
			<p>(유) 잇츠윌 코리아는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품/ 거래정보 및 거래와
				관련하여 잇츠윌에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 (유)잇츠윌 코리아는 책임을
				지지 않습니다. 상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다.
				Copyright EATSWILL. All Rights Reserved.</p>
		</div>
	</div>
	
	
	<!-- Scripts -->
	<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
	<script src="/eatswill/resources/assets/js/skel.min.js"></script>
	<script src="/eatswill/resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/eatswill/resources/assets/js/main.js"></script>
			
	<!-- 카카오톡 채팅 시작 -->
	<div style="position: fixed; right: 10px; bottom: 10px;"
		class="talk_image">
		<a id="channel-chat-button" onclick="void chatChannel();">
			<img src="/eatswill/resources/img/consult_small_yellow_pc1.png"
			width="70" height="70" />
		</a>
		<script type="text/javascript">
           // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
           // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
           //Kakao.init('c089c8172def97eb00c07217cae17495')
           function chatChannel() {
             Kakao.Channel.chat({
               channelPublicId: '_Yfaxoxb',
             })
           }
         </script>
	</div>
	<!-- 카카오톡 채팅 끝 -->	
	
</body>
</html>
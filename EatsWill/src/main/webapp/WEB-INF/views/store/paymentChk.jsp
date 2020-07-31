<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" defer="" async=""
	src="https://collector-658.tvsquared.com/piwik/tv2track.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NSQ8BP"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script
	src="https://connect.facebook.net/signals/config/1041485915908980?v=2.9.22&amp;r=stable"
	async=""></script>
<script async="" src="//connect.facebook.net/en_US/fbevents.js"></script>

<meta name="theme-color" content="#DC1400">
<meta property="og:title" content="잇츠윌-누구보다빠르게 남들과는 다르게">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:image"
	content="https://www.yogiyo.co.kr/mobile/image/app_img_560x292.png">
<meta property="og:description"
	content="요기요에서 원하는 배달음식을 쉽고 편리하게! 먹어본 사람만 쓸 수 있는 클린리뷰로 배달맛집 인증, 다양한 할인 혜택과 함께 배달되지 않던 인기맛집까지, 지금 바로 요기요에서 주문하세요.">
<!-- ngIf: ! page.title -->
<!-- ngIf: page.title -->
<title ng-if="page.title" ng-bind="page.title + &quot; - 요기요&quot;"
	class="ng-binding ng-scope">나의 주문 목록</title>
<!-- end ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="icon" type="image/png"
	href="/eatswill/resources/images/sicon.jpg">


<!-- css---------------------------------------------------------- -->

<link rel="stylesheet"
	href="css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<link rel="stylesheet" href="/eatswill/resources/assets/css/app.css"
	type="text/css" />

<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/buttons.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/normalize.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/vicons-font.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/css/bootstrap.min.css" />
<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/eatswill/resources/assets/js/cart.js"></script>
<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<!--------------------------------------------------------------------------------------- -->

<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
	src="//montelena.gmarket.co.kr/montelena.js"></script>
<script async=""
	src="//script.gmarket.co.kr/mobile/js/common/kr/util/viewability.js"></script>
<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
	src="//montelena.gmarket.co.kr/montelena.js?path=http://myg.gmarket.co.kr/"></script>
<script type="text/javascript"
	src="http://www.gmarket.co.kr/challenge/neo_include/favicon_net.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/json2.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/jquery.popupwindow.js"></script>
<script type="text/javascript" src="/Scripts/Common.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/fnp/desktop-layout.js"></script>
<script type="text/javascript" src="/Scripts/ScriptEventErrorHandler.js"></script>

<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/gmkt.js?dummy=2012091327262"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/dimmed.js"></script>
<script type="text/javascript"
	src="http://myg.gmarket.co.kr/Scripts/MyGMenu.js?dummy=201702141631"></script>
<script type="text/javascript" defer="defer"
	src="http://script.gmarket.co.kr/_Net/js/impression.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/CommonHeader.js"></script>
<script type="text/javascript"
	src="/Scripts/ContractCommon.js?ver=20200319"></script>
<script type="text/javascript"
	src="/Scripts/Home/Default.js?ver=201811271415"></script>
<script type="text/javascript" src="/Scripts/jquery.unobtrusive-ajax.js"></script>
<script type="text/javascript" src="/Scripts/modal.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/MygSmileClubBanner.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/MygSmileStamp.js"></script>


<!-- End location.search generate Code -->
<!-- Start optimizely Code -->
<script src="//cdn.optimizely.com/js/9026702317.js"></script>
<!-- End optimizely Code -->
<!--Start Facebook  Pixel  Code -->


<script src="http://code.jquery.com/jquery-1.11.0.js"></script>

<!-- End Google Tag Manager -->
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/41/4/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/41/4/intl/ko_ALL/util.js"></script>
	
<script type="text/javascript">

	function switchScreen() {
	   	setTimeout("switchScreenTime()", 2000);
	}
	
	function switchScreenTime() {
	   	document.getElementById("divLoading").style.display = "none";
		document.getElementById("divBody").style.display = "";
	}

</script>	
	
</head>

<!--  로딩창 div ----------------------------------------------------------------------------- --> 
<body class="asp_check" style="margin-top: 0px;" onload="switchScreen();">

<div id="divLoading" style="position:absolute; top:30%; left:0;  text-align:center; margin:0 auto; width: 100%;">
    <img src="/eatswill/resources/images/hicon2.gif" alt="잠시만 기다려 주세요. 로딩중입니다."  style="height: 30em; width: 30em;"/>
</div>

<div id="divBody" style="display:none;">
<!--  로딩창 div ----------------------------------------------------------------------------- 맨밑에 /div 있음  --> 


	<div yogiyo-header="">
		<div id="header" class="header">
			<div role="navigation" class="nav-bar">
				<%@ include file="/WEB-INF/views/layout/header.jsp" %>
				
				<%@ include file="/WEB-INF/views/layout/banner.jsp" %>
			</div>
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
	<div id="content" class="container-fluid ng-scope" ng-view="" style="text-align: -webkit-center;">
		<div class="restaurant-category-menu ng-scope ng-hide"
			ng-show="!is_mobile_width &amp;&amp; !is_mobile_width_for_category">
			<div yogiyo-restaurant-category="">
				<div class="sms" ng-show="check_show_category_block()"></div>

			</div>
		</div>
		<div class="restaurant-detail row ng-scope">

			<div class="col-sm-8" style="width: 1000px">
				<div id="banner_11st" class="banner_11st"></div>

				
				<div ng-show="active_tab == &quot;review&quot;" class="">

					<ul id="review" class="list-group review-list">

						<!-- ngRepeat: review in restaurant.reviews -->

						<li class="list-group-item star-point ng-scope"
							ng-repeat="review in restaurant.reviews"
							on-finish-render="scrollCartArea()">
							<div class="b_ta_info" style="text-align: center; font-size:25pt;">
								<img
										alt="" src="/eatswill/resources/img/ot2.png" width="100px"
									height="45px" >
								
								<img
										alt="" src="/eatswill/resources/img/ot2.png" width="100px"
									height="60px" >
								
								<img
								
										alt="" src="/eatswill/resources/img/ot.png" width="130px"
									height="140px" >
							 <br/>
										
											고객님의 주문이 완료되었습니다. 
							<br/>
										
							</div>
							
							<div class="b_ta_info" style="text-align: center; font-size:10pt;">
							<br/>
							빠른 시간 내에 주문하신 
							주문 내역 및 관련 안내는 주문조회를 통하여 확인 가능합니다.<br/>
							</div>
							
							<div class="b_ta_info" style="text-align: center; font-size:10pt;">
							<br/>
							▶ 주문 번호 : ${dto2.orderCode}<br/>
							▶ 주문 일자 : ${dto2.orderDate }<br/>
							</div>
							<br/>
							
						</li>

						<!-- end ngRepeat: review in restaurant.reviews -->


						<!-- 더보기 기능 -->
						<li class="list-group-item btn-more" ng-show="check_more_review()" >
							<a href="<%=cp%>/myPage.action" style="font-size: 18px;">주문확인 바로가기</a>
							
						</li>
					</ul>
					
				</div>
			</div>
		</div>
	</div>
				
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
				
	<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
	<script src="/eatswill/resources/assets/js/skel.min.js"></script>
	<script src="/eatswill/resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/eatswill/resources/assets/js/main.js"></script>
	<input type="hidden" value="${sessionScope.custominfo.id }"
		name="sessionId">
					
	<!-- 시연 - 슬라이드 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script> $('.carousel').carousel({ interval: 1200 //기본 5초 }) </script>

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
           Kakao.init('c089c8172def97eb00c07217cae17495')
           function chatChannel() {
             Kakao.Channel.chat({
               channelPublicId: '_Yfaxoxb',
             })
           }
         </script>
	</div>
	<!-- 카카오톡 채팅 끝 -->
</div>
</body>
</html>
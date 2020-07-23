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
	href="https://www.yogiyo.co.kr/mobile/image/app_128x128.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="https://www.yogiyo.co.kr/mobile/image/app_144x144.png">
<link rel="icon" type="image/png"
	href="https://www.yogiyo.co.kr/mobile/image/favicon.ico">


<!-- css---------------------------------------------------------- -->

<link rel="stylesheet"
	href="css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<link rel="stylesheet" href="/eatswill/resources/assets/css/app.css"
	type="text/css" />

<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<script type="text/javascript"
	src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="/eatswill/resources/assets/js/cart.js"></script>


<!--------------------------------------------------------------------------------------- -->




<link rel="shortcut icon"
	href="http://image.gmarket.co.kr/_Net/MyG/favicon/gmarket.ico">


<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css">
<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/ko/myg.css">
<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/ko/myg_net.css">

<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
	src="//montelena.gmarket.co.kr/montelena.js?path=http://192.168.16.23:8080/eatswill/myOrder.action"></script>
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

<!-- Start location.search generate Code for Naver 검색 유입 -->
<script type="text/javascript">
   if (is_yogiyo) {
      (function() {
         function beginsWith(begin, whole) {
            if (whole.indexOf(begin) === 0) {
               return whole.substr(begin.length);
            }
         }
         function urlResolve(url) {
            var href = url;
            if (msie) {
               urlParsingNode.setAttribute('href', href);
               href = urlParsingNode.href;
            }
            urlParsingNode.setAttribute('href', href);
            return {
               href : urlParsingNode.href,
               protocol : urlParsingNode.protocol ? urlParsingNode.protocol
                     .replace(/:$/, '')
                     : '',
               host : urlParsingNode.host,
               search : urlParsingNode.search ? urlParsingNode.search
                     .replace(/^\?/, '') : '',
               hash : urlParsingNode.hash ? urlParsingNode.hash.replace(
                     /^#/, '') : '',
               hostname : urlParsingNode.hostname,
               port : urlParsingNode.port,
               pathname : (urlParsingNode.pathname.charAt(0) === '/') ? urlParsingNode.pathname
                     : '/' + urlParsingNode.pathname
            };
         }
         var msie = document.documentMode;
         var urlParsingNode = document.createElement('a');
         var originUrl = urlResolve(window.location.href);
         var originSearchUrl = originUrl.search;
         var withoutHashUrl = originUrl.hash;
         if (withoutHashUrl !== '') {
            if (withoutHashUrl.charAt(0) === '#') {
               withoutHashUrl = beginsWith('#', withoutHashUrl);
            }
            var hashUrl = urlResolve(withoutHashUrl);
            if (hashUrl.search !== '' && originSearchUrl === '') {
               window.location.search = hashUrl.search;
            }
         }
      })();
   } else {
      if (document.styleSheets.length > 0
            && document.styleSheets[document.styleSheets.length - 1].cssRules) {
         document.styleSheets[document.styleSheets.length - 1]
               .insertRule(
                     '.asp_check .fake-header, .asp_check .category-list, .asp_check .footer { display: none; }',
                     document.styleSheets[document.styleSheets.length - 1].cssRules.length);
      }
   }
</script>
<!-- End location.search generate Code -->
<!-- Start optimizely Code -->
<script src="//cdn.optimizely.com/js/9026702317.js"></script>
<!-- End optimizely Code -->
<!--Start Facebook  Pixel  Code -->
<script>
   /* eslint-disable */
   !function(f, b, e, v, n, t, s) {
      if (f.fbq)
         return;
      n = f.fbq = function() {
         n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
               .push(arguments)
      };
      if (!f._fbq)
         f._fbq = n;
      n.push = n;
      n.loaded = !0;
      n.version = '2.0';
      n.queue = [];
      t = b.createElement(e);
      t.async = !0;
      t.src = v;
      s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t, s)
   }(window, document, 'script', '//connect.facebook.net/en_US/fbevents.js');
   fbq('init', '1041485915908980');/* eslint-enable */
</script>
<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=1041485915908980&ev=PageView&noscript=1" />
</noscript>
<!--End Facebook  Pixel  Code -->
<!-- Google Analytics -->
<script>
   /* eslint-disable */(function(i, s, o, g, r, a, m) {
      i['GoogleAnalyticsObject'] = r;
      i[r] = i[r] || function() {
         (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
      a = s.createElement(o), m = s.getElementsByTagName(o)[0];
      a.async = 1;
      a.src = g;
      m.parentNode.insertBefore(a, m)
   })(window, document, 'script', '//www.google-analytics.com/analytics.js',
         'ga');
   ga('create', 'UA-42635603-1', 'auto');
   ga('require', 'ec');/* eslint-enable */
</script>
<!-- // -->
<!-- End Google Analytics -->
<!-- Google Tag Manager -->
<script>
   var dataLayer = [];
</script>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>

<script>
   function geo() {        
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition (function(pos) {
                $('#latitude').html(pos.coords.latitude);     // 위도
                $('#longitude').html(pos.coords.longitude); // 경도
            });
            alert("aaa");
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
    }
</script>

<script>
   /* eslint-disable */(function(w, d, s, l, i) {
      w[l] = w[l] || [];
      w[l].push({
         'gtm.start' : new Date().getTime(),
         event : 'gtm.js'
      });
      var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
            + l
            : '';
      j.async = true;
      j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
      f.parentNode.insertBefore(j, f);
   })(window, document, 'script', 'dataLayer', 'GTM-NSQ8BP');/* eslint-enable */
</script>
<!-- End Google Tag Manager -->
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/41/4/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/41/4/intl/ko_ALL/util.js"></script>
</head>
<body class="asp_check" style="margin-top: 0px;">


	<div yogiyo-header="">
		<div id="header" class="header">

			<div role="navigation" class="nav-bar">
				<div class="navigation ver-pc" ng-class="header_show()"
					style="background-color: orange;">
					<!--  색상수정예정예정 -->
					<div class="app-down-banner clearfix ng-hide"
						ng-show="is_show_promotion_banner()">
						<div class="landing-banner">
							<div class="landing-header">
								<input type="checkbox" id="landing_close" name="landing_close"
									ng-model="is_check_noshow"
									class="ng-pristine ng-untouched ng-valid"> <label
									for="landing_close"><span></span><img
									src="image/img_day_close.png" alt=""></label> <a href=""
									ng-click="hide_app_download_block()"
									class="ygy-app-down-btn-close"><img
									src="image/img_close.png" alt=""></a>
							</div>
							<img src="image/splash_banner_firstorder_5000.png" alt="">
							<a href="" ng-click="download_app()" class="btn-ygy-app-down"><img
								src="image/btn-appdown.png" alt="앱 다운로드"></a>
						</div>
					</div>
					<!-- ----------------------------------------------------------------------------------------- -->

					<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
					</nav>

					<nav id="menu">
					<h2>Menu</h2>
					<br />
					<input type="hidden" id="sessionId"
						value="${sessionScope.customInfo.id }" />
					<ul>
						<c:choose>
							<c:when test="${empty sessionScope.customInfo.id }">
								<li><a
									href="${pageContext.request.contextPath}/login.action">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li><font color="#F2849E">${sessionScope.customInfo.name }</font>
									님 환영합니다.
									<p style="text-align: left">
										전화번호 : ${sessionScope.customInfo.tel }</br> 포인트 :
										${sessionScope.customInfo.point }
									</p> <a href="javascript:logout();" data-nethru_clcode="A000012">로그아웃</a></li>
							</c:otherwise>
						</c:choose>

						<li><a href="<%=cp%>/updateInfo.action">내정보수정</a></li>
						<li><a href="generic.html">장바구니</a></li>
						<li><a href="<%=cp%>/myOrder.action">주문내역</a></li>
						<li><a href="<%=cp%>/heartStore.action">찜 목록</a></li>
						<li><a href="<%=cp%>/myReview.action">마이 리뷰</a></li>
					</ul>
					</nav>
					<!-- ----------------------------------------------------------------------------------------- -->
					<div class="nav-top clearfix"
						ng-hide="$location.path() == '/login/' &amp;&amp; is_mobile_device">
						<a href="<%=cp%>/main.action" style="text-decoration: none;">
							<img alt="" src="/eatswill/resources/img/icon3.png" width="125px"
							height="40px" style="margin: 20px 10px;">
						</a>
						<%--       <h1 class="logor pull-left" ng-click="<%=cp%>/main.action" ></h1>  --%>
						<!-- 로고로고 -->
						<div id="cart" class="pull-right">
							<span class="gps-status ng-binding"
								ng-show="check_show_location_button()"
								ng-click="toggle_location_block()" ng-bind="current_location">서초동</span>
							<a class="visible-xs" ng-show="check_show_location_button()"
								ng-click="toggle_location_block()"> <span
								class="ico-set-pic"></span>
							</a> <a id="button-cart" href="" class="visible-xs ng-hide"
								ng-click="click_cart_button()"
								ng-show="check_show_cart_button()"> <span class="ico-cart"></span>
								<span class="badge ng-binding"
								ng-bind="global_cart.get_amount()">0</span>
							</a>
							<%-- <button type="button" class="btn btn-login ng-binding" 
								ng-click="login()"
								ng-bind-html="check_login() ? '로그아웃' : '로그인 <span>|</span> 회원가입'"
								ng-show="is_yogiyo &amp;&amp; !session_storage.oauth_next"> --%>

							<c:choose>
								<c:when test="${empty sessionScope.customInfo.id }">
									<button type="button" class="btn btn-login ng-binding"
										style="width: 95px"
										onclick="javascript:location.href='<%=cp %>/login.action';">로그인</button>
									<button type="button" class="btn btn-login ng-binding"
										style="width: 95px"
										onclick="javascript:location.href='<%=cp %>/signup.action';">회원가입</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-login ng-binding"
										style="width: 150px"
										onclick="javascript:location.href='<%=cp %>/logout.action';">로그아웃</button>
								</c:otherwise>
							</c:choose>

							<!-- <button type="button"
						class="btn btn-warning hidden-xs ng-binding"
						ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
						ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;" style="font-size: 1.2em;background-color: red;">주문표(0)</button> -->
							<button type="button"
								class="btn btn-warning hidden-xs ng-binding" id="cartList"
								style="width: 150px; font-size: 1.2em; background-color: red"
								onclick="javascript:location.href='<%=cp %>/logout.action';">주문표(0)</button>

						</div>
					</div>
				</div>

				<div id="search" class="clearfix search search-show"
					style="background: url('/eatswill/resources/images/th.gif'); color: white;">

					<div class="input-group">
						<span class="input-group-btn loc"> <!-- 현재위치 찾기 -->
							<button class="btn btn-default ico-loc" type="button"
								onclick="geo();">&nbsp;</button>


						</span>
						<form action="." onsubmit="return false"
							class="ng-pristine ng-valid-minlength ng-valid ng-valid-required">
							<input type="search"
								class="form-control ng-pristine ng-scope ng-valid-minlength ng-valid ng-valid-required ng-touched"
								name="address_input" autocomplete="off" autocorrect="off"
								autocapitalize="off" spellcheck="false"
								placeholder="건물명, 도로명, 지번으로 검색하세요." ng-minlength="1"
								ng-required="true"
								ng-model="session_storage.location.address_input" bs-dropdown=""
								ng-focus="show_location_search()" required="required">
						</form>
						<span id="button_search_address"
							class="input-group-btn always-show-search-buttons">
							<button
								class="btn-search-location-cancel btn-search-location btn btn-default ng-hide"
								type="button" ng-click="clear_search_location_input($event)"
								ng-show="is_shown_location_search.v">
								<span class="searchfield-cancel-button">&nbsp;</span>
							</button>
							<button class="btn btn-default ico-pick" type="button"
								ng-click="select_location($event)"
								style="background-color: red;">검색</button>
						</span>
					</div>
				</div>
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
	<div id="content" class="container-fluid ng-scope" ng-view="">
		<div class="restaurant-category-menu ng-scope ng-hide"
			ng-show="!is_mobile_width &amp;&amp; !is_mobile_width_for_category">
			<div yogiyo-restaurant-category="">
				<div class="sms" ng-show="check_show_category_block()"></div>

			</div>
		</div>

		<div class="restaurant-detail row ng-scope">

			<div class="col-sm-8" style="width: 1000px">
				<div id="banner_11st" class="banner_11st"></div>

				<ul class="nav nav-tabs restaurant-tab">
					<li
						ng-class="active_tab == &quot;review&quot; ? &quot;active&quot; : &quot;&quot;"
						class="active"><a ng-click="toggle_tab(&quot;review&quot;)"
						data-toggle="tab">나의 주문목록<span class="ng-binding"></span></a></li>
				</ul>

				<div ng-show="active_tab == &quot;review&quot;" class="">

					<ul id="review" class="list-group review-list">

						<!-- ngRepeat: review in restaurant.reviews -->

						<li class="list-group-item star-point ng-scope"
							ng-repeat="review in restaurant.reviews"
							on-finish-render="scrollCartArea()">
							<div class="b_ta_info">
								<table width="100%" border="1" class="b_table_grey">
									<thead>
										<tr style="text-align-last: center;">
											<th width="350" colspan="2" style="text-align: center;">상품정보</th>
											<th width="140">상태</th>
											<th width="108">확인/신청</th>
										</tr>
									</thead>

									<c:forEach var="dto" items="${lists}">

										<tbody id="orderList">
											<tr>
												<td colspan="4" style="padding: 0;"><hr></td>
											</tr>
											<tr cno="3273614152" ctype="G" column="4" class="first">

												<td class="first_cell" rowspan="1">
													<div class="td_detail">

														<img src="/eatswill/resources/images/${dto.shopImg}"
															width="90" height="90">
													</div>
												</td>
												<td style="width: 100; padding: 0; vertical-align: middle">
													<div class="td_info">
														<p>
															${dto.orderDate } <small>[${dto.orderCode}]</small>
														</p>
														<br>
														<ul style="text-align-last: left">
															<li class="seller_info"><em></em>
															<a href="${storeUrl}?shopCode=${dto.shopCode}&ceoId=${dto.ceoId}">${dto.shopName }</a></li>
															<li class="tit_info" style="color: orange">${dto.menuName }</li>
															<c:if test="${dto.request != null }">
																<li class="seller_info">요청사항 : ${dto.request }</li>
															</c:if>
															<li class="price"><strong>${dto.oAmount }</strong>원</li>
														</ul>
													</div>
												</td>
												<td class="first_cell">
													<div class="td_status">

														<c:choose>
															<c:when test="${dto.orderStatus == '주문취소' }">
																<span><b style="color: red">${dto.orderStatus }</b></span>
															</c:when>
															<c:otherwise>
																<span><b style="color: blue">${dto.orderStatus }</b></span>
															</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td><c:choose>
														<c:when test="${dto.orderStatus == '주문완료' }">
															<span class="btn_bg btn_w81_2"><a
																href="javascript:location.href='<%=cp%>/myOrderCancel.action?orderCode=${dto.orderCode}'">주문
																	취소</a></span>
														</c:when>
														<c:when test="${dto.orderStatus == '배달완료' }">
															<span class="btn_bg btn_w81_2"> <c:if
																	test="${dto.cnt == 0 }">
																	<a href="${reviewUrl }orderCode=${dto.orderCode}">리뷰
																		쓰기</a>
																</c:if> <c:if test="${dto.cnt != 0 }">
																	<a
																		href="javascript:location.href='<%=cp%>/myReview.action'">리뷰
																		보기</a>
																</c:if>
															</span>
														</c:when>
														<c:otherwise></c:otherwise>
													</c:choose></td>
											</tr>

										</tbody>
									</c:forEach>
								</table>
							</div>
						</li>

						<!-- end ngRepeat: review in restaurant.reviews -->


						<!-- 더보기 기능 -->
						<!-- <li class="list-group-item btn-more" ng-show="check_more_review()">
							<a ng-click="get_next_reviews()"><span>더 보기<i
									class="arr-down"></i></span></a>
						</li> -->
					</ul>
				</div>
				<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
				<script src="/eatswill/resources/assets/js/skel.min.js"></script>
				<script src="/eatswill/resources/assets/js/util.js"></script>
				<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
				<script src="/eatswill/resources/assets/js/main.js"></script>
				<input type="hidden" value="${sessionScope.custominfo.id }"
					name="sessionId">
					<!-- 카카오톡 채팅 시작 -->
		<div style="position: fixed; right: 10px; bottom: 10px;" class="talk_image">
			<a id="channel-chat-button" href=""
				onclick="void chatChannel();"> <img
				src="/eatswill/resources/img/consult_small_yellow_pc1.png"
				width="70" height="70"/>
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
</body>
</html>
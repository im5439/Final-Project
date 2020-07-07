<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
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
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" defer="" async=""
	src="https://collector-658.tvsquared.com/piwik/tv2track.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NSQ8BP"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script async="" src="//connect.facebook.net/en_US/fbevents.js"></script>
<script>
	var is_yogiyo = window.location.hostname.indexOf('yogiyo.co.kr') >= 0;
	var is_11st = window.location.hostname.indexOf('yogiyo.m.11st.co.kr') >= 0;
	if (is_11st) {
		document
				.write('<link rel="apple-touch-icon-precomposed" href="//m.11st.co.kr/MW/img/mw11st_touchicon.png">');
		document
				.write('<link rel="shortcut icon" type="image/png" href="//m.11st.co.kr/MW/img/mw11st_touchicon.png" />');
		document.write('<title>요기요배달상품 - 11번가모바일</title>');
		document
				.write('<s'
						+ 'cript src="'
						+ '//m.11st.co.kr/MW/js/lifecategory/delivery/inc_header_extra.js?random='
						+ Math.random()
						+ '" charset="euc-kr" type="text/javascript">'
						+ '</s' + 'cript>');
	} else {
		document.write('<meta name="theme-color" content="#DC1400">');
		document
				.write('<meta property="og:title" content="요기요 - 즐거움은 요기부터. 배달음식 주문은 역시 요기요!">');
		document
				.write('<meta property="og:url" content="http://www.yogiyo.co.kr/">');
		document
				.write('<meta property="og:image" content="https://www.yogiyo.co.kr/mobile/image/app_img_560x292.png">');
		document
				.write('<meta property="og:description" content="요기요에서 원하는 배달음식을 쉽고 편리하게! 먹어본 사람만 쓸 수 있는 클린리뷰로 배달맛집 인증, 다양한 할인 혜택과 함께 배달되지 않던 인기맛집까지, 지금 바로 요기요에서 주문하세요.">');
		document
				.write('<title ng-if="! page.title">요기요 - 즐거움은 요기부터. 배달음식 주문은 역시 요기요!</title>');
		document
				.write('<title ng-if="page.title" ng-bind=\'page.title + " - 요기요"\'></title>');
		document
				.write('<link rel="apple-touch-icon-precomposed" href="https://www.yogiyo.co.kr/mobile/image/app_128x128.png">');
		document
				.write('<link rel="apple-touch-icon-precomposed" sizes="144x144" href="https://www.yogiyo.co.kr/mobile/image/app_144x144.png">');
		document
				.write('<link rel="icon" type="image/png" href="https://www.yogiyo.co.kr/mobile/image/favicon.ico" />');
	}
</script>
<meta name="theme-color" content="#DC1400">
<meta property="og:title" content="요기요 - 즐거움은 요기부터. 배달음식 주문은 역시 요기요!">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:image"
	content="https://www.yogiyo.co.kr/mobile/image/app_img_560x292.png">
<meta property="og:description"
	content="요기요에서 원하는 배달음식을 쉽고 편리하게! 먹어본 사람만 쓸 수 있는 클린리뷰로 배달맛집 인증, 다양한 할인 혜택과 함께 배달되지 않던 인기맛집까지, 지금 바로 요기요에서 주문하세요.">
<!-- ngIf: ! page.title -->
<title ng-if="! page.title" class="ng-scope">요기요 - 즐거움은 요기부터.
	배달음식 주문은 역시 요기요!</title>
<!-- end ngIf: ! page.title -->
<!-- ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
	href="https://www.yogiyo.co.kr/mobile/image/app_128x128.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="https://www.yogiyo.co.kr/mobile/image/app_144x144.png">
<link rel="icon" type="image/png"
	href="https://www.yogiyo.co.kr/mobile/image/favicon.ico">
<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
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
<script src="https://cdn.optimizely.com/js/9026702317.js"></script>
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
<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTM-NSQ8BP"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
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
	<div class="newSb" style="display: none">
		<div class="newSb__close">
			<button type="button" id="newSb_btn_close">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 15 15"
					width="10" height="10">
					<path style="stroke:rgb(105,105,105);stroke-width:2"
						d="M7.5 7.03L0.47 0L0 0.48L7 7.5L0 14.53L0.47 15L7.5 7.98L14.5 15L15 14.53L7.98 7.5L15 0.48L14.5 0L7.5 7.03Z"></path></svg>
			</button>
		</div>
		<img class="newSb__logo" src="image/ico-5000-coupon.png"
			alt="banner image">
		<div class="newSb__meta">
			<header class="newSb__header">
				요기요 첫 주문이라면<br>앱에서 누구나 5천원 즉시할인
			</header>
		</div>
		<div class="newSb__applink">
			<a class="newSb__applink__btn">열기</a>
		</div>
	</div>
	<script type="text/javascript">
		if (is_11st) {
			HeaderExtra.init();
		}
	</script>
	<div yogiyo-header="">
		<div id="header" class="header">

			<div role="navigation" class="nav-bar">
				<div class="navigation ver-pc" ng-class="header_show()">
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

					<div class="nav-top clearfix"
						ng-hide="$location.path() == '/login/' &amp;&amp; is_mobile_device">
						<h1 class="logo pull-left" ng-click="click_home()">요기요</h1>
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
							<button type="button" class="btn btn-login ng-binding"
								ng-click="login()"
								ng-bind-html="check_login() ? '로그아웃' : '로그인 <span>|</span> 회원가입'"
								ng-show="is_yogiyo &amp;&amp; !session_storage.oauth_next">
								로그인 <span>|</span> 회원가입
							</button>
							<button type="button"
								class="btn btn-warning hidden-xs ng-binding"
								ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
								ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;">주문표(0)</button>
						</div>
					</div>
				</div>

				<div id="search" class="clearfix search search-show">
					<div class="input-group">
						<span class="input-group-btn loc">
							<button class="btn btn-default ico-loc" type="button"
								ng-click="get_current_location()">&nbsp;</button>
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
								ng-click="select_location($event)">검색</button>
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
		<!--div class="content">
  <div class="banner-wrap">
    <div id="carousel-banner" class="carousel slide clearfix">
      <ol class="carousel-indicators">
        <li data-target=".carousel" data-slide-to="0" class="active"></li>
        <li data-target=".carousel" data-slide-to="1" class=""></li>
        <li data-target=".carousel" data-slide-to="2" class=""></li>
      </ol>
    </div>
    <div class="carousel-inner">
      <div class="item {{$index == 0 ? 'active' : ''}}" ng-repeat='banner in banners track by $index'>
        <img src="{{banner}}" alt="">
      </div>
      <a class="left carousel-control" data-slide="prev">
        <span class="icon-prev"></span>
      </a>
      <a class="right carousel-control" data-slide="next">
        <span class="icon-next"></span>
      </a>
    </div>
  </div>
</div-->
	</div>
	<div class="category-list" ng-hide="$location.path() != &quot;/&quot;">
		<div class="row">
			<!-- ngRepeat: banner in banner_list -->
			<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
				<a href="" class="thumbnail" ng-click="select_home_category('all')"><div
						class="category-title">전체보기</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-01.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('1인분주문')"><div
						class="category-title">1인분 주문</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-onedish.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('프랜차이즈')"><div
						class="category-title">프랜차이즈</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-10.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('치킨')"><div
						class="category-title">치킨</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-02.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('피자양식')"><div
						class="category-title">피자/양식</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-03.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('중식')"><div
						class="category-title">중국집</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-04.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('한식')"><div
						class="category-title">한식</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-05.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('일식돈까스')"><div
						class="category-title">일식/돈까스</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-06.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('족발보쌈')"><div
						class="category-title">족발/보쌈</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-07.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('야식')"><div
						class="category-title">야식</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-08.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('분식')"><div
						class="category-title">분식</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-09.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('카페디저트')"><div
						class="category-title">카페/디저트</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-11.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('편의점')"><div
						class="category-title">편의점/마트</div>
					<img src="https://www.yogiyo.co.kr/mobile/image/category-convenience-store.png"></a>
			</div>
		</div>
	</div>
	<div class="footer"
		ng-show="is_yogiyo &amp;&amp; !session_storage.oauth_next">
		<div class="footer-menu">
			<ul>
				<li class="mb" ng-show="!is_mobile_device"><a href="#/policy/">이용약관</a></li>
				<li class="mb privacy-txt" ng-show="!is_mobile_device"><a
					href="#/privacy/">개인정보처리방침</a></li>
				<li class="mb cscenter" ng-show="!is_mobile_device"><a
					href="#/point_policy/">회원등급정책</a></li>
				<li class="mb ng-hide" ng-show="is_mobile_device"><a
					ng-bind="check_login() ? '로그아웃' : '로그인'" ng-click="login()"
					class="ng-binding">로그인</a></li>
				<li class="mb cscenter ng-hide" ng-show="is_mobile_device"><a
					href="#/contact/">고객만족센터</a></li>
				<li class="mb"><a href="https://www.deliveryhero.co.kr/"
					rel="noopener noreferrer" target="_blank">회사소개</a></li>
				<li><a href="https://www.yogiyo.co.kr/owner/login/"
					target="_blank">요기요사장님</a></li>
				<li class="mb lst"><a
					href="https://owner.yogiyo.co.kr/owner/join/request/">입점문의</a></li>
				<li class="mb down_app ng-hide" ng-show="is_mobile_device"><a
					href="" ng-click="download_app('footer')" class="app">APP설치</a></li>
				<li class="mb notice"><a href="#/notice/">공지사항</a></li>
				<li class="sns-link"><a
					href="https://www.facebook.com/Yogiyokorea/" class="facebook"
					rel="noopener noreferrer" target="_blank"><span></span>페이스북</a><a
					href="http://blog.yogiyo.co.kr/" class="blog"
					rel="noopener noreferrer" target="_blank"><span></span>블로그</a></li>
			</ul>
		</div>
		<div class="company-wrap">
			<div class="company-logo">
				<a href="" ng-click="click_home()">요기요</a>
			</div>
			<div class="company-info">
				<p>
					<strong>(유)딜리버리히어로 코리아</strong><br>서울시 서초구 서초대로38길 12 마제스타시티
					타워2 17층<span class="bar">|</span>대표자 : 강신봉<span class="bar">|</span>사업자등록번호:211-88-68802
					<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2118868802"
						rel="noopener noreferrer" target="_blank" class="biz-info"
						ng-show="!is_mobile_device">사업자정보확인</a>통신판매업신고:제 2018-서울서초-2635호<span
						class="bar">|</span>개인정보담당자 : <a
						href="mailto:privacy@yogiyo.co.kr">privacy@yogiyo.co.kr</a><span
						class="bar">|</span>제휴문의 : <a
						href="mailto:partnership@deliveryhero.co.kr">partnership@deliveryhero.co.kr</a><span
						class="bar">|</span>고객만족센터 : <span ng-show="is_mobile_width"
						class="pnum ng-hide">1661-5270 (24시간, 연중무휴)</span> <a
						href="mailto:support@yogiyo.co.kr">support@yogiyo.co.kr</a><span
						class="bar">|</span>호스트서비스사업자 : (주)심플렉스인터넷
				</p>
				<div class="footer-terms ng-hide" ng-show="is_mobile_device">
					<a href="#/policy/">이용약관</a><span class="bar">|</span><a
						href="#/privacy/"><strong>개인정보처리방침</strong></a><span class="bar">|</span><a
						href="#/point_policy/">회원등급정책</a><span class="bar">|</span><a
						href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2118868802"
						rel="noopener noreferrer" target="_blank">사업자정보확인</a>
				</div>
			</div>
		</div>
		<div class="service-info">
			<div class="bpg">
				<a href="#/trust/"><span class="img"></span><span class="text">요기요<br>안심센터
				</span></a>
			</div>
			<div class="cleanreview">
				<a href="#/cleanreview/"><span class="img"></span><span
					class="text">요기요 100%<br>클린리뷰
				</span></a>
			</div>
			<div class="csc">
				<em>고객만족센터</em> <strong>1661-5270</strong> <span>24시간, 연중무휴</span>
			</div>
		</div>
		<div class="guide">
			<p>(유)딜리버리히어로 코리아는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품/ 거래정보 및 거래와
				관련하여 요기요에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 (유)딜리버리히어로 코리아는 책임을
				지지 않습니다. 상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다.
				Copyright YOGIYO. All Rights Reserved.</p>
		</div>
	</div>
	<script type="text/javascript">
		if (is_11st) {
			document
					.write('<s'
							+ 'cript src="'
							+ '//m.11st.co.kr/MW/js/lifecategory/delivery/inc_footer_extra.js?random='
							+ Math.random()
							+ '" charset="euc-kr" type="text/javascript">'
							+ '</s' + 'cript>');
		}
	</script>
	<script type="text/javascript"
		src="js/jquery-2.1.3.min.js?v=254ddffd1cab420620ca23002fe458eea88e05db"></script>
	<script src="//nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"
		src="https://pg.cnspay.co.kr/dlp/scripts/postmessage.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="https://pg.cnspay.co.kr/dlp/scripts/cnspay.js" charset="utf-8"></script>
	<script type="text/javascript">
		if (is_yogiyo) {
			if (window.naver) {
				var naver_login = new naver.LoginWithNaverId({
					clientId : '96m5xiTC0SajLMvqJOUH',
					callbackUrl : location.protocol + '//' + location.hostname
							+ '/mobile/',
					isPopup : false
				});
				naver_login.init();
				window.naver_login = naver_login;
			}
			if (window.Kakao) {
				Kakao.init('92dcdbf99967e46645137d9983a77fc9');
			}
		}
	</script>
	<script src="js/require.js?v=254ddffd1cab420620ca23002fe458eea88e05db"></script>
	<script src="js/app.js?v=254ddffd1cab420620ca23002fe458eea88e05db"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5QSVWW0EUN3p9RoHwOJdsSovksfPkqg0"
		type="text/javascript"></script>
	<script language="javascript">
		/**/
		window.isMobile = function() {
			var check = false;/* eslint-disable */
			(function(a) {
				if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i
						.test(a)
						|| /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i
								.test(a.substr(0, 4)))
					check = true;
			})(navigator.userAgent || navigator.vendor || window.opera);
			return check;/* eslint-enable */
		};
	</script>
	<!-- Naver Analytics -->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js">
		
	</script>
	<script type="text/javascript">
		if (!wcs_add)
			var wcs_add = {};
		wcs_add['wa'] = 's_51119d387dfa';
	</script>
	<!-- End Naver Analytics -->
	<!-- // -->
	<!-- // -->
	<!-- // -->
	<!-- // -->
	<script type="text/javascript">
		var is_smart_banner_closed = false;
		var smart_banner_margin_top = 76;
		var menu_detail_top = 60;
		function showSmartBanner() {
			if (is_smart_banner_closed) {
				return;
			}
			$('body').css('margin-top', smart_banner_margin_top + 'px');
			$('.newSb').show().css('margin-top', 0);
		}
		function hideSmartBanner() {
			if (is_smart_banner_closed) {
				return;
			}
			$('body').css('margin-top', '0px');
			$('.newSb').hide();
		}
		function smartbanner_click(adjustToken) {
			window.location.href = adjustToken ? smartbanner_tracking_link
					.replace('ft8dqw_m86r2k', adjustToken)
					: smartbanner_tracking_link;
		}
		if (is_yogiyo && isMobile()) {
			var urlParam = window.location.search.replace(/^\?/, '');
			if (window.location.search.indexOf('referrer=') >= 0) {
				urlParam = decodeURIComponent(urlParam.replace('referrer=', ''));
			}
			$.extend({
				getUrlVars : function() {
					var vars = [], hash;
					var hashes = window.location.href.slice(
							window.location.href.indexOf('?') + 1).split('&');
					for (var i = 0; i < hashes.length; i++) {
						hash = hashes[i].split('=');
						vars.push(hash[0]);
						vars[hash[0]] = hash[1];
					}
					return vars;
				},
				getUrlVar : function(name) {
					return $.getUrlVars()[name];
				}
			});
			var campaign_id = $.getUrlVar('utm_campaign') || '';
			var adgroup_id = $.getUrlVar('utm_source') || '';
			var creative_id = $.getUrlVar('utm_term') || '';
			var label_id = $.getUrlVar('utm_id') || '';
			var gclid = $.getUrlVar('gclid') || '';
			var pathname = window.location.pathname;
			var deeplink_id = encodeURIComponent('yogiyoapp://open?' + urlParam
					+ '&referrer=' + encodeURIComponent(urlParam));
			var smartbanner_tracking_link = 'https://app.adjust.com/ft8dqw_m86r2k?campaign='
					+ campaign_id
					+ '&adgroup='
					+ adgroup_id
					+ '&creative='
					+ creative_id
					+ '&label='
					+ label_id
					+ '&gclid='
					+ gclid
					+ '&deep_link=' + deeplink_id;
			$('#newSb_btn_close').on('click', function() {
				is_smart_banner_closed = true;
				$('.ygy-app-down-btn-close').css('top', 0);
				$('body').css('margin-top', 0);
				$('.detail-wrap').css('top', 0);
				$('.newSb').remove();
				window.resize_location_map();
				if ($('.detail-header').length > 0) {
					$('.detail-header').css('top', 0);
					$('.detail-content').css('top', menu_detail_top + 'px');
				}
			});
			$('.newSb__applink__btn').on('click', function() {
				parent.download_app_for_ga();
				smartbanner_click();
			});
			$(window).on('load', function() {
				var getCookie = function(cname) {
					var name = cname + '=';
					var decodedCookie = decodeURIComponent(document.cookie);
					var ca = decodedCookie.split(';');
					for (var i = 0; i < ca.length; i++) {
						var c = ca[i];
						while (c.charAt(0) == ' ') {
							c = c.substring(1);
						}
						if (c.indexOf(name) == 0) {
							return c.substring(name.length, c.length);
						}
					}
					return '';
				};
				if (getCookie('hide_app_down') == 'true') {
					showSmartBanner();
				}
			});
		}
	</script>
	<!-- End Smart App BAnner (Adjust) -->
	<form method="POST" class="ng-pristine ng-valid"></form>
	<script type="text/javascript" id="">
		var _tvq = window._tvq = window._tvq || [];
		(function() {
			var c = "https:" == document.location.protocol ? "https://collector-658.tvsquared.com/piwik/"
					: "http://collector-656.tvsquared.com/piwik/";
			_tvq.push([ "setSiteId", "TV-364536-1" ]);
			_tvq.push([ "setTrackerUrl", c + "piwik.php" ]);
			_tvq.push([ function() {
				this.deleteCustomVariable(5, "page")
			} ]);
			_tvq.push([ "trackPageView" ]);
			var a = document, b = a.createElement("script");
			a = a.getElementsByTagName("script")[0];
			b.type = "text/javascript";
			b.defer = !0;
			b.async = !0;
			b.src = c + "tv2track.js";
			a.parentNode.insertBefore(b, a)
		})();
	</script>
	<script type="text/javascript" id="">
		window.addEventListener
				&& window
						.addEventListener(
								"load",
								function() {
									var a = window.performance;
									if (a && a.timing) {
										var c = a.timing.loadEventStart
												- a.timing.navigationStart;
										if (!(0 > c)) {
											var d = location.hostname + " "
													+ location.pathname + " "
													+ c;
											if (a.getEntries) {
												a = a.getEntries();
												for (var b = 0; b < a.length; b++)
													a[b].startTime <= c
															&& 0 < a[b].duration
															&& (d += " "
																	+ a[b].name
																			.split("?")[0]
																			.split(";")[0]
																	+ " "
																	+ Math
																			.round(a[b].duration))
											}
											x = new XMLHttpRequest;
											x
													.open(
															"POST",
															"https://pagespeed.deliveryhero.net/log",
															!0);
											x.send(d)
										}
									}
								}, !1);
	</script>
</body>
</html>
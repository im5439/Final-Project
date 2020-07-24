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




	<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
	<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
	
	<link rel="stylesheet" href="<%=cp%>/resources/data/css/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-ui.js"></script>
   <script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
   <script type="text/javascript" src="/eatswill/resources/assets/js/cart.js"></script>


	
	
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

<!-- ------------------------------------------------------------------------------------------****** -->
<script type="text/javascript">

   $(function(){
      $("#container").tabs();
   });
   
   
   $(function(){
      menuPage();
   }); 
   

   $(document).ready(function(){
      
      $("#sendReview").click(function(){ 
         
         $(function(){
            reviewPage();
         });  
         
         
      });
      

      $("#sendMenu").click(function(){ 
            
         $(function(){
            menuPage();
         }); 
             
            
      });
         
      
      $("#sendInfo").click(function(){ 
         
         $(function(){
            infoPage();
         }); 
          
      });
      
      
   });
   
   
   function menuPage(){
      
      var url = "<%=cp%>/menu.action?shopCode=" + "${shopCode}" + "&userId=" + "${userId}" + "&ceoId=" + "${ceoId}";
      
      $.post(url,function(args){
         $("#menuData").html(args);
      });
      
         $("#menuData").show();
         $("#reviewData").hide();
         $("#infoData").hide();
         
      
   }
   
   function reviewPage(){
      
      var url = "<%=cp%>/review.action?shopCode=" +"${shopCode}" + "&userId=" + "${userId}";
      
      $.post(url,function(args){
         $("#reviewData").html(args);
      });
      
         $("#reviewData").show();
         $("#menuData").hide();
         $("#infoData").hide();
      
   }
   
   function infoPage(){
      
      var url = "<%=cp%>/info.action?shopCode=" +"${shopCode}" + "&ceoId=" + "${ceoId}";
      
      $.post(url,function(args){
         $("#infoData").html(args);
      });
      
      $("#infoData").show();
      $("#reviewData").hide();
      $("#menuData").hide();
      
   }
   
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
<body class="asp_check" style="margin-top: 0px;" onload="storeinit();">
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
            <div class="navigation ver-pc" ng-class="header_show()" style="background-color:orange;   "> <!--  색상수정예정예정 -->
               <div class="app-down-banner clearfix ng-hide"
                  ng-show="is_show_promotion_banner()">
                  <div class="landing-banner">
                     <div class="landing-header">
                        
                     </div>
                     
                  
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
					<br/>
					<input type="hidden" id="sessionId" value="${sessionScope.customInfo.id }"/>
					<ul>
						<c:choose>
							<c:when test="${empty sessionScope.customInfo.id }">
								<li><a href="${pageContext.request.contextPath}/login.action">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li><font color="#F2849E">${sessionScope.customInfo.name }</font> 님 환영합니다.
	                      		<p style="text-align: left">
	                      			전화번호 : ${sessionScope.customInfo.tel }</br>
	                      			포인트 : ${sessionScope.customInfo.point }
	                      		</p>
										
								<a href="javascript:logout();" data-nethru_clcode="A000012">로그아웃</a></li>
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
                  <a href="<%=cp%>/main.action" style="text-decoration: none;"><img alt="" src="/eatswill/resources/img/icon3.png" width="125px"
                  height="40px" style=" margin: 20px 10px;" ></a>
            <%--       <h1 class="logor pull-left" ng-click="<%=cp%>/main.action" ></h1>  --%><!-- 로고로고 -->
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
       		
					<c:choose>
						<c:when test="${empty sessionScope.customInfo.id }">
							<button type="button" class="btn btn-login ng-binding" style="width: 95px"
							onclick="javascript:location.href='<%=cp %>/login.action';">로그인</button>
							<button type="button" class="btn btn-login ng-binding" style="width: 95px"
							onclick="javascript:location.href='<%=cp %>/signup.action';">회원가입</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-login ng-binding" style="width: 150px"
							onclick="javascript:location.href='<%=cp %>/logout.action';">로그아웃</button>
						</c:otherwise>
					</c:choose>

		
					<button type="button" class="btn btn-warning hidden-xs ng-binding" id="cartList" style="width: 150px;font-size: 1.2em;background-color: red"
							onclick="javascript:location.href='<%=cp %>/logout.action';">주문표(0)</button>	
   
                 
                  </div>
               </div>
            </div>

            <div id="search" class="clearfix search search-show" style="background:url('/eatswill/resources/images/th.gif'); color: white;">
               
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
                        ng-click="select_location($event)" style="background-color: red;">검색</button>
                  </span>
               </div>
            </div>
         </div>
      </div>
      
		
			
<!-- ========================================================================================검색 끛-->				
				
			</div>
		</div>

		<div id="quick-btn" class="hide-btn">
			<a ng-click="click_cart_button()" id="button-cart-btm" href=""
				class="btn-cart ng-hide" ng-show="check_show_cart_button('quick')"><span
				class="badge ng-binding" ng-bind="global_cart.get_amount()">0</span></a>
			<a ng-click="scrollTop($event)" class="btn-top">top</a>
		</div>
<!-- ------------------------------------------------------------------------------------------------- -->
	</div>
	<div id="messages" class="messages"></div>
	<div id="messages_bottom" class="messages messages-bottom"></div>
	<div ng-show="on_loading" id="spinner" style="" class="ng-hide">
		<div></div>
		<span class="message"></span>
	</div>
	
<!-- ------------------------------------------------------------------------------------------------- -->	
	<!-- ngView:  -->
	<div id="content" class="container-fluid ng-scope" ng-view="">

	 
	</div>
	
<!-- ------------------------------------------------------------------------------------------------- -->	
	<div id="content" class="container-fluid ng-scope" ng-view="">
<div class="content ng-scope">

  <div class="row restaurant-list-info">
    <div class="restaurant-category-menu">
      <div yogiyo-restaurant-category="">
<div class="sms" ng-show="check_show_category_block()">
  <button type="button" id="category-menu" class="btn btn-block visible-xs category-btn clearfix" ng-click="toggle_category_block()"><!--mobile button data-toggle="collapse" data-target="#category" -->
    <span class="pull-left"><span ng-bind="get_current_category_name()" class="category-name ng-binding">전체보기</span></span>
    <i class="pull-right arr-down"></i>
  </button>
  
  <!-- ------------------------------------------------------------------------------------------------- 리스트 상단 카테고리 -->
  
  <div id="category" class="category-menu clearfix collapse in" aria-expanded="true">
    <ul>

      <li class="hidden-xs menu-search"><a class="btn btn-default ico-search1" ng-click="toggle_category_block()">검색</a></li><!--pc button-->
     
      <!--카테고리시작 -->
      <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct01"></i><span ng-bind="ct.title" class="category-name ng-binding">전체보기</span></li>
      <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct02"></i><span ng-bind="ct.title" class="category-name ng-binding">한식</span></li>
      <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct03"></i><span ng-bind="ct.title" class="category-name ng-binding">중식</span></li>
      
      <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct04"></i><span ng-bind="ct.title" class="category-name ng-binding">치킨</span></li>
      <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct05"></i><span ng-bind="ct.title" class="category-name ng-binding">피자/양식</span></li>
      <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct06"></i><span ng-bind="ct.title" class="category-name ng-binding">분식</span></li>
	  <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct07"></i><span ng-bind="ct.title" class="category-name ng-binding">일식</span></li>
	  <li ng-repeat="ct in session_storage.categories" class="" ng-hide="! ct.enabled &amp;&amp; ct.optional" ontouchend="(function(){})()" ng-click="select_category(ct, city, zipcode, $event)"><i class="category-icon ico-ct08"></i><span ng-bind="ct.title" class="category-name ng-binding">프렌차이즈</span></li> 
	  
      <li class="main-search hide">
      <form action="." onsubmit="return false" class="ng-pristine ng-valid">
        <div class="input-group">
          <input type="search" name="category_keyword" class="form-control ng-pristine ng-untouched ng-valid" placeholder="음식점이나 메뉴를 검색해보세요." ng-model="category_keyword.v" ng-change="show_search_cancel_button()">
          <span class="input-group-btn">
            <button class="btn-search-category-cancel btn btn-default ng-hide" type="button" ng-show="is_show_cancel_button" ng-click="clear_search_keyword($event)"></button>
            <button class="btn btn-default ico-search" type="button" id="category_search_button" ng-click="search_restaurant()">&nbsp;</button>
          </span>
        </div>
      </form>
      </li>
    </ul>
  </div>
</div>

</div>
    </div>

    
<!-- ====================================================================================================================  카테고리 끝 -->    

<!-- ====================================================================================================================  리스트 시작 -->

<!-- 신고 아작스  -->

<script type="text/javascript">

 $(function(){
	
	 reportPage(); 
		
}); 
 
 

function reportPage() {
	
	var url = "<%=cp%>/review.action";
	var params = "userId=" + $("#userId").val()
	+ "&ceoId=" + $("#ceoId").val();
	
	$.post(url,params,function(args){
		$("#").html(args);
	});
	
	$("#reviewData").show();
	
}

</script>


   
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------ -->        
          
            </div>
          </div> 
           </div>
        


<div class="restaurant-detail row ng-scope">

  <div class="col-sm-8">
  <!-- ------------------------------------------------------------------------------------------****** -->

<!-- 찜 아작스  -->
<script type="text/javascript">

 $(function(){
	
	heartPage(); 
		
}); 
 
 

function heartPage() {
	
	var url = "<%=cp%>/heart.action";
	var params = "shopCode=" + $("#shopCode").val() 
	+ "&ceoId=" + $("#ceoId").val()
	+ "&userId=" + $("#userId").val()
+ "&chk=" + $("#chk").val();
		

	$.post(url,params,function(args){
		$("#heart").html(args);
	});
	
	$("#heart").show();
	
}

</script>


<!-- -----------------------------------------------------------------------------------------------  -->
       <!-- ---------------------------------------------------------------------------------------------------headline -->
 
   <span id="heart"></span>
    <input type="hidden" value="${shopCode }" id="shopCode">
           <input type="hidden" value="${ceoId }" id="ceoId">
           <input type="hidden" value="${userId }" id="userId">
           <input type="hidden" value="${chk }" id="chk">

    
     <!-- --------------------------------------------------------------------------------------------------- list -->
    
    
    <div id="banner_11st" class="banner_11st"></div>
<!-- ------------------------------------------------------------------ -->
   
    
    <div id="container">
      
    <ul class="nav nav-tabs restaurant-tab">
      <li ng-class="! active_tab || active_tab == &quot;menu&quot; ? &quot;active&quot; : &quot;&quot;" class="active">
      <a ng-click="toggle_tab(&quot;menu&quot;)" data-toggle="tab" href="#f1" id="sendMenu">메뉴 <span class="ng-binding"> </span></a></li>
      <li ng-class="active_tab == &quot;review&quot; ? &quot;active&quot; : &quot;&quot;">
      <a ng-click="toggle_tab(&quot;review&quot;)" data-toggle="tab" href="#f2" id="sendReview">클린리뷰 <span class="ng-binding"> </span></a></li>
      <li ng-class="active_tab == &quot;info&quot; ? &quot;active&quot; : &quot;&quot;">
      <a ng-click="toggle_tab(&quot;info&quot;)" data-toggle="tab" href="#f3" id="sendInfo">가게정보</a></li>
    </ul>
   <div id ="f1">
      <span id="menuData" style="display: none;"></span>
   </div>
   
   <div id ="f2">
      <span id="reviewData" style="display: none;"></span>
   </div>
   
   <div id ="f3">
      <span id="infoData" style="display: none;"></span> 
   </div>

</div>
<input type="hidden" name="shopCode" value="${dto.shopCode}">

    
<!-- -----------------------------------------------------------------메뉴바 -->
    <div id="menu" class="menu-list" ng-show="! active_tab || active_tab == &quot;menu&quot;">
      <div class="panel-group ng-untouched ng-valid ng-dirty ng-valid-parse" ng-model="multiplePanels.activePanels" data-allow-multiple="true" bs-collapse="">
       <div class="panel panel-default ng-scope" ng-repeat="category in restaurant.menu" ng-show="is_show_menu(category)">
          <div class="panel-heading">
            
          </div>
         
</div>

</div>
</div>

</div>
   
    <!-- 장바구니 delete Ajax  -->
    <script type="text/javascript">

 $(function(){
	
	deletePage(); 
		
}); 
 
function deletePage() {
	
	var url = "<%=cp%>/selectCartAll.action";
	var params = "shopCode=" + $("#shopCode").val() 
	+ "&ceoId=" + $("#ceoId").val()
	+ "&userId=" + $("#userId").val();
	 
	
	$.post(url,params,function(args){
		$("#cartHere").html(args);
	});
	
	$("#cartHere").show();
	
}

</script>

<!-- ---------------------------------------------------------------------------  -->
     
  <form action="" method="post">
  
 <span id="cartHere"></span>
 <input type="hidden" name="userId" value="${userId }">
  </form>
  
</div><!-- 절대 건들 ㄴ <div class="restaurant-detail row ng-scope"> -->

     <!--  ====================================================================하단바 시작 내용 수정 가능 -->
     <div class="footer" >
		<div class="footer-menu">
		
		</div>
		
		<!-- =========================================================================================== 하단끝 -->
		
		<div class="company-wrap">
			<div class="company-logo">
				<a href="" ng-click="click_home()">잇츠윌</a>
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
	
	<!-- ========================================================================= 하단 부분 -->
	
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
		<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
			<script src="/eatswill/resources/assets/js/skel.min.js"></script>
			<script src="/eatswill/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/eatswill/resources/assets/js/main.js"></script>

</body>
</html>
     
         

     
     
     
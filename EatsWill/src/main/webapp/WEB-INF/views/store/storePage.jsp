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
	<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/buttons.css" />
   	<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/normalize.css" />
   	<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/vicons-font.css" />
   	<link rel="stylesheet" href="/eatswill/resources/assets/css/bootstrap.min.css" />
	
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
          			.write('<title ng-if="! page.title">다함께 잇츠윌</title>');
		document
				.write('<title ng-if="page.title" ng-bind=\'page.title + " - 요기요"\'></title>');
		document
				.write('<link rel="apple-touch-icon-precomposed" href="https://www.yogiyo.co.kr/mobile/image/app_128x128.png">');
		document
				.write('<link rel="apple-touch-icon-precomposed" sizes="144x144" href="https://www.yogiyo.co.kr/mobile/image/app_144x144.png">');
	        document
    	    			.write('<link rel="icon" type="image/png" href="/eatswill/resources/images/sicon.jpg" />');
	}
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
   8

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
	   
	  var shopCode = "${shopCode}";
	  var userId = "${userId}";
	  var ceoId = "${ceoId}";
	  
	  
	  var params =  "shopCode=" + shopCode 
		+ "&userId=" + userId
		+ "&ceoId=" + ceoId;
	  
  	$.ajax({
		type:"POST",
		url:"<%=cp%>/menu.action",
		data:params,
		success:function(args){

		$("#menuData").html(args);
			
		},
		error:function(e){
			alert(e.responseText);
		}
		
	});
  	
  	 $("#menuData").show();
     $("#reviewData").hide();
     $("#infoData").hide();
      
  
   }
   
   function reviewPage(){
	  
	   var shopCode = "${shopCode}";
	   var userId = "${userId}";
	   
	   var params =  "shopCode=" + shopCode 
		+ "&userId=" + userId;
     
      $.ajax({
  		type:"POST",
  		url: "<%=cp%>/review.action",
  		data:params,
  		success:function(args){
  					
  		$("#reviewData").html(args);
  			
  		},
  		error:function(e){
  			alert(e.responseText);
  		}
  		
  	});
      
         $("#reviewData").show();
         $("#menuData").hide();
         $("#infoData").hide();
      
   }
   
   function infoPage(){
	   
	   var shopCode = "${shopCode}";
		  var ceoId = "${ceoId}";
	  
	  var params =  "shopCode=" + shopCode 
		+ "&ceoId=" + ceoId;
     
      $.ajax({
    		type:"POST",
    		url: "<%=cp%>/info.action",
    		data:params,
    		success:function(args){
    					
    		$("#infoData").html(args);
    			
    		},
    		error:function(e){
    			alert(e.responseText);
    		}
    		
    	});
      
      $("#infoData").show();
      $("#reviewData").hide();
      $("#menuData").hide();
      
   }
   
 //카테검색
	function select_category(cate){
		
	  	var f = document.formCate;
	  	
	  	if (cate!=null){
		  	f.action="<%=cp %>/storeList.action?category=" + cate;
		  	f.submit();
		  	return;
		}
		  	
		f.action="<%=cp %>/storeList.action";
		f.submit();
	  
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

         <div role="navigation" class="nav-bar" style="font-size: 12px;">
            <div class="navigation ver-pc" ng-class="header_show()"
			style="background-color: #FDF5E6;">
			<!--  색상수정예정예정 -->
			<div class="app-down-banner clearfix ng-hide"
				ng-show="is_show_promotion_banner()">
				<div class="landing-banner">
					<div class="landing-header"></div>
				</div>
			</div>
			<!-- ----------------------------------------------------------------------------------------- -->
			<c:choose>
				<c:when test="${!empty sessionScope.customInfo.id }">
					<nav style="height: auto;">
						<ul>
							<li><a href="#menu">Menu</a></li>
						</ul>
					</nav>
				
					<nav id="menu" >
						<h2 style="font-size: 30px;margin-top: 0px;font-weight: bold;">Menu</h2>
						<br/> <input type="hidden" id="sessionId" value="${sessionScope.customInfo.id }"/>
						<ul>		
							<li>
								<font color="#F2849E">${sessionScope.customInfo.name }</font>님 환영합니다.
								<p style="text-align: left">
									전화번호 : ${sessionScope.customInfo.tel }</br> 포인트 :
									${sessionScope.customInfo.point }
								</p> 
								<a href="logout.action" data-nethru_clcode="A000012">로그아웃</a>
							</li>
							<li><a href="updateInfo.action">내정보수정</a></li>
							<li><a href="myPage.action">마이 페이지</a></li>
							<li><a id="basket">장바구니</a></li>
						</ul>
						<form method="POST" action="" name="infoForm">
							<div id="myInfo"></div>
						</form>
					</nav>	
				</c:when>
			</c:choose>
			<!-- ----------------------------------------------------------------------------------------- -->
			<div class="nav-top clearfix"
				ng-hide="$location.path() == '/login/' &amp;&amp; is_mobile_device">
				<a href="main.action" style="text-decoration: none;"><img alt=""
					src="/eatswill/resources/img/icon3.png" width="125px" height="40px"
					style="margin: 20px 10px;"></a>
				<%--       <h1 class="logor pull-left" ng-click="<%=cp%>/main.action" ></h1>  --%>
				<!-- 로고로고 -->
				<div id="cart" class="pull-right">
					<span class="gps-status ng-binding"
						ng-show="check_show_location_button()"
						ng-click="toggle_location_block()" ng-bind="current_location"></span>
					<a class="visible-xs" ng-show="check_show_location_button()"
						ng-click="toggle_location_block()"> <span class="ico-set-pic"></span>
					</a> <a id="button-cart" href="" class="visible-xs ng-hide"
						ng-click="click_cart_button()" ng-show="check_show_cart_button()">
						<span class="ico-cart"></span> <span class="badge ng-binding"
						ng-bind="global_cart.get_amount()">0</span>
					</a>
					<form method="POST" action="" name="cartForm">
						<%-- <button type="button" class="btn btn-login ng-binding" 
						ng-click="login()"
						ng-bind-html="check_login() ? '로그아웃' : '로그인 <span>|</span> 회원가입'"
						ng-show="is_yogiyo &amp;&amp; !session_storage.oauth_next"> --%>
		
		
		
		
						<!-- 상단 버튼 부분 ----------------------------------------------------------------------------->
		
						<c:choose>
							<c:when test="${empty sessionScope.customInfo.id }">
								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 1.2em; font-weight: bold;"
									onclick="javascript:location.href='login.action';">로그인</button>
								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 1.2em; font-weight: bold;"
									onclick="javascript:location.href='signup.action';">회원가입</button>
							</c:when>
							<c:otherwise>
								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 1.2em; font-weight: bold;"
									onclick="javascript:location.href='logout.action';">로그아웃</button>
								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									id="cartList"
									style="width: 150px; height: 38px; font-size: 1.2em; background-color: #FDCD8C; border-color: #FDCD8C; font-weight: bold;">주문표(0)</button>
								<div id="cartInfo"></div>
							</c:otherwise>
						</c:choose>
		
						<!-- <button type="button"
						class="btn btn-warning hidden-xs ng-binding"
						ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
						ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;" style="font-size: 1.2em;background-color: red;">주문표(0)</button> -->
		
		
					</form>
		
					<!--------------------------------------------------------------------------------------------------------------------------->
				</div>
			</div>
		</div>
				
	    <%@ include file="/WEB-INF/views/layout/banner.jsp" %>
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
  <form action="" name="formCate" method="post">
  <input type="hidden" name="searchKey" value="${searchKey }"/>
  <input type="hidden" name="searchValue" value="${searchValue }"/>

  <div id="category" class="category-menu clearfix collapse in" aria-expanded="true">
    <ul>

      <li class="hidden-xs menu-search"><a class="btn btn-default ico-search1" ng-click="toggle_category_block()">검색</a></li><!--pc button-->
     
      <!--카테고리시작 -->
      
      <li  onclick="select_category();"><i class="category-icon ico-ct01"></i><span ng-bind="ct.title" class="category-name ng-binding">전체보기</span></li>
      <li  onclick="select_category('kr')"><i class="category-icon ico-ct02"></i><span ng-bind="ct.title" class="category-name ng-binding">한식</span></li>
      <li  onclick="select_category('ch')"><i class="category-icon ico-ct03"></i><span ng-bind="ct.title" class="category-name ng-binding">중식</span></li>
      
      <li onclick="select_category('ck')"><i class="category-icon ico-ct04"></i><span ng-bind="ct.title" class="category-name ng-binding">치킨</span></li>
      <li onclick="select_category('py')"><i class="category-icon ico-ct05"></i><span ng-bind="ct.title" class="category-name ng-binding">피자/양식</span></li>
      <li onclick="select_category('bs')"><i class="category-icon ico-ct06"></i><span ng-bind="ct.title" class="category-name ng-binding">분식</span></li>
	  <li onclick="select_category('jp')"><i class="category-icon ico-ct07"></i><span ng-bind="ct.title" class="category-name ng-binding">일식</span></li>
	  <li onclick="select_category('fr')"><i class="category-icon ico-ct08"></i><span ng-bind="ct.title" class="category-name ng-binding">프렌차이즈</span></li> 
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
  
  </form>
</div>

</div>
    </div>

    
<!-- ====================================================================================================================  카테고리 끝 -->    

<!-- ====================================================================================================================  리스트 시작 -->

   
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
</form>
    
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

     <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
     
		<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
			<script src="/eatswill/resources/assets/js/skel.min.js"></script>
			<script src="/eatswill/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/eatswill/resources/assets/js/main.js"></script>

</body>
</html>
     
         

     
     
     
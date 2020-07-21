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
<meta name="keywords" content="">
<meta name="description" content="">
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" defer="" async=""
	src="https://collector-658.tvsquared.com/piwik/tv2track.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NSQ8BP"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script async="" src="//connect.facebook.net/en_US/fbevents.js"></script>

<!-- Scripts -->
<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
<script src="/eatswill/resources/assets/js/skel.min.js"></script>
<script src="/eatswill/resources/assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="/eatswill/resources/assets/js/main.js"></script>


<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<link rel="stylesheet"
	href="/eatswill/resources/assets/ButtonStylesInspiration/css/buttons.css" />
<link rel="stylesheet"
	href="/eatswill/resources/assets/ButtonStylesInspiration/css/normalize.css" />
<link rel="stylesheet"
	href="/eatswill/resources/assets/ButtonStylesInspiration/css/vicons-font.css" />

<script type="text/javascript"
	src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="/eatswill/resources/assets/js/login.js"></script>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- 시연 - 슬라이드 css -->
<!-- <link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<link rel="stylesheet"
	href="/eatswill/resources/assets/css/bootstrap.min.css" />
<style>
.carousel-inner>.carousel-item>img { /* width: 640px; height: 720px; */
	
}

/* 팝업 시작 */
  .divpop {
  	position: absolute; z-index:999; top:10%; left:40%;
  	width:500px; height:700px;display:none;
  }
  .title_area {font-weight:bold;text-align:center;width:100%}
  .button_area {position:absolute;bottom:0; color: white; width: 100%; background-color: #3d3d3d; text-align: right; padding-right: 10px;} 
  
  /* 팝업 끝 */
</style>


<!-- 팝업 시작 -->
<script>
	//쿠키설정	
	function setCookie( name, value, expiredays )
	{
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
	}

	//쿠키 불러오기
	function getCookie(name) 
	{ 
	    var obj = name + "="; 
	    var x = 0; 
	    while ( x <= document.cookie.length ) 
	    { 
	        var y = (x+obj.length); 
	        if ( document.cookie.substring( x, y ) == obj ) 
	        { 
	            if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
	                endOfCookie = document.cookie.length;
	            return unescape( document.cookie.substring( y, endOfCookie ) ); 
	        } 
	        x = document.cookie.indexOf( " ", x ) + 1; 
	        if ( x == 0 ) 
	            break; 
	    } 
	    return ""; 
	}
		
	//닫기 버튼 클릭시
	function closeWin(key)
	{
	    if($("#todaycloseyn").prop("checked"))
	    {
	        setCookie('divpop'+key, 'Y' , 1 );
	    }
	    $("#divpop"+key+"").hide();
	}
  
	$(function(){	

		if(getCookie("divpop1") !="Y"){
			$("#divpop1").show();
		}

	});
</script>
<!-- 팝업 끝 -->

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

<!-- 로딩창 스크립---------------------------------------------------- -->
<script type="text/javascript">

	function switchScreen() {
	   	setTimeout("switchScreenTime()", 1300);
	}
	
	function switchScreenTime() {
	   	document.getElementById("divLoading").style.display = "none";
		document.getElementById("divBody").style.display = "";
	}


</script>
<!------------------------------------------------------------------  -->


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

<!-- 시연 - 팝업 설정 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
#pop {
	width: 300px;
	height: 400px;
	background: #3d3d3d;
	color: #fff;
	position: absolute;
	left: 40%;
	text-align: center;
	top: 20%;
	z-index: 10;
}
</style>

<script language="javascript"> 
   

$(document).ready(function() {
	
	if('${message }'!=null && '${message }'!="") {
		alert('${message }');
	}
	
  	$('#close').click(function() {
    	$('#pop').hide();
  	});
});

</script>

</head>



  <!--  로딩창 div ----------------------------------------------------------------------------- -->
  
<body onload="switchScreen();">

<div id="divLoading" style="position:absolute; top:30%; left:0;  text-align:center; margin:0 auto; width: 100%;">
    <img src="/eatswill/resources/images/hicon2.gif" alt="잠시만 기다려 주세요. 로딩중입니다."  style="height: 30em; width: 30em;"/>
</div>

<div id="divBody" style="display:none;">

  <!--  로딩창 div ----------------------------------------------------------------------------- 맨밑에 /div 있음  --> 



	<!-- 시연 - 팝업창 -->
	<form name="notice_form">
	<div id="divpop1" class="divpop">
		<div class="title_area" style="width: 500px; height: 700px;">
			<img alt="" src="/eatswill/resources/img/pop2.jpg" align="middle"> <br>
		</div>

		<div class="button_area">
	 		<div style="width: 100%;"><input type='checkbox' name='chkbox' id='todaycloseyn' value='Y'>&nbsp;오늘 하루 이 창을 열지 않음
 			&nbsp;<a href='#' onclick="javascript:closeWin(1);" style="color: salmon;"><B>[닫기]</B></a></div>	
 		</div>
	</div>
	</form>

	<!-- ---------------------------------------------------------- -->
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
			<header class="newSb__header"> </header>
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
				<div class="navigation ver-pc" ng-class="header_show()"
					style="background-color: #FBFBEF;">
					<!--  색상수정예정예정 -->
					<div class="app-down-banner clearfix ng-hide"
						ng-show="is_show_promotion_banner()">
						<div class="landing-banner">
							<div class="landing-header"></div>


						</div>
					</div>
					<!-- ----------------------------------------------------------------------------------------- -->

					<nav style="height: auto;">
						<ul>
							<li><a href="#menu">Menu</a></li>
						</ul>
					</nav>

					<nav id="menu" style="font-size: 1.2em;">
						<h2 style="font-size: 30px;">Menu</h2>
						<br /> <input type="hidden" id="sessionId"
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
										</p> <a href="<%=cp %>/logout.action" data-nethru_clcode="A000012">로그아웃</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="<%=cp%>/updateInfo.action">내정보수정</a></li>
							<li><a id="basket">장바구니</a></li>
							<li><a href="<%=cp%>/myOrder.action">주문내역</a></li>
							<li><a href="<%=cp%>/heartStore.action">찜 목록</a></li>
							<li><a href="<%=cp%>/myReview.action">마이 리뷰</a></li>
						</ul>
						<form method="POST" action="" name="myForm">
							<div id="myInfo"></div>
						</form>
					</nav>
					<!-- ----------------------------------------------------------------------------------------- -->
					<div class="nav-top clearfix"
						ng-hide="$location.path() == '/login/' &amp;&amp; is_mobile_device">
						<a href="<%=cp%>/main.action" style="text-decoration: none;"><img
							alt="" src="/eatswill/resources/img/icon3.png" width="125px"
							height="40px" style="margin: 20px 10px;"></a>
						<%--       <h1 class="logor pull-left" ng-click="<%=cp%>/main.action" ></h1>  --%>
						<!-- 로고로고 -->
						<div id="cart" class="pull-right">
							<span class="gps-status ng-binding"
								ng-show="check_show_location_button()"
								ng-click="toggle_location_block()" ng-bind="current_location"></span>
							<a class="visible-xs" ng-show="check_show_location_button()"
								ng-click="toggle_location_block()"> <span
								class="ico-set-pic"></span>
							</a> <a id="button-cart" href="" class="visible-xs ng-hide"
								ng-click="click_cart_button()"
								ng-show="check_show_cart_button()"> <span class="ico-cart"></span>
								<span class="badge ng-binding"
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
											style="width: 95px; height: 38px; background-color: #FAAC58; border-color: #FAAC58; font-size: 1.2em; font-weight: bold; font-family: 'Raleway', Arial, sans-serif;"
											onclick="javascript:location.href='<%=cp %>/login.action';">Login</button>
										<button type="button"
											class="button button--ujarak button--border-thin button--text-thick"
											style="width: 95px; height: 38px; background-color: #FAAC58; border-color: #FAAC58; font-size: 1.2em; font-weight: bold"
											onclick="javascript:location.href='<%=cp %>/signup.action';">회원가입</button>
									</c:when>
									<c:otherwise>
										<button type="button"
											class="button button--ujarak button--border-thin button--text-thick"
											style="width: 150px; height: 38px; background-color: #FAAC58; border-color: #FAAC58; font-size: 1.2em; font-weight: bold"
											onclick="javascript:location.href='<%=cp %>/logout.action';">Logout</button>
									</c:otherwise>
								</c:choose>

								<!-- <button type="button"
								class="btn btn-warning hidden-xs ng-binding"
								ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
								ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;" style="font-size: 1.2em;background-color: red;">주문표(0)</button> -->

								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									id="cartList"
									style="width: 150px; height: 38px; font-size: 1.2em; background-color: #FAAC58; border-color: #FAAC58; font-weight: bold;">주문표(0)</button>
								<div id="cartInfo"></div>
							</form>

							<!--------------------------------------------------------------------------------------------------------------------------->
						</div>
					</div>
				</div>

				<%@ include file="/WEB-INF/views/store/layout.jsp" %>
				
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

		<!-- 메뉴 카테고리 메인 ----------------------------------------------------------------------------------------------- -->
		<form method="POST" action="" name="test">
			<div class="category-list" ng-hide="$location.path() != &quot;/&quot;">
				<!-- 카테고리뒷부분 수정 가능 -->
				<div class="row">
					<section class="tiles">
						<article>
							<span class="image"> 
								<a class="thumbnail" index="1">
									<div class="category-title">전체보기</div> 
									<img src="/eatswill/resources/img/eatswill3.png">
								</a>
							</span>
						</article>
	
						<article>
							<span class="image"> 
								<a class="thumbnail" index="2">
									<div class="category-title">프랜차이즈</div> 
									<img src="https://www.yogiyo.co.kr/mobile/image/category-10.png">
								</a>
							</span>
						</article>
	
						<article>
							<span class="image"> 
								<a class="thumbnail" index="3">
									<div class="category-title">치킨</div> 
									<img src="https://www.yogiyo.co.kr/mobile/image/category-02.png">
								</a>
							</span>
						</article>
	
						<article>
							<span class="image"> 
								<a class="thumbnail" index="4">
									<div class="category-title">피자/양식</div> 
									<img src="https://www.yogiyo.co.kr/mobile/image/category-03.png">
								</a>
							</span>
						</article>
	
						<article>
							<span class="image"> 
								<a class="thumbnail" index="5">
									<div class="category-title">중국집</div> 
									<img src="https://www.yogiyo.co.kr/mobile/image/category-04.png">
								</a> 
							</span>
						</article>
	
						<article>
							<span class="image"> 
								<a class="thumbnail" index="6">
									<div class="category-title">한식</div> 
									<img src="https://www.yogiyo.co.kr/mobile/image/category-05.png">
								</a>
							</span>
						</article>
	
						<article>
							<span class="image"> 
								<a class="thumbnail" index="7">
									<div class="category-title">일식/돈까스</div> 
									<img src="https://www.yogiyo.co.kr/mobile/image/category-06.png">
								</a>
							</span>
						</article>
	
						<article>
							<span class="image"> 
							<a class="thumbnail" index="8">
								<div class="category-title">분식</div> 
								<img src="https://www.yogiyo.co.kr/mobile/image/category-09.png">
							</a>
							</span>
						</article>
	
					</section>
				</div>
			</div>
		</form>

		<!------------------------------------------------------------------------------------------------- -->
		<div class="footer" style="background-color: #FBFBEF">
			<div class="footer-menu"></div>

			<!-- =========================================================================================== 하단끝 -->

			<div class="company-wrap">
				<div class="company-logo"></div>
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
					관련하여 잇츠윌에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 (유)잇츠윌 코리아는 책임을 지지
					않습니다. 상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다. Copyright
					EATSWILL. All Rights Reserved.</p>
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
   /*
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
   */
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

	</div>

	<!-- 카카오톡 채팅 시작 -->
	<div style="position: fixed; right: 10px; bottom: 10px;"
		class="talk_image">
		<a id="channel-chat-button" href="" onclick="void chatChannel();">
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
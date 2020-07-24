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
   content="">
<meta name="description"
   content="">
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
    <script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
   <script type="text/javascript" src="/eatswill/resources/assets/js/login.js"></script>
   <script type="text/javascript" src="/eatswill/resources/assets/js/payment2.js"></script>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="/eatswill/resources/assets/js/postcode.v2.js"></script>
   <!-- 결제 추가  -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


   
   
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
            .write('<link rel="icon" type="image/png" href="https://www.yogiyo.co.kr/mobile/image/favicon.ico" />');
   }
   

   

</script>
<meta name="theme-color" content="#DC1400">
<meta property="og:title" content="lets eats will !">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:image"
   content="https://www.yogiyo.co.kr/mobile/image/app_img_560x292.png">
<meta property="og:description"
   content="">
<!-- ngIf: ! page.title -->
<title ng-if="! page.title" class="ng-scope"> 다함께 eats will </title>
<!-- end ngIf: ! page.title -->
<!-- ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
   href="https://www.yogiyo.co.kr/mobile/image/app_128x128.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
   href="https://www.yogiyo.co.kr/mobile/image/app_144x144.png">
<link rel="icon" type="image/png"
   href="https://www.yogiyo.co.kr/mobile/image/favicon.ico">

<!-- Start location.search generate Code for Naver 검색 유입 -->

<!-- End location.search generate Code -->
<!-- Start optimizely Code -->
<script src="https://cdn.optimizely.com/js/9026702317.js"></script>
<!-- End optimizely Code -->
<!--Start Facebook  Pixel  Code -->

<!-- <script>
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
</noscript> -->
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

<!-- 
<!-- 로딩창 스크립---------------------------------------------------- -->
<script type="text/javascript">
//<![CDATA[
function switchScreen() {
    document.getElementById("divLoading").style.display = "none";
    document.getElementById("divBody").style.display = "";
}
//]]>
</script>
----------------------------------------------------------------  -->


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
            
         </header>
      </div>
      <div class="newSb__applink">
         <a class="newSb__applink__btn">열기</a>
      </div>
   </div>
  
<!--   
   로딩창 div -----------------------------------------------------------------------------
  
<body onload="switchScreen();">

<div id="divLoading" style="position:absolute; top:35%; left:0;  text-align:center; margin:0 auto; width: 100%;">
    <img src="/eatswill/resources/images/hicon2.gif" alt="잠시만 기다려 주세요. 로딩중입니다."  style="height: 20em; width: 20em;"/>
</div>

<div id="divBody" style="display:none;">

   로딩창 div ----------------------------------------------------------------------------- 맨밑에 /div 있음  -->
  

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
                  <%--    <button type="button" class="btn btn-login ng-binding" 
                        ng-click="login()"
                        ng-bind-html="check_login() ? '로그아웃' : '로그인 <span>|</span> 회원가입'"
                        ng-show="is_yogiyo &amp;&amp; !session_storage.oauth_next" style="font-size: 1.2em; background-color: red;">
                     로그인 <span>|</span> 회원가입 
                     </button> --%>
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
                    <!--  <button type="button"
                        class="btn btn-warning hidden-xs ng-binding"
                        ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
                        ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;" style="font-size: 1.2em; background-color: red;">주문표(0)</button> -->
                  
                  
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
	
<!-- ------------------------------------------------------------------------------------------------- -->	

	
<!-- ------------------------------------------------------------------------------------------------- -->	
    <form name="orderForm" method="post" action="">
	<div id="content" class="container-fluid ng-scope" ng-view="">
<div class="checkout-wrap ng-scope">
    <div class="col-sm-8">
      <div class="sub-title">
        <span>결제하기</span>
      </div>
      <c:forEach var="dto" items="${lists }">
      <div class="panel-group" data-allow-multiple="true" bs-collapse="">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a bs-collapse-toggle="" class="clearfix" ng-click="delivery_collapse = !delivery_collapse" data-toggle="collapse">
                <span class="menu-name pull-left">배달정보</span>
                <i class="pull-right icon-arr-up" ng-class="delivery_icon_down_up"></i>
              </a>
            </h4>
          </div>
          <div class="panel-collapse collapse am-collapse in" bs-collapse-target="">
            <div class="panel-body">
              <div class="form-horizontal">
                <div class="form-group">
               
                  <label for="address" class="col-sm-2 control-label">주소</label>
                  <div class="col-sm-10">
                  <input type="text" name="deliveryAddr1" id="addr1" style="display: inline;height: 34px;width: 70%"
	            		value="${dto.userAddr1 }"  readonly="readonly" disabled="disabled"/>
	            <input type="button" value="주소검색" id="addrcheck" onclick="sample3_execDaumPostcode();"/>
	            <input type="hidden" name="deliveryAddr1" id="deliveryAddr1"
	            		value="${dto.userAddr1 }" />
	            <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:10px 0;position:relative"></div>
                  
                  </div>
                </div>
               <div class="form-group
                  ">
                  <div class="col-sm-offset-2 col-sm-9">
                    <%-- <input type="text" placeholder="(필수)상세주소 입력" name="deliveryAddr2" id="addr2" value="${dto.userAddr2 }" required="required"> --%>
                    <input type="text" placeholder="(필수)상세주소 입력" name="deliveryAddr2" id="addr2" value="${dto.userAddr2 }" required="false">
     
                  </div>
                </div> 
                <div class="form-group
                  ">
                  <label for="phone" class="col-sm-2 control-label">휴대전화번호</label>

                  <div class="ol-sm-offset-2 col-sm-10">
                    <div class="">
                      <input type="tel" class="form-control input-type1 ng-pristine ng-untouched ng-invalid ng-invalid-required ng-valid-pattern" placeholder="(필수)휴대전화 번호 입력" name="phone" ng-pattern="/^[0-9]+$/" ng-model="session_storage.checkout_input.phone" value="${dto.userTel }" readonly="readonly" ng-required="true" ng-valid="" ng-change="update_phone_number()" ng-class="sms_verified ? 'success' : ''" required="required">
                    </div>

                    <span class="help-block mar0 ng-hide" ng-show="form_checkout.$submitted || form_checkout.phone.$touched">
                      <span class="text-danger" ng-show="form_checkout.phone.$error.required">전화번호를 입력해주세요. (050 등 안심번호
                        사용 불가)</span>
                      <span class="text-danger ng-hide" ng-show="form_checkout.phone.$error.pattern">휴대전화번호는 숫자만 입력해주세요.</span>
                    </span>
                  </div>
                </div>

                <div class="col-sm-offset-2 col-sm-10 check-set" ng-show="session_storage.service_info.safen_number_checkbox">
                  <div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="panel panel-default" bs-collapse="">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a bs-collapse-toggle="" class="clearfix" ng-click="select_order_request()" data-toggle="collapse">
                <span class="menu-name pull-left">주문시 요청사항</span>
                <i class="pull-right icon-arr-up" ng-class="request_icon_down_up"></i>
              </a>
              
            </h4>
          </div>
          <div class="panel-collapse collapse am-collapse in" bs-collapse-target="">
            <div class="panel-body">
              <textarea class="form-control ng-pristine ng-untouched ng-valid ng-valid-maxlength" rows="3" ng-blur="check_order_request($event)" 
              name="orderRequest" id="orderRequest" ng-model="session_storage.checkout_input.comment" maxlength="100" placeholder="코로나19 예방을 위해 비대면 배달 권장드립니다. 요기서 결제 선택 후, &quot;문 앞 배달&quot;을 요청사항에 남겨주세요.">${dto.request}</textarea>
              <div class="txt-limit">
                <div class="txt-length ng-binding">0 / 100</div>
                <span class="help-block ng-hide" ng-show="(session_storage.checkout_input.comment.length) >= 100">
                  <span class="text-danger">최대 100자까지 입력 가능합니다.</span>
                </span>
              </div>
            </div>
          </div>
        </div>

        <div class="panel panel-default clearfix" ng-show="is_yogiyo">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="clearfix">
                결제수단 선택 <span ng-show="!is_show_creditcard &amp;&amp; !is_show_cash" class="ng-hide">(현장 결제는 지원하지 않습니다.)</span>
              </a>
            </h4>
          </div>
          <!-- 요기요 결제 -->
          <div class="panel-collapse collapse am-collapse in">
            <div class="panel-body payment-wrap">
              <div class="ygy-payment clearfix" ng-show="check_enable_online_payment()">
                <div>
                
                  <span ng-show="is_yogiyo &amp;&amp; is_discount()" class="">
                  
                       <!-- 포인트  -->
                 <div>
                 보유 포인트:${dto.userPoint }
                 <input type="text" value="0" name="useUserPoint" id="useUserPoint" onblur="pointChk(${dto.userPoint });"> 
                 
                  	<input type=hidden value="${dto.count-1 }" id="orderCount" name="orderCount">
                </div>
                <input type="hidden" value="${dto.userName }" name="userName" id="userName">
               
                </div>
             
              </div>

              <div ng-show="is_show_creditcard || is_show_cash"><strong>현장결제</strong> <span class="stxt">음식받고 직접
                  결제</span>
                <p ng-show="check_enable_online_payment() &amp;&amp; is_discount()" class="">* 포인트 사용 가능</p>
              </div>
              <div class="btn-group clearfix" ng-show="is_show_creditcard || is_show_cash">
                 
               
                <!-- active 달면 빨간줄 -->
                
                <label class="btn btn-default active" ng-show="is_show_creditcard" ng-class="is_show_cash ? '':'btn-full'">
                  <i class="icon-check icon-card"></i>
                   <input type="radio" id="orderMode" 
                  class="btn btn-default ng-pristine ng-untouched ng-valid ng-valid-required" 
                  ng-model="session_storage.checkout_input.payment" 
                  ng-required="true" bs-radio="" required="required" onclick="onSite();">신용카드
                </label>
                
                <label class="btn btn-default" ng-show="is_show_cash" ng-class="is_show_creditcard ? '':'btn-full'">
                  <i class="icon-check icon-money"></i> <input type="radio" id="orderMode" class="btn btn-default ng-pristine ng-untouched ng-valid ng-valid-required" 
                  ng-model="session_storage.checkout_input.payment"  ng-required="true" bs-radio="" onclick="onSite();" required="required">현금
                </label>
                
           
         
              </c:forEach> 
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="panel-group ng-hide" ng-show="is_yogiyo &amp;&amp; check_enable_online_payment()
    &amp;&amp; (is_discount() == false || (is_discount() &amp;&amp; additional_discount_can_use_coupon))">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="clearfix">
                할인방법 선택
              </a>
            </h4>
          </div>

          <div class="panel-body">
            <div class="form-group coupon-wrap ">
              <label for="coupon" class="col-xs-2 control-label">포인트</label>
              <div class="col-xs-10 onspot_payment">
                <div class="input-group">
                  <input type="text" class="form-control input-type1 ng-pristine ng-untouched ng-valid" placeholder="바로 사용 가능합니다." name="coupon" 
                  ng-readonly="session_storage.checkout_input.payment == 'creditcard' || session_storage.checkout_input.payment == 'cash' || coupon_verified == true"
                   ng-disabled="(session_storage.checkout_input.payment == 'creditcard' || session_storage.checkout_input.payment == 'cash' || coupon_verified == true)" 
                   ng-model="input_coupon_code" ng-keypress="apply_coupon($event)" readonly="readonly" disabled="disabled">
                  <span class="input-group-btn">
                    <a class="btn btn-default btn-ygy2 ng-binding" ng-bind="btn_coupon" ng-click="apply_coupon()">적용</a>
                  </span>
                </div>
              </div>
              <div class="col-xs-offset-2 col-xs-10 ng-hide" ng-show="check_invalid_coupon()">
                <p class="msg-err-code ng-binding" ng-bind="invalid_coupon_message"></p>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>

<!-- 결제창 따라다님 ----------------------------------------------------------------------------------------------------------------- -->
	
    <div class="col-sm-4 order-wrap-pc" style="top: 0px; position: relative;">
      <div class="order-list">
        <div class="panel panel-default">
          <div class="panel-heading">
         
            <h3 class="panel-title">주문내역</h3>
          </div>
          <div class="panel-body checkout-order-list">
          
            <div class="list-group-item restaurant_name ng-binding" ng-bind="cart.get().restaurant_name"> 
            
            ${shopName }
           	
            </div>
            <ul class="list-group order-list">
              <!-- ngRepeat: item in cart.get().items --><li class="list-group-item ng-scope" ng-repeat="item in cart.get().items" ng-show="item.amount > 0"> 
               <c:forEach var="dto1" items="${lists1 }">
              ${dto1.menuName } x${dto1.cQty }
              <input type="hidden" value="${dto1.menuName }" id="menuName" name="menuName">
            </c:forEach>
                <div class="order-item clearfix">
                  <div class="order-name">
                    <span ng-bind-html="cart.get_menu_name(item)|strip_html" class="ng-binding"></span>
            
                  </div>
               
                </div>
              </li><!-- end ngRepeat: item in cart.get().items -->
            </ul>
            <div class="list-group1">
              <span class="list-group-item clearfix ng-hide" ng-show="additional_price > 0">
                <div class="order-name">추가 금액</div>
                <div class="order-price"><span ng-bind="additional_price|krw" class="ng-binding">0원</span></div>
              </span>
              <span class="list-group-item clearfix ng-hide" ng-show="coupon_verified">
                <div class="order-name">포인트할인</div>
                <div class="order-price"><span ng-bind="coupon_discount" class="ng-binding"></span></div>
              </span>
              <span class="list-group-item total-order-price clearfix">
                <div class="order-name">총 결제 금액</div>
                <div class="order-price">
                  <span ng-bind="total_price|krw" class="ng-binding">${priceAmount }</span>
                  <input type="hidden" value="${priceAmount }" id="priceAmount" name="priceAmount">
                  <input type="hidden" value="${shopCode }" id="orderShopCode" name="orderShopCode">
                </div>    
              </span>
            </div>
          </div>
        </div>
 
<!--  결제창 위 공지사항 -->
        <div class="agree-set">
          <small>
            <span ng-hide="check_login()"><a href="#/policy/" target="_blank">이용약관</a>,</span>
            <span ng-hide="check_login()"><a ng-href="#/collect_default/" target="_blank" href="#/collect_default/">개인정보 수집 및 이용</a>,</span>
            <span><a ng-href="#/partner/459987/" target="_blank" href="#/partner/459987/">개인정보 제3자 제공</a>
            <span ng-hide="check_login()">,</span>
            <span ng-hide="check_login()"><a ng-href="#/efinance_agreement/" target="_blank" href="#/efinance_agreement/">전자금융거래 이용약관</a>,</span>
            <span ng-hide="check_login()"><a href="/p/faq/#4-4" target="_blank">만 14세 이상 이용자</a></span> 내용 확인하였으며 결제에 동의합니다.
          </span></small>
        </div>
<!-- ------------------------------------------------------------------------------------------------------------------------ -->
   </form>   

       
        
        <button class="btn btn-lg btn-block btn-ygy1 ng-binding" onclick="requestPay('yes');" value="바로결제하기">바로결제하기</button>
      </div>
  
</div>



<form id="payment_form" action="" target="inicis_frame" method="POST" class="ng-pristine ng-valid"></form>
<iframe name="inicis_frame" style="display:none"></iframe>
<!-- tune install -->
<iframe scrolling="no" frameborder="0" width="1" height="1"></iframe>


</div></div>
 
	
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
</div>

</body>
</html>
     
     
     
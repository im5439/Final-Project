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

.star-rating { width:80px; }
.star-rating,.star-rating span { display:inline-block; height:13px; overflow:hidden; background:url(/eatswill/resources/images/star1.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
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
<meta property="og:title" content="lets eats will !">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:description" content="">
<!-- ngIf: ! page.title -->
<title ng-if="! page.title" class="ng-scope">나의 관심 매장</title>
<!-- end ngIf: ! page.title -->
<!-- ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="icon" type="image/png"
	href="/eatswill/resources/images/sicon.jpg">
   
<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/buttons.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/normalize.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/vicons-font.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/css/bootstrap.min.css" />


<link rel="stylesheet" type="text/css"
   href="http://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css">
<link rel="stylesheet" type="text/css"
   href="/eatswill/resources/assets/css/myg.css">
<link rel="stylesheet" type="text/css"
   href="/eatswill/resources/assets/css/myg_net.css">

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




   <link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
   <link rel="stylesheet"
   href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
   <script type="text/javascript" src="/eatswill/resources/assets/js/cart.js"></script>
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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

<!-- End Google Tag Manager -->
<script type="text/javascript" charset="UTF-8"
   src="https://maps.googleapis.com/maps-api-v3/api/js/41/4/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
   src="https://maps.googleapis.com/maps-api-v3/api/js/41/4/intl/ko_ALL/util.js"></script>
</head>
<body class="asp_check" style="margin-top: 0px;">
         <div class="col-sm-8" style="width: 1000px;padding-left: 0px;padding-right: 20px;">

            <div ng-show="active_tab == &quot;review&quot;" class="">

               <ul id="review" class="list-group review-list">

                  <!-- ngRepeat: review in restaurant.reviews -->
                  <li class="list-group-item star-point ng-scope"
                     ng-repeat="review in restaurant.reviews"
                     on-finish-render="scrollCartArea()">
                     <div class="b_ta_info">
                  <table width="100%" border="1" class="b_table_grey">
                     <thead style="text-align-last: center;">
                        <tr>
                           <th colspan="2">매장 정보</th>
                        </tr>
                     </thead>
                     <c:forEach var="dto" items="${lists}">
                     <tbody id="orderList">
                        
                           <tr>
                              <td colspan="2" style="border: 1; padding: 0" ></td>
                           </tr>
                           <tr cno="3273614152" ctype="G" column="4" class="first">
                              <td class="first_cell" rowspan="1" style="vertical-align: middle">
                                 <div class="td_detail">
                                    <img
                                       src="/eatswill/resources/images/${dto.shopImg}" width="80"
                                       height="80">
                                 </div>
                              </td>
                              <td style="text-align-last: left">
                                 <div class="td_info">
                                    
                                    <ul>
                                       <li class="seller_info"><em></em><a href="${storeUrl}?shopCode=${dto.shopCode}&ceoId=${dto.ceoId}">${dto.shopName }</a></li>
                                       <br>
                                       <li class="tit_info" style="font-size: 12pt">
                                       	   <div class="star-point">
				                              <span class="total"> <c:forEach begin="0"
				                                    end="${dto.shopScore - 1 }">
				                                    <span class="full ng-scope"
				                                       ng-repeat="i in review.rating|number_to_array track by $index">★</span>
				                                 </c:forEach> <c:if test="${dto.shopScore < 5 }">
				                                    <c:forEach begin="0" end="${4 - dto.shopScore }">
				                                       <span class="empty ng-scope"
				                                          ng-repeat="i in (5.9 - (review.rating|number:1))|number_to_array track by $index">★</span>
				                                    </c:forEach>
				                                 </c:if>
				                              </span> 
				                                   ${dto.shopScore } (${dto.reCnt })
				                           </div>
										</li>
                                    </ul>
                                 </div>
                              </td>
                           </tr>
                        
                     </tbody>
                     </c:forEach>
                  </table>
               </div>
                  </li>
               </ul>
            </div>
         </div>

</body>
</html>
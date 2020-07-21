<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

<title>Insert title here</title>

<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=upey5zgsjf&submodules=geocoder"></script>

<script type="text/javascript">

$(function() {
	$("#test").click(function() {
		if($("#map").text() == "") {
			naver.maps.Service.geocode({
		        address: $("#shopAddr").val()
		    }, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
		            return alert('Something wrong!');
		        }
		
		        var result = response.result, 	// 검색 결과의 컨테이너
		            items = result.items; 		// 검색 결과의 배열
	
	            var mapOptions = {
	           		center: new naver.maps.LatLng(items[0].point.y, items[0].point.x),
	           		zoom: 16
	           	};
	           	
	           	var map = new naver.maps.Map('map', mapOptions);
	           	
	           	var markerOptions = {
	           		position: new naver.maps.LatLng(items[0].point.y, items[0].point.x),
	           		map: map
	           	};
	           	
	           	var marker = new naver.maps.Marker(markerOptions);
	
		    });
	
			$("#map").css("width", "600px");
			$("#map").css("height", "600px");
		} else {
			$("#map").text("");
			$("#map").css("width", "0px");
			$("#map").css("height", "0px");
		}
		
	});
});
	
</script>
</head>
<body>




<c:forEach var="dto" items="${lists}">

<div id="info" class="info-list" ng-show="active_tab == &quot;info&quot;">
      <div class="info-item" ng-show="restaurant_info.introduction_by_owner">
        <div class="info-item-title info-icon">사장님알림</div>
      사장님 말 말 말 말 
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

</div>



 <div class="info-item">
        <div class="info-item-title info-icon1">업체정보</div>
        <p><i>영업시간</i> <span class="tc ng-binding">${dto.timeName } </span></p>
        <p ng-show="restaurant.phone.length > 0" class=""><i>전화번호</i> <span class="tc ng-binding">${dto.shopTel }</span></p>
        <p ng-show="restaurant.address.length > 0" class="">
        	<i>주소</i> <span class="tc ng-binding"> ${dto.shopAddr }</span>
        	<input type="hidden" id="shopAddr" value="${dto.shopAddr }">
        	<a id="test" style="display: table-cell;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" class="_2L0B-" role="presentation" style="fill: #03c75a; width: 18px;">
	        	<path d="M10 0c4.4 0 7.95 3.5 7.95 7.79a7.6 7.6 0 0 1-1.23 4.15l-6.33 8.02a.5.5 0 0 1-.78 0l-6.38-8.1A7.6 7.6 0 0 1 2.05 7.8 7.89 7.89 0 0 1 10 0zm0 1.54A6.38 6.38 0 0 0 3.55 7.8c0 1.18.34 2.33.96 3.28l5.5 6.92 5.44-6.86a6.08 6.08 0 0 0 1-3.34A6.37 6.37 0 0 0 10 1.54zM6.75 6.92h6.5a.5.5 0 0 1 .5.5v.54a.5.5 0 0 1-.5.5h-6.5a.5.5 0 0 1-.5-.5v-.54a.5.5 0 0 1 .5-.5z"></path>
	        </svg></a>
        </p>
        <p ng-show="restaurant.tags.length > 0 &amp;&amp; restaurant.tags.indexOf(&quot;CESCO&quot;) >= 0" class="ng-hide"><i>부가정보</i> <span class="cesco info-icon5 tc">세스코멤버스 사업장</span></p>
      </div>
      
	  <div id="map"></div>
	  
      <div class="info-item">
        <div class="info-item-title info-icon3">사업자정보</div>
        <p><i>상호명</i> <span ng-bind="restaurant_info.crmdata.company_name || restaurant.name" class="tc ng-binding">매장이름: ${dto.shopName }</span></p>
        <p><i>사장님 성함</i> <span ng-bind="restaurant_info.crmdata.company_name || restaurant.name" class="tc ng-binding">사장이름: ${dto.ceoName }</span></p>
        <p><i>사업자등록번호</i> <span ng-bind="restaurant_info.crmdata.company_number" class="tc ng-binding">${dto.shopTel}</span></p>
      </div>

      

      <div class="info-item food-safety ng-hide" ng-show="restaurant_info.violations.length > 0">
        <div class="info-item-title info-icon6">위반사항</div>
        <ul class="list">
          <!-- ngRepeat: violation in restaurant_info.violations -->
        </ul>
        <ul class="list1">
          <li>* 3개월 이내 식약처에 기재된 행정처분 정보를 제공합니다.</li>
          <li ng-show="restaurant_info.suspension_text" class="ng-binding ng-hide"></li>
        </ul>
      </div>
    </div>


</c:forEach>


</body>
</html>
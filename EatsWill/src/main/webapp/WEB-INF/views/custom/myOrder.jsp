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
<meta property="og:title" content="lets eats will !">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:description" content="">
<!-- ngIf: ! page.title -->
<title ng-if="! page.title" class="ng-scope">나의 주문 목록</title>
<!-- end ngIf: ! page.title -->
<!-- ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="icon" type="image/png"
	href="/eatswill/resources/images/sicon.jpg">


<!-- css---------------------------------------------------------- -->


<link rel="stylesheet" href="/eatswill/resources/assets/css/app.css"
	type="text/css" />

<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />


<script type="text/javascript"
	src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>


<!--------------------------------------------------------------------------------------- -->



<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css">
<link rel="stylesheet" type="text/css"
	href="/eatswill/resources/assets/css/myg.css">
<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/ko/myg_net.css">

<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
	src="//script.gmarket.co.kr/mobile/js/common/kr/util/viewability.js"></script>
<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
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





</head>
<body class="asp_check" style="margin-top: 0px;">
		<div class="col-sm-8" style="width: 1000px;padding-left: 0px;padding-right: 20px;">

			<div ng-show="active_tab == &quot;review&quot;" class="">

				<ul id="review" class="list-group review-list">
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
														<li class="seller_info"><em></em> <a
															href="${storeUrl}?shopCode=${dto.shopCode}&ceoId=${dto.ceoId}">${dto.shopName }</a></li>
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
														<c:if
																test="${dto.cnt == 0 }"><span class="btn_bg btn_w81_2"> 
																<a href="${reviewUrl }orderCode=${dto.orderCode}">리뷰
																	쓰기</a>
															
														</span></c:if> 
													</c:when>
													<c:otherwise></c:otherwise>
												</c:choose></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- Title -->
<title>EATSWILL 사장님 사이트</title>
<link rel="shortcut icon"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="72x72">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="114x114">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="144x144">
    <!-- Favicon -->
    <link rel="shortcut icon" href="public/img/favicon.ico">


    <!-- DEMO CHARTS -->
    <link rel="stylesheet" href="/eatswill/resources/css/chartist.css">
    <link rel="stylesheet" href="/eatswill/resources/css/chartist-plugin-tooltip.css">

    <!-- Template -->
    <link rel="stylesheet" href="/eatswill/resources/css/graindashboard.css">

<script type="text/javascript"
	src="https://owner.yogiyo.co.kr/media/owners/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="https://owner.yogiyo.co.kr/media/owners/js/jquery.validate.min.js"></script>
	
	 <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>





</head>


	


<body class="has-sidebar has-fixed-sidebar-and-header">


<div class="navigation ver-pc" ng-class="header_show()"
	style="background-color: #f3f5fa;">
	<!--  색상수정예정예정 -->
	<div class="app-down-banner clearfix ng-hide"
		ng-show="is_show_promotion_banner()">
		<div class="landing-banner">
			<div class="landing-header"></div>


		</div>
	</div>
	<!-- ----------------------------------------------------------------------------------------- -->

	

	
	<!-- ----------------------------------------------------------------------------------------- -->
	<div class="nav-top clearfix"
		ng-hide="$location.path() == '/login/' &amp;&amp; is_mobile_device">
		<a href="<%=cp%>/CEO.action/">
				<img alt="" src="/eatswill/resources/img/1sajang.png" width="128px" height="58px" style=" margin-left: 60px; margin-top: 20px;"> 
				<img alt="" src="/eatswill/resources/img/sajang.png" width="96px"  height="22px" style="margin-bottom: -30px;"></a>
		<%--       <h1 class="logor pull-left" ng-click="<%=cp%>/main.action" ></h1>  --%>
		<!-- 로고로고 -->
	
		
	
	</div>
</div>

<!-- -------------------------------------------------------------------------------------------------- -->
<main class="main" style="padding-top: 50px; padding-right: 200px; padding-left: 200px; padding-bottom: 200px">

    <div class="content">
        <div class="py-4 px-3 px-md-4">

<a href="<%=cp %>/ceoStoreList.action?mode=sales" style="width: 95px; height: 38px;  font-size: 4em; font-weight: bold; margin-top: -30px; float: right; " ><i class="fas fa-angle-double-left" ></i></a>


            <div class="mb-3 mb-md-4 d-flex justify-content-between">
                <div class="h3 mb-0">매출관리</div>
            </div>

            <div class="row">
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">총 주문내역</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="media align-items-center px-3 px-md-4 mb-3 mb-md-4">
                                <div class="media-body">
                                    <h4 class="h3 lh-1 mb-2">${orderCount } 회</h4>
                                    <!-- 
                                    <p class="small text-muted mb-0">
                                        +$570.5 <span class="text-success mx-1">+2.31%</span> This Month
                                    </p>
                                     -->
                                </div>
                            </div>

                            <div class="js-area-chart chart chart--axis-x chart--points-invisible position-relative chart--labels-hidden"
                                 data-series='[
                             [
                               {"meta":"Orders","value":"40"},
                               {"meta":"Orders","value":"42"},
                               {"meta":"Orders","value":"45"},
                               {"meta":"Orders","value":"80"},
                               {"meta":"Orders","value":"70"},
                               {"meta":"Orders","value":"70"},
                               {"meta":"Orders","value":"40"},
                               {"meta":"Orders","value":"20"},
                               {"meta":"Orders","value":"20"},
                               {"meta":"Orders","value":"35"},
                               {"meta":"Orders","value":"35"},
                               {"meta":"Orders","value":"32"},
                               {"meta":"Orders","value":"32"},
                               {"meta":"Orders","value":"35"},
                               {"meta":"Orders","value":"40"},
                               {"meta":"Orders","value":"50"},
                               {"meta":"Orders","value":"50"},
                               {"meta":"Orders","value":"80"},
                               {"meta":"Orders","value":"80"},
                               {"meta":"Orders","value":"90"},
                               {"meta":"Orders","value":"90"},
                               {"meta":"Orders","value":"100"},
                               {"meta":"Orders","value":"100"},
                               {"meta":"Orders","value":"80"},
                               {"meta":"Orders","value":"80"}
                             ]
                           ]'
                                 data-height="115"
                                 data-high="115"
                                 data-is-line-smooth='[false]'
                                 data-line-width='["1px"]'
                                 data-line-colors='["#8069f2"]'
                                 data-fill-opacity=".3"
                                 data-is-fill-colors-gradient="true"
                                 data-fill-colors='[
                             ["rgba(128,105,242,.7)","rgba(255,255,255,.6)"]
                           ]'
                                 data-is-show-tooltips="true"
                                 data-is-tooltips-append-to-body="true"
                                 data-tooltip-custom-class="chart-tooltip chart-tooltip--sections-blocked chart-tooltip__meta--text-muted small text-white p-2"
                                 data-tooltip-currency="Qty "
                                 data-is-show-points="true"
                                 data-point-custom-class='chart__point--donut chart__point--border-xxs border-primary rounded-circle'
                                 data-point-dimensions='{"width":8,"height":8}'></div>

                        </div>
                    </div>
                    <!-- End Card -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-secondary rounded-circle mr-3">
                            <i class="gd-wallet icon-text d-inline-block text-secondary"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1">₩ <fmt:formatNumber value="${totSales }" type="number"/></h4>
                            <h6 class="mb-0">총 매출</h6>
                        </div>
                        <i class="gd-arrow-down icon-text d-flex text-danger ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                    <br/><br/>
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-warning rounded-circle mr-3">
                            <i class="gd-money icon-text d-inline-block text-warning"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1">₩ <fmt:formatNumber value="${profit }" type="number"/></h4>
                            <h6 class="mb-0">순이익</h6>
                        </div>
                        <i class="gd-arrow-up icon-text d-flex text-success ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div>
                            <h5 class="lh-1 mb-0">찜한 고객</h5>
                            <small>${heartCount } 명</small>
                        </div>
                        <div class="js-area-chart chart--points-invisible chart--labels-hidden py-2 ml-auto"
                             data-series='[
                           [
                             {"value":"35"},
                             {"value":"20"},
                             {"value":"10"},
                             {"value":"20"},
                             {"value":"20"},
                             {"value":"0"},
                             {"value":"10"},
                             {"value":"0"},
                             {"value":"10"},
                             {"value":"10"},
                             {"value":"15"},
                             {"value":"35"},
                             {"value":"15"},
                             {"value":"20"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"40"},
                             {"value":"42"}
                           ]
                         ]'
                             data-is-hide-area="true"
                             data-width="123"
                             data-height="42"
                             data-high="42"
                             data-is-line-smooth='[false]'
                             data-line-width='["2px"]'
                             data-line-colors='["#8069f2"]'
                             data-is-show-tooltips="true"
                             data-is-tooltips-append-to-body="true"
                             data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle d-flex align-items-center small text-white p-2 mt-5 ml-5"
                             data-tooltip-badge-markup='<span class="indicator indicator-sm bg-primary rounded-circle mr-1"></span>'
                             data-is-show-points="true"
                             data-point-custom-class='chart__point--hidden'
                             data-point-dimensions='{"width":8,"height":8}'></div>
                    </div>
                    <!-- End Card -->
                </div>

				

            </div>
            
            
            
			<div class="row">


            </div>            

            <div class="row">
                <div class="col-12">
                    <!-- Card -->
                    <div class="card mb-3 mb-md-4">
                        <div class="card-header border-bottom p-0">
                            <ul id="wallets" class="nav nav-v2 nav-primary nav-justified d-block d-xl-flex w-100" role="tablist">
                                <li class="nav-item border-bottom border-xl-bottom-0">
                                    <a class="nav-link d-flex align-items-center py-2 px-3 p-xl-4 active" href="#bitcoin" role="tab" aria-selected="true"
                                       data-toggle="tab">
                                        <span>일별매출</span>
                                        <small class="text-muted ml-auto">₩12,012.96</small>
                                    </a>
                                </li>
                                <li class="nav-item border-bottom border-xl-bottom-0 border-xl-left">
                                    <a class="nav-link d-flex align-items-center py-2 px-3 p-xl-4" href="#bitcoinCash" role="tab" aria-selected="false"
                                       data-toggle="tab">
                                        <span>월별매출</span>
                                        <small class="text-muted ml-auto">₩8,038.00</small>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div id="walletsContent" class="card-body tab-content">
                            <div class="tab-pane fade show active" id="bitcoin" role="tabpanel">
                                <!-- <div class="row text-center">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            ₩12,012<sup class="h5">.96</sup>
                                        </div>
                                        <small class="text-muted">일별 총매출</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>$1,059<sup class="h5">.83</sup>
                                        </div>
                                        <small class="text-muted">일별 최대 매출</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>5.32<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">일별 최소 매출</small>
                                    </div>
                                </div> -->
                                <div id="dayChart"></div>
                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
						                           ${jsonDay }
						                         ]'
                                     data-labels='[" 01"," 02"," 03"," 04"," 05"," 06"," 07"," 08"," 09"," 10"," 11"," 12"," 13"," 14"," 15"," 16"," 17"," 18"," 19"," 20"," 21"," 22"," 23"," 24"," 25"," 26"," 27"," 28"," 29"," 30"]'
                                     data-labels-qty="6"
                                     data-labels-start-from="1"
                                     data-prefix="₩"
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="100000"
                                     data-low="0"
                                     data-offset-x="30"
                                     data-offset-y="60"
                                     data-is-line-smooth='[false]'
                                     data-line-width='["1px"]'
                                     data-line-colors='["#8069f2"]'
                                     data-fill-opacity="1"
                                     data-fill-colors='["#ecebfa"]'
                                     data-text-size-x="14px"
                                     data-text-color-x="#4a4e69"
                                     data-text-offset-top-x="10"
                                     data-text-align-axis-x="center"
                                     data-text-size-y="14px"
                                     data-text-color-y="#868e96"
                                     data-is-show-tooltips="true"
                                     data-is-tooltip-divided="true"
                                     data-tooltip-custom-class="chart-tooltip--divided chart-tooltip__value--bg-black chart-tooltip__meta--bg-primary small text-white"
                                     data-tooltip-currency="USD "
                                     data-is-show-points="true"
                                     data-point-custom-class='chart__point--donut chart__point--has-line-helper chart__point--border-xxs border-primary rounded-circle'
                                     data-point-dimensions='{"width":8,"height":8}'></div>
                            </div>

                            <div class="tab-pane fade" id="bitcoinCash" role="tabpanel">
                                <!-- <div class="row text-center">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            ₩8,038<sup class="h5">.00</sup>
                                        </div>
                                        <small class="text-muted">Total Sales</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>₩105<sup class="h5">.84</sup>
                                        </div>
                                        <small class="text-muted">Today Sales (USD)</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-danger">-</span>2.38<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">Net Profit (%)</small>
                                    </div>
                                </div> -->

                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
                                     				${jsonMonth }
						                         ]'
                                     data-labels='["01월","02월","03월","04월","05월","06월","07월","08월","09월","10월","11월","12월"]'
                                     data-labels-qty="12"
                                     data-labels-start-from="1"
                                     data-prefix="₩"
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="1000000"
                                     data-low="0"
                                     data-offset-x="30"
                                     data-offset-y="60"
                                     data-is-line-smooth='[false]'
                                     data-line-width='["1px"]'
                                     data-line-colors='["#8069f2"]'
                                     data-fill-opacity="1"
                                     data-fill-colors='["#ecebfa"]'
                                     data-text-size-x="14px"
                                     data-text-color-x="#4a4e69"
                                     data-text-offset-top-x="10"
                                     data-text-align-axis-x="center"
                                     data-text-size-y="14px"
                                     data-text-color-y="#868e96"
                                     data-is-show-tooltips="true"
                                     data-is-tooltip-divided="true"
                                     data-tooltip-custom-class="chart-tooltip--divided chart-tooltip__value--bg-black chart-tooltip__meta--bg-primary small text-white"
                                     data-tooltip-currency="USD "
                                     data-is-show-points="true"
                                     data-point-custom-class='chart__point--donut chart__point--has-line-helper chart__point--border-xxs border-primary rounded-circle'
                                     data-point-dimensions='{"width":8,"height":8}'></div>
                            </div>


                        </div>
                    </div>
                    <!-- End Card -->
                </div>
            </div>

            



        </div>

        <!-- Footer -->
        <!-- End Footer -->
    </div>
</main>


<script src="/eatswill/resources/js/graindashboard.js"></script>
<script src="/eatswill/resources/js/graindashboard.vendor.js"></script>

<!-- DEMO CHARTS -->
<script src="/eatswill/resources/js/resizeSensor.js"></script>
<script src="/eatswill/resources/js/chartist.js"></script>
<script src="/eatswill/resources/js/chartist-plugin-tooltip.js"></script>
<script src="/eatswill/resources/js/gd.chartist-area.js"></script>
<script src="/eatswill/resources/js/gd.chartist-bar.js"></script>
<script src="/eatswill/resources/js/gd.chartist-donut.js"></script>
<script>
    $.GDCore.components.GDChartistArea.init('.js-area-chart');
    $.GDCore.components.GDChartistBar.init('.js-bar-chart');
    $.GDCore.components.GDChartistDonut.init('.js-donut-chart');
</script>
</body>
</html>

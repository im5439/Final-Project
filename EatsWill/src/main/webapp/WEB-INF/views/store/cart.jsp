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
</head>
<body>
    <script type="text/javascript">

	function storechange(pIndx,cal) {
    	
    	var btnIdx = pIndx;
    	var priceAmount = document.getElementById("priceAmount");
		var arrAmount = new Array();
		
		var obj1 = document.getElementById("amount"+btnIdx);
        var obj2 = document.getElementById("menuPrice"+btnIdx);
        var obj3 = document.getElementById("cAmount"+btnIdx);
		
		if(cal==2){
    	 
         
         var val = Number(obj1.value) + 1;
         obj1.value = val;

         obj3.value =  Number(obj1.value) * Number(obj2.value);
         
         //기존의 주문 총 금액에서 선택한 메뉴의 금액을 더함
         priceAmount.value = Number(priceAmount.value) + Number(obj2.value); 
         
		}
		
		
		if(cal==1){
 	    

         var val = Number(obj1.value)-1;
         if(val <= 0){ val=1; }
         obj1.value = val;

         obj3.value =  Number(obj1.value) * Number(obj2.value);
         
         //기존의 주문 총 금액에서 선택한 메뉴의 금액을 뺌
       	 
         priceAmount.value = Number(priceAmount.value) - Number(obj2.value);
      
		}
		 
    }
		function deleteIt(pIndx) {
		
			
			var btnIdx = pIndx;  
		
    		var params = "shopCode=" + $("#shopCode").val() 
    				+ "&ceoId=" + $("#ceoId").val()
    				+ "&menuCode=" +  $("#cartMenuCode" + btnIdx).val() 
    				+ "&userId=" + $("#userId").val();
    	
    		$.ajax({
    			type:"POST",
    			url:"<%=cp%>/deleteCart.action",
    			data:params,
    			success:function(args){
    					
    				$("#cartHere").html(args);
    			
    			},
    			error:function(e){
    				alert(e.responseText);
    			}
    		
    		});
    	}
 
    </script>
    
    <div class="col-sm-4 hidden-xs restaurant-cart" style="top: 0px; position: relative;">
        <!-- ngInclude: undefined --><ng-include src="'cart.html'" class="ng-scope">
<div class="" style="height: 30em; width: 20em;">
  <div class="sub-title" style="background-color: orange;">
    <span >주문표</span>
    <a ng-hide="cart.is_empty()" ng-click="clear_cart()" class="ng-hide">
      <span class="ico-clear"></span>
    </a>
  </div>
  <div class="cart">
    <div class="restaurant-name ng-hide" ng-hide="cart.is_empty() || current_controller == &quot;restaurant_controller&quot;"><a ng-bind="cart.get().restaurant_name" ng-click="$location.url('/' + cart.get().restaurant_id + '/')" class="ng-binding">${dto.menuName }</a>
        <div>
          <span class="coupon-base ng-binding" ng-show="is_yogiyo &amp;&amp; delivery_discount_value() != 0"></span>
        
        </div>
    </div>
    <div ng-show="restaurant.has_disposable_menu" class="cart-disposable-menu ng-hide">
      주문 시 일회용품(비닐봉투 등)을 함께 구매해야하는 매장입니다.<br>
      <em>일회용품은 자동 추가되며, 이를 제외하고 주문할 수 없습니다.</em>
    </div>
    <ul class="list-group">
      <!-- ngRepeat: item in cart.get().items -->
    </ul>
 
        <form name="storeForm" method="post">
        <c:forEach var="dto" items="${lists }" varStatus="status">
        
       <c:if test="dto==null">
        <div ng-show="cart.is_empty()" class="cart-empty">
            주문표에 담긴 메뉴가 없습니다.
        </div>
        </c:if>
        <div align="center"  style="">
        <br/>
       <h1 style="font-size: 13pt; color: red; font-weight: bold; "> 메뉴명 : ${dto.menuName }</h1>
       <input type="text" id="cartMenuCode${status.index}" value="${dto.menuCode }" name="menuCode">
        <img src="resources/img/delete.png" width="20px" height="20px" 
        id="deleteImg" onclick="deleteIt(${status.index});"> 
       <br/>    
       <input type=hidden name="menuPrice" value="${dto.menuPrice }"  id="menuPrice${status.index}">
       <table>
      
       <tr align="center" >
       <td colspan="2" align="center" width="122" height="48" >
       
        
       수량   &nbsp;<input type="button" name="del" value=" - " onclick="storechange(${status.index},1);" >
       </td>
       
       <td >
       <input style="text-align: center;" type="text"  id="amount${status.index}"  name="amount" value="${dto.cQty }" size="3" readonly="readonly" >
       </td>
       <td colspan="2" align="center" width="122" height="48">
       <input type="button" name="add" value=" + " onclick="storechange(${status.index},2);">
       </td>
       </tr>
       </table>
       <br/>
       <table>
       <tr align="center" >
       		<td >    		
       		금액 : <input type="text" id="cAmount${status.index}" name="cAmount" value="${dto.cAmount } " size="11" readonly="readonly" >원<br/>   		
       		</td>
       </tr>
       </table>
        <hr>
        </div>
        
        <input type="hidden" name="menuName" value="${dto.menuName }">
       
        </c:forEach>
        
       <input type="hidden" name="shopCode" value="${dto.shopCode }">
       <input type="hidden" name="userId" value="${userId }">

        <div class="clearfix">
          <span class="list-group-item clearfix text-right ng-binding" ng-show="cart.get_delivery_fee(restaurant) > 0">
           총금액 : <input type="text"  id="priceAmount" value="${priceAmount }" size="11" readonly="readonly" > <span ng-show="restaurant.free_delivery_threshold > 0" class="ng-binding ng-hide"> (0원 이상 주문시 배달무료)</span>
          </span>
          <span class="list-group-item minimum-order-price ng-hide" ng-show="!cart.is_empty() &amp;&amp; (restaurant.min_order_amount > cart.get_total() || (cart.has_discounted_item() &amp;&amp; restaurant.discounts.additional.delivery.discount_mov > restaurant.min_order_amount))">
            <p class="discount-color ng-binding ng-hide" ng-show="cart.has_discounted_item() &amp;&amp; restaurant.discounts.additional.delivery.discount_mov > restaurant.min_order_amount">
              0원 이상 주문 시  할인
            </p>
            <p ng-show="restaurant.min_order_amount > cart.get_total()" class="ng-binding">
              최소주문금액
            </p>
          </span>
          <span class="list-group-item cart-total-order-price ng-binding ng-hide" ng-show="! cart.is_empty() &amp;&amp; cart.get_total() > 0">
            합계 : <input type="text" name="totAmount" value="-" size="11" readonly="readonly" 원><br/>
          </span>
        </div>

        </form>
    <div class="cart-btn clearfix">
      <a class="btn btn-lg btn-ygy2 btn-left ng-hide" ng-show="$route.$$route.originalPath == &quot;/cart/&quot;" ng-click="add_cart()">
            <span ng-show="! cart.is_empty()" class="ng-hide">메뉴추가</span>
            <span ng-show="cart.is_empty()">홈으로 가기</span>
      </a>
      <a class="btn btn-lg btn-ygy1 btn-block" ng-disabled="cart.get_restaurant_id() != restaurant.id || cart.get_amount() < 1" ng-click="checkout()" disabled="disabled">주문하기</a>
    </div>
  </div>
</div>

</ng-include>
  </div>
 
 <script src="/eatswill/resources/assets/js/jquery.min.js"></script>
			<script src="/eatswill/resources/assets/js/skel.min.js"></script>
			<script src="/eatswill/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/eatswill/resources/assets/js/main.js"></script>
 
  
 </body>
 </html>
 
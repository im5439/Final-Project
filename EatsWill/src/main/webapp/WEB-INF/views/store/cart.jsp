<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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

<style type="text/css">


input[type=button]{

	background-color: orange;
	border: none;
	color: white;
	height: 30px;
	width: 40px;
	align-content: center;
	font-size: 15pt;
	border-radius: 7px;

}

.btn-ygy1:hover, .btn-ygy1:focus, .btn-ygy1:active, .btn-ygy1.active, .open .dropdown-toggle.btn-ygy1 {
    background-color: #e05929 !important;
}

/* input[type=button]:hover {
	color: #B42E01;
} */



</style>

</head>
<body>
    <script type="text/javascript">
    
    addside();
    
    //카트에  각각의 메뉴+사이드메뉴 합 구하는 함수(모든 for 출력에 더함)
    function addside(){

    	var listsu = "${listsu}";
    	//var listSideSu = "${listSideSu}";
	
	    for(var i=0;i<listsu;i++){
	    	document.getElementById("cAmount"+i).value = 
	    		Number(document.getElementById("cAmount"+i).value); 
	    		//+ Number(document.getElementById("sidePrice"+i).value);
		    	for(var j=0;j<listsu;j++){
		    		if(document.getElementById("cAmountSide"+i+"_"+j)){
			    		document.getElementById("cAmount"+i).value = 
			    			Number(document.getElementById("cAmount"+i).value)
			    			+ Number(document.getElementById("cAmountSide"+i+"_"+j).value);
		    		}
		        }
	    	
	    }

    }
    
    //+ , - 했을때 해당 index만 가져와 더해주고 빼주는 함수
	function addsidesel(index){
    	
	
    	var btnIdx = index;
    	
	    	document.getElementById("cAmount"+btnIdx).value = 
	    	Number(document.getElementById("cAmount"+btnIdx).value) 
	    	+ Number(document.getElementById("sidePrice"+btnIdx).value);
    
    }
    
	//+,-했을 때 값을 더해주고 빼주는 함수
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

	         obj3.value =  (Number(obj3.value) + Number(obj2.value));
	         // addsidesel(btnIdx);
	         //기존의 주문 총 금액에서 선택한 메뉴의 금액을 더함
	         priceAmount.value = Number(priceAmount.value) + Number(obj2.value);
	       
	     
		}
		
		
		if(cal==1){
 	    	
		        var val = Number(obj1.value)-1;
		        
		      	//기존의 주문 총 금액에서 선택한 메뉴의 금액을 뺌
		        if(val>=1) {
		        	priceAmount.value = Number(priceAmount.value) - Number(obj2.value);
		        }				
		     
		        if(val>0){
			        if((Number(obj3.value) - Number(obj2.value))>=Number(obj2.value)) {
			        	obj3.value =  Number(obj3.value) - Number(obj2.value);
			        }
		        }
		        
				if(val <= 0){ val=1; }
		        
		        obj1.value = val;
		       // addsidesel(btnIdx);
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
	

	function cQtyChk() {
		
		var f = document.storeForm;
		var size = $("#cartMainListsSize").val();
		var size2 = $("#cartMainListsSize2").val();

		var mainQty = "";
		var cartMenuCode = "";
		var cartAmount = "";
		var sidePrice = "";
		
		for(var i=0; i<size; i++) {
			
			mainQty +=  document.getElementById("amount" + i).value + ',';
			cartMenuCode +=  document.getElementById("cartMenuCode" + i).value + ',';
			cartAmount +=  document.getElementById("cAmount" + i).value + ',';
			
			
		}
		
		for(var i=0; i<size2; i++) {
			
			sidePrice +=  document.getElementById("sidePrice" + i).value + ',';
		}
		
		document.getElementById("mainQty").value = mainQty;
		document.getElementById("cartMenuCode").value = cartMenuCode;
		document.getElementById("cartAmount").value = cartAmount;
		document.getElementById("sidePrice2").value = sidePrice;
	
	}
	
	function sendIt1() {
	      
	      var f = document.storeForm;
	      var userId = "${userId }";
	   
	      
	      if(userId=="guest"){
	         
	         alert("로그인을 먼저 해주세요!");
	         f.action = "<%=cp %>/login.action";
	         f.submit();   
	         return;   
	         
	      } 
	      
	      if(userId!="guest" && $("#priceAmount").val()==null || $("#priceAmount").val()==0 ){
	         
	         alert("주문표에 음식을 담아주세요!");
	         return;
	      }
	      
	      var con = confirm("결제창으로 이동하시겠습니까?");
	        
	        if(con==true) {
	           
	           f.action = "<%=cp%>/cartUpdate.action";
	           f.submit(); 
	           
	        }else{
	           return;
	        }
	   
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
 
        <form name="storeForm" method="post" action="">
        <c:forEach var="dto" items="${lists }" varStatus="status">
 
        <div align="center"  style="">
        <br/>
       <table border="0" width="280">
       <tr valign="middle">
       <td colspan="6" >
        <b>${dto.menuName } </b>
       <br/>
        <c:forEach var="dto1" items="${lists1 }">
        <c:if test="${lists1!=null && dto.menuCode==dto1.menuCode}" >
        	${dto1.menuName }(${dto1.cQty})
       	</c:if>
   
        </c:forEach>
     
       </td>
       <td align="right">
        <img src="resources/img/delete.png" width="20px" height="20px" 
        id="deleteImg" onclick="deleteIt(${status.index});"> </td>
        </tr>
         
        <tr align="center" >
       <td width="50">수량 </td>
       <td  align="center" width="50" height="48">
       <input type="button" name="del" value=" - " onclick="storechange(${status.index},1);" >
       </td>
       <td>
       <input style="text-align: center;" type="text"  id="amount${status.index}"  name="amount" value="${dto.cQty }" size="3" readonly="readonly" >
       </td>
       <td align="center" width="50" height="48">
       <input type="button" name="add" value=" + " onclick="storechange(${status.index},2);">
       </td>
       
       		<td colspan="2">
       		
       			<input type="text" id="cAmount${status.index}" name="cAmount" value="${dto.cAmount }" size="11" readonly="readonly" style="text-align: right;"/>
       			
       			<c:forEach var="dto2" items="${lists2 }" varStatus="statusSide">
	       			 <c:if test="${lists2!=null && dto.menuCode==dto2.menuCode}" >
		       			 <input type="hidden" id="cAmountSide${status.index}_${statusSide.index}"  value="${dto2.sideSum }" size="11" readonly="readonly" style="text-align: right;"/>
		       		</c:if>
        		</c:forEach>
       			
       			
       		</td>
       		<td>원</td>
       </tr>
      
       </table>
       
     
       
        <hr>
        </div>
        <input type="hidden" id="cartMenuCode${status.index}" value="${dto.menuCode }" name="menuCode">
        <input type="hidden" name="menuPrice" value="${dto.menuPrice }"  id="menuPrice${status.index}">
        <input type="hidden" name="menuName" value="${dto.menuName }">
        <input type="hidden" name="cartMainListsSize" value="${fn:length(lists)} " id="cartMainListsSize">
        <input type="hidden" name="cartMainListsSize2" value="${fn:length(lists2)} " id="cartMainListsSize2">
		
        </c:forEach>
        
        <!--  메인메뉴별 사이드메뉴들의 합을 가져와서 메인메뉴합에 더해줌-->
        <c:forEach var="dto2" items="${lists2 }" varStatus="sts">
        <input type="hidden" id="sidePrice${sts.index }" value="${dto2.sideSum }"/>
        </c:forEach>

       <input type="hidden" name="priceSideAmount" value="${priceSideAmount }"/>
       <input type="hidden" id="cartAmount" name="cartAmount" value="${cartAmount}">
       <input type="hidden" name="mainQty" id="mainQty" value="${mainQty }">
       <input type="hidden" name="cartMenuCode" id="cartMenuCode" value="${cartMenuCode }">
       <input type="hidden" name="sidePrice2" id="sidePrice2" value="${sidePrice2 }">
       

        <div class="clearfix">
          <span class="list-group-item clearfix text-right ng-binding" ng-show="cart.get_delivery_fee(restaurant) > 0">
          	<font style="font-size: 18px;float: left;">총&nbsp;금액 :</font>
          	<input type="text" id="priceAmount" value="${priceAmount }" name="priceAmount" size="11" readonly="readonly" style="text-align: right;font-size: 23px;font-weight: bold;">
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
      <input type="button" value="주문하기" onclick="cQtyChk();sendIt1();" class="btn btn-lg btn-ygy1 btn-block"
      style="height: 50px;background-color: #FE642E;"/>
      <%-- <a class="btn btn-lg btn-ygy1 btn-block" ng-disabled="cart.get_restaurant_id() != restaurant.id || cart.get_amount() < 1" onclick="cQtyChk();sendIt1();">주문하기</a> --%>
    </div>
  </div>
</div>

</ng-include>
  </div>
 
 
  
 </body>
 </html>
 
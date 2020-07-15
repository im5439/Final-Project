<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>BLUEB</title>
</head>

<body onload="init();">
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
	
 	
    	function deleteIt() {
    	
    		var params = "shopCode=" + $("#shopCode").val() 
    				+ "&ceoId=" + $("#ceoId").val()
    				+ "&menuCode=" +  $("#menuCode").val() 
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
<div class="">
  <div class="sub-title">
    <span style="width: 400px;">주문표</span>
    <a ng-hide="cart.is_empty()" ng-click="clear_cart()" class="ng-hide">
      <span class="ico-clear"></span>
    </a>
  </div>
  <div class="cart">
    <div class="restaurant-name ng-hide" ng-hide="cart.is_empty() || current_controller == &quot;restaurant_controller&quot;"><a ng-bind="cart.get().restaurant_name" ng-click="$location.url('/' + cart.get().restaurant_id + '/')" class="ng-binding">네네치킨-신도림점</a>
        <div>
          <span class="coupon-base ng-binding" ng-show="is_yogiyo &amp;&amp; delivery_discount_value() != 0">배달할인 2,000원</span>
          <span class="coupon-base coupon-style1 ng-binding ng-hide" ng-show="is_yogiyo &amp;&amp; additional_discount_value() != 0">추가할인 0%</span>
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
        <div> 
        메뉴명: ${dto.menuName }
        <img src="resources/img/delete.png" width="20px" height="20px" 
        id="deleteImg" onclick="deleteIt();"class="imgCart"> 
        <br/>
        <input type="hidden" id="menuCode" value="${dto.menuCode }" name="menuCode">
        
       수량 :<br/> <input type=hidden name="menuPrice" value="${dto.menuPrice }"  id="menuPrice${status.index}">
       <table>
       <tr>
       <td>
       <input type="button" name="del" value=" - " onclick="storechange(${status.index},1);">
       </td>
       <td >
       <input style="text-align: center;" type="text"  id="amount${status.index}"  name="amount" value="${dto.cQty }" size="3" readonly="readonly" >
       </td>
       <td>
       <input type="button" name="add" value=" + " onclick="storechange(${status.index},2);">
       </td>
       </tr>
       </table>
       <br/>
       <table>
       <tr>
       		<td>금액 : <input type="text" id="cAmount${status.index}" name="cAmount" value="${dto.cAmount }" size="11" readonly="readonly" >원<br/></td>
       </tr>
       </table>
       
        </div>
        
        <input type="hidden" name="menuName" value="${menuName }">
        
        </c:forEach>
        
       <input type="hidden" name="shopCode" value="${dto.shopCode }">
       <input type="hidden" name="userId" value="${userId }">
       
       <table>
       <tr>
       		<td>금액 : </td><td ><input type="text"  id="priceAmount" value="${priceAmount }" size="11" readonly="readonly" ></td><td>원</td>
       </tr>
	   </table>

        <div class="clearfix">
          <span class="list-group-item clearfix text-right ng-binding" ng-show="cart.get_delivery_fee(restaurant) > 0">
            배달요금 2,000원 별도<span ng-show="restaurant.free_delivery_threshold > 0" class="ng-binding ng-hide"> (0원 이상 주문시 배달무료)</span>
          </span>
          <span class="list-group-item minimum-order-price ng-hide" ng-show="!cart.is_empty() &amp;&amp; (restaurant.min_order_amount > cart.get_total() || (cart.has_discounted_item() &amp;&amp; restaurant.discounts.additional.delivery.discount_mov > restaurant.min_order_amount))">
            <p class="discount-color ng-binding ng-hide" ng-show="cart.has_discounted_item() &amp;&amp; restaurant.discounts.additional.delivery.discount_mov > restaurant.min_order_amount">
              0원 이상 주문 시  할인
            </p>
            <p ng-show="restaurant.min_order_amount > cart.get_total()" class="ng-binding">
              최소주문금액 : 9,000원 이상
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
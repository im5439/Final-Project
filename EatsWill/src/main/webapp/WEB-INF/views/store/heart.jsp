<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

$(document).ready(function(){

	
	$("#heartImg").click(function(){
		
		var params = "shopCode=" + $("#shopCode").val() 
				+ "&ceoId=" + $("#ceoId").val()
				+ "&userId=" + $("#userId").val()
		+ "&chk=" + $("#chk").val();
	
		$.ajax({
			
			type:"POST",
			url:"<%=cp%>/heartInDel.action",
			data:params,
			success:function(args){
				
				$("#heart").html(args);
			
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	});
});

</script>


<form action="" method="post" name="infoForm">
    <div class="restaurant-info">
   
      <div class="restaurant-title">
        <span class="restaurant-name ng-binding" ng-bind="restaurant.name"> ${dto.shopName}</span>
      </div>
      <div class="restaurant-content">
        <div class="logo">
        	<img src="<spring:url value='/shopImg/${dto.shopImg }'/>" width="80px" height="80px" style="width: 80px;max-height: 80px;">
        </div>
       
       <!-- --------------------------------------------------------------------------------------------------- list -->
        <ul class="list">
          <li><span class="stars star-point ng-binding">
        	<span class="full ng-scope" ng-repeat="i in restaurant.review_avg|number_to_array track by $index">★</span> <!-- 별점 -->
         <span class="full ng-scope" ng-repeat="i in restaurant.review_avg|number_to_array track by $index">${dto.reScore}</span></li> <!-- 별점 점수 -->
          <!--li>영업시간 : <span>{{restaurant.open_time_description}}</span></li-->
          <li ng-show="show_discount_description()" class="discount-desc ng-hide">
          
          <span class="ng-binding">사장님 이름: ${dto.ceoName}</span></li>
           <c:if test="${userId != 'guest' }">
          <li>찜<span id="heartImg">
         
          <c:if test="${chk=='in'}" >
      <img src="resources/img/fullheart.png" width="20px" height="20px" id="heartImg">
      </c:if>
      <c:if test="${chk=='del'}">
      <img  src="resources/img/emptyheart.png" width="20px" height="20px" id="heartImg">
      </c:if></span></li>
          <!--li class="restaurant-address">위치 : <span>{{restaurant.address|trim_address|normalize_address}}</span></li-->
	</c:if>
          <li class="">결제
           <span ng-show="check_enable_online_payment()" class="ico-payment-yogiyo yogiseo-payment ng-binding">바로결제</span>
           
           <input type="hidden" value="${dto.shopCode }" id="shopCode">
           <input type="hidden" value="${dto.ceoId }" id="ceoId">
           <input type="hidden" value="${userId }" id="userId">
           <input type="hidden" value="${chk }" id="chk">
           
          </li>
          <li class="delivery-time-tooltip" ng-show="restaurant.estimated_delivery_time">영업시간
            <span class="ng-binding">${dto.timeName }<button type="button" class="btn-tooltip" data-toggle="tooltip" data-html="true" id="delivery-time-tooltip" data-placement="bottom" title="" data-original-title="최근 주문의 배달시간을 분석한 정보 입니다. <br> 실제 배달시간과는 차이가 있을 수 있습니다.">&nbsp;</button></span>
          </li>
          
          <li class="full-w" ng-show="is_yogiyo &amp;&amp; (delivery_discount_value() > 0 || additional_discount_value() > 0)">
            <span class="coupon-base ng-binding" ng-show="delivery_discount_value() > 0">적립금 사용 가능</span>
            <span class="coupon-base coupon-style1 ng-binding ng-hide" ng-show="additional_discount_value() > 0">추가할인 0%</span>
          </li>
          
        </ul>
        <input type="hidden">
       
        
      </div>
    </div>
 
    </form>

</body>
</html>
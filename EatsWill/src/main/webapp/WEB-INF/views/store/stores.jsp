<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet" href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
</head>
<body>

<form action="<%=cp %>/page.action" name="storesForm" method="post">
<c:forEach var="dto" items="${page_lists}">
                     <div class="col-sm-6 contract" ng-repeat="restaurant in list">
                        <div class="item clearfix"
                           ng-click="select_restaurant(restaurant, $index)"
                           style="cursor: pointer;">
                           <table>
                              <tbody>

                                 <tr>
                                    <td>
                                       <!-- 이미지 storeimg 적용해야됨 -->

                                       <div ng-show="restaurant|restaurant_is_available"
                                          class="logo"
                                          ng-style="{'background-image':'url(' + get_logo_url(restaurant.logo_url) + '), url(\'image/default_restaurant_logo.png\')'}"
                                          style="background-image: url(), url();"></div>

                                       <div ng-show="! (restaurant|restaurant_is_available)"
                                          class="logo not-available ng-binding ng-hide">
                                          현재 잇츠윌<br>서비스가<br>제공되지<br>않습니다.
                                       </div>
                                    </td>
                                    <td>

                                       <div class="restaurants-info">

                                          <div class="restaurant-name ng-binding"
                                             ng-bind="storename" id="storename" title="">
                                             <a onclick="javascript:storesForm.submit();">
                                                ${dto.shopName }</a>
                                             <input type="hidden" name="shopCode" value="${dto.shopCode}">
                                             <input type="hidden" name="ceoId" value="${dto.ceoId}">
                           
                                          </div>
                                          <div class="stars">
                                             <span> <span class="ico-star1 ng-binding"
                                                ng-show="별점">${dto.reScore }</span>
                                             </span> <span class="review_num ng-binding" ng-show="리뷰갯수">
                                                리뷰 수(${dto.reCount }) </span> <span class="review_num ng-binding"
                                                ng-show="사장님 답글"> 사장님댓글 갯 </span> <span
                                                class="review_num ng-binding" ng-show="storecreated"
                                                id="shopcreated"> 오픈일 ${dto.shopCreated } </span> <span
                                                ng-show="restaurant.review_count < 1" class="ng-hide">
                                                첫번째 리뷰를 남겨주세요! </span>
                                          </div>
                                          <ul>
                                             <li class="payment-methods ng-binding yogiseo-payment"
                                                ng-class="is_online_payment(restaurant) ? 'yogiseo-payment' : ''">잇츠윌결제</li>
                                             <li class="min-price ng-binding">~이상배달</li>
                                             <li class="full-w"
                                                ng-show="is_yogiyo &amp;&amp; (delivery_discount_value(restaurant) > 0 || additional_discount_value(restaurant) > 0 || restaurant.tags.length > 0 &amp;&amp; restaurant.tags.indexOf('CESCO') >= 0)">
                                                <span class="coupon-base ng-binding"
                                                ng-show="delivery_discount_value(restaurant) > 0">배달
                                                   할인 얼마</span> <span
                                                class="coupon-base coupon-style1 ng-binding ng-hide"
                                                ng-show="additional_discount_value(restaurant) > 0">추가할인
                                                   0%</span> <span
                                                ng-show="restaurant.tags.length > 0 &amp;&amp; restaurant.tags.indexOf(&quot;CESCO&quot;) >= 0"
                                                class="ico-cesco ng-hide">cesco</span>
                                             </li>
                                             <li class="delivery-time ng-binding" ng-show="timeCode">

                                             </li>
                                          </ul>

                                       </div>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </div>
                     <!-- end ngRepeat: restaurant in list -->
                  </c:forEach>

</form>


</body>
</html>
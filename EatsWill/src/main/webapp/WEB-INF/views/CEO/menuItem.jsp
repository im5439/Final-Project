<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<div id="menu" class="menu-list" ng-show="! active_tab || active_tab == &quot;menu&quot;">
      <div class="panel-group ng-untouched ng-valid ng-dirty ng-valid-parse" ng-model="multiplePanels.activePanels" data-allow-multiple="true" bs-collapse="">
        <!-- ngRepeat: category in restaurant.menu -->
        <div class="panel panel-default ng-scope" ng-repeat="category in restaurant.menu" ng-show="is_show_menu(category)">
          <div class="panel-heading">
            <h4 class="panel-title ng-hide" ng-click="select_menu_category(category)" ng-show="show_menu_category(category.slug)">
              <a class="clearfix">
                <span class="menu-name pull-left ng-binding" ng-class="get_menu_class(category.slug)">Photo Menu Items</span>
                <i class="pull-right" ng-class="category.icon_down_up"></i>
              </a>
            </h4>
          </div>
          <div class="panel-collapse collapse in btn-scroll-container" ng-show="toggle_category(category)">
            <div ng-class="'panel-body' + (category.slug == 'photo_menu_items' ? ' photo-menu-container' : '')" class="panel-body photo-menu-container">
              <div class="category-desc ng-binding ng-hide" ng-show="category.description" ng-bind-html="category.description|strip_html"></div>
              <div ng-show="category.slug=='photo_menu_items'">
                <div ng-class="'photo-slide ' + (show_menu_discount() ? 'discount_mov' : '')" class="photo-slide" style="width: 896px;">
                  <!-- ngRepeat: item in category.items --><!-- ngIf: check_count(category.slug, $index) -->
                  <c:if test="${menu != null }">
                  <c:forEach var="dto" items="${menu }">
                  <div ng-repeat="item in category.items" ng-click="select_menuitem(item)" ng-if="check_count(category.slug, $index)" ng-class="get_menu_item_class(item)" class="ng-scope photo-menu">
                    <!-- ngIf: item.soldout -->
                    <!-- 
                    <div class="photo" style="background-image: url('https://images.de`liveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%A7%A5%EB%8F%84%EB%82%A0%EB%93%9C/2020-07-01/%EC%A0%9C%ED%9C%B4FR_20200630_%EB%A7%A5%EB%8F%84%EB%82%A0%EB%93%9C_%EC%BF%BC%ED%84%B0%ED%8C%8C%EC%9A%B4%EB%8D%94%EC%B9%98%EC%A6%88%EB%94%94%EB%9F%AD%EC%8A%A4%EC%84%B8%ED%8A%B8_1080x640.jpg?width=384&amp;height=273&amp;quality=100');"></div>
                     -->
                    <div class="photo"><img src="<spring:url value='/img/${dto.menuImg }'/>"  style="width : 137; height : 97;"/></div>
                    <div class="menu-name ng-binding" ng-bind-html="item.name|strip_html">${dto.menuName }</div>
                    <div ng-class="'menu-price ' + (show_menu_discount() ? 'discount_mov' : '')" class="menu-price">
                      <span ng-class="is_discount(item) ? 'text-strike' : ''" ng-bind="item.price|krw" class="ng-binding">가격 : <fmt:formatNumber value="${dto.menuPrice }" type="number"/> 원</span>
                    </div>
                  </div><!-- end ngIf: check_count(category.slug, $index) --><!-- end ngRepeat: item in category.items --><!-- ngIf: check_count(category.slug, $index) -->
                  </c:forEach>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div><!-- end ngRepeat: category in restaurant.menu -->
      </div>
    
    </div>


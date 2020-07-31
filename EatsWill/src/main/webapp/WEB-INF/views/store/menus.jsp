<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:forEach var="dto" items="${lists }" varStatus="status">
 <!-- Href trigger modal 모달 팝업창을 불러주기 위해 부트스트랩 사용 및 내용 추가수정-->

<div class="panel-collapse collapse in btn-scroll-container" ng-show="toggle_category(category)">
            <div ng-class="'panel-body' + (category.slug == 'photo_menu_items' ? ' photo-menu-container' : '')" class="panel-body">
              <div class="category-desc ng-binding ng-hide" ng-show="category.description" ng-bind-html="category.description|strip_html"></div>
              <div ng-show="category.slug=='photo_menu_items'" class="ng-hide">
        
              </div>
      
              <ul class="sub-list" ng-show="category.slug!='photo_menu_items'">
                 <!-- ngRepeat: item in category.items --><!-- ngIf: check_count(category.slug, $index) -->
                 
                 
                 
                 <li ng-repeat="item in category.items" ng-click="select_menuitem(item)" ng-if="check_count(category.slug, $index)" ng-class="get_menu_item_class(item)" 
                 	class="ng-scope photo-menu" style="padding: 0;">
                  <table>
                    <tbody><tr>
                      <td class="menu-text">
                        
                        <!-- 제목 -->
                        <div class="menu-name ng-binding" ng-bind-html="item.name|strip_html">
                        <a onclick="goArticleModal(${(pageNum-1)*4 + status.index });" data-toggle="modal" data-target="#myModal" style="color: orange;">${dto.menuName }</a>
                        </div>
                        
                        <!-- 설명 -->
                        <div class="menu-desc ng-binding" ng-show="item.description" ng-bind-html="item.description|strip_html">
                        맛있는 ${dto.menuName }
                        </div>
                        
                        
                        <!-- 가격 -->
                        <div class="menu-price">
                          <span ng-class="is_discount(item) ? 'text-strike' : ''" ng-bind="item.price|krw" class="ng-binding">${dto.menuPrice } 원</span>
                     
                        </div>
         
                      </td>
                      
                      <!-- 사진 -->
                      <td class="photo-area" ng-show="item.image">
                        <div>
                        	<img src="<spring:url value='/menuImg/${dto.menuImg }'/>" width="80px" height="80px" >
                        </div>
                      </td>
                      
                      
                    </tr>
                  </tbody></table>
                </li>
                 
        
              </ul>
            </div>
          </div>

<br/>
<!-- DB에서 메뉴들의 정보를 가져오기 위해 post로 데이터를 보냄 (menuCode) -->
<input type="hidden" value="${dto.menuCode}" id="menuCode${status.index + ((pageNum-1)*4)}"/>
<input type="hidden" name="shopCode" id="shopCode" value="${dto.shopCode}" />
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	
	$('.btn-del').click(function(){
		var count = parseInt("${menuCount}"/"${numPerPage}");
		var pageNum = "${currentPage}";
	    var btnIdx = $(this).attr('index');
	    console.log("index : " + btnIdx);
	    
	    var params = "menuCode=" + $("#menuCode" + btnIdx).val();
	    params += "&shopCode=" + $("#shopCode").val();
	    params += "&shopName=" + $("#shopName").val();
	    
	    console.log(params);
	    
	    $.ajax({
	        type:"post",
	        url:"<%=cp%>/deleteMenu.action",
	        async: false,
	        data:params,
	        success: function(args){
	        
	           $("#menuItem").html(args);
	        
	        },
	        error:function(e){
	        	alert("실패하였습니다.");
	          	console.log(request.status);
	          	console.log(request.responseText);
	          	console.log(error);
	        }
	        
	     });
	     
	     return false;
	     
	 });
	
	

</script>

   

    <c:if test="${menu != null }">
    <c:forEach var="dto" items="${menu }" varStatus="status">
      <div class="restaurant-list" style="float: left;">
        <!-- ngRepeat: restaurant in list -->
        <div class="col-sm-6 contract">
          <div class="item clearfix" style="cursor: pointer; width: 400;">
            <table>
              <tbody>
              <tr>
                <td>
                  <div ng-show="restaurant|restaurant_is_available" class="logo" ng-style="{'background-image':'url(' + get_logo_url(restaurant.logo_url) + ')'}" style="background-image: url(&quot;/media/franchise_logos/나우픽_20191220_Franchise_crop_200x200.jpg&quot;);">
                  	<c:if test="${dto.menuImg != null }">
                  	<img src="<spring:url value='/menuimg/${dto.menuImg }'/>"  style="width : 68; height : 68; max-height: max-content;"/>
                  	</c:if>
					<c:if test="${dto.menuImg == null }">
                  	<div class="logo not-available ng-binding ng-hide"><br/>이미지가<br/>없습니다.</div>
					</c:if>
                  </div>
                </td>
                <td>
                  <div class="restaurants-info">
                    <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="즉시배송마켓 나우픽-역삼점">${dto.menuName }</div>
                    <div class="stars">
                    </div>
                    <ul>
                      <li class="payment-methods ng-binding yogiseo-payment" ng-class="is_online_payment(restaurant) ? 'yogiseo-payment' : ''">메뉴 가격</li>
                      <li class="min-price ng-binding"><fmt:formatNumber value="${dto.menuPrice }" type="number"/>원</li>
                      <li class="full-w" ng-show="is_yogiyo &amp;&amp; (delivery_discount_value(restaurant) > 0 || additional_discount_value(restaurant) > 0 || restaurant.tags.length > 0 &amp;&amp; restaurant.tags.indexOf('CESCO') >= 0)">
                      	<c:if test="${dto.part == '0' }">메인메뉴</c:if><c:if test="${dto.part == '1' }">사이드메뉴</c:if>
                      </li>
                      <li class="delivery-time ng-binding" ng-show="restaurant.estimated_delivery_time">
                      <a href="#">수정</a>&nbsp;&nbsp;<a href="#" class="btn-del" index="${status.index }">삭제</a>
                      <input type="hidden" value="${dto.menuCode }" id="menuCode${status.index }">
                      <input type="hidden" value="${shopCode }" id="shopCode">
                      <input type="hidden" value="${shopName }" id="shopName">
                      </li>
                    </ul>
                  </div>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
        
      </div>
    </c:forEach>
    </c:if>
      
     
      

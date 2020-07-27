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
		
	    var btnIdx = $(this).attr('index');
	    console.log("index : " + btnIdx);
	      
	    var params = "shopCode=" + $("#shopCode" + btnIdx).val();
	      
	    console.log(params);
	      
	    $.ajax({
	        type:"post",
	        url:"<%=cp%>/deleteStore.action",
	        async: false,
	        data:params,
	        success: function(args){
	        	  
	           $("#storeItem").html(args);
	             
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
   

    <c:if test="${lists != null }">
    <c:forEach var="dto" items="${lists }" varStatus="status">
      <div class="restaurant-list" style="float: left;">
        <!-- ngRepeat: restaurant in list -->
        <div class="col-sm-6 contract">
          <div class="item clearfix" style="cursor: pointer; width: 400;">
            <table>
              <tbody>
              <tr>
                <td>
                  <div ng-show="restaurant|restaurant_is_available" class="logo" ng-style="{'background-image':'url(' + get_logo_url(restaurant.logo_url) + ')'}" style="background-image: url(&quot;/media/franchise_logos/나우픽_20191220_Franchise_crop_200x200.jpg&quot;);">
                  	<c:if test="${dto.shopImg != null }">
                  	<img src="<spring:url value='/shopImg/${dto.shopImg }'/>"  style="width : 68; height : 68; max-height: max-content;"/>
                  	</c:if>
					<c:if test="${dto.shopImg == null }">
                  	<div class="logo not-available ng-binding ng-hide"><br/>이미지가<br/>없습니다.</div>
					</c:if>                  	
                  </div>
                </td>
                <td>
                  <div class="restaurants-info">
                    <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="즉시배송마켓 나우픽-역삼점">${dto.shopName }</div>
                    <div class="stars">
                    </div>
                    <ul>
                      <li class="payment-methods ng-binding yogiseo-payment" ng-class="is_online_payment(restaurant) ? 'yogiseo-payment' : ''">
                      <c:if test="${dto.category == 'ck' }">치킨</c:if>
                      <c:if test="${dto.category == 'py' }">피자</c:if>
                      <c:if test="${dto.category == 'kr' }">한식</c:if>
                      <c:if test="${dto.category == 'bs' }">분식</c:if>
                      <c:if test="${dto.category == 'ch' }">중식</c:if>
                      <c:if test="${dto.category == 'jp' }">일식</c:if>
                      </li>
                      <li class="min-price ng-binding">${dto.shopAddr }</li>
                      <li class="full-w" ng-show="is_yogiyo &amp;&amp; (delivery_discount_value(restaurant) > 0 || additional_discount_value(restaurant) > 0 || restaurant.tags.length > 0 &amp;&amp; restaurant.tags.indexOf('CESCO') >= 0)">
                      
                      </li>
                      <li class="delivery-time ng-binding" ng-show="restaurant.estimated_delivery_time">
                      <!-- <a href="#">수정</a>&nbsp;&nbsp; --><a href="#" class="btn-del" index="${status.index  }">삭제</a>
                      <input type="hidden" value="${dto.shopCode }" id="shopCode${status.index }">
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
      
     
      
    
    
    


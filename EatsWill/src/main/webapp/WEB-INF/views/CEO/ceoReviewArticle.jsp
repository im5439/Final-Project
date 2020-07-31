<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<script type="text/javascript">

function modal(btnIdx, pageNum ) {
    
    var params = "renum=" + $("#renum" + btnIdx).val();
    params += "&shopCode=" + $("#shopCode").val();
    //params += "&shopName=" + $("#shopName").val();
    params += "&pageNum=" + pageNum;
    params += "&end=" + "${end}";

    	    
    console.log("modal");
    console.log('btnIdx====> ' + btnIdx);
    console.log('params====> ' + params);

    $.ajax({
        type:"post",
        url:"<%=cp%>/reviewModal.action",
        async: false,
        data:params,
        success: function(args){
        
           $("#reviewModal").html(args);
        
        },
        error:function(e){
        	alert("실패하였습니다.??");
          	console.log(request.status);
          	console.log(request.responseText);
          	console.log(error);
        }
        
     });
     
     return false;
 }

function delConfirm(){
	var delConfirm = confirm('정말로 삭제하시겠습니까?');
	if (delConfirm)
		return;
	else 
		return true;
}

function deleteItem(btnIdx, pageNum ) {
    
    var params = "renum=" + $("#renum" + btnIdx).val();
    params += "&shopCode=" + $("#shopCode").val();
    //params += "&shopName=" + $("#shopName").val();
    params += "&pageNum=" + pageNum;

    console.log("delete");
    console.log('btnIdx====> ' + btnIdx);
    console.log('params====> ' + params);

    $.ajax({
        type:"post",
        url:"<%=cp%>/ajaxCeoReviewDel.action",
        async: false,
        data:params,
        beforeSend : delConfirm(),
        success: function(args){
        
           $("#ceoReviewArticle").html(args);
        
        },
        error:function(e){
        	console.log("실패하였습니다.");
          	console.log(request.status);
          	console.log(request.responseText);
          	console.log(error);
        }
        
     });
     
     return false;
 }



</script>

		<c:forEach var="dto" items="${reviewList }" varStatus="status">
	        <!-- ngRepeat: review in restaurant.reviews -->
	        <!-- end ngRepeat: review in restaurant.reviews -->
	        <li class="list-group-item star-point ng-scope" ng-repeat="review in restaurant.reviews" on-finish-render="scrollCartArea()" id="ceoreply">
	          <div>
	            <span ng-show="review.phone" class="review-id ng-binding">${dto.userId }</span>
	            <span ng-bind="review.time|since" class="review-time ng-binding">&nbsp;&nbsp; 주문일시 : ${dto.reCreated }</span>
		        
		        <c:if test="${dto.ceoContent == null }">
		        <a href="#ex1" onClick="modal(${(currentPage-1)*4 + status.index }, ${currentPage})" rel="modal:open" class="btn-modal" index="${(currentPage-1)*4 + status.index }" style="padding-left: 553px;">답글</a>
		        </c:if>
				<input type="hidden" value="${dto.renum }" id="renum${(currentPage-1)*4 + status.index }"/>
	          </div>
	          
	          <div>
	            <div class="star-point">
	              <span class="total">
	              <c:forEach begin="0" end="${dto.reScore - 1 }">
	                <span class="full ng-scope" ng-repeat="i in review.rating|number_to_array track by $index">★</span>
	              </c:forEach>
	              <c:if test="${dto.reScore < 5 }">
	              <c:forEach begin="0" end="${4 - dto.reScore }">
	                <span class="empty ng-scope" ng-repeat="i in (5.9 - (review.rating|number:1))|number_to_array track by $index">★</span>
	              </c:forEach>
	              </c:if>
	              </span>
	              <span class="category" ng-show="review.rating_taste > 0 || review.rating_quantity > 0 || review.rating_delivery > 0">
	                <span class="category-tit" ng-show="review.rating_taste > 0"></span>
	                <span class="full" ng-show="review.rating_taste > 0">★</span>
	                
	                <span class="points ng-binding" ng-show="review.rating_taste > 0">${dto.reScore }</span>
	                <!-- <span class="category-tit" ng-show="review.rating_quantity > 0">양</span>
	                <span class="full" ng-show="review.rating_quantity > 0">★</span>
	                <span class="points ng-binding" ng-show="review.rating_quantity > 0">5</span>
	                <span class="category-tit" ng-show="review.rating_delivery > 0">배달</span>
	                <span class="full" ng-show="review.rating_delivery > 0">★</span>
	                <span class="points ng-binding" ng-show="review.rating_delivery > 0">5</span> -->
	              </span>
	            </div>
	          </div>
	
	          <!-- one image layout -->
	          <!-- ngIf: review.review_images.length == 1 -->
	          <!-- two image layout -->
	          <!-- ngIf: review.review_images.length == 2 -->
	          <table class="info-images half ng-scope" ng-if="review.review_images.length == 2" style="width: 627.778px;">
	            <tbody><tr>
	              <td>
	              <c:if test="${dto.reImg != null }">
	                <!-- ngRepeat: img in review.review_images -->
	                <div class="info ng-scope" ng-repeat="img in review.review_images" style="width: 312px; height: 312px; margin-right: 1px;">
	                  <img class="ng-isolate-scope" src="<spring:url value='/reImg/${dto.reImg }'/>" style="visibility: visible; width: 312px; height: 448.988px; left: 0px; top: -68.5px;">
	                </div><!-- end ngRepeat: img in review.review_images -->
	              </c:if>
	              </td>
	            </tr>
	          </tbody>
	          </table><!-- end ngIf: review.review_images.length == 2 -->
	          <!-- three image layout -->
	          <!-- ngIf: review.review_images.length == 3 -->
	
	          <div class="order-items default ng-binding" ng-click="show_review_menu($event)">
	          <c:forEach var="dedto" items="${dto.orderDetail }">
	            	${dedto.menuName }/${dedto.oqty } &nbsp;&nbsp;
	          </c:forEach>
	          </div>
	
	          <p ng-show="review.comment" ng-bind-html="review.comment|strip_html" class="ng-binding"> ${dto.reContent } </p>
	
			<c:if test="${dto.ceoContent != null }">
	          <!-- ngIf: !!review.owner_reply -->
	          <div class="review-answer ng-scope" ng-if="!!review.owner_reply">
	            <div>
	              <span class="owner-review-id">사장님</span>
	              <!-- <span ng-bind="review.owner_reply.created_at|since" class="review-time ng-binding">어제</span> -->
	              <%-- <a class="btn-del" index2="${status.index }">삭제</a> --%>
	              <a onClick="deleteItem(${(currentPage-1)*4 + status.index }, ${currentPage})" class="btn-del" index2="${(currentPage-1)*4 + status.index }" style="padding-left: 692px;">삭제</a>
	            </div>
	
	            <p ng-bind-html="review.owner_reply.comment|strip_html" class="ng-binding">
	            ${dto.ceoContent }
				</p>
	          </div><!-- end ngIf: !!review.owner_reply -->
			</c:if>
	        </li><!-- end ngRepeat: review in restaurant.reviews -->
	        <!-- end ngRepeat: review in restaurant.reviews -->
	   </c:forEach>
		      
	      	
	      	
								
		<span id="reviewModal" style="display: none"></span><!-- reviewModal.jsp 불러옴 -->
			
		
				
					   


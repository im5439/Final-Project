<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
@charset "UTF-8";

[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak, .ng-hide:not(.ng-hide-animate) {
	display: none !important;
}

ng\:form {
	display: block;
}

.star-rating {
	width: 80px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 13px;
	overflow: hidden;
	background: url(/eatswill/resources/images/star1.png) no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}
</style>




<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<script type="text/javascript"
	src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>



<script type="text/javascript" src="/eatswill/resources/data/js/jquery-ui.js"></script>

<!-- 리뷰삭제 아작스  -->
<script type="text/javascript">


	function myReviewDel(pIndx) {
		var btnIdx = pIndx;                      
		
		var params = "reNum=" + $("#myReNum" + btnIdx).val();
	
		$.ajax({
			
			type:"POST",
			url:"reviewDelete.action",
			data:params,
			success:function(args){
				
				$("#myReview").html(args);
			
			},
			error:function(e){
				alert(e.responseText);
			}
		});
		
				
			}

</script>


	<div ng-show="active_tab == &quot;review&quot;" align="left">
	<form action="" method="post" name="myReviewForm">

		<ul id="review" class="list-group review-list">

			<!-- ngRepeat: review in restaurant.reviews -->
			<c:forEach var="dto" items="${lists}" varStatus="status">
				<li class="list-group-item star-point ng-scope"
					ng-repeat="review in restaurant.reviews"
					on-finish-render="scrollCartArea()" style="text-align: left;">

					<div style="text-align: left;">
						<small>${dto.orderDate }</small><br> <span
							ng-show="review.phone" class="review-id ng-binding"><a
							href="${storeUrl}?shopCode=${dto.shopCode}&ceoId=${dto.ceoId}">${dto.shopName }
								></a> </span> <img src="resources/img/delete.png" width="20px" height="20px" 
        id="deleteImg1" onclick="myReviewDel(${status.index});"> 
							<input type="hidden" value="${dto.reNum }" name="reNum" id="myReNum${status.index}">
					</div> <!--   <span ng-bind="review.time|since" class="review-time ng-binding" style="text-align: left"><span class="star-rating" style="text-align: left"><span style ="width:${dto.reStar}%; text-align: left"></span></span>(${dto.reScore})</span> -->

					<div>
						<div class="star-point">
							<span class="total"> <c:forEach begin="0"
									end="${dto.reScore - 1 }">
									<span class="full ng-scope"
										ng-repeat="i in review.rating|number_to_array track by $index">★</span>
								</c:forEach> <c:if test="${dto.reScore < 5 }">
									<c:forEach begin="0" end="${4 - dto.reScore }">
										<span class="empty ng-scope"
											ng-repeat="i in (5.9 - (review.rating|number:1))|number_to_array track by $index">★</span>
									</c:forEach>
								</c:if>
							</span>

						</div>
					</div>

					<div class="order-items default ng-binding"
						ng-click="show_review_menu($event)" style="text-align: left;">${dto.menuName}
					</div> <c:if test="${dto.reImg != null }">
						<img src="http://localhost:8080/reImg/${dto.reImg }"
							align="center" width="300" height="300">
					</c:if>
					<p ng-show="review.comment"
						ng-bind-html="review.comment|strip_html" class="ng-binding"
						style="text-align: left;">${dto.reContent }</p> <c:if
						test="${dto.ceoContent != null }">
						<!-- ngIf: !!review.owner_reply -->
						<!-- 사장님 시작 -->
						<div class="review-answer ng-scope" ng-if="!!review.owner_reply"
							style="text-align: left;">

							<div style="text-align: left;">
								<span class="owner-review-id">사장님</span>
							</div>

							<p ng-bind-html="review.owner_reply.comment|strip_html"
								class="ng-binding" style="text-align: left;">${dto.ceoContent }</p>

						</div>
						<!-- 사장님 끝 -->
					</c:if>
				</li>
			</c:forEach>

		</ul>
		</form>
	</div>

</body>
</html>
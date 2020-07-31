<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!-- css---------------------------------------------------------- -->


<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<script type="text/javascript"
	src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>


<!--------------------------------------------------------------------------------------- -->



<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css">
<link rel="stylesheet" type="text/css"
	href="/eatswill/resources/assets/css/myg.css">
<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/ko/myg_net.css">

<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
	src="//script.gmarket.co.kr/mobile/js/common/kr/util/viewability.js"></script>
<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script type="text/javascript"
	src="http://www.gmarket.co.kr/challenge/neo_include/favicon_net.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/json2.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/jquery.popupwindow.js"></script>
<script type="text/javascript" src="/Scripts/Common.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/fnp/desktop-layout.js"></script>
<script type="text/javascript" src="/Scripts/ScriptEventErrorHandler.js"></script>

<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/gmkt.js?dummy=2012091327262"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/dimmed.js"></script>
<script type="text/javascript"
	src="http://myg.gmarket.co.kr/Scripts/MyGMenu.js?dummy=201702141631"></script>
<script type="text/javascript" defer="defer"
	src="http://script.gmarket.co.kr/_Net/js/impression.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/CommonHeader.js"></script>
<script type="text/javascript"
	src="/Scripts/ContractCommon.js?ver=20200319"></script>
<script type="text/javascript"
	src="/Scripts/Home/Default.js?ver=201811271415"></script>
<script type="text/javascript" src="/Scripts/jquery.unobtrusive-ajax.js"></script>
<script type="text/javascript" src="/Scripts/modal.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/MygSmileClubBanner.js"></script>
<script type="text/javascript"
	src="http://script.gmarket.co.kr/_Net/js/MygSmileStamp.js"></script>
	
<script type="text/javascript">

	function orderCancel(){
		
		var delConfirm = confirm('정말로 취소하시겠습니까?');
		if (delConfirm) {
			$('#orderForm').submit();
		}	
	}

</script>


	
		<div class="col-sm-8" style="width: 1000px;padding-left: 0px;padding-right: 20px;">

			<div ng-show="active_tab == &quot;review&quot;" class="">

				<ul id="review" class="list-group review-list">
					<li class="list-group-item star-point ng-scope"
						ng-repeat="review in restaurant.reviews"
						on-finish-render="scrollCartArea()">
						<div class="b_ta_info">
							<table width="100%" border="1" class="b_table_grey">
								<thead>
									<tr style="text-align-last: center;">
										<th width="350" colspan="2" style="text-align: center;">상품정보</th>
										<th width="140">상태</th>
										<th width="108">확인/신청</th>
									</tr>
								</thead>

								<c:forEach var="dto" items="${lists}">

									<tbody id="orderList">
										<tr>
											<td colspan="4" style="padding: 0;"><hr></td>
										</tr>
										<tr cno="3273614152" ctype="G" column="4" class="first">

											<td class="first_cell" rowspan="1">
												<div class="td_detail">

													<img src="<spring:url value='/shopImg/${dto.shopImg }'/>"
														width="90" height="90">
												</div>
											</td>
											<td style="width: 100; padding: 0; vertical-align: middle">
												<div class="td_info">
													<p>
														${dto.orderDate } <small>[${dto.orderCode}]</small>
													</p>
													<br>
													<ul style="text-align-last: left">
														<li class="seller_info"><em></em> <a
															href="${storeUrl}?shopCode=${dto.shopCode}&ceoId=${dto.ceoId}">${dto.shopName }</a></li>
														<li class="tit_info" style="color: orange">${dto.menuName }</li>
														<c:if test="${dto.request != null }">
															<li class="seller_info">요청사항 : ${dto.request }</li>
														</c:if>
														<li class="price"><strong>${dto.oAmount }</strong>원</li>
													</ul>
												</div>
											</td>
											<td class="first_cell">
												<div class="td_status">

													<c:choose>
														<c:when test="${dto.orderStatus == '주문취소' }">
															<span><b style="color: red">${dto.orderStatus }</b></span>
														</c:when>
														<c:otherwise>
															<span><b style="color: blue">${dto.orderStatus }</b></span>
														</c:otherwise>
													</c:choose>
												</div>
											</td>
											<td><c:choose>
													<c:when test="${dto.orderStatus == '주문완료' }">
														<span class="btn_bg btn_w81_2">
															<a href="#" onclick="orderCancel();">주문 취소</a></span>
															<form method="POST" action="myOrderCancel.action" id="orderForm">
																<input type="hidden" name="orderCode" value="${dto.orderCode}"/>
															</form>
													</c:when>
													<c:when test="${dto.orderStatus == '배달완료' }">
														<c:if test="${dto.cnt == 0 }">
															<span class="btn_bg btn_w81_2"> 
																<a href="${reviewUrl }orderCode=${dto.orderCode}">리뷰 쓰기</a>
															</span>
														</c:if> 
													</c:when>
													<c:otherwise></c:otherwise>
												</c:choose></td>
										</tr>

									</tbody>
								</c:forEach>
							</table>
						</div>
					</li>
				</ul>
			</div>
		</div>
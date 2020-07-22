<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navigation ver-pc" ng-class="header_show()"
	style="background-color: #FDF5E6;">
	<!--  색상수정예정예정 -->
	<div class="app-down-banner clearfix ng-hide"
		ng-show="is_show_promotion_banner()">
		<div class="landing-banner">
			<div class="landing-header"></div>


		</div>
	</div>
	<!-- ----------------------------------------------------------------------------------------- -->

	<nav style="height: auto;">
		<ul>
			<li><a href="#menu">Menu</a></li>
		</ul>
	</nav>

	<nav id="menu" style="font-size: 1.2em;">
		<h2 style="font-size: 30px;">Menu</h2>
		<br /> <input type="hidden" id="sessionId"
			value="${sessionScope.customInfo.id }" />
		<ul>
			<c:choose>
				<c:when test="${empty sessionScope.customInfo.id }">
					<li><a
						href="${pageContext.request.contextPath}/login.action">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li><font color="#F2849E">${sessionScope.customInfo.name }</font>
						님 환영합니다.
						<p style="text-align: left">
							전화번호 : ${sessionScope.customInfo.tel }</br> 포인트 :
							${sessionScope.customInfo.point }
						</p> <a href="logout.action" data-nethru_clcode="A000012">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="updateInfo.action">내정보수정</a></li>
			<li><a id="basket">장바구니</a></li>
			<li><a href="myOrder.action">주문내역</a></li>
			<li><a href="heartStore.action">찜 목록</a></li>
			<li><a href="myReview.action">마이 리뷰</a></li>
		</ul>
		<form method="POST" action="" name="infoForm">
			<div id="myInfo"></div>
		</form>
	</nav>
	<!-- ----------------------------------------------------------------------------------------- -->
	<div class="nav-top clearfix"
		ng-hide="$location.path() == '/login/' &amp;&amp; is_mobile_device">
		<a href="main.action" style="text-decoration: none;"><img
			alt="" src="/eatswill/resources/img/icon3.png" width="125px"
			height="40px" style="margin: 20px 10px;"></a>
		<%--       <h1 class="logor pull-left" ng-click="<%=cp%>/main.action" ></h1>  --%>
		<!-- 로고로고 -->
		<div id="cart" class="pull-right">
			<span class="gps-status ng-binding"
				ng-show="check_show_location_button()"
				ng-click="toggle_location_block()" ng-bind="current_location"></span>
			<a class="visible-xs" ng-show="check_show_location_button()"
				ng-click="toggle_location_block()"> <span
				class="ico-set-pic"></span>
			</a> <a id="button-cart" href="" class="visible-xs ng-hide"
				ng-click="click_cart_button()"
				ng-show="check_show_cart_button()"> <span class="ico-cart"></span>
				<span class="badge ng-binding"
				ng-bind="global_cart.get_amount()">0</span>
			</a>
			<form method="POST" action="" name="cartForm">
				<%-- <button type="button" class="btn btn-login ng-binding" 
				ng-click="login()"
				ng-bind-html="check_login() ? '로그아웃' : '로그인 <span>|</span> 회원가입'"
				ng-show="is_yogiyo &amp;&amp; !session_storage.oauth_next"> --%>




				<!-- 상단 버튼 부분 ----------------------------------------------------------------------------->

				<c:choose>
					<c:when test="${empty sessionScope.customInfo.id }">
						<button type="button"
							class="button button--ujarak button--border-thin button--text-thick"
							style="width: 95px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 1.2em; font-weight: bold; font-family: 'Raleway', Arial, sans-serif;"
							onclick="javascript:location.href='login.action';">Login</button>
						<button type="button"
							class="button button--ujarak button--border-thin button--text-thick"
							style="width: 95px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 1.2em; font-weight: bold"
							onclick="javascript:location.href='signup.action';">회원가입</button>
					</c:when>
					<c:otherwise>
						<button type="button"
							class="button button--ujarak button--border-thin button--text-thick"
							style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 1.2em; font-weight: bold"
							onclick="javascript:location.href='logout.action';">Logout</button>
					</c:otherwise>
				</c:choose>

				<!-- <button type="button"
				class="btn btn-warning hidden-xs ng-binding"
				ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
				ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;" style="font-size: 1.2em;background-color: red;">주문표(0)</button> -->

				<button type="button"
					class="button button--ujarak button--border-thin button--text-thick"
					id="cartList"
					style="width: 150px; height: 38px; font-size: 1.2em; background-color: #FDCD8C; border-color: #FDCD8C; font-weight: bold;">주문표(0)</button>
				<div id="cartInfo"></div>
			</form>

			<!--------------------------------------------------------------------------------------------------------------------------->
		</div>
	</div>
</div>
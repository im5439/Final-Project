<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
@charset "UTF-8";

[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak, .ng-hide:not(.ng-hide-animate) {
	display: none !important;
}

ng\:form {
	display: block;
}

</style>

<meta charset="utf-8">

	<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
	
	<link rel="stylesheet" href="<%=cp%>/resources/data/css/jquery-ui.css" type="text/css" />
	<script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-ui.js"></script>

   <script type="text/javascript" src="/eatswill/resources/assets/js/cart.js"></script>
   <script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<link rel="stylesheet" href="/eatswill/resources/assets/css/app.css"
	type="text/css" />

<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">

<link rel="stylesheet"
	href="/eatswill/resources/assets/ButtonStylesInspiration/css/buttons.css" />
<link rel="stylesheet"
	href="/eatswill/resources/assets/ButtonStylesInspiration/css/normalize.css" />
<link rel="stylesheet"
	href="/eatswill/resources/assets/ButtonStylesInspiration/css/vicons-font.css" />
<link rel="stylesheet"
	href="/eatswill/resources/assets/css/bootstrap.min.css" />
<script type="text/javascript"
	src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>		

<title ng-if="! page.title" class="ng-scope">다함께 잇츠윌</title>
<link rel="apple-touch-icon-precomposed" href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/eatswill/resources/images/sicon.jpg">
<link rel="icon" type="image/png" href="/eatswill/resources/images/sicon.jpg">

<script type="text/javascript">

   $(function(){
      $("#container").tabs();
   });
   
   
   $(function(){
	   myOrder();
   }); 
   

   $(document).ready(function(){
	   var sBtn = $("ul > li");
	   
      $("#myOrderB").click(function(){ 
    	  sBtn.removeClass("active");    

         $("#myOrderLi").attr('class','active');
         $(function(){
        	 myOrder();
         });  
         
         
      });
      

      $("#myReviewB").click(function(){ 
    	  sBtn.removeClass("active");  
          $("#myReviewLi").attr('class','active');
    	  $(function(){
        	 
        	 myReview();
         }); 
             
            
      });
         
      
      $("#myStoreB").click(function(){ 
    	  sBtn.removeClass("active");  
          $("#myStoreLi").attr('class','active');
         $(function(){
            myStore();
         }); 
          
      });
      
      
      
      
   });
   
   
   function myOrder(){
      
      var url = "<%=cp%>/myOrder.action";
      
      $.post(url,function(args){
         $("#myOrder").html(args);
      });
      
         $("#myOrder").show();
         $("#myReview").hide();
         $("#myStore").hide();
         
      
   }
   
   function myReview(){
      
      var url = "<%=cp%>/myReview.action";
      
      $.post(url,function(args){
         $("#myReview").html(args);
      });
      
         $("#myReview").show();
         $("#myOrder").hide();
         $("#myStore").hide();
      
   }
   
   function myStore(){
      
      var url = "<%=cp%>/heartStore.action";
      
      $.post(url,function(args){
         $("#myStore").html(args);
      });
      
      $("#myStore").show();
      $("#myOrder").hide();
      $("#myReview").hide();
      
   }
   
   // 리뷰 삭제
   $(function(){
		
		reviewDelPage(); 
			
	}); 

	function reviewDelPage() {
		
		var url = "<%=cp%>/myReview.action";
		var params = "reNum=" + $("#myReNum").val();
		
		$.post(url,params,function(args){
			$("#myReview").html(args);
		});
		
		$("#myReview").hide();
		
	}
   
</script>


</head>

<body class="asp_check" style="margin-top: 0px;">


	<div yogiyo-header="">
		<div id="header" class="header">
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

				<c:choose>
					<c:when test="${!empty sessionScope.customInfo.id }">
						<nav style="height: auto;font-size: 12px;">
							<ul>
								<li><a href="#menu">Menu</a></li>
							</ul>
						</nav>
		
						<nav id="menu" style="font-size: 14.4px;">
							<h2 style="font-size: 29px; margin-top: 0; font-weight: bold;">Menu</h2>
							<br/>
							<input type="hidden" id="sessionId" value="${sessionScope.customInfo.id }"/>
							<ul>
								<li>
									<font color="#F2849E">${sessionScope.customInfo.name }</font>님 환영합니다.
									<p style="text-align: left">
										전화번호 : ${sessionScope.customInfo.tel }</br> 포인트 :
										${sessionScope.customInfo.point }
									</p> 
									<a href="#" onclick="logout();" data-nethru_clcode="A000012">로그아웃</a>
								</li>
								<li><a href="updateInfo.action">내정보수정</a></li>
								<li><a href="myPage.action">마이 페이지</a></li>	
								<li><a href="#" id="basket">장바구니</a></li>		
							</ul>
							<form method="POST" action="" name="infoForm">
								<div id="myInfo"></div>
							</form>
						</nav>
					</c:when>
				</c:choose>
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
							ng-click="toggle_location_block()"> <span class="ico-set-pic"></span>
						</a> <a id="button-cart" href="" class="visible-xs ng-hide"
							ng-click="click_cart_button()" ng-show="check_show_cart_button()">
							<span class="ico-cart"></span> <span class="badge ng-binding"
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
										style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 14.4px; font-weight: bold; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
										onclick="javascript:location.href='login.action';">로그인</button>
									<button type="button"
										class="button button--ujarak button--border-thin button--text-thick"
										style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 14.4px; font-weight: bold; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
										onclick="javascript:location.href='signup.action';">회원가입</button>
								</c:when>
								<c:otherwise>
									<button type="button"
										class="button button--ujarak button--border-thin button--text-thick"
										style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 14.4px; font-weight: bold; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
										onclick="logout();">로그아웃</button>
								</c:otherwise>
							</c:choose>

							<!-- <button type="button"
						class="btn btn-warning hidden-xs ng-binding"
						ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
						ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;" style="font-size: 1.2em;background-color: red;">주문표(0)</button> -->

							<button type="button"
								class="button button--ujarak button--border-thin button--text-thick"
								id="cartList"
								style="width: 150px; height: 38px; font-size: 14.4px; background-color: #FDCD8C; border-color: #FDCD8C; font-weight: bold; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';">주문표(0)</button>
							<div id="cartInfo"></div>
						</form>

						<!--------------------------------------------------------------------------------------------------------------------------->
					</div>
				</div>

				<!-- 시연 - 슬라이드쇼 -->
				<div class="container"></div>
				<div id="demo" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<!-- 슬라이드 쇼 -->
						<div class="carousel-item active">
							<img class="d-block w-100"
								src="/eatswill/resources/img/엽떡배너_1.jpg" alt="First slide"
								style="width: 100px; height: 300px;">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="/eatswill/resources/img/생일배너_1.jpg" alt="Second slide"
								style="width: 100px; height: 300px;">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="/eatswill/resources/img/냉면배너_1.jpg" alt="Third slide"
								style="width: 100px; height: 300px;">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="/eatswill/resources/img/마라배너_1.jpg" alt="Fourth slide"
								style="width: 100px; height: 300px;">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="/eatswill/resources/img/본죽배너_1.jpg" alt="Fifth slide"
								style="width: 100px; height: 300px;">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="/eatswill/resources/img/타임배너_1.jpg" alt="Sixth slide"
								style="width: 100px; height: 300px;">
						</div>
						<!-- / 슬라이드 쇼 끝 -->
						<!-- 왼쪽 오른쪽 화살표 버튼 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<!-- <span>Previous</span> -->
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<!-- <span>Next</span> -->
						</a>
						<!-- / 화살표 버튼 끝 -->
					</div>
				</div>
				
				<!-- 시연 - 검색 -->
				<form method="POST" action="" name="findAddr">
					<div class="input-group"
						style="width: 100%; height: 85px; background-image: url('/eatswill/resources/img/background.jpg'); align-content: center; place-content: center; display: flex;">
						&nbsp;
						<select id="searchKey" name="searchKey" class="form-control ng-pristine ng-scope ng-valid-minlength ng-valid ng-valid-required ng-touched"
							style="height: 3.3em; width: 7em; font-size: 9pt; color: #6C757D; text-align-last: center; 
							flex: inherit; -webkit-appearance: listbox; border-radius: 10px 10px 10px 10px;
							font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,  'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji',  'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';">
							<option>강남구</option>
							<option>송파구</option>
							<option>강동구</option>				
						</select>
						<input type="search" id="searchValue" name="searchValue"
							class="form-control ng-pristine ng-scope ng-valid-minlength ng-valid ng-valid-required ng-touched"
							placeholder="건물명, 도로명, 지번으로 검색하세요." ng-minlength="1"
							ng-required="true"
							ng-model="session_storage.location.address_input" bs-dropdown=""
							style="height: 3.3em; width: 35em; left: 1em; font-size: 9pt; flex: inherit; border-radius: 10px 10px 10px 10px;
							font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,  'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji',  'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';">
						<span id="button_search_address"
							class="input-group-btn always-show-search-buttons">
							<button
								class="btn-search-location-cancel btn-search-location btn btn-default ng-hide"
								type="button" ng-click="clear_search_location_input($event)"
								ng-show="is_shown_location_search.v">
								<span class="searchfield-cancel-button">&nbsp;</span>
							</button>
							<button class="btn btn-default ico-pick" type="button"
								ng-click="select_location($event)"
								style="background-color: #FE642E; left: 2em; font-size: 10pt; border-radius: 20px 20px 20px 20px;
								font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,  'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji',  'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';">검색</button>
						</span>
					</div>
				</form>
			</div>
		</div>


		<div id="quick-btn" class="hide-btn">
			<a ng-click="click_cart_button()" id="button-cart-btm" href=""
				class="btn-cart ng-hide" ng-show="check_show_cart_button('quick')"><span
				class="badge ng-binding" ng-bind="global_cart.get_amount()">0</span></a>
			<a ng-click="scrollTop($event)" class="btn-top">top</a>
		</div>

	</div>
	<div id="messages" class="messages"></div>
	<div id="messages_bottom" class="messages messages-bottom"></div>
	<div ng-show="on_loading" id="spinner" style="" class="ng-hide">
		<div></div>
		<span class="message"></span>
	</div>

	<!-- ngView:  -->
	<div id="content" class="container-fluid ng-scope" ng-view=""
		style="border-top: 1px solid #d0d0d0; padding-top: 98px; padding-bottom: 7em; text-align: -webkit-center;">
		<div class="restaurant-category-menu ng-scope ng-hide"
			ng-show="!is_mobile_width &amp;&amp; !is_mobile_width_for_category">
			<div yogiyo-restaurant-category="">
				<div class="sms" ng-show="check_show_category_block()"></div>

			</div>
		</div>

		<div class="restaurant-detail row ng-scope"
			style="place-content: center;">

			<div class="col-sm-8" style="width: 1000px">
				<div id="banner_11st" class="banner_11st"></div>
<div id="container">
				<ul class="nav nav-tabs restaurant-tab" style="font-size: 11pt;">
					<li
						ng-class="! active_tab || active_tab == &quot;menu&quot; ? &quot;active&quot; : &quot;&quot;"
						 id="myOrderLi" class="active"><a ng-click="toggle_tab(&quot;menu&quot;)"
						data-toggle="tab" href="#f1" id="myOrderB">나의 주문 목록<span
							class="ng-binding"> </span></a></li>
					<li
						ng-class="active_tab == &quot;review&quot; ? &quot;active&quot; : &quot;&quot;" 
						id="myReviewLi">
						<a ng-click="toggle_tab(&quot;review&quot;)" data-toggle="tab"
						href="#f2" id="myReviewB">나의 리뷰<span class="ng-binding">
						</span></a>
					</li>
					<li
						ng-class="active_tab == &quot;info&quot; ? &quot;active&quot; : &quot;&quot;"
						id="myStoreLi">
						<a ng-click="toggle_tab(&quot;info&quot;)" data-toggle="tab"
						href="#f3" id="myStoreB">나의 관심 매장</a>
					</li>
				</ul>
				<div id="f1">
					<span id="myOrder" style="display: none;"></span>
				</div>

				<div id="f2">
					<span id="myReview" style="display: none;"></span>
				</div>

				<div id="f3">
					<span id="myStore" style="display: none;"></span>
				</div>
</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<!-- Scripts -->
	<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
	<script src="/eatswill/resources/assets/js/skel.min.js"></script>
	<script src="/eatswill/resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/eatswill/resources/assets/js/main.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script> $('.carousel').carousel({ interval: 1200 //기본 5초 }) </script>

	<!-- 카카오톡 채팅 시작 -->
	<div style="position: fixed; right: 10px; bottom: 10px;"
		class="talk_image">
		<a id="channel-chat-button" onclick="void chatChannel();">
			<img src="/eatswill/resources/img/consult_small_yellow_pc1.png"
			width="70" height="70" />
		</a>
		<script type="text/javascript">
           // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
           // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
           Kakao.init('c089c8172def97eb00c07217cae17495')
           function chatChannel() {
             Kakao.Channel.chat({
               channelPublicId: '_Yfaxoxb',
             })
           }
         </script>
	</div>
	<!-- 카카오톡 채팅 끝 -->

</body>
</html>
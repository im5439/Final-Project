<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 쓰기</title>
<style type="text/css">
@import
   url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label {
   margin: 0;
   padding: 0;
}

body {
   margin: 20px;
}

h1 {
   font-size: 1.5em;
   margin: 10px;
}

/****** Style Star Rating Widget *****/
.rating {
   border: none;
   float: left;
}

.rating>input {
   display: none;
}

.rating>label:before {
   margin: 5px;
   font-size: 1.25em;
   font-family: FontAwesome;
   display: inline-block;
   content: "\f005";
}

.rating>label {
   color: #ddd;
   float: right;
}

/***** CSS Magic to Highlight Stars on Hover *****/
.rating>input:checked ~ label, /* show gold star when clicked */ .rating:not(:checked)>label:hover,
   /* hover current star */ .rating:not(:checked)>label:hover ~ label {
   color: #FFD700;
} /* hover previous stars in list */
.rating>input:checked+label:hover,
   /* hover current star when changing rating */ .rating>input:checked ~
   label:hover, .rating>label:hover ~ input:checked ~ label,
   /* lighten current selection */ .rating>input:checked ~ label:hover ~
   label {
   color: #FFED85;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description">
<meta name="keywords">

<meta name="theme-color" content="#DC1400">
<meta property="og:title" content="lets eats will !">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:description" content="">
<!-- ngIf: ! page.title -->
<title ng-if="! page.title" class="ng-scope">리뷰 쓰기</title>
<!-- end ngIf: ! page.title -->
<!-- ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="icon" type="image/png"
	href="/eatswill/resources/images/sicon.jpg">
	
<link rel="stylesheet" href="/eatswill/resources/assets/css/nav.css" />
<link rel="stylesheet" href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/buttons.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/normalize.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/ButtonStylesInspiration/css/vicons-font.css" />
<link rel="stylesheet" href="/eatswill/resources/assets/css/bootstrap.min.css" />

<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/eatswill/resources/assets/js/cart.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script async=""
   src="//script.gmarket.co.kr/mobile/js/common/kr/util/viewability.js"></script>
<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
   src="//montelena.gmarket.co.kr/montelena.js?path=https://bamboo.gmarket.co.kr/Feedback/Premium/WritePremiumReview?gd_no=1775279016&amp;contr_no=3273614152&amp;gd_nm=%uC2E0%uC138%uACC4%uAC15%uB0A8%uC810%uB098%uC2A4%20%uC18C%uD504%uD2B8%20%uB9E4%uD2B8%20%uCEF4%uD50C%uB9AC%uD2B8%20%uCEE8%uC2E4%uB7EC&amp;maker_nm=%uAE30%uD0C0&amp;delivery_yn=Y&amp;shop_group_cd=undefined"></script>
<script type="text/javascript"
   src="http://gmarket.co.kr/challenge/neo_include/favicon_net.js"></script>
<script type="text/javascript"
   src="https://script.gmarket.co.kr/_Net/js/json2.js"></script>
<script type="text/javascript"
   src="https://script.gmarket.co.kr/_Net/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
   src="https://script.gmarket.co.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
<script type="text/javascript"
   src="https://script.gmarket.co.kr/_Net/js/jquery.popupwindow.js"></script>
<script type="text/javascript" src="/Scripts/Common.js"></script>

<script type="text/javascript">
   $(document).jsErrorHandler();
   var _ContentUrls = [ "https://script.gmarket.co.kr/_Net/css/",
         "http://image.gmarket.co.kr/_Net/",
         "https://script.gmarket.co.kr/_Net/",
         "https://script.gmarket.co.kr/",
         "https://sslimage.gmarket.co.kr/_Net/",
         "https://script.gmarket.co.kr/_Net/", "http://myg.gmarket.co.kr/",
         "https://myg.gmarket.co.kr/", "http://member.gmarket.co.kr/",
         "https://member.gmarket.co.kr/", "http://gbank.gmarket.co.kr/",
         "https://gbank.gmarket.co.kr/", "http://claim.gmarket.co.kr/",
         "https://claim.gmarket.co.kr/", "http://escrow.gmarket.co.kr/",
         "https://sslescrow.gmarket.co.kr/", "http://diary.gmarket.co.kr/",
         "http://event.gmarket.co.kr/", "http://sns.gmarket.co.kr/",
         "http://gmarket.co.kr/", "https://gmarket.co.kr/",
         "http://item.gmarket.co.kr/", "http://shop.gmarket.co.kr/",
         "http://member2.gmarket.co.kr/",
         "https://sslmember2.gmarket.co.kr/",
         "http://promotion.gmarket.co.kr/", "https://diary2.gmarket.co.kr/",
         "http://event2.gmarket.co.kr/", "/", "http://g9.co.kr/",
         "http://signin.gmarket.co.kr/", "https://sslsignin.gmarket.co.kr/",
         "/", "/", "/", "/", "/", "/", "/", "/", "/", "/", "/", "/" ];
   ;
</script>
<script type="text/javascript"
   src="https://script.gmarket.co.kr/_Net/js/dimmed.js"></script>
<script type="text/javascript"
   src="https://script.gmarket.co.kr/_Net/js/gmkt.js?dummy=2012091327262"></script>
<script type="text/javascript" defer="defer"
   src="https://script.gmarket.co.kr/_Net/js/impression.js"></script>
<script type="text/javascript"
   src="https://script.gmarket.co.kr/_Net/js/CommonHeader.js"></script>

<link rel="stylesheet" type="text/css"
   href="https://script.gmarket.co.kr/pc/css/ko/common.css">

<link rel="stylesheet" type="text/css"
   href="/eatswill/resources/assets/css/myg_sub.css">
<link rel="stylesheet" type="text/css"
   href="/eatswill/resources/assets/css/myg_layer.css">



<script type="text/javascript" language="javascript">
   var g_isSubmit = false;
   var g_isInnerIconClicked = false; //edit inner icon clicked
   var g_mode = "Add";

   var g_C2GoodsYn = "N";
   var g_MobileAppYn = "N";
   var g_defaultTitle = "제목을 입력해주세요";
   var g_defaultContents = "상품평을 입력해주세요(최소10자 이상)";
   var g_imageAttach = [];

   var g_PrvwExtInfo = {
      "PRvwNo" : 0,
      "ContrNo" : 0,
      "RcdmGdNo" : null,
      "CustNo" : null,
      "RegId" : null,
      "WrtrNm" : null,
      "PRvwNm" : null,
      "PRvwTxt" : null,
      "PhtRvwYn" : null,
      "ReadCnt" : 0,
      "RegDt" : "\/Date(-62135596800000)\/",
      "SelInfo" : null,
      "PhtUrl" : null,
      "PhtUrl2" : null,
      "PhtUrl3" : null,
      "PhtUrl4" : null,
      "PhtUrl5" : null,
      "PhtUrl6" : null,
      "PhtUrl7" : null,
      "PhtUrl8" : null,
      "PhtUrl9" : null,
      "PhtUrl10" : null,
      "PhtUrlDesc" : null,
      "PhtUrl2Desc" : null,
      "PhtUrl3Desc" : null,
      "PhtUrl4Desc" : null,
      "PhtUrl5Desc" : null,
      "PhtUrl6Desc" : null,
      "PhtUrl7Desc" : null,
      "PhtUrl8Desc" : null,
      "PhtUrl9Desc" : null,
      "PhtUrl10Desc" : null,
      "WinYn" : null,
      "IsPowerReviewer" : null,
      "IsAgreedOut" : null,
      "IsBlockContent" : false,
      "FromWhere" : null,
      "TotalPoint" : 0,
      "DeliverySatisPoint" : 0,
      "ReplyComment" : null,
      "ReplyCommentRegDt" : null,
      "ShopGroupCd" : 0,
      "RNum" : 0
   };

   var g_IsG9 = 'False';


   $(document)
         .ready(
               function() {

                  var g_WrtnStartDt = '2020-07-07 09:46:34';

                  if (g_mode == "Add") {
                     $(".rating_table").show();

                     var totalPoint = -1;
                     var deliverySatisPoint = -1;

                     $("input[name='TotalPoint']:radio[value='5']")
                           .attr("checked", true);
                     $(
                           "input[name='DeliverySatisPoint']:radio[value='3']")
                           .attr("checked", true);

                  } else if (g_mode == "Modify") {
                     //debugger;
                     //if (g_buyTip != "") {
                     //    try {
                     //        $("#divBuyTipLine").show();
                     //    } catch (e) { }
                     //}

                     //$(".rating_table").hide();
                     $("#PRvwNm").val("");

                     // if ("" == "N") {
                     //     $("#chkIsOutAgreed").attr("checked", false);
                     // }

                     // 추천여부
                     $("input:radio[name='TotalPoint']:radio[value='0']")
                           .attr("checked", true);
                     $(
                           "input:radio[name='DeliverySatisPoint']:radio[value='0']")
                           .attr("checked", true);

                  }

                  //$("#selInfo").text(g_buyTip);
                  //if ($("#selInfo").text() == "") {
                  //    $(".order-info").hide();
                  //}
                  //if (g_mode == "Modify") {
                  //    $(".rating_table").hide();
                  //}

                  $("#btnSave")
                        .click(
                              function(e) {
                                 //등록버튼 클릭여부
                                 if (g_isSubmit) {
                                    alert("처리중입니다.");
                                    return;
                                 }

                                 /* 2017-05-18 by suhpark : SNS Delete */
                                 //sns전송여부를 체크
                                 // if (chkAvailableFeed() == false) return;
                                 if (isValidation() == false)
                                    return;

                                 var data = $("#form1")
                                       .serializeObject();
                                 //console.log(data);

                                 var snsKind = '';
                                 $("input[name=cbSnsKind]:checked")
                                       .each(
                                             function(index) {
                                                var value = $(
                                                      this)
                                                      .val();// facebook$FACEBOOK_GMAREKT_REVIEW$FB
                                                if (index == 0) {
                                                   snsKind = value;
                                                } else {
                                                   snsKind += ","
                                                         + value;
                                                }
                                             });
                                 data.SnsKindGubun = snsKind;

                                 $("input[name=photoUrl]")
                                       .each(
                                             function(index) {
                                                if (index === 0) {
                                                   data["PhtUrl"] = $(
                                                         this)
                                                         .val();
                                                } else {
                                                   data["PhtUrl"
                                                         + (index + 1)] = $(
                                                         this)
                                                         .val();
                                                }
                                             });
                                 $("textarea[name=explan]")
                                       .each(
                                             function(index) {
                                                if (index === 0) {
                                                   data["PhtUrlDesc"] = $(
                                                         this)
                                                         .val();
                                                } else {
                                                   data["PhtUrl"
                                                         + (index + 1)
                                                         + "Desc"] = $(
                                                         this)
                                                         .val();
                                                }
                                             });

                                 // sns
                                 data.WrtnStartDt = g_WrtnStartDt;
                                 data.IsAgreedOut = "Y"; // ($("#chkIsOutAgreed").attr("checked") ? "Y" : "N");

                                 g_isSubmit = true;
                                 $
                                       .ajax({
                                          url : "SavePremiumReview",
                                          type : "POST",
                                          cache : false,
                                          dataType : "json",
                                          data : data,
                                          success : function(
                                                result) {
                                             g_isSubmit = false;
                                             SavePremiumReviewAfterAction(result);
                                          },
                                          error : function(
                                                request, error) {
                                             g_isSubmit = false;
                                             //console.log(request);
                                             //console.log(error);
                                             alert(error);
                                          }
                                       });

                              });

                  $("#preview").click(function(e) {
                     GmktPopLayerAdd("ViewPreview", 800, 700, "N");
                  });

               });

   

   function hideImageLayer() {
      GmktPopLayerDelete();
   }
</script>

<script type="text/javascript">

function sendIt() {
   f = document.myForm;
   
   str = f.reScore.value;
   str = str.trim();
   if(!str){
      alert("\n별점을 입력하세요.");
      f.reScore.focus();
      return;
   }
   
   f.reScore.value = str;
   
   str = f.reContent.value;
   str = str.trim();
   if(!str){
      alert("\n내용을 입력하세요.");
      f.reContent.focus();
      return;
   }
   f.reContent.value = str;
   
   f.action = "<%=cp%>/reviewCreated_ok.action";
   
   f.submit();
}
</script>

</head>
<body>

   <div yogiyo-header="">
		<div id="header" class="header">

			<div class="navigation ver-pc" ng-class="header_show()"
			style="background-color: #FDF5E6;">
			<!--  색상수정예정예정 -->
			<div class="app-down-banner clearfix ng-hide"
				ng-show="is_show_promotion_banner()" style="background-color: initial;position: static;z-index: 0;">
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
						<h2 style="font-size: 29px;margin-top: 0;font-weight: bold;">Menu</h2>
						<br /> <input type="hidden" id="sessionId"
							value="${sessionScope.customInfo.id }" />
						<ul>
							<li>
								<font color="#F2849E">${sessionScope.customInfo.name }</font>님 환영합니다.
								<p style="text-align: left">
									전화번호 : ${sessionScope.customInfo.tel }</br> 포인트 :
									${sessionScope.customInfo.point }
								</p> 
								<a href="logout.action" data-nethru_clcode="A000012">로그아웃</a>
							</li>
							<li><a href="updateInfo.action">내정보수정</a></li>
							<li><a href="myPage.action">마이 페이지</a></li>
							<li><a id="basket">장바구니</a></li>
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
									style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 14.4px; font-weight: bold; 
									font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
									onclick="javascript:location.href='login.action';">로그인</button>
								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 14.4px; font-weight: bold;
									font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
									onclick="javascript:location.href='signup.action';">회원가입</button>
							</c:when>
							<c:otherwise>
								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									style="width: 150px; height: 38px; background-color: #FDCD8C; border-color: #FDCD8C; font-size: 14.4px; font-weight: bold;
									font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
									onclick="javascript:location.href='logout.action';">로그아웃</button>
									
								<button type="button"
									class="button button--ujarak button--border-thin button--text-thick"
									id="cartList"
									style="width: 150px; height: 38px; font-size: 14.4px; background-color: #FDCD8C; border-color: #FDCD8C; font-weight: bold;
									font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';">주문표(0)</button>
								<div id="cartInfo"></div>	
							</c:otherwise>
						</c:choose>
		
						<!-- <button type="button"
						class="btn btn-warning hidden-xs ng-binding"
						ng-show="show_pc_cart_button()" ng-click="click_cart_button()"
						ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;" style="font-size: 1.2em;background-color: red;">주문표(0)</button> -->
		
						
					</form>
		
					<!--------------------------------------------------------------------------------------------------------------------------->
					</div>
				</div>
			</div>
		</div>
	</div>

<br><br>
   <div id="HeaderScriptContainer">
      <link rel="stylesheet" type="text/css" href="https://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css"/>
      <script type="text/javascript"
         src="https://script.gmarket.co.kr/fnp/desktop-layout.js"></script>
      <script type="text/javascript">
      DesktopLayout.render([
         {
            name: "Header",
            params: { type: "sub", user: { type: GmarketHeaderComm.Member.Type, name: GmarketHeaderComm.Member.Name, grade: GmarketHeaderComm.Member.Grade }, isAdult: false },
            container: document.getElementById('header')
         }      
      ]);
   </script>
   </div>


   <div id="wrap">
      <a name="top"></a>
      <!-- S:퀵메뉴:12.12.17 -->

      <!--// E:퀵메뉴:12.12.17 -->

      <div id="contents">
         <link rel="stylesheet" href="/Scripts/jqueryupload/css/jquery.fileupload.css">
         <link rel="stylesheet"   href="/Scripts/jqueryupload/css/jquery.fileupload-ui.css">

<!-- form 시작 -->
         <form name="myForm" method="post" action="" enctype="multipart/form-data"><!-- enctype="multipart/form-data" -->
            <div class="shopping-webzine-center">
               <div class="shopping-webzine">
                  <div class="premium-reviews">
                     <div>
                     <img alt="" src="/eatswill/resources/img/리뷰이벤트.jpg">
                     </div>
                     <br>
                     <hr>
                     <div class="product-review-modify">
                     
                     
                     
                        <div class="product-info">
                           <span class="img"> <a
                              href="http://item.gmarket.co.kr/detailview/Item.asp?goodscode=1775279016">
                              <img src="/eatswill/resources/images/${dto.shopImg}" width="70" height="70"></a>
                           </span> <span class="info"> <span class="location">주문번호: [${dto.orderCode}]</span> <span class="link"><a
                                 href="">(${dto.shopName })</a>&nbsp;${dto.menuName }</span>
                                 <input type="hidden" name="orderCode" value="${dto.orderCode }">
                                 <input type="hidden" name="shopCode" value="${dto.shopCode }">
                              <span class="order-info"> </span>
                           </span>
                        </div>
                     </div>

                     <table class="board-write" summary="제목, 상품평, 첨부 내용을 표여주는 표">
                        <caption>제목, 상품평, 첨부 내용을 표여주는 표</caption>
                        <colgroup>
                           <col style="width: 99px;">
                           <col>
                        </colgroup>
                        <tbody>
                           <tr class="first">
                              <!-- input의 id값과 label의 for값 일치시켜주세요 -->
                              <th scope="row"><label for="ip_tit">별 점</label></th>
                              <td>
                                 <fieldset class="rating">
                                    <input type="radio" id="star5" name="reScore" value="5" /><label
                                       class="full" for="star5" title="매우 강추!"></label> <input
                                       type="radio" id="star4" name="reScore" value="4" /><label
                                       class="full" for="star4" title="강추"></label> <input
                                       type="radio" id="star3" name="reScore" value="3" /><label
                                       class="full" for="star3" title="보통"></label> <input
                                       type="radio" id="star2" name="reScore" value="2" /><label
                                       class="full" for="star2" title="비추"></label> <input
                                       type="radio" id="star1" name="reScore" value="1" /><label
                                       class="full" for="star1" title="매우 비추"></label>
                                 </fieldset>
                              </td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="ip_review">리뷰 내용</label></th>
                              <td><textarea id="reContent" name="reContent" rows="30"
                                    placeholder="리뷰를 입력해 주세요." cols="120"
                                    style="width: 750px; height: 267px;"></textarea></td>
                           </tr>
                           <tr class="last">
                              <th scope="row">사진 첨부</th>
                              <td>
                              <input type="file" name="uploadfile" >
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  
                     <div class="btn-type2">
                     <img id="send" src="http://image.gmarket.co.kr/challenge/webzine_img/img_110617/btn/register.gif" alt="등록" border="0" onclick="javascript:sendIt();"/>
                     <img src="http://image.gmarket.co.kr/challenge/webzine_img/img_110617/btn/cancel.gif" alt="취소" border="0" onclick="javascript:location.href='<%=cp%>/myPage.action';">
                     </div>
                  </div>
               </div>
            </div>
         </form>
         <!-- form 끝 -->
      </div>
   </div>
   
   <!------------------------------------------------------------------------------------------------- -->
	<div class="footer" style="background-color: #FDF5E6; display: block;">
		<div class="footer-menu"></div>
	
		<!-- =========================================================================================== 하단끝 -->
	
		<div class="company-wrap">
			<div class="company-logo"></div>
			<div class="company-info">
				<p>
					<strong>(유) 윗츠윌 코리아 </strong>
				</p>
	
			</div>
		</div>
	
		<!-- ========================================================================= 하단 부분 -->
	
		<div class="service-info" style="font-family: '맑은고딕', malgun gothic,'돋움',Dotum,'Apple SD Gothic Neo',Helvetica,sans-serif;">
			<div class="bpg">
				<a href="#/trust/"><span class="img"></span><span class="text">잇츠윌<br>안심센터
				</span></a>
			</div>
			<div class="cleanreview">
				<a href="#/cleanreview/"><span class="img"></span><span
					class="text">잇츠윌 100%<br>클린리뷰
				</span></a>
			</div>
			<div class="csc">
				<em>고객만족센터</em> <strong>1661-5270</strong> <span>24시간, 연중무휴</span>
			</div>
		</div>
		<div class="guide">
			<p style="color: #989898; font-size: 12px;">(유) 잇츠윌 코리아는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품/ 거래정보 및 거래와
				관련하여 잇츠윌에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 (유)잇츠윌 코리아는 책임을 지지
				않습니다. 상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다. Copyright
				EATSWILL. All Rights Reserved.</p>
		</div>
	</div>
   
   <!-- Scripts -->
	<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
	<script src="/eatswill/resources/assets/js/skel.min.js"></script>
	<script src="/eatswill/resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/eatswill/resources/assets/js/main.js"></script>
	
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
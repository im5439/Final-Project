<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>잇츠윌-주문내역</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon"
	href="http://image.gmarket.co.kr/_Net/MyG/favicon/gmarket.ico">


<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/ko/common.css">
<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/common/kr/ui/desktop_layout.css">
<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/ko/myg.css">
<link rel="stylesheet" type="text/css"
	href="http://script.gmarket.co.kr/pc/css/ko/myg_net.css">

<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
	src="//montelena.gmarket.co.kr/montelena.js?path=http://192.168.16.23:8080/eatswill/myOrder.action"></script>
<script async=""
	src="//script.gmarket.co.kr/mobile/js/common/kr/util/viewability.js"></script>
<script async="" src="//script.gmarket.co.kr/js/header/statsna.js"></script>
<script async=""
	src="//montelena.gmarket.co.kr/montelena.js?path=http://myg.gmarket.co.kr/"></script>
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

</head>
<body class="service__mypage page__main">
	<div id="header">
		<div id="desktop_layout-header"
			class="section__header section__header-sub">
			<div class="box__header">
				<div class="box__header-inner">
					<div class="box__head-content">
						<h1 class="box__title-logo">
							<a href=""><img
								src="/eatswill/resources/images/feeldo1.jpg"
								width="240" height="113" ><span
								class="sprite__common">야농냐옹</span></a>
						</h1>
						&nbsp;
						<div class="box__head-mytools">
							<ul class="list__mytools">
								<li class="list-item list-item--mypage"><a
									href="http://myg.gmarket.co.kr/" class="link" title="나의 쇼핑정보"
									data-montelena-acode="200003387" data-montelena-floating_yn="N"><img
										src="//pics.gmarket.co.kr/pc/single/kr/common/image__header-mypage.svg"
										alt="마이페이지" class="image"></a></li>
								</li>
								<li class="list-item list-item--cart"><a
									href="https://cart.gmarket.co.kr/ko/cart" class="link"
									title="장바구니 이동" data-montelena-acode="200003389"
									data-montelena-floating_yn="N"><img
										src="//pics.gmarket.co.kr/pc/single/kr/common/image__header-cart.svg"
										alt="" class="image"></a></li>
							</ul>
						</div>
					</div>
					<div class="box__navigation">
						<div class="box__category-all" id="skip-navigation-category-all"
							ismenudimmedafter="true">
							
							<div id="box__category-all-layer" class="box__category-all-layer"
								aria-labelledby="button__category-all" style="">
								<ul class="list__category-all"></ul>
							</div>
						</div>
						<div class="box__service-all">
							<ul class="list__service-all"></ul>
						</div>
						<div class="box__usermenu">
							<ul class="list__usermenu">
								<li class="list-item list-item--member list-item--svip">
								<a href="http://member2.gmarket.co.kr/MYInfo/memberinfo"
									class="link__usermenu" data-montelena-acode="200003394"><span
										class="text__username">김유저</span>님</a></li> <!-- 세션에 있는 아이디값 -->
								<li class="list-item"><a
									href="https://signinssl.gmarket.co.kr/logout/logoutproc"
									class="link__usermenu" data-montelena-acode="200003396">로그아웃</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="wrap" class="mygwrap">

		<a name="top"></a>

		<div id="contentswrap">
			<div id="contents">
				<div id="main_menu">
					<span class="bg_menu_else"></span>
					</div>
				</div>

				<div id="main_cont">
					<script type="text/javascript" language="javascript">
						var smileClubBanner = new SmileClubBanner();
					</script>

					<div id="top_tit">
						<h4>
							<p class="rec_order_list">주문내역</p>
						</h4>
					</div>

					<div class="btn_go btn_go2"></div>

					<!-- 최근 주문내역 -->
					<form action="/" data-ajax="true" data-ajax-mode="replace"
						data-ajax-update="#orderList"
						data-ajax-url="/ContractList/GeneralContractList" id="form0"
						method="post">
						<div class="b_ta_info">
							<table width="100%" border="1" class="b_table_grey">
								<colgroup>
									<col width="108" class="date">
									<col class="pinfo">
									<col width="115;" class="status">
									<col width="108;" class="confirm">
								</colgroup>
								<thead>
									<tr class="head">
										<th>날짜</th>
										<th>상품정보</th>
										<th>상태</th>
										<th>확인/신청</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<td class="last" colspan="4"></td>
									</tr>
								</tfoot>
								<tbody id="orderList">
										<c:forEach var="dto" items="${lists}">
									<tr cno="3273614152" ctype="G" column="4" class="first">
										<td class="first_cell" rowspan="1">
											<div class="td_detail">
												${dto.orderDate }
												<small>[${dto.orderCode}]</small>
												<span class="btn_bg btn_w81_2"><a href="">재주문</a></span>
											</div>
										</td>
										<td>
											<div class="td_info">
												<p>
													<a href=""> <img src="/eatswill/resources/images/${dto.shopImg}" width="70" height="70"></a>
												</p>
												<ul>
													<li class="seller_info"><em></em><a href="">${dto.shopName }</a></li>
													<li class="tit_info">${dto.menuName }</li>
													
													
													<li class="price"><strong>${dto.oAmount }</strong>원</li>
												</ul>
											</div>
										</td>
										<td class="first_cell">
											<div class="td_status">
												<span><b style="color: blue">${dto.orderStatus }</b></span>
											</div>
										</td>
										<td><span class="btn_bg btn_w81_2"><a href="${reviewUrl }&orderCode=${dto.orderCode}">리뷰쓰기</a></span></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
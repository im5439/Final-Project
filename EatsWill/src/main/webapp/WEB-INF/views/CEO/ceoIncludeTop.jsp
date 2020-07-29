<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!-- menu bar CSS -->
<link rel="stylesheet" type="text/css" href="/eatswill/resources/css/default.css"> 
<link rel="stylesheet" type="text/css" href="/eatswill/resources/css/component.css"> 
<script type="text/javascript" src="/eatswill/resources/js/modernizr.custom.js" ></script>
<!-- ------------ -->

<script type="text/javascript">
	
	function loginChk(){
		
		alert("로그인 후 이용해주세요!");
		return;
		
	}
	
</script>

<div id="nav" >
		<div class="clearfix">
		
			<h1>
				<a href="<%=cp%>/CEO.action/">
				<img alt="" src="/eatswill/resources/img/1sajang.png" width="128px" height="58px" style=" margin-left: 60px; margin-top: 20px;"> 
				<img alt="" src="/eatswill/resources/img/sajang.png" width="96px"  height="22px" style="margin-bottom: 10px;"></a>
			</h1>
			<!-- 
			<ul class="nav">
				<li class="n1 "><a nohref=""
					onclick="javascript:alert('로그인 후 이용하실 수 있습니다.'); window.location.href='/owner/login/?next_url=/owner/orders/'"
					style="cursor: pointer">내 업소 관리</a></li>
				<li class="n2 "><a href="/owner/benefit/restaurant/">사장님 혜택</a></li>
				<li class="n3 "><a href="/owner/join/intro/">입점 안내</a></li>
			</ul>
 			-->
			<ul class="ext">
				<li class="outlink"><a href="" target="_blank"></a></li>
			</ul>
			
		</div>
	</div>
	
	<c:choose>
		<c:when test="${empty sessionScope.ceoInfo.ceoId }">
			<div class="main clearfix">
				<nav id="menu" class="nav">
				<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true">
				<i aria-hidden="true" class="icon-menu"> </i> Menu</button>					
					<ul>
						<li>
							<a href="<%=cp %>/CEO.action" onclick="loginChk()">
								<span class="icon">
									<i aria-hidden="true" class="icon-home"></i>
								</span>
								<span>주문확인</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/CEO.action" onclick="loginChk()">
								<span class="icon"> 
									<i aria-hidden="true" class="icon-services"></i>
								</span>
								<span>매장관리</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/CEO.action" onclick="loginChk()">
								<span class="icon">
									<i aria-hidden="true" class="icon-portfolio"></i>
								</span>
								<span>메뉴관리</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/CEO.action" onclick="loginChk()">
								<span class="icon">
									<i aria-hidden="true" class="icon-blog"></i>
								</span>
								<span>리뷰 관리</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/CEO.action" onclick="loginChk()">
								<span class="icon">
									<i aria-hidden="true" class="icon-team"></i>
								</span>
								<span>매출관리</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</c:when>
		<c:otherwise>
			<div class="main clearfix">
				<nav id="menu" class="nav">
				<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true">
				<i aria-hidden="true" class="icon-menu"> </i> Menu</button>					
					<ul>
						<li>
							<a href="<%=cp %>/ceoStoreList.action?mode=orderChk">
								<span class="icon">
									<i aria-hidden="true" class="icon-home"></i>
								</span>
								<span>주문확인</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/addStore.action">
								<span class="icon"> 
									<i aria-hidden="true" class="icon-services"></i>
								</span>
								<span>매장관리</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/ceoStoreList.action?mode=addMenu">
								<span class="icon">
									<i aria-hidden="true" class="icon-portfolio"></i>
								</span>
								<span>메뉴관리</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/ceoStoreList.action?mode=ceoReview">
								<span class="icon">
									<i aria-hidden="true" class="icon-blog"></i>
								</span>
								<span>리뷰 관리</span>
							</a>
						</li>
						<li>
							<a href="<%=cp %>/ceoStoreList.action?mode=sales">
								<span class="icon">
									<i aria-hidden="true" class="icon-team"></i>
								</span>
								<span>매출관리</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</c:otherwise>
	</c:choose>
			
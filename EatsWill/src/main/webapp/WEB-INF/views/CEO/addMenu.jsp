<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html lang="ko" >
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=1000">
<meta name="description"
	content="요기요 사장님 전용 사이트, 주문확인, 업소관리, 알뜰쇼핑, 청구서확인 등 사장님을 위한 다양한 정보 제공.">
<meta name="naver-site-verification"
	content="4cdda9d96d7ffd83e486b2bf7d2d63e5ea479f3b">
<meta name="google-site-verification"
	content="sjuYAwgH5hN_We8OTVoWve7cwBlU5yvn6sADTbxCmsU">
<script type="text/javascript"
	src="https://bam.nr-data.net/1/060998d475?a=2104228&amp;v=1169.7b094c0&amp;to=NgQDY0YEWhICVEFQWg9OJ0JaBkAIDFkaXVoWAA9DGgpDDwZFRhdDCAQWRBoNWwwGDVxXUQQZ&amp;rst=366&amp;ck=1&amp;ref=https://owner.yogiyo.co.kr/owner/&amp;ap=105&amp;be=181&amp;fe=360&amp;dc=247&amp;af=err,xhr,stn,ins&amp;perf=%7B%22timing%22:%7B%22of%22:1594016825867,%22n%22:0,%22u%22:158,%22ue%22:158,%22f%22:4,%22dn%22:4,%22dne%22:4,%22c%22:4,%22ce%22:4,%22rq%22:9,%22rp%22:151,%22rpe%22:155,%22dl%22:160,%22di%22:246,%22ds%22:246,%22de%22:255,%22dc%22:359,%22l%22:359,%22le%22:360%7D,%22navigation%22:%7B%7D%7D&amp;fp=242&amp;fcp=242&amp;jsonp=NREUM.setToken"></script>
<script src="https://js-agent.newrelic.com/nr-1169.min.js"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<title>EATSWILL 사장님 사이트</title>
<link rel="shortcut icon"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="72x72">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="114x114">
<link rel="apple-touch-icon-precomposed"
	href="/eatswill/resources/images/sicon.jpg"
	sizes="144x144">
<link rel="stylesheet" type="text/css"
	href="https://owner.yogiyo.co.kr/media/owners/css/owners_new.css?v=3c43aea">
	
	<link rel='stylesheet' href='https://www.yogiyo.co.kr/mobile/css/app.css?v=71b8bbd02b288c15133166a751af94e192e3c7e9'>
	<script src="https://cdn.optimizely.com/js/9026702317.js"></script>
	 <script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"708645",ustr:"",originlat:"0",clientrtt:"10",ghostip:"173.223.227.108",ipv6:false,pct:"10",clientip:"1.234.209.30",requestid:"28c50461",region:"30609",protocol:"h2",blver:14,akM:"b",akN:"ae",akTT:"O",akTX:"1",akTI:"28c50461",ai:"462223",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script>
	
		<!-- menu bar CSS -->
<link rel="stylesheet" type="text/css" href="/eatswill/resources/css/default.css"> 
<link rel="stylesheet" type="text/css" href="/eatswill/resources/css/component.css"> 
<script type="text/javascript" src="/eatswill/resources/js/modernizr.custom.js" ></script>
<!-- ------------ -->

<script type="text/javascript"
	src="https://owner.yogiyo.co.kr/media/owners/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="https://owner.yogiyo.co.kr/media/owners/js/bootstrap-2.3.2.min.js"></script>
<script type="text/javascript"
	src="https://owner.yogiyo.co.kr/media/owners/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="https://owner.yogiyo.co.kr/media/owners/js/google_analytics.js"></script>

<script type="text/javascript">
    
    	function showRequest(){
			
    		var menuName = $.trim($("#menuName").val());
    		var menuPrice = $.trim($("#menuPrice").val());
    		var part = $.trim($("#part").val());
    		var uploadMenu = $("#uploadMenu").val();
    		
    		if(!menuName){
				alert("메뉴이름을 입력하십시오");
				$("#menuName").focus();
				return false;
			}
			if(!menuPrice){
				alert("메뉴가격를 입력하십시오");
				$("#menuPrice").focus();
				return false;
			}
			if(!part){
				alert("메뉴구분을 선택해주십시오");
				$("#part").focus();
				return false;
			}
			if(!uploadMenu){
				alert("메뉴이미지를 선택해주십시오");
				$("#uploadMenu").focus();
				return false;
			}
			
			return true;    		
    	}

   	function delConfirm(){
   		var delConfirm = confirm('정말로 삭제하시겠습니까?');
   		if (delConfirm)
   			return false;
   		else 
   			return true;
   	}
   	
     function deleteItem(btnIdx, pageNum ) {
	    
	    var params = "menuCode=" + $("#menuCode1" + btnIdx).val();
	    params += "&shopCode=" + $("#shopCode").val();
	    params += "&shopName=" + $("#shopName").val();
	    params += "&pageNum=" + pageNum;

	    	    
	    console.log('btnIdx====> ' + btnIdx);
	    console.log('params====> ' + params);

	    console.log(params);
	    
	    $.ajax({
	        type:"post",
	        url:"<%=cp%>/deleteMenu.action",
	        async: false,
	        data:params,
	        beforeSend : delConfirm(),
	        success: function(args){
	        
	           $("#menuItem").html(args);
	        
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
     
     
 	
	function logout(){
    		
    	var f = document.myForm;
			
		f.action = "<%=cp%>/logout_ok.action";
		f.submit();
    	
	}
	
	
		
	$(function(){ 
		
		$(window).load(function(){

		
			var count = parseInt("${menuCount}"/"${numPerPage}");
			var pageNum = 1;
			
	        var params = "shopCode=" + $("#shopCode").val();
	        params += "&shopName=" + $("#shopName").val();
	        params += "&pageNum=" + "${currentPage}";
	        
	        console.log(params);
	        
	        $.ajax({
	            type:"post",
	            url:"<%=cp%>/menuItem.action",
	            async: false,
	            data:params,
	            success: function(args){
	            	/* alert("저장되었습니다."); */ 
	            	console.log(args);
	            	
	            	$("#menuItem").html(args);
	            	
	            	if(count == (pageNum - 1)){
						$("#review").hide();
					} 
	            	
	            	if("${menuCount}" == 0){
						$("#menuChk").show();
					} else
						$("#menuChk").hide();
						
		            
	            },
	            error:function(request, error){
	            	console.log("실패하였습니다.");
	            	console.log(request.status);
	            	console.log(request.responseText);
	            	console.log(error);
	          }
	          
	        });
	        return false;
			
		});
		
		$("#addMenu").click(function(){
			
			var formData = new FormData();
			formData.append("menuName", $("input[name=menuName]").val());
			formData.append("menuPrice", $("input[name=menuPrice]").val());
			formData.append("shopCode", $("input[name=shopCode]").val());
			formData.append("shopName", $("input[name=shopName]").val());
			formData.append("part", $("select[name=part]").val());
			formData.append("uploadMenu", $("input[name=uploadMenu]")[0].files[0]); 
			
			$.ajax({
				url: "<%=cp%>/addMenu_ok.action", 
				data: formData, 
				processData: false, 
				contentType: false, 
				type: 'POST', 
				beforeSend: showRequest,
				success: function(args){ 
					
					$("#menuItem").html(args);
				
					$("#menuName").val('');
					$("#menuPrice").val('');
					$("#uploadMenu").val('');
					$("#addMenu").val('');
					
				},
				error:function(e){
					console.log("실패하였습니다.");
	            	console.log(request.status);
	            	console.log(request.responseText);
	            	console.log(error);
	          }
			});
			return false;
		}); 
		
		function addPage(){
			
			index = Number(document.getElementById("nextNum").value) + 1;
			
			//document.getElementsById("#nextNum").value = idx;
			//var index = index + 1;
			document.getElementById("nextNum").value = Number(index);
			console.log("dddddd : " + index);
			//nextIt(index);
			return index;
			
		}
		
		$("#nextSee").click(function(){
			
			var count = parseInt("${menuCount}"/"${numPerPage}");
			var pageNum = addPage();
			console.log("menuCount : " + count);
			var params = "shopCode=" + $("#shopCode").val();
		        params += "&shopName=" + $("#shopName").val();
		        params += "&pageNum=" + pageNum;
		        console.log("pagenum:" + pageNum);
		        console.log("count : " + count);
		        console.log(params);
			
			$.ajax({
				url: "<%=cp%>/menuItem.action", 
				async: false,
	            data: params,
				type: 'POST',
				success: function(args){ 
					//console.log("args : " + args);
							
					$("#menuItem").append(args);
					
					if(pageNum  >= ("${menuCount}"/"${numPerPage}")){
						$("#review").hide();
					}
				},
				error:function(e){
					console.log("실패하였습니다.");
	            	console.log(request.status);
	            	console.log(request.responseText);
	            	console.log(error);
	          }
				
			});
			
			return false;
		});
	
	});
		
</script>

</head>
<body>

<div id="nav" >
		<div class="clearfix">
		
			<h1 style="margin: auto;">
				<a href="<%=cp%>/CEO.action/">
				<img alt="" src="/eatswill/resources/img/1sajang.png" width="128px" height="58px" style=" margin-left: 60px; margin-top: 20px;"> 
				<img alt="" src="/eatswill/resources/img/sajang.png" width="96px"  height="22px" style="margin-bottom: 10px; vertical-align: bottom;"></a>
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
				<li class="outlink"><a href="https://boss.yogiyo.co.kr/" target="_blank"></a></li>
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
<!-- 
	<span>scrollHeight: <b id="scrollHeight">0</b></span><br/>
	<span>scrollPosition: <b id="scrollPosition">0</b></span><br/>
	<span>from bottom :  <b id="bottom"></b></span><br/>
 -->
	<div class="own-container" style="overflow: auto;">
		<div class="own-main">
		<%-- 
			<ul class="nav clearfix" style="width: max-content;">
				<li class="n1"><a href="<%=cp %>/orderChk.action" style="cursor: pointer">주문확인</a></li>
				<li class="n2"><a href="<%=cp %>/addStore.action" style="cursor: pointer">매장관리</a></li>
				<li class="n3"><a href="<%=cp %>/storeList.action" style="cursor: pointer">메뉴관리</a></li>
				<li class="n5"><a href="<%=cp %>/ceoReview.action" style="cursor: pointer">리뷰 관리</a></li>
				<li class="n6"><a href="<%=cp %>/sales.action" style="cursor: pointer">매출관리</a></li>
				<li class="n4"><a href="<%=cp %>/storeList.action" style="cursor: pointer">매장목록</a></li>
			</ul>
 		--%>
			<div class="mid clearfix" >
				<div id="carousel-img" class="own-slide carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-img" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-img" data-slide-to="1"></li>
						<li data-target="#carousel-img" data-slide-to="2"></li>
						<li data-target="#carousel-img" data-slide-to="3"></li>
						<li data-target="#carousel-img" data-slide-to="4"></li>
					</ol>

				</div>

				<div class="own-login" style="float: none; width: auto; padding-left: 100; padding-right: 100; padding-top: 30;">

					<div class="status-logout">
						<form method="POST" name="myForm" enctype="multipart/form-data">

							<div style="font-size: large;">매장명 : ${shopName }</div>

							<br/>
							<div>
								<input type="text" class="inp-txt" name="menuName" id="menuName"	placeholder=" 메뉴이름">
							</div>
							<br/>
							<div>
								<input type="text" class="inp-txt" name="menuPrice" id="menuPrice"	placeholder=" 메뉴가격">
							</div>
							<br/>
							<div>
								<select class="inp-txt pwd" name="part" id="part" style="margin-bottom: auto;">
									<option value="">메뉴구분</option>
									<option value="0">메인메뉴</option>
									<option value="1">사이드메뉴</option>
								</select>
							</div>
							<br/>
							<div>
								<input type="file" class="inp-txt pwd"  name="uploadMenu" id="uploadMenu" placeholder=" ">
							</div>
							&nbsp;&nbsp;&nbsp;<span style="color: red;">*메뉴 이미지를 선택해주세요.</span>
							<br/>
							<br/>
							<div>
								<button type="submit" class="btn-own-login" id="addMenu">메뉴등록</button>
							</div>
								<input type="hidden" name="shopCode" id="shopCode" value="${shopCode }">
								<input type="hidden" name="shopName" id="shopName" value="${shopName }">
						</form>
					</div>

				</div>
			</div>
			<br/><br/><br/><br/><br/><br/>
			
		 <div class="ng-scope">
		    <div class="" style="overflow: auto;" id="menuList">
		      <div class="ranking-guide ng-scope">
		        <p>메뉴 목록</p>
		      </div>
		      
					<span id="menuItem"></span><!-- menuItem.jsp 불러옴 -->
					
			</div>
		</div>
      		<div >
      		<c:choose>
			<c:when test="${menuCount == 0 }">
				 <ul class="list-group review-list" id="menuChk">
			        <li class="list-group-item ng-hide" >
			          <p class="review-empty clearfix ng-binding">등록된 메뉴가 없습니다.</p>
			        </li>
		      	</ul>
	      	</c:when>
	      	<c:otherwise>
				<ul id="review" class="list-group review-list" style="margin-left: 10; margin-right: 30;">
			        <li class="list-group-item btn-more">
			          <a href="" id="nextSee"><span>더 보기<i class="arr-down"></i></span></a>
			        </li>
		      	</ul>
		      	<input type="hidden" value="1" id="nextNum"/>
	      	</c:otherwise>
	    </c:choose>
			</div>
		</div>
	</div>
	
	<div class="modal fade popup-notice" id="modal-notice">
		<a href="#" onclick="redirectLogin('/owner/vat/')" class="btn1">부가세
			신고 자료 조회하기</a> <a href="#" data-dismiss="modal" id="no-show-modal"
			class="pop-close-day">다시보지않기</a> <a href="#" data-dismiss="modal"
			class="pop-close">Close</a>
	</div>


	
	<jsp:include page="ceoIncludeBottom.jsp" flush="false"/>


	<script type="text/javascript">
    $(document).ready(function() {
        var regexS = "[\\?&]login=([^&#]*)";
        var regex = new RegExp( regexS );
        var results = regex.exec(window.location.href);
        if (results) {
            $('.popup-pwd-notice').modal('show');
        }
    });
</script>


	<script type="text/javascript"
		src="https://owner.yogiyo.co.kr/media/owners/js/jquery.cookie.js"></script>

	<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","queueTime":0,"licenseKey":"060998d475","agent":"","transactionName":"NgQDY0YEWhICVEFQWg9OJ0JaBkAIDFkaXVoWAA9DGgpDDwZFRhdDCAQWRBoNWwwGDVxXUQQZ","applicationID":"2104228","errorBeacon":"bam.nr-data.net","applicationTime":105}</script>



</body>
</html>
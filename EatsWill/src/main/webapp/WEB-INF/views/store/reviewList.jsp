<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">
<meta name="google-site-verification"
	content="U4GhkkNiUMneDT6RC-apM8m8D6hZJfAXVfXi2_SuyWU">
<meta name="keywords"
	content="치킨, 요기요, 중국집, 피자, 치킨추천, 배달음식, 야식, 내주변맛집, 짜장면, 근처중국집, 배달, 뭐먹지, 맛있는치킨추천, 여기요, 점심메뉴추천, 요기요첫주문할인, 중화요리, 피자추천, 맛있는음식, 치킨배달, 피자배달, 근처중국집배달, 맛있는치킨순위, 야식추천, 근처치킨집, 후라이드치킨순위, 족발집, 낙지소면, 요기요쿠폰, 짜장면집, 배달앱, 족발배달, 피자집, 피자할인, 식사, 요기요할인, 낙지볶음배달, 곱창배달, 배달어플할인, 24시중국집, 배달어플, 치킨할인, 떡볶이배달, 야식배달, 낙지소면배달, 중국집배달, 냉면배달, 점심배달음식, 치킨집, 요기요첫주문, 요기요쿠폰코드, 배달떡볶이, 피자치킨세트, 야식어플, 배달피자, 배달앱추천, 보쌈, 요기요할인쿠폰, 배달요기요, 초밥배달, 근처피자집, 맛있는치킨, 배달야식추천, 24시간중국집, 족발, 돈까스배달, 배달맛집, 배달음식순위, 비비큐할인, 삼계탕배달, 24시간피자배달, 집들이음식배달, 맛있는피자, 분식배달, 24시치킨, 배달사이트, 저녁메뉴추천, 요기오, 부대찌개배달, 혼자배달음식, 배달음식추천, 요기요배달, 요기요치킨, 배달서비스, 스파게티배달, 아침식사배달, 24시야식배달, 24시배달, 배달할인, 여기요할인, 24시간배달, 24시간치킨, 요기여, 1인분배달, yogiyo, 치킨배달할인, 강남역배달, 배달죽, 요기요플러스, 플러스요기요">
<meta name="description"
	content="요기요에서 원하는 배달음식을 쉽고 편리하게! 먹어본 사람만 쓸 수 있는 클린리뷰로 배달맛집 인증, 다양한 할인 혜택과 함께 배달되지 않던 인기맛집까지, 지금 바로 요기요에서 주문하세요.">
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" defer="" async=""
	src="https://collector-658.tvsquared.com/piwik/tv2track.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NSQ8BP"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script async="" src="//connect.facebook.net/en_US/fbevents.js"></script>




	<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
	<link rel="stylesheet"
	href="https://www.yogiyo.co.kr/mobile/css/app.css?v=254ddffd1cab420620ca23002fe458eea88e05db">
	
<meta name="theme-color" content="#DC1400">
<meta property="og:title" content="요기요 - 즐거움은 요기부터. 배달음식 주문은 역시 요기요!">
<meta property="og:url" content="http://www.yogiyo.co.kr/">
<meta property="og:image"
	content="https://www.yogiyo.co.kr/mobile/image/app_img_560x292.png">
<meta property="og:description"
	content="요기요에서 원하는 배달음식을 쉽고 편리하게! 먹어본 사람만 쓸 수 있는 클린리뷰로 배달맛집 인증, 다양한 할인 혜택과 함께 배달되지 않던 인기맛집까지, 지금 바로 요기요에서 주문하세요.">
<!-- ngIf: ! page.title -->
<title ng-if="! page.title" class="ng-scope">요기요 - 즐거움은 요기부터.
	배달음식 주문은 역시 요기요!</title>
<!-- end ngIf: ! page.title -->
<!-- ngIf: page.title -->
<link rel="apple-touch-icon-precomposed"
	href="https://www.yogiyo.co.kr/mobile/image/app_128x128.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="https://www.yogiyo.co.kr/mobile/image/app_144x144.png">
<link rel="icon" type="image/png"
	href="https://www.yogiyo.co.kr/mobile/image/favicon.ico">

<title>Insert title here</title>
</head>
<body>

<!-- 신고 아작스  -->

<script type="text/javascript">


	function reportIt(pIndx) {
		
		var btnIdx = pIndx;                      
		
		var params = "reNum=" + $("#reNum" + btnIdx).val() 
		+ "&userId=" + $("#userId").val()
		+ "&count=" + $("#count").val()
		+ "&shopCode=" + $("#shopCode").val()
		+ "&ceoId=" + $("#ceoId").val();
	
		$.ajax({
			
			type:"POST",
			url:"<%=cp%>/report.action",
			data:params,
			success:function(args){
				
				$("#reviewData").html(args);
			
			},
			error:function(e){
				alert(e.responseText);
			}
		});
		
				
			}


</script>
<form action="" method="post" name="reviewForm">
<c:forEach var="dto" items="${lists }" varStatus="status">


<!-- -----------------------------------li 시작 -->
       <li class="list-group-item star-point ng-scope" ng-repeat="review in restaurant.reviews" on-finish-render="scrollCartArea()">
      
          <div>
           
            <span ng-show="review.phone" class="review-id ng-binding"> ${dto.reUserId } 님 </span>
            <span ng-bind="review.time|since" class="review-time ng-binding"> 작성날짜 ${dto.reCreated } </span>
       
          	신고 (${dto.count })
            <img alt="" src="/eatswill/resources/img/siren.png" style="height: 1.5em; width: 1.5em;" id="report"  onclick="reportIt(${status.index});" >
            
             <input type="hidden" id="reNum${status.index}" value="${dto.reNum}" name="reNum">
            <input type="hidden" id="userId" value="${userId}">
            <input type="hidden" id="shopCode" value="${dto.shopCode}">
            <input type="hidden" id="count" value="${dto.count}">
            <input type="hidden" id="ceoId" value="${dto.ceoId}">
            
          </div>
          <div>
          
            <div class="star-point">
             

              <span class="category" ng-show="review.rating_taste > 0 || review.rating_quantity > 0 || review.rating_delivery > 0">
                <span class="category-tit" ng-show="review.rating_taste > 0">별점${dto.reScore }</span>
                <span class="full" ng-show="review.rating_taste > 0">★</span>
                
              
              </span>
            </div>
            
          </div>

     
          
          <table class="info-images ng-scope" ng-if="review.review_images.length == 1" style="width: 569px;">
            <tbody><tr>
              <td>
               
               <!--  리뷰 이미지  -->
                <div style="width: 569px; height: 284px;">
                	
                
                  <img alt="" src="resources/img/${dto.reImg}"
                  style="visibility: visible; width: 569px; height: 758.37px; left: 0px; top: -237px;">
                </div>
                
                
              </td>
            </tr>
          </tbody>
         </table>

          <div class="order-items default ng-binding" ng-click="show_review_menu($event)">
            	${dto.menuName }
          </div>

          <p ng-show="review.comment" ng-bind-html="review.comment|strip_html" class="ng-binding">${dto.reContent }</p>

  
        <c:if test="${dto.ceoContent != null }">
      
        <div style="background-color: #FDF5E6;">
            <span ng-show="review.phone" class="review-id ng-binding">
            <img alt="" src="/eatswill/resources/img/dat.png" style="height: 2.5em; width: 2.5em;">&nbsp;사장님 &nbsp;${dto.userId } 님</span>
            <span ng-bind="review.time|since" class="review-time ng-binding"> 작성날짜 ${dto.reCreated } </span>
            
            <p ng-show="review.comment" ng-bind-html="review.comment|strip_html" class="ng-binding">&nbsp;${dto.ceoContent }</p>
            <span></span>
          </div>
        
    
        </c:if>
        
        
        </li>

        
       
        
   </c:forEach>    
   
   </form>
        
  <!-- -----------------------------------li 끝-->

  
    
     







</body>
</html>
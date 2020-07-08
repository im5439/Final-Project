<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax 테스트</title>

<link rel="stylesheet" href="<%=cp%>/resources/data/css/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-ui.js"></script>

<style type="text/css">
	body{ font: 62.5% "굴림", sans-serif; margin: 50px;}
	ul#icons {margin: 0; padding: 0;}
	ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
	ul#icons span.ui-icon {float: left; margin: 0 4px;}
	#container {align-content:center; width: 700px; height: 700px;}
</style>

<script type="text/javascript">

	$(function(){
		$("#container").tabs();
	});
	
	
	$(function(){
		menuPage();
	}); 
	

	$(document).ready(function(){
		
		$("#sendReview").click(function(){ //댓글생성
			
			$(function(){
				reviewPage();
			});  
			
			
		});
		

		$("#sendMenu").click(function(){ //댓글생성
				
			$(function(){
				menuPage();
			}); 
				 
				
		});
			
		
		$("#sendInfo").click(function(){ //댓글생성
			
			$(function(){
				infoPage();
			}); 
			 
		});
		
		
	});
	
	
	function menuPage(){
		
		var url = "<%=cp%>/menu.action?shopCode=" + "${shopCode}";
		
		$.post(url,function(args){
			$("#menuData").html(args);
		});
		
			$("#menuData").show();
		
	}
	
	function reviewPage(){
		
		var url = "<%=cp%>/review.action";
		
		$.post(url,function(args){
			$("#reviewData").html(args);
		});
		
			$("#reviewData").show();
		
	}
	
	function infoPage(){
		
		var url = "<%=cp%>/info.action?shopCode=" +"${shopCode}" + "&ceoId=" + "${ceoId}";
		
		$.post(url,function(args){
			$("#infoData").html(args);
		});
		
		$("#infoData").show();
		
	}
	


</script>



</head>
<body>
<form action="">
<table width="400px" style="border: solid;">
<c:forEach var="dto" items="${lists}">
	<tr>
		<td>
		<img src="resources/img/${dto.shopImg}" width="40px" height="40px"></td>
		<td colspan="2">
		음식점이름: ${dto.shopName}<br/>
		사장님 이름: ${dto.ceoName}<br/>
		평균별점: ${dto.reScore}
		<c:if test="${chk=='in'}">
		<img src="resources/img/fullheart.png" width="20px" height="20px" onclick="javascript:location.href='<%=cp%>/heart.action?shopCode=${dto.shopCode }&userId=${userId}&chk=${chk }&ceoId=${dto.ceoId }'">
		</c:if>
		<c:if test="${chk=='del'}">
		<img  src="resources/img/emptyheart.png" width="20px" height="20px" onclick="javascript:location.href='<%=cp%>/heart.action?shopCode=${dto.shopCode }&userId=${userId }&chk=${chk}&ceoId=${dto.ceoId }'">
		</c:if>
		</td>
	</tr>
</c:forEach>
</table>

<div id="container">
	<ul>
		<li><a href="#f1" id="sendMenu"><span>메뉴</span></a></li>
		<li><a href="#f2" id="sendReview"><span>리뷰</span></a></li>
		<li><a href="#f3" id="sendInfo"><span>정보</span></a></li>
	</ul>
	
	<div id ="f1">
		<span id="menuData" style="display: none;"></span><br/><br/><br/>
	</div>
	
	<div id ="f2">
		<span id="reviewData" style="display: none;"></span><br/><br/><br/>
	</div>
	
	<div id ="f3">
		<span id="infoData" style="display: none;"></span> <br/><br/><br/>
	</div>

</div>
<input type="hidden" name="shopCode" value="${dto.shopCode}">
</form>

</body>
</html>
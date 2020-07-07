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
		
		var url = "<%=cp%>/menu.action";
		
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
		
		var url = "<%=cp%>/info.action";
		
		$.post(url,function(args){
			$("#infoData").html(args);
		});
		
		$("#infoData").show();
		
	}
	


</script>



</head>
<body>

<input type="button" onclick="javascript:location.href='<%=cp%>/write_review.action';" value="리뷰작성"/>

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

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=upey5zgsjf&submodules=geocoder"></script>

<!-- https://openapi.naver.com/v1/map/geocode
https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode -->
<script type="text/javascript">

$(function() {
	$("#test").click(function() {
		
		alert("A2");
		
		naver.maps.Service.geocode({
	        address: '불정로 6'
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	
	        var result = response.result, 	// 검색 결과의 컨테이너
	            items = result.items; 		// 검색 결과의 배열
	            
			alert(items[0].address);
	            
	        // $("#testa").html(); 			// 결과의 텍스트 데이터를 넣음
	        // document.getElementById('testa').innerHTML = items;		// 결과 자체를 데이터에 넣음
	    });
		
	});
});

</script>

</head>
<body>

<input type="button" value="click" id="test"/>
<div id="testa"></div>

</body>
</html>
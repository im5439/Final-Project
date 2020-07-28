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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=upey5zgsjf&submodules=geocoder"></script>
<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>

<script type="text/javascript">

$(function() {
	$("#test").click(function() {

		naver.maps.Service.geocode({
	        //address: '불정로 6'
	        address: '서울 성동구 행당로 79'
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	
	        var result = response.result, 	// 검색 결과의 컨테이너
	            items = result.items; 		// 검색 결과의 배열

            var mapOptions = {
           		center: new naver.maps.LatLng(items[0].point.y, items[0].point.x),
           		zoom: 16
           	};
           	
           	var map = new naver.maps.Map('map', mapOptions);
           	
           	var markerOptions = {
           		position: new naver.maps.LatLng(items[0].point.y, items[0].point.x),
           		map: map
           	};
           	
           	var marker = new naver.maps.Marker(markerOptions);

	    });
		
	});
});
	
</script>

</head>
<body>

<input type="button" value="click" id="test"/>
<div id="map" style="width: 600px;height: 600px;"></div>

</body>
</html>
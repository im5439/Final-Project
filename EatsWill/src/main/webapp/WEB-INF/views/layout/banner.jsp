<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			flex: inherit; -webkit-appearance: listbox; border-radius: 10px 10px 10px 10px;">
			<option value="1">강남구</option>
			<option value="2">송파구</option>
			<option value="3">강동구</option>				
		</select>
		<input type="search" id="searchValue" name="searchValue"
			class="form-control ng-pristine ng-scope ng-valid-minlength ng-valid ng-valid-required ng-touched"
			placeholder="건물명, 도로명, 지번으로 검색하세요." ng-minlength="1"
			ng-required="true"
			ng-model="session_storage.location.address_input" bs-dropdown=""
			style="height: 3.3em; width: 35em; left: 1em; font-size: 9pt; flex: inherit; border-radius: 10px 10px 10px 10px;">
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
				style="background-color: #FE642E; left: 2em; font-size: 10pt; border-radius: 20px 20px 20px 20px">검색</button>
		</span>
	</div>
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="search" class="clearfix search search-show" style="background:url('/eatswill/resources/images/th.gif')">
<!-- <div id="search" class="clearfix search search-show" style="background:url('/eatswill/resources/images/banner2.png')"> -->
	
	<div class="input-group">
		<span class="input-group-btn loc">
			<!-- <button class="btn btn-default ico-loc" type="button"
				ng-click="get_current_location()">&nbsp;</button> -->
			<button class="btn btn-default ico-loc" type="button"
				onclick="testyo();">&nbsp;</button>
		</span>
		<form action="." onsubmit="return false"
			class="ng-pristine ng-valid-minlength ng-valid ng-valid-required">
			<input type="search"
				class="form-control ng-pristine ng-scope ng-valid-minlength ng-valid ng-valid-required ng-touched"
				name="address_input" autocomplete="off" autocorrect="off"
				autocapitalize="off" spellcheck="false"
				placeholder="건물명, 도로명, 지번으로 검색하세요." ng-minlength="1"
				ng-required="true"
				ng-model="session_storage.location.address_input" bs-dropdown=""
				ng-focus="show_location_search()" required="required">
		</form>
		<span id="button_search_address"
			class="input-group-btn always-show-search-buttons">
			<button
				class="btn-search-location-cancel btn-search-location btn btn-default ng-hide"
				type="button" ng-click="clear_search_location_input($event)"
				ng-show="is_shown_location_search.v">
				<span class="searchfield-cancel-button">&nbsp;</span>
			</button>
			<button class="btn btn-default ico-pick" type="button"
				ng-click="select_location($event)" style="background-color: red;">검색</button>
		</span>
	</div>
</div>
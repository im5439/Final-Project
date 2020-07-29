<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<div class="footer" style="text-align: -webkit-center;">
		<div class="service-info" style="margin-left: 26%;">
			<div class="bpg">
				<a href="https://www.yogiyo.co.kr/mobile/#/trust/"><span
					class="img"></span><span class="text">요기요<br>안심센터
				</span></a>
			</div>
			<div class="cleanreview">
				<a href="https://www.yogiyo.co.kr/mobile/#/cleanreview/"><span
					class="img"></span><span class="text">요기요 100%<br>클린리뷰
				</span></a>
			</div>
			<div class="csc">
				<em>고객만족센터</em> <strong>1661-5270</strong> <span>24시간, 연중무휴</span>
			</div>
		</div>
		<div class="guide">
			<p>유한책임회사 딜리버리히어로코리아는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품/거래정보 및
				거래와 관련하여 요기요에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 유한책임회사
				딜리버리히어로코리아는 책임을 지지 않습니다. 상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여
				주시기 바랍니다. Copyright YOGIYO. All Rights Reserved.</p>
		</div>
	</div>


	<div class="modal fade popup-pwd-notice modal1" id="modal-pwd-notice">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">비밀번호 변경 안내</h3>
		</div>
		<div class="modal-body">
			고객님의 소중한 정보를 보호하기 위해 <strong>3개월 주기로 비밀번호 변경</strong>을 안내해 드리고 있습니다.<br>
			불편하시더라도 주기적으로 비밀번호를 변경하여 사용해 주시길 부탁드립니다.
		</div>
		<div class="pop-btns">
			<a href="#" data-dismiss="modal" class="btn btn1">다음에 변경하기</a> <a
				href="#" onclick="redirectLogin('/owner/password_change/')"
				data-dismiss="modal" class="btn btn2">비밀번호 변경하기</a>
		</div>
	</div>
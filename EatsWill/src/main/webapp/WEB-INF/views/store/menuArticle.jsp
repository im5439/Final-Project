<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>BLUEB</title>
</head>

<body onload="init();">
<script language="JavaScript">

var menuPrice;
var cQty;

function init () {
	menuPrice = document.form.menuPrice.value;
	cQty = document.form.cQty.value;
	document.form.cAmount.value = menuPrice;
	change();
}

function add () {
	hm = document.form.cQty;
	cAmount = document.form.cAmount;
	hm.value ++ ;

	cAmount.value = parseInt(hm.value) * menuPrice;
}

function del () {
	hm = document.form.cQty;
	cAmount = document.form.cAmount;
		if (hm.value > 1) {
			hm.value -- ;
			cAmount.value = parseInt(hm.value) * menuPrice;
		}
}

function change () {
	hm = document.form.cQty;
	cAmount = document.form.cAmount;

		if (hm.value < 0) {
			hm.value = 0;
		}
		cAmount.value = parseInt(hm.value) * menuPrice;
}  


//-->
</script>

<p><b>메뉴상세페이지</b></p>
메뉴명: ${dto.menuName }
<form name="form" action="<%=cp %>/cartInsert.action" method="post">
수량 : 
<input type="hidden" name="menuPrice" value="${dto.menuPrice }">
<input type="button" value=" - " onclick="del();">
<input type="text" name="cQty" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add();">
<br/>
금액 : <input type="text" name="cAmount" size="11" readonly="readonly">원
<input type="hidden" name="menuCode" value="${dto.menuCode }">
<input type="hidden" name="menuName" value="${dto.menuName }">
<input type="hidden" name="shopCode" value="${dto.shopCode }">
<input type="hidden" name="userId" value="${userId }">
<input type="submit" value="전송" onclick="return confirm('장바구니에 추가하시겠습니까?');">

</form>

</body>
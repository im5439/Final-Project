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
var amount;

function init () {
	menuPrice = document.form.menuPrice.value;
	amount = document.form.amount.value;
	document.form.sum.value = menuPrice;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * menuPrice;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * menuPrice;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * menuPrice;
}  
//-->
</script>
메뉴명: ${dto.menuName }
<form name="form" method="get">
수량 : <input type=hidden name="menuPrice" value="${dto.menuPrice }">
<input type="button" value=" - " onclick="del();">
<input type="text" name="amount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add();">
<br/>

금액 : <input type="text" name="sum" size="11" readonly="readonly">원
</form>
</body>
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
	
<style type="text/css">

input[type=button]{

	background-color: orange;
	border: none;
	color: white;
	height: 30px;
	width: 40px;
	align-content: center;
	font-size: 15pt;
	border-radius: 7px;

}

#cqty{

	border: none;
	height: 30px;
	width: 30px;
	align-items: center;
	font-size: 15pt;

}


#camount{

	border: none;
	height: 30px;
	width: 80px;
	align-items: center;
	font-size: 15pt;

}

#insertCart{
	
	background-color: orange;
	border: none;
	color: white;
	height: 50px;
	width: 585px;
	align-items: center;
	font-size: 15pt;

}




</style>
	
	
</head>

<body onload="init();">
<script language="JavaScript">

var menuPrice;
var cQty;


init();

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



<form name="form" action="<%=cp %>/cartInsert.action" method="post">

<!-- 자리 확인하고 border 0으로 주기 -->
<table border="1" width="585px">
<tr>
	<td colspan="3">메뉴 사진띄우기<br/><br/></td>
</tr>

<tr>
	<td colspan="3"><b style="font-size: 12pt;">메뉴명: ${dto.menuName }</b><br/><br/></td>
</tr>


<!-- forEach문 이용해서 돌리기 추가 메뉴개수까지-->
<c:forEach begin="1" step="1" end="8">
<tr>
	<td>추가메뉴</td>
	<td align="center">가격</td>
	<td align="center">선택</td>
</tr>
</c:forEach>


<tr height="60px">
	
	<td>수량:&nbsp;&nbsp;
	<input type="button" value=" - " onclick="del();" id="plus"/>
	<input id="cqty" name="cQty" value="1" size="3" onchange="change();" readonly="readonly"/>
	<input type="button" value=" + " onclick="add();" id="minus"/>
	<br/>
	</td>
	
	<td colspan="2" align="right">
	금액 : <input id="camount" name="cAmount" size="11" readonly="readonly" /><b style="font-size: 12pt;">원</b>
	<br/>
	</td>
</tr>


</table>
<input type="submit" value="주문표에 담기" id="insertCart" onclick="return confirm('장바구니에 추가하시겠습니까?');">
<input type="hidden" name="menuPrice" value="${dto.menuPrice }"/>
<input type="hidden" name="menuCode" value="${dto.menuCode }">
<input type="hidden" name="menuName" value="${dto.menuName }">
<input type="hidden" name="shopCode" value="${dto.shopCode }">
<input type="hidden" name="userId" value="${userId }">
</form>

</body>
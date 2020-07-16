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


#camount,#addAmount,#Amount{

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

<script language="JavaScript">

var menuPrice = document.form.menuPrice; //메뉴가격
var cQty = document.form.cQty; //수량
var cAmount = document.form.cAmount; //수량에 의한 금액(수량 * 메뉴가격)
var addAmount = document.form.addAmount; //추가 금액

var Amount = document.form.Amount;//총금액


change();
addall();

/* function init () {
	menuPrice = document.form.menuPrice.value;
	cQty = document.form.cQty.value;
	addamount = document.form.addamount.value;
	document.form.cAmount.value = menuPrice;
	change();
} */

function add () {
	
	cQty.value ++ ;
	cAmount.value = parseInt(cQty.value) * menuPrice.value;
	addall();
}

function del () {

		if (cQty.value > 1) {
			cQty.value -- ;
			cAmount.value = parseInt(cQty.value) * menuPrice.value;
		}
		
		addall();
}

function change () {

		if (cQty.value < 0) {
			cQty.value = 0;
		}
		cAmount.value = parseInt(cQty.value) * menuPrice.value;
		Amount.value = Number(cAmount.value);
}  

//구매수량 가격 + 추가금액
function addall(){
	
	Amount.value = Number(cAmount.value) + Number(addAmount.value); 
	
}

function menuAdd(){
	
	//var Idx = index;
	
	var chk_leng = form.chkbox.length;
	var sum = 0;
	
	for(i=0;i<chk_leng;i++){
		
		if(form.chkbox[i].checked==true){
			sum += Number(form.chkbox[i].value);
		}
		
	}
	
	addAmount.value = Number(sum);
	addall();
	//addmenu(form.addAmount.value);
	
}




//-->
</script>
	
	
</head>

<body onload="init();">




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
<!--  
<tr>
	<td>사이다</td>
	<td align="center">1500</td>
	<td align="center"><input type="checkbox" name="chkboxcider" style="height: 16px; -webkit-appearance: checkbox; opacity: 1;" value="1500"
	onclick="addmenu();"></td>
</tr>
<tr>
	<td>콜라</td>
	<td align="center">1500</td>
	<td align="center"><input type="checkbox" name="chkboxcolar" style="height: 16px; -webkit-appearance: checkbox; opacity: 1;" value="1500"
	onclick="addmenu();" ></td>
</tr>
-->


<c:forEach var="dto" items="${lists }">
<tr>
	<td>추가메뉴</td>
	<td align="center">${dto.menuName }</td>
	<td align="center">${dto.menuPrice }</td>
	<td align="center"><input type="checkbox" name="chkbox" style="height: 16px; -webkit-appearance: checkbox; opacity: 1;" value="${dto.menuPrice }"
	onclick="menuAdd();" ></td>
</tr>

</c:forEach>
<tr>
	<td width="100px">추가금액</td>
	
	<td colspan="2" align="right" width="100px">
	<input readonly="readonly" name="addAmount" value="0" id="addAmount"/>
	원</td>
	
</tr>



<tr height="60px">
	
	<td>수량:&nbsp;&nbsp;
	<input type="button" value=" - " onclick="del();" id="plus"/>
	<input id="cqty" name="cQty" value="1" size="3" onchange="change();" readonly="readonly"/>
	<input type="button" value=" + " onclick="add();" id="minus"/>
	<br/>
	</td>
	
	<td colspan="2" align="right">
	금액 : <input id="camount" name="cAmount" size="10" readonly="readonly" />원
	<br/>
	</td>
</tr>

<tr height="60px">
	
	
	
	<td colspan="3" align="right">
	  총 금액 : <input id="Amount" name="Amount" size="11" readonly="readonly" /><b style="font-size: 12pt;">원</b>
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
<input type="hidden" name="ceoId" value="${ceoId }">
</form>

</body>
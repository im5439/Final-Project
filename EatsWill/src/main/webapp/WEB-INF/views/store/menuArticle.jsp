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

//사이드메뉴 금액
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

//내가 체크한 데이터 넘기기
function sendIt() {
	
	var f = document.form;

	var sideMenuCode = '';
	var sideMenuName = '';
	var sideMenuPrice = '';
	var userId = "${userId}";
	
	var count = f.chkbox.length;
	for(var i=0;i<count;i++){
		if(f.chkbox[i].checked){
			
			//체크한 데이터들의 끝에,를 붙여서 변수에 담음
			sideMenuCode +=  f.sideMenuCode[i].value + ',';
			sideMenuName +=   f.sideMenuName[i].value + ',';
			sideMenuPrice +=  f.sideMenuPrice[i].value + ',';
		}
	}
	
	if(userId=="guest"){
		f.action = "<%=cp %>/login.action";
		f.submit();	
		return;	
	}
	
	f.action = "<%=cp %>/cartInsert.action?sideMenuCode=" + sideMenuCode +"&sideMenuName=" + sideMenuName +"&sideMenuPrice=" + sideMenuPrice;
	f.submit();

	
}



//-->
</script>
	
	
</head>

<body onload="init();">




<form name="form" action="" method="post">

<!-- 자리 확인하고 border 0으로 주기 -->
<table border="1" width="585px">
<tr>
	<td colspan="3">메뉴 사진띄우기<br/><br/></td>
</tr>

<tr>
	<td colspan="3"><b style="font-size: 12pt;">메뉴명: ${dto.menuName }</b><br/><br/></td>
</tr>


<c:forEach var="dto" items="${lists }">
<tr>
	<td align="center" >
	<input type="hidden" name="sideMenuCode" value="${dto.menuCode }"> ${dto.menuName }
	<input type="hidden" name="sideMenuName" value="${dto.menuName }">
	<input type="hidden" name="sideMenuPrice" value="${dto.menuPrice }"/>
	<td align="center">${dto.menuPrice }</td>
	<td align="center"><input type="checkbox" name="chkbox" style="height: 16px; -webkit-appearance: checkbox; opacity: 1;" value="${dto.menuPrice }"
	onclick="menuAdd();" ></td>
</tr>

</c:forEach>
<tr>
	<td width="100px">추가금액</td>
	
	<td colspan="2" align="center" width="100px">
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

<input type="button" value="주문표에 담기" id="insertCart" onclick="sendIt();">
<input type="hidden" name="menuPrice" value="${dto.menuPrice }"/>
<input type="hidden" name="menuCode" value="${dto.menuCode }">
<input type="hidden" name="menuName" value="${dto.menuName }">
<input type="hidden" name="shopCode" value="${dto.shopCode }">
<input type="hidden" name="userId" value="${userId }">
<input type="hidden" name="ceoId" value="${ceoId }">
</form>

</body>


function requestPay() {
    // IMP.request_pay(param, callback) 호출
    alert("들어옴");
  IMP.init("imp91142724"); 
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'eatswill',
	    amount 100,
	    buyer_email : 'hyehellohi@gmail.com',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : '<%=cp%>/orderReal.action'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '이름 : ' + rsp.name;
	        msg += '결제 금액 : ' + rsp.amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
 	
}
   
   

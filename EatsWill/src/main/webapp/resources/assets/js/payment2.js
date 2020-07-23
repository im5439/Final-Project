
 function requestPay(mode) {
 
  alert("들어옴");
  alert(mode);
	
	if(mode=="no") {
	
		var f = document.orderForm;
		
	    f.action="order_ok.action";	
	    f.submit();
	
	}
	
	  IMP.init("imp91142724"); 
		 IMP.request_pay({
			  pg : 'inicis',
			  pay_method : 'card',
			  merchant_uid : 'merchant_' + new Date().getTime(),	
			  name: $("#menuName").val() + "  외   " + $("#orderCount").val() + "  개",
	          amount: 100,
	          buyer_email: "hyehellohi@gmail.com",
	          buyer_name: "eatsWill",
	          buyer_tel: "010-8858-8032",
	          buyer_addr: "서울특별시 강남구 잇츠윌",
	          buyer_postcode: "1004"
	}, function(rsp) {
	    if ( rsp.success ) {
	    	var f = document.orderForm;
	    	
	    	f.action="order_ok.action";	
	    	f.submit();
	
	    } else {
	    
	        msg = '에러내용 : ' + rsp.error_msg;
	
	        alert(msg);
	    }
});

}
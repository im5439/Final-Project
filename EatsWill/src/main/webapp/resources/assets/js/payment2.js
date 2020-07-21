
 
	   function requestPay() {
  alert("들어옴");

	  IMP.init("imp91142724"); 
	  
	  var oAmount = Number($("#priceAmount").val()) - Number($("#userPoint").val());
		
		var params =  "shopCode=" + $("#orderShopCode").val() 
 				+ "&request=" + $("#orderRequest").val()
 				+ "&oAmount=" + oAmount;
 	
 	alert(params);
	   
	      IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: "ORD20180131-0000015",
	          name: $("#menuName").val() + "  외   " + $("#orderCount").val() + "  개",
	          amount: 100,
	          buyer_email: "hyehellohi@gmail.com",
	          buyer_name: "eatsWill",
	          buyer_tel: "010-8858-8032",
	          buyer_addr: "서울특별시 강남구 잇츠윌",
	          buyer_postcode: "1004"
	          
	      }, 
	       jQuery.ajax({
       url: "<%=cp%>/orderReal.action", // 가맹점 서버
       method: "POST",
       data:params,
	      success:function(rsp){
	      alert("ssss");
 					
 		$("#aaa").html(args);
 			
 		},
 		error:function(e){
 			alert(e.responseText);
 		}
 		
 	}));
	      
}
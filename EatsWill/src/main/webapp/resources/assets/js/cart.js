function cartList() {
	var param = "id=" + $("#sessionId").val();

    $.ajax({
        url: "cartList.action",
        type: "POST",            
        data: param,
        success: function(data){
        	$("#cartList").text("주문표(" + data + ")");
        },
        error: function(){
            alert("Error");
        }
    });
}

function cartOpen(check) {

	var f = "";
	var info = "";

	if(check == "my") {
		f = document.infoForm;
	} else {
		f = document.cartForm;
	}
		
	var param = "id=" + $("#sessionId").val();

    $.ajax({
        url: "cartOpen.action",
        type: "POST",            
        data: param,
        success: function(data){
        
        	var shopCode = data.substring(0, data.indexOf(','));
        	var ceoId = data.substring((data.indexOf(',')+1), data.length);
        	
        	if(check == "my") {
        		$("#myInfo").append($('<input/>', {type: 'hidden', name: 'shopCode', value: shopCode}));
        		$("#myInfo").append($('<input/>', {type: 'hidden', name: 'ceoId', value: ceoId}));
        	} else {
        		$("#cartInfo").append($('<input/>', {type: 'hidden', name: 'shopCode', value: shopCode}));
        		$("#cartInfo").append($('<input/>', {type: 'hidden', name: 'ceoId', value: ceoId}));
        	}
        	
        	f.action = "page.action";
			f.submit();
        },
        error: function(){
            alert("Error");
        }
    });
}

$(function() {
	
	$("#cartList").show(function(){
		cartList();
	});
	
	$("#cartList").click(function(){
		cartOpen("cart");
	});
	
	$("#basket").click(function(){
		cartOpen("my");
	});
	
});
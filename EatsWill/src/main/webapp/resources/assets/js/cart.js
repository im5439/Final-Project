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

$(function() {

	$("#cartList").show(function(){
		cartList();
	});
	
});
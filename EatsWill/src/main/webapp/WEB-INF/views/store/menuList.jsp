<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>

<!-- 더보기 아작스  -->
<script type="text/javascript">


$(function(){
	
	nextItMenu(1); //처음에 보이는 페이지 1
		
}); 



function addPageMenu(){
	
	index = Number(document.getElementById("nextNumMenu").value)+1;
	//document.getElementsById("#nextNum").value = idx;
	//var index = index + 1;
	document.getElementById("nextNumMenu").value = Number(index);

	nextItMenu(index);
	
};

//더보기
function nextItMenu(index) {
	
	if(index==1){
		document.getElementById("nextNumMenu").value = 1;
	}
		  
	var menuCount = "${menuCountall}";
	  var shopCode = "${shopCode}";
	  var userId = "${userId}";
	  var ceoId = "${ceoId}";
	
	  var params =  "pageNum=" + index 
		+  "&shopCode=" + shopCode 
		+ "&userId=" + userId
		+ "&ceoId=" + ceoId;
	
	var url="<%=cp%>/menus.action";
 	$.post(url,params,function(args){
	
		$("#menuData").append(args);
	});
	

	if(index >= (menuCount/4)){
		$("#menuMore").hide();
	}
		
}

function goArticleModal(pIdnx){

    var btnIdx = pIdnx;

    var params = "menuCode="+$("#menuCode"+btnIdx).val();
    params += "&userId=" + $("#userId").val();
    params += "&shopCode=" + $("#shopCode").val();
    params += "&ceoId=" + $("#ceoId").val();
   
    $.ajax({
        type:"post",
        url:"<%=cp%>/menuArticle.action",
        data:params,
        success: function(args){
           //layer_popup($href); // 레이어 팝업 띄우기
      
           $(".modal-body").html(args); // 팝업 내용 - menuArticle 모달 팝업으로 띄우기
           
        },
        error:function(e){
         e.responseText();
      }
      
    });
    
}


  	
</script> 




</head>


<body>


<input type="hidden" value="${userId}" id="userId"/>
<input type="hidden" value="${ceoId}" id="ceoId"/>



<!-- Modal팝업 내부양식  각 클래스들은 부트스트랩.js를 위한 클래스들임 지우면 안됨-->
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color: orange;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" ><b>메뉴상세페이지</b></h4>
      </div>
      <br/>
      <div  class="modal-body">
        
        <!-- menuArticle내용 보여줌  -->
       
        
      </div>

    </div>
  </div>
</div>

<script type="text/javascript">


   
 
</script>




</body>
</html>
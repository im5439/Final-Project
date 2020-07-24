<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html lang="ko" slick-uniqueid="3">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript">

$(function(){

	$('#btn-reply').click(function(){
			var renum = $('#renum').val();
			console.log("modal renum : " + renum);
			
	        var params = "renum=" + $("#renum").val();
	        params += "&ceoContent=" + $("#ceoContent").val();
	        params += "&shopCode=" + $("#shopCode").val();//다음 데이터는 &를 붙여준다
	        
	        console.log(params);
	        
	        $.ajax({
	            type:"post",
	            url:"<%=cp%>/ajaxCeoReview.action",
	            async: false,
	            data:params,
	            success: function(args){
	               
	               $("#ceoReviewArticle").html(args);
	              // $("#reviewModal").html();
	               //$("#ceoContent").val("");
	               
	            },
	            error:function(e){
	            	alert("실패하였습니다.");
	            	console.log(request.status);
	            	console.log(request.responseText);
	            	console.log(error);
	          }
	          
	        });
	        
 	});
});
</script>
</head>
<body>
<!-- modal -->
<div id="ex1" class="modal" style="height: max-content;">
		<!-- ngIf: !!review.owner_reply -->
		<div class="review-answer ng-scope">
			<div>
				<span class="owner-review-id">사장님 댓글달기</span>
				</div>
			<p class="ng-binding">
				<textarea id="ceoContent"  cols="50" rows="5" maxlength="300" placeholder="사장님 댓글(최대 300자)"></textarea>
			</p>
			renum : <input type="text" value="${renum }" id="renum"><br/>
			shopCode : <input type="text" value="${shopCode }" id="shopCode">
			<a href="#" id="btn-reply" rel="modal:close" >등록</a>
			</div>
		<!-- end ngIf: !!review.owner_reply -->
  <a href="#" rel="modal:close">닫기</a>
</div>
<!-- modal -->
</body>
</html>
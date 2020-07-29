<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function(){
		$('.btn-own-login').click(function(){
			
				/* console.log("modal renum : " + "${renum}");
				
		        var params = "ceoContent=" + $(".ceoContent").val();
		        params += "&renum=" + "${renum }";
		        params += "&shopCode=" + "${shopCode}";//다음 데이터는 &를 붙여준다 */
		        
		        var formData = new FormData();
				formData.append("renum", $("input[name=renum]").val());
				formData.append("ceoContent", $("textarea[name=ceoContent]").val());
				formData.append("shopCode", $("input[name=shopCode]").val());
				formData.append("end", $("input[name=end]").val());
		        
				//console.log(params);
		        
		        $.ajax({
		            type:"post",
		            url:"<%=cp%>/ajaxCeoReview.action",
		            data:formData,
		            processData: false, 
					contentType: false, 
		            async: false,
		            success: function(args){
		               
		            	$("#ceoReviewArticle").html(args);
		            	
		            },
		            error:function(e){
		            	console.log("실패하였습니다.");
		            	console.log(request.status);
		            	console.log(request.responseText);
		            	console.log(error);
		          }
		          
		        });
		        
			});
		
		   $('#ex1').on('shown.bs.modal', function(){

				$("#ceoContent").focus();	

			});
	});
	
	
</script>
<!-- modal -->
<div id="ex1" class="modal" style="height: max-content;">
<form action="" method="post" name="myForm" >
		<!-- ngIf: !!review.owner_reply -->
		<div class="review-answer ng-scope">
			<div>
				<span class="owner-review-id">사장님 댓글달기</span>
			</div>
				<textarea id="ceoContent" class="ceoContent" name="ceoContent" cols="50" rows="5" maxlength="300" placeholder="사장님 댓글(최대 300자)"></textarea>
			<!-- <a href="javascript:location" class="btn-reply" rel="modal:close" >등록</a> -->
			<button type="submit" class="btn-own-login">등록</button>
			<!-- <button class="btn-reply">등록</button> -->
			</div>
		<!-- end ngIf: !!review.owner_reply -->
  		<!-- <a href="#" rel="modal:close">닫기</a> -->
			<input type="hidden" value="${renum }" id="renum" name="renum">
			<input type="hidden" value="${shopCode }" id="shopCode" name="shopCode">
			<input type="hidden" value="${end }" id="end" name="end">
</form>
</div>
<!-- modal -->

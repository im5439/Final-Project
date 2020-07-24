<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<script type="text/javascript">
		
	$(function(){ 
		
		$('.orderChk').click(function(){
			
	        var btnIdx = $(this).attr('index');
	        console.log("index : " + btnIdx);
	        
	        var params = "orderCode=" + $("#orderCode" + btnIdx).val();
	        
	        console.log(params);
	        
	        $.ajax({
	            type:"post",
	            url:"<%=cp%>/storeOrderChk_ok.action",
	            async: false,
	            data: params,
	            success: function(args){
	               
	               $("#orderChkList").innerhtml(args);
	               
	            },
	            error:function(e){
	            	console.log(request.status);
	            	console.log(request.responseText);
	            	console.log(error);
	          }
	          
	        });
	        return false;
	    });
		
	});
	
		
</script>

				<div class="card mb-3 mb-md-4">
                        <div class="card-header">
                            <h5 class="font-weight-semi-bold mb-0">매장명 : ${shopName }</h5>
                        </div>

                        <div class="card-body pt-0">
                            <div class="table-responsive-xl">
                                <table class="table text-nowrap mb-0">
                                    <thead>
                                    <tr>
                                        <th class="font-weight-semi-bold border-top-0 py-2">#주문코드</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">주문정보</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">고객정보</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">주문총액</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">주문상태</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dto" items="${orderList }" varStatus="status">
                                    <tr>
                                        <td class="py-3">${dto.orderCode }</td>
                                        <td class="py-3">
                                        	<c:forEach var="dedto" items="${dto.orderDetail }">
                                            <div>${dedto.menuName }</div>
                                            <div class="text-muted">수량 : ${dedto.oqty }</div>
                                        	</c:forEach>
                                        </td>
                                        <td class="py-3">
                                        	<div>주문ID : ${dto.userId }</div>
                                        	<div>주문 일시 : ${dto.orderDate }</div>
                                        	<div>Tel : ${dto.userTel }</div>
                                        	<div>주소 : ${dto.userAddr1 }${dto.userAddr2 }</div>
                                        	<div>요청사항 : ${dto.request}</div>
                                        </td>
                                        
                                        <td class="py-3">\ <fmt:formatNumber value="${dto.oamount }" type="number"/> 원</td>
                                        <td class="py-3">
                                        <c:if test="${dto.orderStatus == '100' }">
                                            <span class="badge badge-pill badge-warning">주문확인</span></c:if>
                                            <c:if test="${dto.orderStatus == '200' }">
                                            <span class="badge badge-pill badge-success">준비중</span></c:if>
                                            <c:if test="${dto.orderStatus == '300' }">
                                            <span class="badge badge-pill badge-light">배달완료</span></c:if>
                                        </td>
                                        <td class="py-3">
                                            <div class="position-relative">
                                            	<c:if test="${dto.orderStatus == '100' }">
												<div><a href="" class="orderChk" index="${status.index }"><span class="badge badge-pill badge-danger" style="background-color: #00ff33;'">주문확인</span></a></div>
												<div><a href="" class="orderChk" index="${status.index }"><span class="badge badge-pill badge-danger" style="background-color: #ff0033;'">주문취소</span></a></div>
												<input type="hidden" id="orderCode${status.index }" value="${dto.orderCode }">
                                            	</c:if>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-sm-8" style="width: 1000px;padding-left: 0px;padding-right: 20px;">

     <div ng-show="active_tab == &quot;review&quot;" class="">

        <ul id="review" class="list-group review-list">

           <!-- ngRepeat: review in restaurant.reviews -->
           <!-- 포이치 시작!!!! -->
           <li class="list-group-item star-point ng-scope"
              ng-repeat="review in restaurant.reviews"
              on-finish-render="scrollCartArea()">
              <div class="b_ta_info">
           <table width="100%" border="1" class="b_table_grey">
              <thead style="text-align-last: center;">
                 <tr>
                    <th colspan="2">매장 정보</th>
                 </tr>
              </thead>
              <c:forEach var="dto" items="${lists}">
              <tbody id="orderList">
                 
                    <tr>
                       <td colspan="2" style="border: 1; padding: 0" ></td>
                    </tr>
                    <tr cno="3273614152" ctype="G" column="4" class="first">
                       <td class="first_cell" rowspan="1" style="vertical-align: middle">
                          <div class="td_detail">
                             <img
                                src="/eatswill/resources/images/${dto.shopImg}" width="80"
                                height="80">
                          </div>
                       </td>
                       <td style="text-align-last: left">
                          <div class="td_info">
                             
                             <ul>
                                <li class="seller_info"><em></em><a href="${storeUrl}?shopCode=${dto.shopCode}&ceoId=${dto.ceoId}">${dto.shopName }</a></li>
                                <br>
                                <li class="tit_info" style="font-size: 12pt">
                                	   <div class="star-point">
                           <span class="total"> <c:forEach begin="1"
                                 end="${dto.shopScore }">
                                 <span class="full ng-scope"
                                    ng-repeat="i in review.rating|number_to_array track by $index">★</span>
                              </c:forEach> <c:if test="${dto.shopScore < 5 }">
                                 <c:forEach begin="0" end="${4 - dto.shopScore }">
                                    <span class="empty ng-scope"
                                       ng-repeat="i in (5.9 - (review.rating|number:1))|number_to_array track by $index">★</span>
                                 </c:forEach>
                              </c:if>
                           </span> 
                                ${dto.shopScore } (${dto.reCnt })
                        </div>
						</li>
                             </ul>
                          </div>
                       </td>
                    </tr>
                 
              </tbody>
              </c:forEach>
           </table>
        </div>
           </li>
        </ul>
     </div>
  </div>
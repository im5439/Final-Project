<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/javascript">
   
   //ajax
   $('.btn-example').click(function(){
        var btnIdx = $(this).attr('index');
        
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
        
    });
   
 
</script>


</head>


<body>


<!-- <input type="button" id="test" value="팝업 테스트"/><br/> -->


<c:forEach var="dto" items="${lists }" varStatus="status">
 <!-- Href trigger modal 모달 팝업창을 불러주기 위해 부트스트랩 사용 및 내용 추가수정-->

<div class="panel-collapse collapse in btn-scroll-container" ng-show="toggle_category(category)">
            <div ng-class="'panel-body' + (category.slug == 'photo_menu_items' ? ' photo-menu-container' : '')" class="panel-body">
              <div class="category-desc ng-binding ng-hide" ng-show="category.description" ng-bind-html="category.description|strip_html"></div>
              <div ng-show="category.slug=='photo_menu_items'" class="ng-hide">
        
              </div>
      
              <ul class="sub-list" ng-show="category.slug!='photo_menu_items'">
                 <!-- ngRepeat: item in category.items --><!-- ngIf: check_count(category.slug, $index) -->
                 
                 
                 
                 <li ng-repeat="item in category.items" ng-click="select_menuitem(item)" ng-if="check_count(category.slug, $index)" ng-class="get_menu_item_class(item)" class="ng-scope photo-menu">
                  <table>
                    <tbody><tr>
                      <td class="menu-text">
                        
                        <!-- 제목 -->
                        <div class="menu-name ng-binding" ng-bind-html="item.name|strip_html">
                        <a class="btn-example" href="#1" index="${status.index}" data-toggle="modal" data-target="#myModal" style="color: orange;">${dto.menuName }</a>
                        </div>
                        
                        <!-- 설명 -->
                        <div class="menu-desc ng-binding" ng-show="item.description" ng-bind-html="item.description|strip_html">
                        맛있는 ${dto.menuName }
                        </div>
                        
                        
                        <!-- 가격 -->
                        <div class="menu-price">
                          <span ng-class="is_discount(item) ? 'text-strike' : ''" ng-bind="item.price|krw" class="ng-binding">${dto.menuPrice } 원</span>
                     
                        </div>
                        
                        
          
                      </td>
                      
                      <!-- 사진 -->
                      <td class="photo-area" ng-show="item.image">
                        <div>
                        <img  src="resources/img/${dto.menuImg }" width="80px" height="80px" >
                        </div>
                      </td>
                      
                      
                    </tr>
                  </tbody></table>
                </li>
                 
        
              </ul>
            </div>
          </div>






<br/>
<!-- DB에서 메뉴들의 정보를 가져오기 위해 post로 데이터를 보냄 (menuCode) -->
<input type="hidden" value="${dto.menuCode}" id="menuCode${status.index}"/>
<input type="hidden" name="shopCode" id="shopCode" value="${dto.shopCode}" />
</c:forEach>

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
      <div class="modal-body">
        
        <!-- menuArticle내용 보여줌  -->
       
        
      </div>

    </div>
  </div>
</div>






</body>
</html>
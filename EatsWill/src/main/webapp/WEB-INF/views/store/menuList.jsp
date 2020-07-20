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



<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<%-- <script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=cp%>/resources/data/js/jquery-ui.js"></script> --%>


<!-- 레이어 팝업 css

<style type="text/css">

* {
  margin: 0;
  padding: 0;
}

body {
  margin: 100px;
}

.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #f15f5f;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #f15f5f;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}


</style>
 -->

<script type="text/javascript">
   
   //ajax
   $('.btn-example').click(function(){
        //var $href = $(this).attr('href');
        var btnIdx = $(this).attr('index');
        //alert(btnIdx);
        
        var params = "menuCode="+$("#menuCode"+btnIdx).val();
        params += "&userId=" + $("#userId").val();//다음 데이터는 &를 붙여준다
        
        
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
   
   <%-- 
   //일반 팝업
   $(document).on('click','#test',function(){
      var data= $("#menuCode").val();
      window.open('<%=cp%>/menuArticle.action?menuCode='+data,'test','width=400,height=400');
      
   });  --%>
   
   <%--
   //레이어 팝업
    function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn(); //레이어를 감지하면 dim-layer 클래스 이름을 가진 곳에 fadein

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
            
            modal:true;
          
            
        } else {
            $el.css({top: 0, left: 0});
        }
        

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
          
           
               확인 또는 취소되었을때 메세지 띄우기 테스트
             $ajax({
               type:"POST",
               url:"<%=cp%>/time.action",
               timeout:2000,
               success: function(args){
                   
                   $("#timetest").html(args); // 팝업 내용 - menuArticle
                   
             },
                error:function(e){
                 e.responseText();
            }
               
            }); 
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });
        
        //장바구니로 보내기 기능
        
    }
    --%>
   
</script>


</head>


<body>


<!-- <input type="button" id="test" value="팝업 테스트"/><br/> -->


<c:forEach var="dto" items="${lists }" varStatus="status">
 <!-- Href trigger modal 모달 팝업창을 불러주기 위해 부트스트랩 사용 및 내용 추가수정-->
<a class="btn-example" href="#1" index="${status.index}" data-toggle="modal" data-target="#myModal">메뉴명:${dto.menuName }</a>

사진: ${dto.menuImg }
메뉴가격: ${dto.menuPrice }

<br/>
<!-- DB에서 메뉴들의 정보를 가져오기 위해 post로 데이터를 보냄 (menuCode) -->
<input type="hidden" value="${dto.menuCode}" id="menuCode${status.index}"/>
</c:forEach>

<input type="hidden" value="${userId}" id="userId"/>
<!-- 레이어 팝업  내부 양식
<div class="dim-layer">
    <div class="dimBg"></div>
       <div id="1" class="pop-layer">
           <div class="pop-container">
               <div class="pop-conts">
                   content //
                   <p class="ctxt mb20">
                   
               </p>
               
                   
                   // content
               </div>
           </div>
           <div class="btn-r">
              <a href="#" class="btn-layerClose">Close</a>
          </div>
    </div>
</div>
 -->




<!-- Modal팝업 내부양식  각 클래스들은 부트스트랩.js를 위한 클래스들임 지우면 안됨-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
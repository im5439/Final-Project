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
<title>eat's will</title>

<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script type="text/javascript" src="/eatswill/resources/assets/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/eatswill/resources/assets/js/login.js"></script>
		
</head>
<body>

<div id="wrapper">			
	<div class="inner" style="background-color: red;" >
	<br/>
	  <a href="" >로그인</a>  &nbsp;&nbsp;  <a href="">회원가입</a> <br/>
	
	  <input type="button" value="로그인" class="small" onclick="javascript:location.href='<%=cp %>/login.action';"> &nbsp;&nbsp; 
	  <input type="button" value="회원가입" class="small" onclick="javascript:location.href='<%=cp %>/signup.action';">
	
	</div>
	<!-- Header -->
	<header id="header" >
		<div class="inner" style="text-align: -webkit-center">

			<!-- Logo -->
			<a href="main.action" class="logo">
				<span class="symbol" ><img src="/eatswill/resources/images/iconfeeldo.png" alt="" /></span><span class="title">잇츠윌 IT's Will</span>
			</a>

			<!-- Nav -->
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>
			
			<br/>
				
			<footer id="footer" style="padding: 2em;width: 30%">
				<div class="inner" style="place-content: center">
					<section>
						<form action="" method="post" name="myForm" style="text-align: -webkit-center">
							<%-- <%@ include file="test.jsp" %> jsp 내용 이후가 작성이 안됨 --%>
							<!-- <div class="field half first">
								<input type="text" name="name" id="name" placeholder="Name" />
							</div>
							<div class="field half">
								<input type="email" name="email" id="email" placeholder="Email" />
							</div> -->
							
							<!-- 2020.07.06 filed margin 수정, input[type="text"] height 수정, logincheck 속성 추가 -->
							<div>
								<div class="field">
									<input type="text" name="id" id="id" placeholder="아이디" style="font-size: 70%"/>
								</div>							
								<div class="field">
									<input type="text" name="email" id="email" placeholder="이메일" style="font-size: 70%"/>
								</div>
							</div>
							
							<ul class="actions" style="padding-top: 1em">
								<li><input type="button" value="확인" class="special" id="findId"/></li>
							</ul>
						</form>
					</section>
				</div>
			</footer>

		</div>
	</header>
</div>
</body>
</html>
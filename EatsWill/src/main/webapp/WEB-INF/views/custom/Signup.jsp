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
		
</head>
<body>

<div id="wrapper">			
	<div class="inner" style="background-color: red;" >
	<br/>
	  <a href="" >로그인</a>  &nbsp;&nbsp;  <a href="">회원가입</a> <br/>
	
	  <input type="button" value="로그인" class="small"> &nbsp;&nbsp; <input type="button" value="회원가입" class="small">
	
	</div>
	<!-- Header -->
	<header id="header" >
		<div class="inner" style="text-align: -webkit-center">

			<!-- Logo -->
			<a href="index.html" class="logo">
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
						<h2>회원가입</h2>
						<form method="post" action="insert.action" style="text-align: -webkit-center">
							<%-- <%@ include file="test.jsp" %> jsp 내용 이후가 작성이 안됨 --%>
							<!-- <div class="field half first">
								<input type="text" name="name" id="name" placeholder="Name" />
							</div>
							<div class="field half">
								<input type="email" name="email" id="email" placeholder="Email" />
							</div> -->
							
							<!-- 2020.07.06 filed margin 수정 -->
							<div>
								<div class="field half first">
									<input type="text" name="id" id="id" placeholder="아이디" style="font-size: 80%"/>
								</div>
								<div class="field half">
									<input type="text" name="pwd" id="pwd" placeholder="패스워드" style="font-size: 80%"/>
								</div>
								<div class="field">
									<input type="text" name="name" id="name" placeholder="이름" style="font-size: 80%"/>
								</div>
								<div class="field">
									<input type="text" name="tel" id="tel" placeholder="전화번호" style="font-size: 80%"/>
								</div>
								<div class="field">
									<input type="text" name="address" id="address" placeholder="주소" style="font-size: 80%"/>
								</div>
								<div class="field">
									<input type="email" name="email" id="email" placeholder="이메일" style="font-size: 80%"/>
								</div>
							</div>
							<ul class="actions" style="padding-top: 2em">
								<li><input type="submit" value="Send" class="special" /></li>
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
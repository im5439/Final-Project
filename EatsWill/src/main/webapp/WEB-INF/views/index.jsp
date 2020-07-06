<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>eat's will</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/eatswill/resources/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
		<!-- Wrapper -->
			<div id="wrapper">
					
					
					<div class="inner" style="background-color: red;" >
					<br/>
					  <a href="" >로그인</a>  &nbsp;&nbsp;  
					  <a href="">회원가입</a> <br/>
					
					  <input type="button" value="로그인" class="small"> &nbsp;&nbsp; 
					  <input type="button" value="회원가입" class="small" onclick="javascript:location.href='<%=cp %>/choice.action';">
					
					</div>
				<!-- Header -->
					<header id="header" >
						<div class="inner">

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

						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="generic.html">내정보</a></li>
							<li><a href="generic.html">주문내역</a></li>
							<li><a href="generic.html">ㅇㅇ</a></li>
							<li><a href="elements.html">ㅇㅇ</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner" >
							<header style="background-image: url('/eatswill/resources/images/th.gif'); color: white;">
								<br/><h1>배달사이트를 만들고싶습니다<br />
								우리팀 조장은 <a href="http://html5up.net">충환이오빠</a>.</h1>
								<p>배경음식사진으로 바꿀꺼</p><br/>
							</header>
							<section class="tiles">
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo1.jpg" alt="" />
									</span>
									<a href="">
										<h2>전체보기</h2>
										<div class="content">
											<p>모든음식보기</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo2.jpg" alt="" />
									</span>
									<a href="">
										<h2>중식</h2>
										<div class="content">
											<p>짜장면 짬뽕 탕수육 </p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo3.jpg" alt="" />
									</span>
									<a href="">
										<h2>한식</h2>
										<div class="content">
											<p>한국인은 밥심</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo4.jpg" alt="" />
									</span>
									<a href="">
										<h2>치킨</h2>
										<div class="content">
											<p>역시 치킨이 최고야</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo5.jpg" alt="" />
									</span>
									<a href="">
										<h2>피자/양식</h2>
										<div class="content">
											<p>느끼한게 땡길때</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo6.jpg" alt="" />
									</span>
									<a href="">
										<h2>일식</h2>
										<div class="content">
											<p>초밥 먹고싶다</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo7.jpg" alt="" />
									</span>
									<a href="">
										<h2>분식</h2>
										<div class="content">
											<p>떡볶이 사랑해</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="/eatswill/resources/images/feeldo1.jpg" alt="" />
									</span>
									<a href="">
										<h2>프렌차이즈</h2>
										<div class="content">
											<p>브랜드만 보여줘</p>
										</div>
									</a>
								</article>
								
							</section>
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="#">
									<div class="field half first">
										<input type="text" name="name" id="name" placeholder="Name" />
									</div>
									<div class="field half">
										<input type="email" name="email" id="email" placeholder="Email" />
									</div>
									<div class="field">
										<textarea name="message" id="message" placeholder="Message"></textarea>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="special" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="/eatswill/resources/assets/js/jquery.min.js"></script>
			<script src="/eatswill/resources/assets/js/skel.min.js"></script>
			<script src="/eatswill/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/eatswill/resources/assets/js/main.js"></script>

	</body>
</html>
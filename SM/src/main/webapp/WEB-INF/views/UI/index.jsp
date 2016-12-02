<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>Bootstrap E-commerce Templates</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
			<!-- <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
		<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" />     <!--  선생님 수정  --> 
		<link href="<c:url value='/resources/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">
		
		<link href="<c:url value='/resources/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='/resources/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='/resources/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src=<c:url value='/resources/themes/js/jquery-1.7.2.min.js'/> ></script>
		<script src=<c:url value='/resources/bootstrap/js/bootstrap.min.js'/> ></script>				
		<script src=<c:url value='/resources/themes/js/superfish.js'/> ></script>	
		<script src=<c:url value='/resources/themes/js/jquery.scrolltotop.js'/> ></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>
    
    <a href="home">홈</a>	
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="예) 목걸이">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="mypage">마이페이지</a></li>
							<li><a href="cart">장바구니</a></li>
							<li><a href="checkout">Checkout</a></li>		
						
						<c:if test="${empty login_id}">
						<li><a href="register">로그인</a></li>	
						</c:if>
								<c:if test="${not empty login_id }">
								<!-- 세션에 로그인 정보가 있는 경우 -->
								<c:url value="/buyer/logout" var="logout" />
								<li><a href="${logout }">로그아웃</a></li>		
								</c:if>			
	
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index" class="logo pull-left"><img src=<c:url value='/resources/themes/images/logo.png' /> class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products.html">홈/데코</a>					
								<ul>
									<li><a href="./products.html">Lacinia nibh</a></li>									
									<li><a href="./products.html">Eget molestie</a></li>
									<li><a href="./products.html">Varius purus</a></li>									
								</ul>
							</li>															
							<li><a href="./products.html">캔들/디퓨저</a></li>			
							<li><a href="./products.html">아트/펜시</a>
								<ul>									
									<li><a href="./products.html">Gifts and Tech</a></li>
									<li><a href="./products.html">Ties and Hats</a></li>
									<li><a href="./products.html">Cold Weather</a></li>
								</ul>
							</li>							
							<li><a href="./products.html">쥬얼리</a></li>
							<li><a href="./products.html">인기 판매자</a></li>
							<li><a href="./products.html">Top Seller</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<section  class="homepage-slider" id="home-slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<img src=<c:url value='/resources/themes/images/carousel/banner-5.jpg'/> alt="" />
							<div class="intro">
								<h1>누군가를 위해, 또는 나를 위해</h1>
								<p><span>따스함을 선물해 보세요</span></p>
								<p><span>건강한 베이킹 DIY KIT 20%</span></p>
							</div>
						</li>
						<li>
							<img src=<c:url value='/resources/themes/images/carousel/banner-4.jpg'/> alt="" />
							<div class="intro">
								<h1>크리스마스엔 직접 만든</h1>
								<p><span>베이킹 선물 어떠세요?</span></p>
								<p><span>건강한 베이킹 DIY KIT 20%</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
			<section class="header_text">
				손으로 할 수 있는 모든 것을 담아내는 곳
				<br/>손이 없으면 할 수 없는 멋진 수공예 상품과 만나고, 함께 배울 수 있는 공간입니다.
			</section>
			<section class="main-content">
				<div class="row">
					<div class="span12">													
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">베스트 <strong>상품</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">		
															<!-- ------------------------  -->						
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/b1.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Ut wisi enim ad</a><br/>
														<a href="products.html" class="category">Commodo consequat</a>
														<p class="price">$17.25</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/b2.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Quis nostrud exerci tation</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$32.50</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/b3.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Know exactly turned</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$14.20</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/b4.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">You think fast</a><br/>
														<a href="products.html" class="category">World once</a>
														<p class="price">$31.45</p>
													</div>
												</li>
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/5.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Know exactly</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$22.30</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/6.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Ut wisi enim ad</a><br/>
														<a href="products.html" class="category">Commodo consequat</a>
														<p class="price">$40.25</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/7.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">You think water</a><br/>
														<a href="products.html" class="category">World once</a>
														<p class="price">$10.45</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/ladies/8.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Quis nostrud exerci</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$35.50</p>
													</div>
												</li>																																	
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<br/>
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">새로운 <strong>상품</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-2" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">												
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="product_detail.html">
														<!-- <img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware2.jpg'/> alt="" /> -->
														<img src=<c:url value='/resources/themes/images/ladies/b4.jpg'/> alt="" />
														</a></p>
														<a href="product_detail.html" class="title">Ut wisi enim ad</a><br/>
														<a href="products.html" class="category">Commodo consequat</a>
														<p class="price">$25.50</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html">
														<!-- <img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware1.jpg'/> alt="" /> -->
														<img src=<c:url value='/resources/themes/images/ladies/b3.jpg'/> alt="" />
														</a></p>
														<a href="product_detail.html" class="title">Quis nostrud exerci tation</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$17.55</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html">
														<!-- <img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware6.jpg'/> alt="" /> -->
														<img src=<c:url value='/resources/themes/images/ladies/b2.jpg'/> alt="" />
														</a></p>
														<a href="product_detail.html" class="title">Know exactly turned</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$25.30</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html">
														<!-- <img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware5.jpg'/> alt="" /> -->
														<img src=<c:url value='/resources/themes/images/ladies/b1.jpg'/> alt="" />
														</a></p>
														<a href="product_detail.html" class="title">You think fast</a><br/>
														<a href="products.html" class="category">World once</a>
														<p class="price">$25.60</p>
													</div>
												</li>
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware4.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Know exactly</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$45.50</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware3.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Ut wisi enim ad</a><br/>
														<a href="products.html" class="category">Commodo consequat</a>
														<p class="price">$33.50</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware2.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">You think water</a><br/>
														<a href="products.html" class="category">World once</a>
														<p class="price">$45.30</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src=<c:url value='/resources/themes/images/cloth/bootstrap-women-ware1.jpg'/> alt="" /></a></p>
														<a href="product_detail.html" class="title">Quis nostrud exerci</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$25.20</p>
													</div>
												</li>																																	
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<div class="row feature_box">						
							<div class="span4">
								<div class="service">
									<div class="responsive">	
										<img src=<c:url value='/resources/themes/images/feature_img_2.png'/> alt="" />
										<h4>MODERN <strong>DESIGN</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>									
									</div>
								</div>
							</div>
							<div class="span4">	
								<div class="service">
									<div class="customize">			
										<img src=<c:url value='/resources/themes/images/feature_img_1.png'/> alt="" />
										<h4>FREE <strong>SHIPPING</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="service">
									<div class="support">	
										<img src=<c:url value='/resources/themes/images/feature_img_3.png'/> alt="" />
										<h4>24/7 LIVE <strong>SUPPORT</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
									</div>
								</div>
							</div>	
						</div>		
					</div>				
				</div>
			</section>
			<section class="our_client">
				<h4 class="title"><span class="text">Manufactures</span></h4>
				<div class="row">					
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/14.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/35.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/1.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/2.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/3.png'/>></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src=<c:url value='/resources/themes/images/clients/4.png'/>></a>
					</div>
				</div>
			</section>
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="./index.html">Homepage</a></li>  
							<li><a href="./about.html">About Us</a></li>
							<li><a href="./contact.html">Contac Us</a></li>
							<li><a href="./cart.html">Your Cart</a></li>
						<!-- ------------------------------------------------------  -->	
							<li><a href="./register.html">Login.</a></li>							
						<!-- ------------------------------------------------------  -->
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src=<c:url value='/resources/themes/images/logo.png'/> class="site_logo" alt=""></p>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src=<c:url value='/resources/themes/js/common.js'/>></script>
		<script src=<c:url value='/resources/themes/js/jquery.flexslider-min.js'/>></script>
		<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
		</script>
    </body>
</html>
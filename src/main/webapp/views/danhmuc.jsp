<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${category.tendanhmuc}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="<c:url value='home/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">      
		<link href="<c:url value='home/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">		
		<link href="<c:url value='home/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='home/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='home/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src="<c:url value='home/themes/js/jquery-1.7.2.min.js' />"></script>
		<script src="<c:url value='home/bootstrap/js/bootstrap.min.js' />"></script>				
		<script src="<c:url value='home/themes/js/superfish.js' />"></script>	
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					
				</div>
				<div class="span8">
					<div class="account pull-right">
					<ul class="user-menu">
						<li><a href="<c:url value='/cart2?action=view' />">Your
								Cart2 <b>(<span id="countTotal">${sessionScope.cart.tongsl}</span>)
							</b>
						</a></li>
						<c:if test="${empty sessionScope.user}">
							<li><a href="<c:url value='/login' />">Login</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.user}">
							<li><a href="<c:url value='/logout' />">Logout</a></li>
							<li><i>Welcome,</i> <b>${sessionScope.user.username}</b></li>
						</c:if>
					</ul>
				</div>
			</div>
			<header class="bg-dark py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="text-center text-white">
					<a href="/ASM/index"><h1 class="display-4 fw-bolder">Shop in style</h1></a>
					<p class="lead fw-normal text-white-50 mb-0">With this shop
						homepage template</p>
				</div>
			</div>
		</header>
		</div>
		<div id="wrapper" class="container">
			<section class="header_text sub">
			
				<h4><span>${category.tendanhmuc}</span></h4>
			</section>
			<section class="main-content">
				
				<div class="row">						
					<div class="span9">								
						<ul class="thumbnails listing-products">
							<c:forEach var="product" items="${listProduct}">
								<li class="span3">
									<div class="product-box">
										<span class="sale_tag"></span>												
										<a href="<c:url value='/sanpham?maSP=${product.masp}' />"><img alt="" src="<c:url value='home/themes/images/hinhanh/${product.hinh}' />"></a><br/>
										<a href="<c:url value='/sanpham?maSP=${product.masp}' />" class="title">${product.tensp}</a><br/>
										<a href="#" class="category">${product.mota}</a>
										<p class="price">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.giasp}" />
										</p>
									</div>
								</li>
							</c:forEach>       
							
						</ul>								
						<hr>
						<div class="pagination pagination-small pagination-centered">
							<ul>
								<li><a href="#">Prev</a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">Next</a></li>
							</ul>
						</div>
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">CATEGORIES</li>
								<c:forEach var="category" items="${listCategory}">
									<li><a href="<c:url value='/sanpham?maDM=${category.madm}'/>">${category.tendanhmuc}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</section>
			<section id="footer-bar">
			<div class="row">

				<div class="span12">
					<h4 class="text-center">PS22736_Nguyễn Tấn Tài</h4>
				</div>
			</div>
		</section>
		<section class="text-center" id="copyright">
			<span>Website_BanHangOnline</span>
		</section>
		</div>
		<script src="<c:url value='home/themes/js/common.js' />"></script>	
    </body>
</html>
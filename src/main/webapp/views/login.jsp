<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login</title>
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
		</div>
		<header class="bg-dark py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="text-center text-white">
					<h1 class="display-4 fw-bolder">Shop in style</h1>
					<p class="lead fw-normal text-white-50 mb-0">With this shop
						homepage template</p>
				</div>
			</div>
		</header>
	</div>
		<div id="wrapper" class="container">
			
			<section class="header_text sub">
				<h4><span>Login</span></h4>
			</section>
			<section class="main-content">
				<div class="row">
					<div style="width: 400px; margin: auto">					
						<h4 class="title"><span class="text"><strong>Login</strong> Form</span></h4>
						<h5 style="color: red; text-align: center; margin-top: -10px">${errorMessage}</h5>
						<form action="<c:url value='/login' />" method="POST" >
							<input type="hidden" name="next" value="/">
							<fieldset>
								<div class="control-group">
									<label class="control-label">Username</label>
									<div class="controls">
										<input type="text" placeholder="Enter your username" id="username" name="username" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Password</label>
									<div class="controls">
										<input type="password" name="password" placeholder="Enter your password" id="password" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<input tabindex="3" class="btn btn-inverse large" type="submit" value="Login">
									<hr>
									<p class="reset">Recover your <a tabindex="4" href="#" title="Recover your username or password">username or password</a></p>
								</div>
							</fieldset>
						</form>				
					</div>
				</div>
			</section>
			<section id="footer-bar">
			<div class="row">

				<div class="span5">
					<h4>Tấn Tài</h4>
				</div>
			</div>
		</section>
		<section id="copyright">
			<span>Hello</span>
		</section>
		</div>
			
    </body>
</html>
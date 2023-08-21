<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- bootstrap -->
<link href="<c:url value='home/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='home/bootstrap/css/bootstrap-responsive.min.css' />"
	rel="stylesheet">
<link href="<c:url value='home/themes/css/bootstrappage.css' />"
	rel="stylesheet" />

<!-- global styles -->
<link href="<c:url value='home/themes/css/flexslider.css' />"
	rel="stylesheet" />
<link href="<c:url value='home/themes/css/main.css' />" rel="stylesheet" />

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
					<a href="/ASM/index"><h1 class="display-4 fw-bolder">Shop in style</h1></a>
					<p class="lead fw-normal text-white-50 mb-0">With this shop
						homepage template</p>
				</div>
			</div>
		</header>
	</div>
	<div id="wrapper" class="container">

		<section class="header_text sub">

			<h4>
				<span class="text-primary">Cart detail</span>
			</h4>
		</section>
		<section class="main-content">
			<div class="row">
				<div class="span12">
					<h4 class="title">
						<span class="text-warning"><strong>Your</strong> Cart</span>
					</h4>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Remove</th>
								<th>Image</th>
								<th>Product Name</th>
								<th>Quantity</th>
								<th>Unit Price</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartDetail" items="${sessionScope.cart.detail}">
								<tr id="tr-${cartDetail.value.masp}">
									<td><button onclick="removeSP('${cartDetail.value.masp}')"
											class="btn btn-warning" type="button">Xóa</button></td>
									<td></td>
									<td>${cartDetail.value.tensp}</td>
									<td><input id="slMua-${cartDetail.value.masp}"
										onchange="updateCart('${cartDetail.value.masp}')"
										type="number" class="input-mini"
										value="${cartDetail.value.slMua}"></td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${cartDetail.value.giasp}" /></td>
									<td><span id="totalSP-${cartDetail.value.masp}"> <fmt:formatNumber
												type="number" maxFractionDigits="3"
												value="${cartDetail.value.giasp * cartDetail.value.slMua}" />
									</span></td>
								</tr>
								<input type="hidden" id="giaSP-${cartDetail.value.masp}"
									value="${cartDetail.value.giasp}" />
							</c:forEach>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><strong id="tongTien"><fmt:formatNumber
											type="number" maxFractionDigits="3"
											value="${sessionScope.cart.tongtien}" /></strong></td>
							</tr>
						</tbody>
					</table>
					<hr />
					<div class="row-fluid">
						<div class="span6">
							<div class="control-group">
								<label class="control-label">Phone number:</label>
								<div class="controls">
									<input id="phoneNumber" type="text" placeholder=""
										maxlength="11" class="input-xlarge">
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="control-group">
								<label class="control-label">Address:</label>
								<div class="controls">
									<input id="address" type="text" placeholder=""
										class="input-xlarge">
								</div>
							</div>
						</div>
					</div>
					<hr />
					<p class="buttons center">
						<button class="btn btn-info" type="button" id="payNow">Mua
							Ngay</button>
					</p>
				</div>

			</div>
		</section>
		<section  id="footer-bar">
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
	<script>
		function removeSP(maSP) {
			$.ajax({
				url : 'cart?action=add&masp=' + maSP + '&soluong=0&isUpdate=0',
				dataType : 'json'
			}).then(function(data) {
				$('#tongTien').text(numberWithDot(data.tongtien));
				$('#countTotal').text(data.tongsl);
				var idRemoveTag = '#tr-' + maSP;
				$(idRemoveTag).remove();
			}).fail(function(error) {
				alert('Xóa thất bại, vui lòng thử lại!');
			});
		}

		function updateCart(maSP) {
			var idInputSL = '#slMua-' + maSP;
			var slUpdate = $(idInputSL).val();
			var idInputGiaSP = '#giaSP-' + maSP;
			var giaSP = parseFloat($(idInputGiaSP).val());
			if (parseInt(slUpdate) < 1) {
				removeSP(maSP);
			} else {
				$.ajax(
						{
							url : 'cart?action=add&masp=' + maSP + '&soluong='
									+ slUpdate + '&isUpdate=1',
							dataType : 'json'
						}).then(
						function(data) {
							$('#tongTien').text(numberWithDot(data.tongtien));
							$('#countTotal').text(data.tongsl);
							var tongTienSPUpdate = parseFloat(giaSP
									* parseInt(slUpdate));
							let idTongGiaSP = '#totalSP-' + maSP;
							$(idTongGiaSP)
									.text(numberWithDot(tongTienSPUpdate));
						}).fail(function(error) {
					alert('Cập nhật thất bại, vui lòng thử lại!');
				});
			}
		}

		$('#payNow').click(
				function() {
					var checkUserLogin = $('#checkUserLogin').val();
					if (checkUserLogin.length == 0) {
						window.location.href = "login";
						return;
					}

					var phone = $('#phoneNumber').val();
					var address = $('#address').val();
					if (phone.length == 0) {
						alert('Vui lòng nhập sdt');
						$('#phoneNumber').focus();
						return;
					}
					;
					if (address.length == 0) {
						alert('Vui lòng nhập địa chỉ');
						$('#address').focus();
						return;
					}

					$.ajax(
							{
								url : 'cart?action=paying&phone=' + phone
										+ '&address=' + address,
								dataType : 'json'
							}).then(function(data) {
						alert('Thanh toán thành công!');
						window.location.href = "index";
					}).fail(function(error) {
						alert('Thanh toán thất bại, vui lòng thử lại!');
					});
				})

		function numberWithDot(x) {
			return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
		}
	</script>
</body>
</html>